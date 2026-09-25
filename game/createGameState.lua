local selectDifficulty = require("game.selectDifficulty")
local text = require("utils.text")
local words = require("data.words")

local function createGameState()
    local difficulty = selectDifficulty()
    local randomIndex = math.random(1, #words)
    local selectedWord = words[randomIndex]
    local word = selectedWord.word:lower()
    local maxMistakes = difficulty.baseMistakes + (#word * difficulty.mistakesPerLetter)

    local gameState = {
        word = word,
        hint = selectedWord.hint,
        maskedWord = text.createMaskedWord(word),
        guesses = {},
        guessHistory = {},
        mistakes = 0,
        score = 0,
        currentMessage = nil,
        difficulty = difficulty,
        maxMistakes = maxMistakes
    }

    return gameState
end

return createGameState
