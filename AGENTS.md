# Diretrizes para colaboradores/agentes neste repositório

Este repositório distribui uma skill editorial em PT-BR; não confunda instruções para contribuir com instruções para qualquer projeto do usuário.

- A fonte principal é `skills/humanizar-natural-ptbr/SKILL.md`; sincronize as cópias `SKILL.md` e `references/` da raiz se alterar a fonte.
- Não copie código, texto ou marca do repositório Superpowers. A inspiração é estrutural.
- Não reivindique testes com Claude, GPT, Gemini ou outras ferramentas sem execuções reproduzíveis e registro de resultados.
- Adicione um caso de regressão ao corrigir uma falha de comportamento; não aumente regras sem necessidade.
- Verifique a sintaxe com `python3 scripts/validar_pacote.py` e o verificador com `--self-test`.
- Preserve dados pessoais, segredos, tokens e exemplos reais de autoria; não inclua informações de usuários no repositório.
- Não apague testes nem documentos por preferência estilística. Qualquer publicação exige revisão do diff.
