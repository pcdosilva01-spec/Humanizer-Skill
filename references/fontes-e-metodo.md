# Fontes e metodologia (pesquisa externa, novembro de 2026)

Estas fontes justificam **o método editorial**, não listas universais de “palavras humanas”, desempenho mensurado da skill ou resultados de testes em modelos.

1. **Agent Skills — Specification:** https://agentskills.io/specification — estrutura com SKILL.md, YAML e recursos sob demanda.
2. **C-ORAL-BRASIL (UFMG):** https://c-oral-brasil.org/ — projeto de corpora de fala espontânea, especialmente contextos informais; não extrapolar diretamente para escrita profissional.
3. **Linguateca, Corpus Brasileiro:** https://www.linguateca.pt/acesso/contabilizacao.php — corpus com gêneros escritos e falados; frequência, por si só, não determina boa escolha de estilo.
4. **Linguateca, C-ORAL-BRASIL:** https://www.linguateca.pt/acesso/corpus.php?corpus=CORALBRASIL — amostras de fala e possibilidades de consulta.
5. **Academia Brasileira de Letras, VOLP:** https://www.academia.org.br/nossa-lingua/busca-no-vocabulario — grafia e classe gramatical; não serve como guia de cordialidade.
6. **Wikipedia — Signs of AI writing:** https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing — observações comunitárias que podem orientar revisão, mas não demonstram autoria. Alguns padrões são comuns também em escrita humana.
7. **OpenAI — Testing Agent Skills Systematically with Evals:** https://developers.openai.com/blog/eval-skills — avaliar comportamento com cenários e validação em vez de confundir instruções com resultados.
8. **Superpowers (referência de organização, não código reutilizado):** https://github.com/obra/superpowers — separação de skills, scripts, testes e integrações por ambiente; não foi clonado nem redistribuído.

## Procedimento recomendado para pesquisar mais vocabulário

- Comparar formas em um corpus **por gênero textual**, não por impressão de familiaridade.
- Separar correção ortográfica, frequência de uso, adequação ao canal e preferência do autor.
- Elaborar pares mínimos com **mesmo significado**, testando exceções em que a forma formal é necessária.
- Não copiar conversas privadas, conteúdo de terceiros identificáveis ou dados pessoais para treinar um perfil de autor.
- Não inventar métricas de frequência, exemplos atribuídos a falantes reais ou generalizações sobre grupos sociais.

## O que não foi feito

Não foi realizada análise quantitativa reproduzível de frequência de palavras nos corpora nem varredura de conversas privadas. Os pares neste pacote são **exemplos editoriais construídos**, não citações de pessoas reais. Não há garantia de detectar, ocultar ou provar autoria humana.
