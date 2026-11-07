#!/usr/bin/env bash
# Instala a skill localmente. Não instala agentes, não autentica e não acessa a rede.
set -Eeuo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
NAME=humanizar-natural-ptbr
SOURCE="$ROOT/skills/$NAME"
AGENT=""; SCOPE="user"; PROJECT=""; REPLACE=0
usage() {
  cat <<'HELP'
Uso: bash scripts/instalar.sh --agent AGENTE [--scope user|project] [--project CAMINHO] [--replace]
Agentes: opencode, claude, codex, gemini, cursor, copilot, cline, roo, qwen, kimi, portable, all
Padrão: escopo user; para escopo project o projeto padrão é o diretório atual.
HELP
}
while (($#)); do
  case "$1" in
    --agent) (($# >= 2)) || { usage; exit 2; }; AGENT="$2"; shift 2;;
    --scope) (($# >= 2)) || { usage; exit 2; }; SCOPE="$2"; shift 2;;
    --project) (($# >= 2)) || { usage; exit 2; }; PROJECT="$2"; shift 2;;
    --replace) REPLACE=1; shift;;
    -h|--help) usage; exit 0;;
    *) echo "Parâmetro desconhecido: $1" >&2; usage; exit 2;;
  esac
done
[[ -f "$SOURCE/SKILL.md" ]] || { echo 'Fonte da skill ausente.' >&2; exit 2; }
[[ "$SCOPE" == user || "$SCOPE" == project ]] || { echo 'Escopo inválido.' >&2; exit 2; }
[[ -n "$AGENT" ]] || { usage; exit 2; }
if [[ "$SCOPE" == project ]]; then
  PROJECT="${PROJECT:-$PWD}"
  [[ -d "$PROJECT" ]] || { echo "Projeto não existe: $PROJECT" >&2; exit 2; }
  PROJECT="$(cd -- "$PROJECT" && pwd)"
fi
path_for() {
  case "$SCOPE:$1" in
    user:opencode) printf '%s' "$HOME/.config/opencode/skills";;
    user:claude) printf '%s' "$HOME/.claude/skills";;
    user:codex) printf '%s' "$HOME/.codex/skills";;
    user:gemini) printf '%s' "$HOME/.gemini/skills";;
    user:cursor) printf '%s' "$HOME/.cursor/skills";;
    user:copilot) printf '%s' "$HOME/.copilot/skills";;
    user:cline) printf '%s' "$HOME/.cline/skills";;
    user:roo) printf '%s' "$HOME/.roo/skills";;
    user:qwen) printf '%s' "$HOME/.qwen/skills";;
    user:kimi) printf '%s' "$HOME/.kimi-code/skills";;
    user:portable) printf '%s' "$HOME/.agents/skills";;
    project:opencode) printf '%s' "$PROJECT/.opencode/skills";;
    project:claude) printf '%s' "$PROJECT/.claude/skills";;
    project:codex) printf '%s' "$PROJECT/.agents/skills";;
    project:gemini) printf '%s' "$PROJECT/.gemini/skills";;
    project:cursor) printf '%s' "$PROJECT/.cursor/skills";;
    project:copilot) printf '%s' "$PROJECT/.github/skills";;
    project:cline) printf '%s' "$PROJECT/.cline/skills";;
    project:roo) printf '%s' "$PROJECT/.roo/skills";;
    project:qwen) printf '%s' "$PROJECT/.qwen/skills";;
    project:kimi) printf '%s' "$PROJECT/.kimi-code/skills";;
    project:portable) printf '%s' "$PROJECT/.agents/skills";;
    *) echo "Agente desconhecido: $1" >&2; return 2;;
  esac
}
install_one() {
  local target_parent target temporary backup
  target_parent="$(path_for "$1")" || return 2
  target="$target_parent/$NAME"
  mkdir -p -- "$target_parent"
  if [[ -L "$target" ]]; then
    echo "Recusado: destino é link simbólico: $target" >&2; return 2
  fi
  if [[ -e "$target" && "$REPLACE" == 0 ]]; then
    echo "Já existe (use --replace para atualizar): $target"; return 0
  fi
  temporary="$(mktemp -d "$target_parent/.humanizar-tmp.XXXXXXXX")"
  cp -R -- "$SOURCE" "$temporary/$NAME"
  if [[ -e "$target" ]]; then
    backup="${target}.backup-$(date +%Y%m%d-%H%M%S)-$$"
    mv -- "$target" "$backup"
    echo "Backup anterior: $backup"
  fi
  mv -- "$temporary/$NAME" "$target"
  rmdir -- "$temporary"
  echo "Instalado [$1]: $target"
}
if [[ "$AGENT" == all ]]; then
  for entry in opencode claude codex gemini cursor copilot cline roo qwen kimi; do
    install_one "$entry"
  done
else
  install_one "$AGENT"
fi
printf '\nValide o carregamento na interface do agente. Instalação de arquivo não garante ativação.\n'
