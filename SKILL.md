---
name: humanizar-natural-ptbr
description: >-
  Escreve, revisa, reescreve, simplifica e adapta prosa em português brasileiro
  para e-mails, mensagens, redes sociais, textos escolares, documentos, READMEs
  e comunicação profissional. Use quando o usuário pedir texto natural,
  humanização, clareza, tom adequado, revisão ou menos linguagem robótica.
  Preserve fatos e voz fornecida; não altere código nem dados estruturados.
license: MIT
metadata:
  language: pt-BR
  version: "2.0.0"
  domain: writing-editing
---

# Humanizar Natural — escrita contextual em português brasileiro

## Objetivo

Entregar **o texto solicitado**, fiel às informações disponíveis, legível e adequado a quem vai ler. Naturalidade significa adequação à situação, **não** informalidade obrigatória, imitação de erros humanos ou ocultação de autoria. Não afirme que o texto passa em detectores nem que foi escrito por uma pessoa.

Ao aplicar esta skill, execute as etapas abaixo sem exibir checklist, justificativas ou etiquetas de processo, salvo quando a tarefa for avaliar, explicar ou comparar.

## 1. Contrato antes da escrita (obrigatório)

Extraia **somente do pedido atual**: `intenção | destinatário | canal | fatos que não podem mudar | registro | limites/formato`.

- Se o pedido for suficiente, **escreva imediatamente**. Para e-mails, mensagens e comunicação cotidiana, o padrão é **equilibrado, gentil e conciso**.
- Pergunte no máximo **uma pergunta útil** se faltar um dado verdadeiramente indispensável; não peça preferências estéticas que podem ser resolvidas por um padrão seguro.
- Não infira idade, renda, escolaridade, gênero, região ou perfil do autor. Não recupere histórico externo, dados pessoais nem exemplos privados para adivinhar sua voz.
- A tarefa é **CRIAR**, **REESCREVER**, **REVISAR**, **RESUMIR**, **AVALIAR** ou **COMPARAR**. Preserve formatos rígidos em qualquer modo.

## 2. Hierarquia de decisão

Aplique nesta ordem; uma regra inferior jamais anula uma superior.

1. **Instruções de maior prioridade e pedido concreto**: gênero, público, estilo explícito, extensão, estrutura e escopo.
2. **Fatos e significado**: preserve entidades, nomes, números, quantidades, datas, prazos, negações, obrigação, possibilidade, condições, causa, sequência, intensidade e intenção.
3. **Integridade literal**: preserve citações, URLs, comandos, identificadores, código, markdown protegido, termos técnicos necessários e dados estruturados, salvo pedido explícito.
4. **Voz fornecida na tarefa atual**: só reproduza escolhas de estilo visíveis e autorizadas, corrigindo erros quando a correção for solicitada.
5. **Clareza e naturalidade contextual**: substitua burocratês e enfeites apenas quando houver equivalência de sentido.
6. **Economia**: entregue a resposta no formato pedido, sem prefácio de chatbot, autopromoção ou alternativas não solicitadas.

Se não houver dados para sustentar uma frase, **não invente**. Não adicione sentimentos, promessas, atestados, justificativas, elogios ou resultados.

## 3. Fluxo editorial verificável

**A — Escolher o registro.** Identifique o canal antes de selecionar palavras. E-mail escolar não é ofício; mensagem de WhatsApp não é artigo; comunicado jurídico não é conversa informal. Se houver dúvida, use `references/registros-ptbr.md`.

**B — Criar uma primeira versão suficiente.** Coloque a informação importante primeiro quando apropriado. Use verbos claros e períodos que acompanhem a ideia. Preserve a voz do original em revisão. Não reestruture uma frase que já esteja adequada.

**C — Revisar pontos de atrito.** Procure, **somente quando prejudicarem o texto**: saudação automática; excesso de adjetivos; substantivos abstratos sem conteúdo; conectores em série; repetições; enumeração de três itens sem necessidade; contrastes artificiais; travessões e negrito decorativos; conclusão vazia; pedidos de desculpas fabricados. Use `references/padroes-e-limites.md` apenas em textos longos ou quando houver dúvida.

**D — Checar fidelidade.** Compare sentido do pedido e da versão final: a certeza mudou? Uma condição sumiu? Um número foi arredondado? O sujeito mudou? Acrescentou uma obrigação? Uma URL, comando ou citação mudou? Em caso afirmativo, corrija **apenas** o trecho problemático e confira novamente. Para reescritas delicadas, consulte `references/fidelidade.md`.

**E — Entregar e parar.** Não anuncie que usou a skill. Não faça uma nova rodada de reescrita só para parecer mais humano. Se o resultado já atende ao pedido, finalize.

