local letter = require("game.letter")
local revealRandomLetter = require("game.revealRandomLetter")

local function processGuess(guess, gameState)
    if guess == "help" then
        if gameState.difficulty.allowReveal then
            local revealedLetter = revealRandomLetter(gameState)

            if revealedLetter then
                gameState.mistakes = gameState.mistakes + 2
                gameState.currentMessage = 'O comando "help" revelou a letra: ' .. revealedLetter
            end
        else
            gameState.currentMessage = '(!) O comando "help" não está disponível nesta dificuldade.'
        end

        return
    end

    if not letter.isValidLetter(guess) then
        gameState.currentMessage = "(!) Você deve digitar apenas 'uma' letra entre A-Z."
        return
    end

    if gameState.guesses[guess] ~= nil then
        if gameState.guesses[guess] then
            gameState.currentMessage = "(!) Essa letra já foi utilizada e estava correta."
        else
            gameState.currentMessage = "(!) Essa letra já foi utilizada e estava incorreta."
        end

        return
    end

    local isCorrect, matchCount = letter.revealLetter(guess, gameState)

    gameState.guesses[guess] = isCorrect
    table.insert(gameState.guessHistory, guess)

    if isCorrect then
        gameState.score = gameState.score + (matchCount * gameState.difficulty.pointsPerMatch)
        gameState.currentMessage = "Você acertou uma letra!"
    else
        gameState.mistakes = gameState.mistakes + 1
        gameState.currentMessage = "Você errou!"
    end
end

return processGuess
