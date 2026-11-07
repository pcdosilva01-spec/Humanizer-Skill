---
name: humanizar-natural-ptbr
description: >-
  Cria, revisa e reescreve textos em português brasileiro com linguagem natural,
  fidelidade aos fatos e tom adequado ao leitor. Use para e-mails, mensagens,
  posts, redações, descrições, documentação e textos que precisem soar menos
  robóticos, menos burocráticos ou mais claros. Não use para alterar código,
  fórmulas ou dados estruturados sem pedido explícito.
license: MIT
compatibility: 'Agent Skills; OpenCode e agentes compatíveis com SKILL.md'
metadata:
  language: pt-BR
  version: '1.2.0'
  category: writing-editing
---

# Humanizar Natural — escrita contextual em PT-BR

## Missão e limite

Entregue um texto **correto, natural para aquele contexto e fiel ao pedido**, sem exibir o processo editorial. Não existe uma “voz humana” universal: a forma de escrever depende de quem lê, do objetivo, do canal e do texto fornecido. Esta skill **não garante obediência do modelo nem autenticidade de autoria**; melhora a orientação e permite avaliar resultados.

**Regra operacional:** ao ser acionada, siga o procedimento abaixo em toda tarefa de prosa. Faça a preparação e a checagem internamente. **Não imprima o plano, a rubrica ou o checklist**, salvo se o usuário pedir análise ou auditoria.

## 1. Regras inegociáveis — resolver conflitos nesta ordem

1. **Pedido e instruções de maior prioridade:** respeite canal, público, finalidade, tom, formato, tamanho e restrições explícitas.
2. **Fidelidade factual:** não altere nomes, datas, horários, números, quantidades, prazos, fatos, relações de causa, responsáveis, condições, negações, graus de certeza ou intenção. `pode` não vira `vai`; `não` não desaparece; `um` não vira `vários`.
3. **Sem invenção:** não acrescente justificativas, diagnósticos, sentimentos, elogios, experiências, promessas, resultados, cargos, referências ou compromissos que não tenham sido informados.
4. **Integridade de material protegido:** preserve literalmente links, citações, comandos, blocos de código, identificadores, nomes de arquivos, dados estruturados e conteúdo que o usuário pediu para manter. Edite apenas a prosa autorizada.
5. **Adequação antes de simplicidade:** não elimine termos técnicos, jurídicos, acadêmicos ou formais quando necessários para expressar corretamente a mensagem.
6. **Entrega limpa:** produza o artefato solicitado, sem “Claro!”, explicações sobre a skill, autopromoção ou ofertas automáticas de versões.

**Se naturalidade e precisão conflitarem, mantenha a precisão e ajuste somente o restante.** Nunca force gírias, erros ou informalidade para simular uma pessoa.

## 2. Procedimento de execução — aplicar na ordem

### Etapa A — Determine o modo

| Pedido | Modo | Saída padrão |
| --- | --- | --- |
| Criar texto do zero | `CRIAR` | Texto pronto |
| Reescrever / humanizar | `REESCREVER` | Versão final, sem apagar fatos |
| Corrigir / polir | `REVISAR` | Menor intervenção suficiente |
| Reduzir / resumir | `ENXUGAR` | Versão mais curta com ressalvas e fatos essenciais |
| Analisar / auditar | `AVALIAR` | Problemas concretos + propostas de melhoria |
| Mostrar antes e depois | `COMPARAR` | Comparação objetiva |
| Seguir formato fixo | `MANTER_FORMATO` | Estrutura e limites preservados |

`MANTER_FORMATO` pode coexistir com outro modo. Se a frase já está adequada, **não a altere só para demonstrar trabalho**. Se pedirem mais de uma versão, entregue apenas a quantidade pedida.

### Etapa B — Fixe o contrato do texto

Antes de escrever, identifique internamente estes **seis campos** com base somente na tarefa atual:

`objetivo | leitor | canal | fatos obrigatórios | registro | formato/limites`

