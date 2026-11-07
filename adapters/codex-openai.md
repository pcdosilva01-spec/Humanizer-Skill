# OpenAI Codex / OpenAI API

No CLI Codex, coloque a pasta em `~/.codex/skills/humanizar-natural-ptbr` ou `.agents/skills/humanizar-natural-ptbr` no projeto. O arquivo `SKILL.md` usa frontmatter padronizado e referências por caminho relativo. Experimente um pedido explícito: “Use a skill humanizar-natural-ptbr para revisar este e-mail sem alterar fatos”.

Para Responses API com shell hospedado, prepare o ZIP **somente da skill** e associe-o ao ambiente da requisição conforme a documentação. Para Agents API, registre o diretório pai como `capability_directories` no sandbox, com caminho absoluto. Este pacote **não configura nem autentica APIs** e não precisa enviar texto do usuário a um servidor externo para funcionar localmente.

A qualidade vem do procedimento e dos testes, não de supor que “GPT deve usar um vocabulário especial”.

Fontes: https://developers.openai.com/api/docs/guides/tools-skills ; https://developers.openai.com/blog/eval-skills
