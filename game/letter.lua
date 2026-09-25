local letter = {}

function letter.revealLetter(guess, gameState)
    local isCorrect = false
    local matchCount = 0

    for i = 1, #gameState.word do
        local currentLetter = gameState.word:sub(i, i)

        if currentLetter == guess then
            gameState.maskedWord[i] = guess
            isCorrect = true
            matchCount = matchCount + 1
        end
    end

    return isCorrect, matchCount
end

function letter.isValidLetter(guess)
    return guess:match("^[a-z]$") ~= nil
end

return letter
