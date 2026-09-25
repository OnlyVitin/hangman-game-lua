local text = require("utils.text")
local hangmanStages = require("data.hangmanStages")
local getHangmanStage = require("game.getHangmanStage")

local display = {}

local function showDifficultyMenuHeader()
    print([[
╔══════════════════════════════════╗
║      ESCOLHA A DIFICULDADE       ║
╚══════════════════════════════════╝
]])
end

local function showDifficultyOptions(difficulties)
    for i, difficulty in ipairs(difficulties) do
        print("[" .. i .. "] | " .. difficulty.name .. " " .. difficulty.description)
    end
end

local function showDifficultyInstructions()
    print("")
    print([[
╔══════════════════════════════════════════╗
║[1 desc] | Ver informações da dificuldade ║
║[1]      | Escolher dificuldade e jogar   ║
╚══════════════════════════════════════════╝
]])
end

function display.showDifficultyMenu(difficulties)
    showDifficultyMenuHeader()
    showDifficultyOptions(difficulties)
    showDifficultyInstructions()
end

function display.showErrorMessage(errorMessage)
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

function display.showHangman(maskedWord, mistakes, maxMistakes)
    local stage = getHangmanStage(mistakes, maxMistakes)
    local formattedWord = text.formatMaskedWord(maskedWord)

    print(string.format(hangmanStages[stage], formattedWord))
end

function display.showCurrentMessage(currentMessage)
    if currentMessage then
        print(currentMessage)
    end
end

function display.showUsedLetters(guessHistory, showUsedLetters)
    if showUsedLetters then
        print("Letras usadas até o momento: " .. table.concat(guessHistory, ", "))
    end
end

function display.showMistakes(mistakes, maxMistakes)
    print("Erros: " .. mistakes .. "/" .. maxMistakes)
end

function display.showScore(score)
    if score ~= 0 then
        print("Pontos: " .. score)
    end
end

function display.showFinalScore(score)
    print("Pontos: " .. score)
end

function display.showHint(hint, showHint)
    if showHint then
        print("Dica: " .. hint)
    end
end

function display.showHelpCommand(allowReveal)
    if allowReveal then
        print('Extra: digite "help" para revelar uma letra aleatória ao custo de 2 erros.')
    end
end

function display.showResult(word, maskedWord, mistakes, maxMistakes)
    if mistakes >= maxMistakes then
        print("Você perdeu!")
        print("A palavra era: " .. word)
    elseif word == table.concat(maskedWord) then
        print("")
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

return display
