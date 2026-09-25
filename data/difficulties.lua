local difficulties = {
    {
        name = "Fácil",
        description = "• Para iniciantes",
        baseMistakes = 5,
        mistakesPerLetter = 1,
        showHint = true,
        allowReveal = true,
        showUsedLetters = true,
        pointsPerMatch = 5
    },

    {
        name = "Normal",
        description = "• Para quem busca por uma experiência mediana",
        baseMistakes = 5,
        mistakesPerLetter = 0,
        showHint = true,
        allowReveal = true,
        showUsedLetters = true,
        pointsPerMatch = 10
    },

    {
        name = "Difícil",
        description = "• Pense bem antes de escolher essa dificuldade",
        baseMistakes = 4,
        mistakesPerLetter = 0,
        showHint = false,
        allowReveal = true,
        showUsedLetters = false,
        pointsPerMatch = 15
    }
}

return difficulties
