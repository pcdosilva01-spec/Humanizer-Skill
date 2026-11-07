# Cursor, Copilot, Cline, Roo e OpenCode

As cinco ferramentas usam diretórios de skills, mas com nomes diferentes (ver `docs/COMPATIBILIDADE.md`). Use `scripts/instalar.sh` ou `scripts/instalar.ps1` ou copie o **diretório inteiro** para o destino documentado. Não copie somente `SKILL.md` se quiser os exemplos e as referências.

- **Cursor:** `.cursor/skills` ou `~/.cursor/skills`; `.cursor-plugin/plugin.json` descreve um plugin local opcional; não significa publicação no marketplace.
- **Copilot:** `.github/skills` no projeto, `~/.copilot/skills` no usuário; suporte varia conforme modo/agente.
- **Cline:** `.cline/skills` ou `~/.cline/skills`.
- **Roo:** `.roo/skills` ou `~/.roo/skills`, genérica (sem restringir modo).
- **OpenCode:** `.opencode/skills` ou `~/.config/opencode/skills`; use `skill` ou menção explícita ao nome se a seleção automática falhar.

Não duplique a skill entre pastas diferentes reconhecidas pelo mesmo agente, pois a precedência pode confundir diagnósticos.

Fontes detalhadas: `docs/COMPATIBILIDADE.md`.
