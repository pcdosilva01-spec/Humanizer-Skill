# Publicação no GitHub com autorização via navegador

O arquivo `publicar-humanizer.sh` publica somente arquivos autorizados por `scripts/publicacao-manifest.txt` no repositório **pcdosilva01-spec/Humanizer-Skill**. É um utilitário local; não executamos login remoto por você.

## Dependências Linux Mint / Ubuntu

```bash
sudo apt update
sudo apt install -y git gh python3
```

`gh` é a GitHub CLI oficial. Em distribuições que usem uma versão mais antiga, instale uma versão suportada pela documentação do GitHub.

## Uso (pasta extraída)

```bash
bash publicar-humanizer.sh
```

## Uso (ZIP ao lado do script)

```bash
bash publicar-humanizer.sh Humanizar-Natural-Multiplataforma-v2.0.0.zip
```

## Autorização por dispositivo

Se a conta ainda não estiver conectada, o comando `gh auth login --hostname github.com --git-protocol https --web` apresenta um código temporário e o site `https://github.com/login/device`. Abra o endereço, faça login **diretamente no GitHub**, digite o código mostrado e autorize a CLI. A quantidade exata de caracteres do código é definida pelo GitHub; o script não gera código nem pede que você o envie a alguém.

O `gh` pode abrir o navegador automaticamente; se não conseguir, a autorização manual no endereço acima funciona. Depois, `gh auth setup-git` configura o Git para usar a autenticação do `gh`. O script identifica sua conta pública com `gh api user` e usa o endereço `ID+login@users.noreply.github.com` apenas na configuração **local do commit no clone temporário**.

## Salvaguardas

- Não faz push forçado e não executa `git push --force`.
- Clona o remoto antes de atualizar, preservando o histórico e a branch padrão.
- Não usa `git add .`; adiciona apenas arquivos do manifesto do pacote.
- Não envia `~/.ssh`, `.env`, tokens, cookies nem outros arquivos do computador.
- Recusa links simbólicos no pacote a ser enviado e detecta entradas ZIP de caminho inseguro.
- Mostra `git diff --cached` e exige confirmação antes do commit.
- Se o repositório existente tiver arquivos não listados no pacote, deixa-os intocados. Arquivos obsoletos antigos não são removidos automaticamente.
- Se houver alterações feitas depois do clone, o Git poderá rejeitar o push; sincronize com segurança e tente novamente.
- A autenticação pode persistir no armazenamento de credenciais do GitHub CLI; use `gh auth logout` se quiser desconectar o computador. Não há alegação de remoção do lado do GitHub.

**Observação:** quem executar o script precisa ter permissão de escrita no repositório. Login não concede acesso automaticamente; a autorização pode ser negada ou exigir autenticação adicional.
