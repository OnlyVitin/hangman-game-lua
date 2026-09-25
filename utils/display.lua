local text = require("utils.text")
local hangmanStages = require("data.hangmanStages")
local getHangmanStage = require("game.getHangmanStage")

local display = {}

function display.showDifficultyMenu(difficulties, errorMessage)
    print([[
╔══════════════════════════════════╗
║      ESCOLHA A DIFICULDADE       ║
╚══════════════════════════════════╝
]])

    for i, difficulty in ipairs(difficulties) do
        print("[" .. i .. "] | " .. difficulty.name .. " " .. difficulty.description)
    end

    print("")
    print([[
╔══════════════════════════════════════════╗
║[1 desc] | Ver informações da dificuldade ║
║[1]      | Escolher dificuldade e jogar   ║
╚══════════════════════════════════════════╝
]])

    if errorMessage then
        print(errorMessage)
        print("")
    end
end

function display.showDifficultyInfo(difficulty)
    print("Dificuldade: " .. difficulty.name)
    print("")
    print("Erros base: " .. difficulty.baseMistakes)
    print("Erros extras por letra: " .. difficulty.mistakesPerLetter)
    print("Pontos por acerto: " .. difficulty.pointsPerMatch)
    print("Dica: " .. (difficulty.showHint and "Sim" or "Não"))
    print("Mostrar letras usadas: " .. (difficulty.showUsedLetters and "Sim" or "Não"))
    print('Comando "help": ' .. (difficulty.allowReveal and "Sim" or "Não"))
    print('(!) "help" revela uma letra pelo custo de "2" erros (Você não recebe pontos)')
end

function display.showHangman(gameState)
    local stage = getHangmanStage(gameState)
    local formattedWord = text.formatMaskedWord(gameState.maskedWord)

    print(string.format(hangmanStages[stage], formattedWord))
end

function display.showCurrentMessage(gameState)
    if gameState.currentMessage then
        print(gameState.currentMessage)
    end
end

function display.showUsedLetters(gameState)
    if gameState.difficulty.showUsedLetters then
        print("Letras usadas até o momento: " .. table.concat(gameState.guessHistory, ", "))
    end
end

function display.showMistakes(gameState)
    print("Erros: " .. gameState.mistakes .. "/" .. gameState.maxMistakes)
end

function display.showScore(gameState)
    if gameState.score ~= 0 then
        print("Pontos: " .. gameState.score)
    end
end

function display.showFinalScore(gameState)
    print("Pontos: " .. gameState.score)
end

function display.showHint(gameState)
    if gameState.difficulty.showHint then
        print("Dica: " .. gameState.hint)
    end
end

function display.showHelpCommand(gameState)
    if gameState.difficulty.allowReveal then
        print('Extra: digite "help" para revelar uma letra aleatória ao custo de 2 erros.')
    end
end

function display.showResult(gameState)
    if gameState.mistakes >= gameState.maxMistakes then
        print("Você perdeu!")
        print("A palavra era: " .. gameState.word)
    elseif gameState.word == table.concat(gameState.maskedWord) then
        print("Parabéns! Você venceu!")
        print("")
        print([[
    _._     _,-'""`-._
    (,-.`._,'(      |\`-/|
        `-.-' \ )-`( , o o)
              `-    \`_`"'-
        ]])
    end
end

function display.showGameScreen(gameState)
    display.showHangman(gameState)
    display.showCurrentMessage(gameState)
    display.showUsedLetters(gameState)
    display.showMistakes(gameState)
    display.showScore(gameState)
    display.showHint(gameState)
    display.showHelpCommand(gameState)
end

function display.showFinalScreen(gameState)
    display.showHangman(gameState)
    display.showMistakes(gameState)
    display.showFinalScore(gameState)
    display.showResult(gameState)
end

return display
