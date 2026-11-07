#!/usr/bin/env bash
# Publicação assistida para https://github.com/pcdosilva01-spec/Humanizer-Skill
# Uso: bash publicar-humanizer.sh [Humanizar-Natural-Multiplataforma-v2.0.0.zip|pasta]
# Login via navegador/código temporário através de GitHub CLI: gh auth login --web
set -Eeuo pipefail

REPOSITORY='pcdosilva01-spec/Humanizer-Skill'
REPO_URL="https://github.com/${REPOSITORY}.git"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_NAME='Humanizar-Natural-Multiplataforma-v2.0.0.zip'
COMMIT_MESSAGE='feat: Humanizar Natural 2.0.0 multiplataforma'
BLUE='\033[1;34m'; RESET='\033[0m'
info() { printf '\n%b%s%b\n' "$BLUE" "$*" "$RESET"; }
fail() { printf '\nErro: %s\n' "$*" >&2; exit 1; }
help() {
  cat <<'HELP'
Uso: bash publicar-humanizer.sh [arquivo.zip|pasta-extraida] [--relogin]
Necessário: git, gh (GitHub CLI) e python3 (para fontes ZIP).
Fluxo: código temporário no terminal -> https://github.com/login/device -> confirmar -> revisão do diff -> commit/push.
--relogin: inicia nova autorização no navegador mesmo se já estiver conectado.
HELP
}
SOURCE_ARG=''; RELOGIN=0
while (($#)); do
  case "$1" in
    --relogin) RELOGIN=1; shift;;
    -h|--help) help; exit 0;;
    -*) fail "Parâmetro desconhecido: $1";;
    *) [[ -z "$SOURCE_ARG" ]] || fail 'Informe no máximo uma pasta/ZIP.'; SOURCE_ARG="$1"; shift;;
  esac
done
for bin in git gh; do
  command -v "$bin" >/dev/null 2>&1 || fail "Falta $bin. No Linux Mint: sudo apt update && sudo apt install git gh python3"
done
if [[ -z "$SOURCE_ARG" ]]; then
  if [[ -f "$SCRIPT_DIR/scripts/publicacao-manifest.txt" ]]; then
    SOURCE_ARG="$SCRIPT_DIR"
  elif [[ -f "$SCRIPT_DIR/$PACKAGE_NAME" ]]; then
    SOURCE_ARG="$SCRIPT_DIR/$PACKAGE_NAME"
  elif [[ -f "$PWD/$PACKAGE_NAME" ]]; then
    SOURCE_ARG="$PWD/$PACKAGE_NAME"
  else
    fail "Coloque $PACKAGE_NAME ao lado do .sh ou informe seu caminho."
  fi
fi
[[ -e "$SOURCE_ARG" ]] || fail "Fonte não encontrada: $SOURCE_ARG"
TMP="$(mktemp -d -t humanizar-publicar.XXXXXXXX)"
trap 'rm -rf -- "$TMP"' EXIT
if [[ -f "$SOURCE_ARG" ]]; then
  [[ "$SOURCE_ARG" == *.zip ]] || fail 'A fonte deve ser um diretório ou .zip.'
  command -v python3 >/dev/null 2>&1 || fail 'Instale Python 3 para extrair o ZIP com segurança.'
  mkdir -p "$TMP/zip"
  python3 - "$SOURCE_ARG" "$TMP/zip" <<'PY'
import pathlib, stat, sys, zipfile
source, dest = pathlib.Path(sys.argv[1]), pathlib.Path(sys.argv[2])
try:
    with zipfile.ZipFile(source) as z:
        names = z.infolist()
        if len(names) > 400:
            raise ValueError('ZIP com arquivos demais')
        for member in names:
            p = pathlib.PurePosixPath(member.filename)
            if not member.filename or p.is_absolute() or '..' in p.parts or '\\' in member.filename:
                raise ValueError(f'Caminho ZIP inseguro: {member.filename}')
            if stat.S_ISLNK(member.external_attr >> 16):
                raise ValueError(f'Link simbólico ZIP recusado: {member.filename}')
            if member.file_size > 5_000_000:
                raise ValueError(f'Arquivo ZIP muito grande: {member.filename}')
        z.extractall(dest)
except (zipfile.BadZipFile, ValueError) as exc:
    sys.exit(f'Falha ao validar ZIP: {exc}')
