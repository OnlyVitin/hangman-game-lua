local difficulties = require("data.difficulties")
local text = require("utils.text")
local display = require("utils.display")
local terminal = require("utils.terminal")

local function selectDifficulty()
    local errorMessage = nil

    while true do
        terminal.clear()
        display.showDifficultyMenu(difficulties, errorMessage)

        local input = io.read()
        local descriptionIndex = text.parseDescriptionCommand(input)
        local choice = tonumber(text.removeWhitespace(input))

        if descriptionIndex and difficulties[descriptionIndex] then
            terminal.clear()
            display.showDifficultyInfo(difficulties[descriptionIndex])

            print("")
            print("Pressione ENTER para voltar.")
            local _ = io.read()
        elseif choice and difficulties[choice] then
            return difficulties[choice]
        else
            errorMessage = "(!) Entrada inválida. Tente novamente."
        end
    end
end

return selectDifficulty