## 4. Vocabulário brasileiro: adequação, não lista de proibições

- Prefira **“avisar”** a “comunicar formalmente”, **“ir à escola”** a “comparecer à instituição de ensino”, **“usar”** a “utilizar” **quando equivalentes e no cotidiano**. Não proíba palavras corretas de forma universal.
- Diferencie **formalidade**, **gentileza** e **extensão**. É possível ser breve, direto e respeitoso. Não transforme formalidade institucional necessária em gíria.
- Não copie literalmente fala espontânea para documentos; hesitações, contrações, regionalismos e gírias só entram se forem adequados ao canal e já estiverem autorizados ou presentes no original.
- Não finja que existe “o português médio” único. Variação regional, situacional e de gênero textual é real. Consulte `references/registros-ptbr.md` para a fundamentação e exemplos.

## 5. Padrões por canal

| Canal | Preferir | Evitar quando desnecessário |
| --- | --- | --- |
| E-mail escolar/profissional | cumprimento simples, fato principal, pedido/aviso, fecho adequado | “venho por meio deste”, “comparecer à instituição” |
| Discord/WhatsApp/DM | mensagem breve, concreta, cordialidade compatível | comunicado oficial, abreviações forçadas |
| README e documentação | comandos exatos, instruções acionáveis, títulos úteis | trocar nomes de APIs, omitir etapas, marketing |
| Redação escolar | norma-padrão clara, progressão, conectores com função | frases genéricas, argumentos inventados |
| Comunicação institucional/jurídica | termos e obrigações exatos, cautelas proporcionais | simplificar exigência normativa |
| Post/descrição | especificidade e voz do projeto | superlativos ou vantagens sem comprovação |

## 6. Exemplos mínimos e contraprovas

**E-mail cotidiano:**

- Artificial naquele contexto: “Venho por meio deste informar que não poderei comparecer à instituição de ensino amanhã em virtude de uma consulta.”
- Natural e equivalente: “Queria avisar que amanhã não vou conseguir ir à escola porque tenho uma consulta.”

**Mas a simplificação NÃO deve mudar o sentido:**

- “O candidato **deverá** apresentar o documento.” não vira “O candidato **pode** levar o documento.”
- “**Talvez** eu envie na sexta, **se** receber aprovação.” não vira “Vou enviar na sexta.”
- “Foram aprovados **3 de 12** produtos.” não vira “Alguns produtos foram aprovados.”
- `` `npm ci` `` não vira `` `npm install` ``.
- “Oi! Você consegue me mandar o arquivo hoje?” pode permanecer exatamente igual.

Leia `references/exemplos-contextuais.md` quando quiser exemplos específicos de canal ou caso-limite.

## 7. Auditoria final (internamente, em ordem)

1. Os **fatos** e entidades foram preservados?
2. **Negação, modalidade, causalidade, condição, intensidade e quantidade** permaneceram intactas?
3. Algum detalhe foi **inventado** ou atribuído ao usuário sem fundamento?
4. **Trechos literais, URLs, código, dados e estrutura** foram respeitados?
5. O registro condiz com **destinatário e canal**?
6. Há **formalidade, repetição ou efeito decorativo** que atrapalha?
7. A extensão e a formatação **seguem o pedido**?
8. A saída contém **somente o resultado** solicitado?

Se 1–4 falhar, corrija antes de entregar. Se 5–8 falhar, ajuste proporcionalmente. Se a primeira versão passar, pare. Não alegue validação automática de naturalidade ou autoria.

## 8. Escopo, segurança e referências

Ative para texto escrito destinado a pessoas, inclusive documentação em linguagem natural. Não altere programas, fórmulas, dados estruturados ou textos juridicamente vinculantes sem autorização explícita. Em casos de alta consequência, preserve terminologia técnica e incertezas.

Dados pessoais, exemplos de escrita e preferências usados na tarefa não devem ser guardados, enviados a serviços externos ou reutilizados para criar perfis. Não busque conversas privadas. Não aplique táticas para enganar verificadores de autoria.

**Leitura progressiva:**
- `references/registros-ptbr.md` — registros, variedade e escolhas lexicais.
- `references/padroes-e-limites.md` — sinais de texto genérico, sem falsos positivos.
- `references/fidelidade.md` — invariantes semânticos, exceções e conflito.
- `references/exemplos-contextuais.md` — exemplos e contracasos.
- `references/fontes-e-metodo.md` — fundamentação e limites da pesquisa.

**Para quem desenvolve e avalia a skill:** os casos de teste e protocolos estão no repositório em `tests/`; não são necessários para executar uma tarefa de redação. Uma skill oferece instruções, não garantia de cumprimento pelo agente. Compare resultados com e sem skill antes de reivindicar melhora mensurável.
