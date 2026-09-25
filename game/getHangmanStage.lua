local function getHangmanStage(gameState)
    local maxStage = 5
    local mistakes = math.min(gameState.mistakes, gameState.maxMistakes)

    return math.floor((mistakes / gameState.maxMistakes) * maxStage)
end

return getHangmanStage
