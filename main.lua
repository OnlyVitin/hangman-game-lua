local processGuess = require("game.processGuess")
local createGameState = require("game.createGameState")
local askPlayAgain = require("game.askPlayAgain")

local text = require("utils.text")
local display = require("utils.display")
local terminal = require("utils.terminal")

terminal.configureUTF8()
math.randomseed(os.time())

local keepPlaying = true

while keepPlaying do
    local gameState = createGameState()

    while gameState.word ~= table.concat(gameState.maskedWord) and gameState.mistakes < gameState.maxMistakes do
        terminal.clear()

        display.showHangman(gameState.maskedWord, gameState.mistakes, gameState.maxMistakes)
        display.showUsedLetters(gameState.guessHistory, gameState.difficulty.showUsedLetters)
        display.showMistakes(gameState.mistakes, gameState.maxMistakes)
        display.showScore(gameState.score)
        display.showHint(gameState.hint, gameState.difficulty.showHint)
        display.showHelpCommand(gameState.difficulty.allowReveal)
        print("")
        display.showCurrentMessage(gameState.currentMessage)

        print("Insira uma letra: ")

        local guess = io.read()
        local normalizedGuess = text.normalizeText(guess)

        processGuess(normalizedGuess, gameState)
    end

    terminal.clear()

    display.showHangman(gameState.maskedWord, gameState.mistakes, gameState.maxMistakes)
    display.showMistakes(gameState.mistakes, gameState.maxMistakes)
    display.showFinalScore(gameState.score)
    display.showResult(gameState.word, gameState.maskedWord, gameState.mistakes, gameState.maxMistakes)

    keepPlaying = askPlayAgain()
end