PY
  if [[ -f "$TMP/zip/scripts/publicacao-manifest.txt" ]]; then
    SOURCE="$TMP/zip"
  else
    mapfile -d '' ROOTS < <(find "$TMP/zip" -mindepth 1 -maxdepth 1 -type d -print0)
    ((${#ROOTS[@]} == 1)) || fail 'O ZIP deve conter uma única pasta raiz com o pacote.'
    SOURCE="${ROOTS[0]}"
  fi
elif [[ -d "$SOURCE_ARG" ]]; then
  SOURCE="$(cd -- "$SOURCE_ARG" && pwd)"
else
  fail 'Fonte não suportada.'
fi
MANIFEST="$SOURCE/scripts/publicacao-manifest.txt"
[[ -f "$MANIFEST" && ! -L "$MANIFEST" ]] || fail 'Manifesto de publicação ausente ou inseguro.'
[[ -f "$SOURCE/skills/humanizar-natural-ptbr/SKILL.md" ]] || fail 'A skill principal não foi encontrada.'

# Manifesto é fechado, arquivos não listados nunca entram no commit.
FILES=()
while IFS= read -r rel || [[ -n "$rel" ]]; do
  [[ -n "$rel" && "${rel:0:1}" != '#' ]] || continue
  case "$rel" in
    /*|../*|*/../*|*/..|./*|*'\\'*|*'//'*) fail "Entrada insegura no manifesto: $rel";;
  esac
  [[ -f "$SOURCE/$rel" && ! -L "$SOURCE/$rel" ]] || fail "Arquivo esperado não encontrado ou link simbólico: $rel"
  FILES+=("$rel")
done < "$MANIFEST"
((${#FILES[@]} >= 10)) || fail 'Manifesto incompleto.'
printf 'Arquivos a considerar: %s (listados no manifesto).\n' "${#FILES[@]}"

info 'Autenticação do GitHub pelo navegador'
if ((RELOGIN)) || ! gh auth status --hostname github.com >/dev/null 2>&1; then
  echo 'A CLI mostrará um código de uso único. Acesse https://github.com/login/device e autorize na sua conta.'
  gh auth login --hostname github.com --git-protocol https --web || fail 'Login GitHub não concluído.'
else
  echo 'GitHub CLI já tem autenticação válida. Use --relogin para solicitar outro código pelo navegador.'
fi
gh auth setup-git --hostname github.com || fail 'Não foi possível configurar o Git para usar o GitHub CLI.'
LOGIN="$(gh api user --jq '.login')" || fail 'Falha ao consultar a conta autenticada.'
ID="$(gh api user --jq '.id')" || fail 'Falha ao consultar o identificador GitHub.'
[[ -n "$LOGIN" && -n "$ID" ]] || fail 'Dados da conta insuficientes.'
echo "Conta autenticada: $LOGIN"
[[ "$LOGIN" == pcdosilva01-spec ]] || echo 'Atenção: esta conta precisa ter permissão de gravação no repositório.'

info 'Clonando repositório e identificando branch padrão'
git clone -- "$REPO_URL" "$TMP/repo" || fail 'Clone falhou. Verifique URL ou permissões.'
cd "$TMP/repo"
if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
  if git show-ref --verify --quiet refs/remotes/origin/main; then
    git switch -c main --track origin/main
  elif [[ -n "$(git for-each-ref --format='%(refname)' refs/remotes/origin)" ]]; then
    fail 'Remoto com histórico e HEAD inválido: ajuste a branch padrão no GitHub antes de publicar.'
  else
    git symbolic-ref HEAD refs/heads/main
  fi
fi
BRANCH="$(git symbolic-ref --quiet --short HEAD)" || fail 'Não foi possível identificar branch atual.'
git config --local user.name "$LOGIN"
git config --local user.email "${ID}+${LOGIN}@users.noreply.github.com"

for rel in "${FILES[@]}"; do
  mkdir -p -- "$(dirname -- "$rel")"
  cp -- "$SOURCE/$rel" "$rel"
  if [[ "$rel" == *.sh ]]; then chmod +x -- "$rel"; fi
done
git add -- "${FILES[@]}"
if git diff --cached --quiet; then
  info 'Nenhuma alteração: os arquivos publicados já estão idênticos.'
  exit 0
fi

info 'Verifique as alterações ANTES de confirmar'
git --no-pager diff --cached --stat
git --no-pager diff --cached --name-status
printf '\nDestino: %s (branch: %s)\n' "$REPOSITORY" "$BRANCH"
printf 'O GitHub receberá o conteúdo dos arquivos acima e metadados públicos do commit (login e e-mail noreply).\n'
printf 'Arquivos fora do manifesto não serão adicionados; arquivos antigos não listados não serão apagados.\n'
# Diff completo disponível antes de autorizar; se o terminal for curto, o usuário pode rolar.
git --no-pager diff --cached
printf '\n'
if [[ ! -t 0 ]]; then
  fail 'Confirmação interativa necessária: execute em um terminal local.'
fi
read -r -p 'Criar commit e fazer push após revisar a lista e o diff? [s/N]: ' CONFIRM
case "$CONFIRM" in
  s|S|sim|SIM|Sim) ;;
  *) info 'Cancelado. Nenhum arquivo foi enviado ao repositório.'; exit 0;;
esac

git commit -m "$COMMIT_MESSAGE" || fail 'Falha ao criar commit.'
git push -u origin "$BRANCH" || fail 'Push recusado ou falhou. Nada foi forçado; revise o Git remoto.'
info "Publicação concluída: https://github.com/$REPOSITORY"
