# Humanizar Natural 1.2.0 (PT-BR)

Skill de escrita contextual e revisão de prosa em português brasileiro, com foco em fidelidade e consistência de execução.

## Arquivos

- `SKILL.md` — instruções autossuficientes que o agente deve carregar.
- `references/exemplos-contextuais.md` — exemplos adicionais para decisões difíceis.
- `tests/casos.jsonl` — 22 casos de regressão.
- `tests/PROTOCOLO.md` — protocolo A/B, rubrica e limitações.
- `scripts/checar_resultados.py` — verificador literal offline, com biblioteca padrão de Python.

## Instalação no OpenCode

Coloque **a pasta inteira** em `~/.config/opencode/skills/humanizar-natural-ptbr/` (global) ou `.opencode/skills/humanizar-natural-ptbr/` (projeto). O arquivo `SKILL.md` deve ficar diretamente dentro dessa pasta. Verifique que a configuração do agente permite carregar skills e que a skill foi de fato ativada.

Se quiser só a execução editorial, `SKILL.md` funciona sozinho; os arquivos adicionais servem para testar e explicar decisões.

## Teste local do verificador

```bash
python3 scripts/checar_resultados.py --self-test
```

Para checar respostas de um modelo, siga `tests/PROTOCOLO.md`. **O script não chama um modelo nem avalia naturalidade de forma automática.**

## Mudanças em relação à 1.1.0

- Regras essenciais concentradas em uma hierarquia operacional.
- Contrato interno de seis campos e procedimento de redação em cinco etapas.
- Auditoria explícita em oito verificações com regra de correção.
- Contracasos para negação, modalidade, quantidade e comandos.
- Bateria de 22 testes para comparar respostas com e sem skill.
- Padrão de distribuição compatível com o OpenCode, sem dependência de arquivos não incluídos.

Licença: MIT (mesmo identificador de licença indicado na versão anterior).
