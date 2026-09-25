local letter = require("game.letter")

local function revealRandomLetter(gameState)
    local availableLetters = {}
    local seenLetters = {}

    for i = 1, #gameState.word do
        local currentLetter = gameState.word:sub(i, i)

        if gameState.maskedWord[i] == "*" and not seenLetters[currentLetter] then
            table.insert(availableLetters, currentLetter)
            seenLetters[currentLetter] = true
        end
    end

    if #availableLetters == 0 then
        return nil
    end

    local revealedLetter = availableLetters[math.random(1, #availableLetters)]

    letter.revealLetter(revealedLetter, gameState)

    gameState.guesses[revealedLetter] = true
    table.insert(gameState.guessHistory, revealedLetter)

    return revealedLetter
end

return revealRandomLetter
