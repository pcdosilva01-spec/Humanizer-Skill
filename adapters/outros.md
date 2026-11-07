# Qwen, Kimi e demais agentes

- **Qwen Code:** `.qwen/skills/<nome>` (projeto) ou `~/.qwen/skills/<nome>` (global). Também reconhece `.agents/skills` em versões documentadas.
- **Kimi Code CLI:** `.kimi-code/skills/<nome>` (projeto) ou `~/.kimi-code/skills/<nome>` (global), além de `.agents/skills`. Esta skill usa apenas `name` e `description`, evitando placeholders exclusivos.
- **Outros agentes:** use `.agents/skills/<nome>` somente se a versão tiver suporte explícito. Para plataformas sem suporte a diretório de skills, forneça o conteúdo do `SKILL.md` como instrução na sessão se permitido, mas não anuncie integração nativa.

O objetivo é interoperabilidade honesta, não inventar uma lista de compatibilidade com qualquer plataforma do mercado.

Fontes: https://qwenlm.github.io/qwen-code-docs/en/users/features/skills/ ; https://moonshotai.github.io/kimi-code/en/customization/skills
