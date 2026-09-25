local function isValidLetter(guess)
    return guess:match("^[a-z]$") ~= nil
end

local function revealLetter(guess, word, maskedWord)
    local isCorrect = false
    local matchCount = 0

    for i = 1, #word do
        local currentLetter = word:sub(i, i)

        if currentLetter == guess then
            maskedWord[i] = guess
            isCorrect = true
            matchCount = matchCount + 1
        end
    end

    return isCorrect, matchCount
end

local function recordGuess(guess, isCorrect, gameState)
    gameState.guesses[guess] = isCorrect
    table.insert(gameState.guessHistory, guess)
end

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

    revealLetter(revealedLetter, gameState.word, gameState.maskedWord)
    recordGuess(revealedLetter, true, gameState)

    return revealedLetter
end

local function processHelp(gameState)
    if not gameState.difficulty.allowReveal then
        gameState.currentMessage = '(!) O comando "help" não está disponível nesta dificuldade.'
        return
    end

    local revealedLetter = revealRandomLetter(gameState)

    if revealedLetter then
        gameState.mistakes = gameState.mistakes + 2
        gameState.currentMessage = 'O comando "help" revelou a letra: ' .. revealedLetter
    end
end

local function getRepeatedGuessMessage(guess, guesses)
    if guesses[guess] == nil then
        return nil
    end

    if guesses[guess] then
        return "(!) Essa letra já foi utilizada e estava correta."
    end

    return "(!) Essa letra já foi utilizada e estava incorreta."
end

local function processLetter(guess, gameState)
    local isCorrect, matchCount = revealLetter(guess, gameState.word, gameState.maskedWord)

    recordGuess(guess, isCorrect, gameState)

    if isCorrect then
        gameState.score = gameState.score + (matchCount * gameState.difficulty.pointsPerMatch)
        gameState.currentMessage = "Você acertou uma letra!"
    else
        gameState.mistakes = gameState.mistakes + 1
        gameState.currentMessage = "Você errou!"
    end
end

local function processGuess(guess, gameState)
    if guess == "help" then
        processHelp(gameState)
        return
    end

    if not isValidLetter(guess) then
        gameState.currentMessage = "(!) Você deve digitar apenas 'uma' letra entre A-Z."
        return
    end

    local repeatedGuessMessage = getRepeatedGuessMessage(guess, gameState.guesses)

    if repeatedGuessMessage then
        gameState.currentMessage = repeatedGuessMessage
        return
    end

    processLetter(guess, gameState)
end

return processGuess
