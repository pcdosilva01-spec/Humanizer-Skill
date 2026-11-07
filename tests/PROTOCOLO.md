# Avaliação da Humanizar Natural: protocolo A/B reproduzível

**Não confunda check estrutural com qualidade medida.** Um agente pode carregar o arquivo e ignorar regras. O objetivo destes testes é medir se o uso da skill melhora saídas reais.

## Experimento

1. Selecione ao menos **dois** agentes/modelos e anote as versões. Confirme se cada agente listou ou ativou a skill.
2. Para cada um dos casos em `casos.jsonl`, abra duas sessões sem contexto compartilhado: **A** (sem skill) e **B** (com skill). Use o mesmo prompt, mesma configuração e, se possível, mesma temperatura e mesmas permissões.
3. Repita pelo menos **3 vezes** as tarefas mais importantes; alterne a ordem de execução A/B para reduzir efeitos temporais.
4. Exporte `id` e `response` para um arquivo local JSONL, sem dados pessoais. Exemplo:

```json
{"id":"email-consulta","response":"Olá! Queria avisar que amanhã não vou à escola porque tenho uma consulta."}
```

5. Execute o verificador literal:

```bash
python3 scripts/checar_resultados.py --cases tests/casos.jsonl --outputs respostas.jsonl
```

6. Faça revisão humana **cega quanto à condição A/B**. Não peça ao avaliador que adivinhe se é IA.

## Critérios manuais por caso (0, 1 ou 2 pontos)

| Critério | 0 | 1 | 2 |
| --- | --- | --- | --- |
| Fidelidade semântica | mudou fatos/negação/certidão | pequenas imprecisões | invariantes preservados |
| Adequação ao canal | registro inadequado | aceitável | adequado ao destinatário |
| Naturalidade e fluidez | rígido/artificial | razoável | claro sem afetação |
| Economia | repetitivo ou truncado | pequenos excessos | extensão proporcional |
| Precisão de formato | desrespeita o pedido | deslizes leves | cumpre formato integralmente |

**Falha grave automática na avaliação humana:** inventar dado pessoal, alterar negação/obrigação/certeza, mudar código ou URL exigidos, atribuir citação inventada. Se ocorrer, marque falha independentemente da soma dos pontos.

## Resultado e divulgação

Apresente taxa de falhas graves, mediana da pontuação e variação entre repetições, por agente e por condição. Um teste literal que passa **não prova equivalência semântica**; um caso que falha por variante aceitável exige revisão humana. Não anuncie “100% natural”, “indetectável” nem “compatível com todos os modelos”.

## Política de dados

Use prompts sintéticos, não exporte conversas pessoais ou identificadores reais. Não envie dados a ferramentas externas sem autorização. Os arquivos de respostas devem permanecer locais e são ignorados pelo `.gitignore`.
