# Protocolo de avaliação A/B — Humanizar Natural

## O que este protocolo mede

Avalia se o agente segue a skill com **fidelidade, naturalidade e consistência**. Não demonstra autoria humana, não garante aderência universal e não valida automaticamente interpretações subjetivas.

## Execução comparável

1. Escolha um único modelo e sua configuração fixa (mesma temperatura/esforço, mesmas ferramentas, mesmo prompt).
2. Em sessões independentes, rode cada caso de `casos.jsonl` **sem a skill** (controle) e **com a skill carregada** (teste). Verifique que o agente realmente acessou `SKILL.md` na condição de teste.
3. Faça **três repetições por condição** no mínimo, alternando a ordem entre controle e teste. Não reutilize um histórico em que o modelo já viu respostas anteriores.
4. Guarde respostas identificadas apenas por `id`, condição e repetição. Não inclua dados pessoais ou conteúdo privado nos arquivos de avaliação.
5. Avalie primeiro os requisitos objetivos de cada caso e depois os critérios humanos abaixo, sem olhar a condição quando possível.
6. Registre **falhas específicas** com trecho, tipo de erro, frequência e proposta mínima de correção. Crie teste de regressão sempre que alterar a skill.

## Rubrica humana (0–2 por critério)

| Critério | 0 | 1 | 2 |
| --- | --- | --- | --- |
| Fidelidade factual | Distorce ou inventa fato importante | Pequeno desvio / ambiguidade | Preserva fatos, condições e intenção |
| Modalidade e negação | Inverte ou fortalece indevidamente | Pequena imprecisão | Mantém grau de certeza e polaridade |
| Registro contextual | Inadequado para leitor/canal | Aceitável, mas artificial | Natural e apropriado |
| Cordialidade | Rude, fria ou bajuladora sem motivo | Levemente desbalanceada | Respeitosa sem exagero |
| Concisão e fluidez | Verborrágico ou truncado | Algum excesso | Econômico e fácil de ler |
| Formato e escopo | Desobedece restrições | Pequeno desvio | Cumpre formato e só altera o autorizado |

**Condições eliminatórias:** fato inventado central, negação invertida, grau de certeza incorretamente aumentado, alteração de comandos/URLs protegidos ou exigência explícita de formato descumprida. Não compense esses erros com pontos de estilo.

**Como interpretar:** compare a proporção de respostas sem falhas eliminatórias, a mediana das pontuações e a variação entre repetições. A melhoria é mais convincente se a skill reduzir erros graves **sem piorar** a naturalidade e o cumprimento do pedido. Com poucas amostras, descreva o resultado como exploratório.

## Checagem automática auxiliar

Crie um arquivo JSONL com uma linha por resposta, por exemplo:

```json
{"id":"email-consulta","response":"Olá! Queria avisar que amanhã não vou conseguir ir à escola porque tenho uma consulta. Obrigado!"}
```

Execute, estando na raiz da skill:

```bash
python3 scripts/checar_resultados.py --cases tests/casos.jsonl --outputs respostas.jsonl
```

O script testa somente requisitos **literais** de algumas situações (`must_contain`, `must_not_contain`, `max_words`). Pode marcar como falha uma paráfrase correta ou deixar passar erro semântico; por isso **não substitui a rubrica humana**. Use `--self-test` para verificar o funcionamento básico do script.

## Registro de regressão

Para cada falha observada, anote: `caso`, `modo`, `trecho`, `regra quebrada`, `frequência`, `ajuste proposto`, `resultado após ajuste`. Não publique dados privados ou conteúdo pessoal do usuário.