- **Se o contexto resolve o tom, escreva diretamente.** Padrão para comunicação cotidiana: equilibrado, gentil e conciso.
- **Pergunte apenas se uma informação essencial estiver faltando e impossibilitar um resultado útil.** Para uma escolha estilística realmente decisiva e ainda indefinida, faça no máximo uma pergunta objetiva; em tarefas simples, escolha o padrão seguro e avance.
- Não peça amostras pessoais nem pesquise a identidade do usuário para criar uma “voz”. Use amostras fornecidas **nesta tarefa** somente quando autorizadas.
- Não transforme “consulta” em “consulta médica”, “reunião” em “reunião de emergência”, “amanhã” em uma data calculada sem necessidade, nem invente assinatura ou destinatários.

### Etapa C — Escolha o registro antes do vocabulário

| Situação | Registro recomendado | Evitar |
| --- | --- | --- |
| E-mail escolar / cotidiano profissional | Educado, simples, objetivo | “Venho por meio deste”, cerimonialidade sem motivo |
| WhatsApp / DM | Conversacional, com cortesia proporcional | Ofício disfarçado, gírias fabricadas |
| Redação ou trabalho escolar | Norma-padrão natural e nível solicitado | Jargão acadêmico automático, frases genéricas |
| README / documentação | Direto, técnico quando necessário | Remover nomes de APIs, comandos ou detalhes essenciais |
| Comunicação institucional / jurídica | Formalidade e terminologia exigidas | Simplificar obrigação ou ambiguidade legal |
| Post / divulgação | Concreto, adequado ao público e ao objetivo | Hype inventado, promessas e elogios sem evidência |

**Tom e cordialidade são diferentes:** é possível ser direto e gentil ao mesmo tempo. Formalidade não é sinônimo de respeito. A extensão deve seguir a quantidade de informação necessária.

### Etapa D — Redija ou edite com operações verificáveis

1. **Mantenha o conteúdo:** conserve a proposição de cada frase antes de mudar sua forma.
2. **Prefira construções comuns quando equivalentes:** “avisar” no lugar de “comunicar formalmente”; “ir à escola” no lugar de “comparecer à instituição de ensino”; “usar” no lugar de “utilizar”. Essas trocas são **contextuais, nunca proibições gerais**.
3. **Use verbos claros:** “pedir uma resposta” normalmente é melhor que “realizar uma solicitação de retorno”. Não troque palavras técnicas quando mudarem o sentido.
4. **Elimine apenas o excesso:** corte repetições, introduções vazias, elogios sem base, conclusões decorativas, conectivos automáticos e explicações não solicitadas.
5. **Preserve marcas de autoria realmente fornecidas:** ritmo, perspectiva, escolhas de palavras, nível de informalidade e regionalismos compatíveis com o objetivo. Não invente biografia, sotaque ou erros.
6. **Não padronize todos os textos:** não imponha cabeçalhos, lista, negrito, travessão, saudação, assinatura ou despedida sem função para aquele gênero.

**Exemplo de escolha contextual:**

- E-mail cotidiano: “Queria avisar que amanhã não vou conseguir ir à escola porque tenho uma consulta.”
- Aviso administrativo em que presença formal é relevante: “O candidato deverá comparecer ao local indicado com um documento de identificação.”

A palavra “comparecer” não é errada; só pode ser inadequada ao primeiro contexto. Não transforme a segunda frase em “O candidato pode ir lá com um documento”, porque isso enfraquece a obrigação e perde precisão.

### Etapa E — Auditoria obrigatória antes da entrega

Cheque em silêncio, por esta ordem. **Qualquer falha nos itens 1–4 exige corrigir a saída antes de enviá-la.**

1. **Fatos:** nomes, datas, números, condições, intenções e causas foram preservados?
2. **Polaridade e modalidade:** alguma negação, obrigação, possibilidade, dúvida ou intensidade mudou?
3. **Invenção:** há algo que o usuário não afirmou ou autorizou, apresentado como fato?
4. **Formato e escopo:** mantive limites, estrutura, voz narrativa, comandos, links, textos literais e quantidade de versões?
5. **Registro:** alguém nesse contexto escreveria assim? A formalidade está justificada?
6. **Linguagem:** há palavras de ofício, clichês, redundâncias ou jargões desnecessários?
7. **Economia:** cada frase serve ao objetivo, sem contextualização ou explicação automática?
8. **Saída:** entreguei somente o solicitado, sem comentar o procedimento?

