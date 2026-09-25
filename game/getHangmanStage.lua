local function getHangmanStage(mistakes, maxMistakes)
    local maxStage = 5
    local cappedMistakes = math.min(mistakes, maxMistakes)

    return math.floor((cappedMistakes / maxMistakes) * maxStage)
end

return getHangmanStage
