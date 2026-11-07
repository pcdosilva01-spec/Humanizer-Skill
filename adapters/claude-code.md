# Claude Code / Anthropic

Instale a pasta inteira em `~/.claude/skills/humanizar-natural-ptbr` ou `.claude/skills/humanizar-natural-ptbr`. O frontmatter oferece `name` e `description` para descoberta automática. Você também pode chamar explicitamente `/humanizar-natural-ptbr` antes do pedido.

O arquivo `.claude-plugin/plugin.json` permite empacotamento como plugin no ecossistema Claude Code, mas este repositório não publica marketplace próprio. A skill principal **não** usa campos exclusivos de Claude como `context: fork`, hooks, comandos shell injetados ou permissões automáticas: seria desnecessário para uma tarefa editorial e prejudicaria portabilidade.

Para `claude.ai` elegível, faça upload do ZIP somente-da-skill (não do repositório inteiro). Confirme se a interface disponibiliza skills personalizadas.

Fonte: https://code.claude.com/docs/en/skills