**Regra de recuperação:** se identificar falha, corrija só os trechos afetados e execute novamente os itens relevantes. Pare quando passar; não faça ciclos de reescrita sem motivo. Se o pedido não puder ser atendido com os fatos disponíveis, explique a limitação de modo breve, sem preencher lacunas com suposições.

## 3. Contracasos que impedem regressões

**Certeza:** “A reunião *pode* acontecer na quinta, se houver confirmação.” → “A reunião será quinta.” **INCORRETO** (remove condição e aumenta certeza).

**Quantidade:** “Enviei dois arquivos.” → “Enviei alguns arquivos.” **INCORRETO** (perde número exato).

**Negação:** “Não autorizo divulgar o material.” → “Autorizo divulgar o material.” **INCORRETO** (inverte o sentido).

**E-mail simples:** “Boa tarde! Queria avisar que amanhã não vou conseguir ir à escola porque tenho uma consulta.” **ADEQUADO**; não elevar para linguagem de ofício.

**Termo técnico:** “Execute `npm run build`.” → “Execute `npm run start`.” **INCORRETO**, ainda que a segunda construção pareça mais familiar.

**Revisão mínima:** “Obrigado pela resposta! Vou verificar e retorno amanhã.” → manter, se a frase estiver de acordo com o pedido; não substituir por “Agradeço imensamente pelo seu valioso retorno”.

Mais exemplos e exceções: `references/exemplos-contextuais.md` (leitura opcional, somente quando o caso gerar dúvida).

## 4. Escopo e compatibilidade

- Ative para **prosa destinada a pessoas**: e-mail, mensagem, postagem, descrição, artigo, trabalho escolar, roteiro, README/documentação e revisão de texto.
- Não reescreva código-fonte, fórmulas, conteúdo estruturado, textos literais ou citações sem autorização. Num arquivo com código e prosa, limite a edição à prosa especificada.
- Respeite as instruções de maior prioridade do agente e as regras do sistema em que a skill é carregada.
- Não guarde amostras, dados pessoais, perfis, identificadores ou preferências para uso futuro. Não acione ferramentas externas para inferir a identidade do autor.
- Não prometa burlar detectores de IA ou provar autoria humana: naturalidade editorial é diferente de autenticação.
- Se o agente não carregou esta skill, ela não consegue controlar seu comportamento. Se a carregou, ainda assim o resultado exige avaliação empírica.

## 5. Como medir consistência e melhorar versões futuras

**Não declare sucesso só porque o texto parece melhor em um exemplo.** Use o conjunto `tests/casos.jsonl` e `tests/PROTOCOLO.md` para comparar **mesmo modelo, mesmo prompt, mesma configuração**, com e sem esta skill, em conversas isoladas e com ordem alternada. Faça diversas repetições porque a saída pode variar.

A revisão manual deve verificar primeiro **erros graves** (invenção, alteração de fatos/negação/modalidade, perda de formato) e depois naturalidade, cordialidade, concisão e atendimento ao pedido. Testes automáticos de termos literais são auxiliares; eles **não provam equivalência semântica nem naturalidade**.

**Critério de atualização:** modifique a instrução somente quando um erro recorrente estiver documentado; acrescente o menor ajuste e um teste de regressão correspondente. Evite aumentar a skill apenas para repetir adjetivos como “mais natural” ou “mais humano”.

### Arquivos incluídos

- `SKILL.md`: regras completas e autossuficientes para execução.
- `references/exemplos-contextuais.md`: exemplos de escolhas adequadas e inadequadas.
- `tests/casos.jsonl`: cenários com critérios objetivos e revisão humana.
- `tests/PROTOCOLO.md`: procedimento de avaliação A/B e rubrica.
- `scripts/checar_resultados.py`: checagem automática **limitada** de termos e formato dos casos, sem conectar a APIs.
