# Hangman Game

Jogo da forca desenvolvido em Lua, com sistema de dificuldades, pontuação, dicas, controle de tentativas e interface em ASCII no terminal.

## Preview

![Hangman Game](https://i.imgur.com/Rd2JSxh.png)

## Requisitos

- Lua 5.5+

## Como jogar

- Escolha uma dificuldade antes de começar.
- Digite uma letra para tentar acertar a palavra.
- Digite `help` para revelar uma letra aleatória.
- O comando `help` adiciona erros à partida.
- Ao final, escolha se deseja jogar novamente.

## Dificuldades

- Fácil
- Normal
- Difícil

## Como rodar

```bash
lua main.lua
```

## Estrutura do projeto

### `data/`

Contém os dados e configurações fixas do jogo, como palavras, dificuldades e estágios visuais da forca.

### `game/`

Contém as principais regras e lógicas do jogo, como criação da partida, processamento das tentativas, seleção de dificuldade e uso do comando `help`.

### `utils/`

Contém funções auxiliares utilizadas em diferentes partes do projeto, sendo manipulação de texto, controle do terminal e exibição das informações.

### `main.lua`

Responsável por controlar o fluxo principal do jogo, iniciando partidas, processando os turnos e permitindo jogar novamente.
