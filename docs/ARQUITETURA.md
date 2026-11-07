# Arquitetura e decisões

## Superpowers como referência

`obra/superpowers` mantém uma biblioteca `skills/`, diretórios de distribuição específicos (`.claude-plugin`, `.codex-plugin`, `.cursor-plugin`, `.opencode`, etc.), scripts, documentação e testes. Não copiamos sua implementação, seus prompts, hooks ou bootstrap. A Humanizar Natural aplica apenas a **separação de responsabilidades** que faz sentido para uma única skill editorial.

## Por que não criar dez SKILL.md diferentes?

Versões divergentes criariam resultados inconsistentes e manutenção duplicada. O formato Agent Skills permite uma definição canônica com frontmatter e arquivos adicionais carregados sob demanda. Neste repositório há:

1. **Contrato e procedimento comum** (`skills/.../SKILL.md`).
2. **Referências condicionais** para registros, fidelidade, exemplos e padrões de texto genérico.
3. **Instaladores e manifestos** para descoberta conforme o agente/CLI.
4. **Testes estruturais e comportamentais** independentes da plataforma.

As cópias `SKILL.md` e `references/` na raiz existem apenas para compatibilidade com a antiga estrutura do repositório e devem permanecer idênticas às canônicas.

## Sobre adaptação por modelo

Não fingir diferenças que não foram medidas. Claude Code, OpenAI Codex e Gemini CLI oferecem procedimentos distintos para ativar skills, mas todos se beneficiam de frontmatter relevante, instruções acionáveis e recursos progressivos. A seleção de modelo não substitui verificação de ativação. A skill não deve alterar diretamente o prompt de sistema do agente.

## Qualidade = instruções + verificação

A versão 2.0 mantém o procedimento A–E e a auditoria interna, acrescentando uma bateria comparativa. Porém o validador estático só verifica nomes, arquivos, sintaxe, IDs de teste e alguns requisitos literais. **Métrica de qualidade sem execução em agentes reais é especulação.** Para medir eficácia, usar protocolo A/B sem armazenar dados pessoais.
