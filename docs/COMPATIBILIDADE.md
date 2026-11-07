# Matriz de compatibilidade: instalado ≠ executado

Pesquisado em 2026-11-07. Cada ferramenta pode ter versões e configurações diferentes. A compatibilidade declarada indica **caminhos de instalação documentados**, não execução de testes A/B com modelos reais nem aprovação em marketplaces.

| Ferramenta | Diretório de projeto | Diretório do usuário (Linux/macOS) | Ativação |
| --- | --- | --- | --- |
| Claude Code | `.claude/skills/<nome>/` | `~/.claude/skills/<nome>/` | automática por descrição ou `/humanizar-natural-ptbr` |
| OpenAI Codex | `.agents/skills/<nome>/` | `~/.codex/skills/<nome>/` | agente decide; referência explícita à skill ajuda |
| Gemini CLI | `.gemini/skills/<nome>/` | `~/.gemini/skills/<nome>/` | `activate_skill` com confirmação, `/skills list` |
| OpenCode | `.opencode/skills/<nome>/` | `~/.config/opencode/skills/<nome>/` | ferramenta `skill`, carregamento sob demanda |
| Cursor | `.cursor/skills/<nome>/` | `~/.cursor/skills/<nome>/` | Agent decide ou comando `/nome` |
| GitHub Copilot | `.github/skills/<nome>/` | `~/.copilot/skills/<nome>/` | carrega skill quando relevante em superfícies compatíveis |
| Cline | `.cline/skills/<nome>/` | `~/.cline/skills/<nome>/` | carrega quando relevante, pode invocar explicitamente |
| Roo Code | `.roo/skills/<nome>/` | `~/.roo/skills/<nome>/` | por descrição e modo (skill genérica) |
| Qwen Code | `.qwen/skills/<nome>/` | `~/.qwen/skills/<nome>/` | invocação pelo agente ou usuário |
| Kimi Code CLI | `.kimi-code/skills/<nome>/` | `~/.kimi-code/skills/<nome>/` | pelo agente ou `/skill:<nome>` (conforme versão) |
| Portátil Agent Skills | `.agents/skills/<nome>/` | `~/.agents/skills/<nome>/` | somente agentes que examinam esse diretório |

`<nome>` = `humanizar-natural-ptbr`. O `instalar.sh` e `instalar.ps1` usam **a coluna específica de cada ferramenta**; o modo `portable` usa `.agents/skills`.

## Produtos que precisam de tratamento separado

- **Claude.ai:** oferece upload de skills personalizadas em ZIP em planos/ambientes elegíveis; use o ZIP *skill-only* e confirme as condições da conta.
- **OpenAI API (Responses/Agents):** exige configurar a skill como bundle no ambiente de execução e/ou subir a versão do bundle. Um ZIP não altera automaticamente chats no aplicativo ChatGPT.
- **ChatGPT na interface comum:** não há garantia de descoberta de uma pasta local nem uma configuração universal pelo ZIP. O conteúdo pode ser fornecido explicitamente se a interface permitir.
- **Windsurf, Antigravity, Devin, Hermes, Pi, Muse, Factory, Grok e outros:** o Superpowers lista integrações próprias para vários desses ambientes, mas não atribuímos automaticamente as integrações dele a este projeto. Use o modo portátil **apenas se a versão do agente suportar Agent Skills**, ou consulte sua documentação. A ausência de um instalador específico não equivale à incompatibilidade do modelo subjacente.

## Modelos vs. ferramentas

Uma instalação de SKILL.md depende sobretudo do *harness* (editor, agente ou CLI), e não só da família GPT/Claude/Gemini. O corpo da skill usa instruções curtas, invariantes semânticos, exemplos e referências sob demanda. Não há pesquisa que sustente um “prompt mágico” universal por modelo. Se um agente não invocar a skill, teste com um pedido explícito e verifique seu mecanismo de descoberta; não presuma aplicação automática.

## Fontes oficiais

- Agent Skills: https://agentskills.io/specification
- Claude Code: https://code.claude.com/docs/en/skills
- OpenAI API: https://developers.openai.com/api/docs/guides/tools-skills
- OpenCode: https://opencode.ai/docs/skills/
- Gemini CLI: https://github.com/google-gemini/gemini-cli/blob/main/docs/cli/skills.md
- Cursor: https://cursor.com/help/customization/skills
- GitHub Copilot: https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/customize-cloud-agent/add-skills
- Cline: https://github.com/cline/cline/blob/main/docs/customization/skills.mdx
- Roo: https://roocodeinc.github.io/Roo-Code/features/skills/
- Qwen Code: https://qwenlm.github.io/qwen-code-docs/en/users/features/skills/
- Kimi Code: https://moonshotai.github.io/kimi-code/en/customization/skills
- Superpowers (referência de organização): https://github.com/obra/superpowers

**Observação:** manifestos de plugin/extension são preparados para as superfícies documentadas, mas não foram submetidos nem testados nos marketplaces ou runtimes reais. Manual por diretório é a opção mais previsível.
