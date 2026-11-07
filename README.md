# Humanizar Natural — edição multiplataforma 2.0.0

Skill de redação e revisão em **português brasileiro**, compatível com o padrão [Agent Skills](https://agentskills.io/specification). O foco é escrever para cada público e canal sem burocratês desnecessário, preservar fatos e limitar invenções. **Não promete** ocultar autoria de IA, passar em detectores ou garantir que todo agente seguirá as instruções.

## O que contém

- **Uma skill central**, em `skills/humanizar-natural-ptbr/SKILL.md`, com referências modulares e casos-limite. `SKILL.md` e `references/` da raiz são cópias de compatibilidade para leitores antigos.
- **Integrações de distribuição**: `.claude-plugin/plugin.json` (Claude Code), `.cursor-plugin/plugin.json` (Cursor) e `gemini-extension.json` (Gemini CLI). A presença do manifesto não significa aprovação em marketplaces.
- **Instaladores locais**: `scripts/instalar.sh` (Linux/macOS) e `scripts/instalar.ps1` (Windows PowerShell) para 10 agentes com suporte identificado; há opção `portable` para agentes que leem `.agents/skills`.
- **Testes** em `tests/casos.jsonl` e verificador offline em `scripts/checar_resultados.py`.
- **Publicação assistida** em `publicar-humanizer.sh`, com login do GitHub via navegador e código temporário.

## Instalação rápida

Em Linux/macOS (dentro da pasta extraída):

```bash
bash scripts/instalar.sh --agent opencode --scope user
bash scripts/instalar.sh --agent claude --scope user
bash scripts/instalar.sh --agent all --scope user
```

No Windows PowerShell:

```powershell
.\scripts\instalar.ps1 -Agent opencode -Scope user
.\scripts\instalar.ps1 -Agent all -Scope user
```

Para colocar no projeto, use `--scope project --project /caminho/do/projeto` ou `-Scope project -ProjectPath "C:\caminho\do\projeto"`. O instalador nunca instala agentes, não muda configurações do modelo e não envia dados para a internet. Se um diretório da skill já existir, exige `--replace`/`-Replace` e faz cópia de segurança local.

**Instalação manual portátil:** copie a pasta `skills/humanizar-natural-ptbr` integralmente para `.agents/skills/humanizar-natural-ptbr` no projeto, ou `~/.agents/skills/humanizar-natural-ptbr` no usuário. Isso funciona nos agentes que reconhecem esse diretório; veja a [matriz de compatibilidade](docs/COMPATIBILIDADE.md).

**Claude.ai / OpenAI API:** use o arquivo separado `Humanizar-Natural-SKILL-only-v2.0.0.zip`, que contém uma única skill, em vez do pacote completo com múltiplos manifestos. A plataforma precisa oferecer importação de skills; isso não transforma um chat comum em runtime de skills.

## Estrutura do repositório

```text
Humanizer-Skill/
├── README.md, SKILL.md, references/, LICENSE, CHANGELOG.md
├── skills/humanizar-natural-ptbr/
│   ├── SKILL.md
│   └── references/ (registro, fidelidade, exemplos, padrões, fontes)
├── adapters/ (orientações específicas por agente/família)
├── scripts/ (instalação, validação, comparação, manifesto)
├── tests/ (cenários e protocolo de avaliação)
├── docs/ (compatibilidade e pesquisa)
├── .claude-plugin/plugin.json
├── .cursor-plugin/plugin.json
├── gemini-extension.json, GEMINI.md
└── publicar-humanizer.sh
```

A organização é **inspirada na separação de biblioteca, integrações e testes do [Superpowers](https://github.com/obra/superpowers)**. Não contém código copiado do Superpowers e não promete reproduzir o bootstrap, os hooks nem as integrações daquele projeto.

## Avaliação local

```bash
python3 scripts/validar_pacote.py
python3 scripts/checar_resultados.py --self-test
```

Para avaliar um modelo, siga `tests/PROTOCOLO.md` e preencha respostas JSONL para executar:

```bash
python3 scripts/checar_resultados.py --cases tests/casos.jsonl --outputs respostas.jsonl
```

**Importante:** verificação estrutural não é avaliação de naturalidade ou eficácia. Para afirmar melhora, execute casos A/B com e sem a skill em modelos reais e faça revisão humana cega, conforme o protocolo.

## Publicar no GitHub

Baixe o pacote e o `.sh` de publicação, coloque-os na mesma pasta e execute:

```bash
chmod +x publicar-humanizer.sh
./publicar-humanizer.sh Humanizar-Natural-Multiplataforma-v2.0.0.zip
```

O script abre o fluxo OAuth Device do GitHub CLI (`gh auth login --web`), exibe um **código temporário** para inserir em https://github.com/login/device, clona `pcdosilva01-spec/Humanizer-Skill`, apresenta o diff e **pede confirmação** antes do commit/push. Sem `force-push`. Veja `docs/PUBLICACAO.md`.

## Fontes e transparência

A linguagem foi orientada por referências da ABL/VOLP, C-ORAL-BRASIL, Corpus Brasileiro e guias de escrita; os exemplos são construídos, não falas copiadas. As observações sobre sinais de IA não identificam autoria. Não foram extraídas conversas privadas. Os detalhes e links estão em `skills/humanizar-natural-ptbr/references/fontes-e-metodo.md`.

Licença: MIT. Não há garantia de comportamento uniforme entre provedores nem verificação concluída em cada runtime listado.
