local difficulties = require("data.difficulties")
local text = require("utils.text")
local display = require("utils.display")
local terminal = require("utils.terminal")

local function selectDifficulty()
    local errorMessage = nil

    while true do
        terminal.clear()
        display.showDifficultyMenu(difficulties)
        display.showErrorMessage(errorMessage)

        local input = io.read()
        local descriptionIndex = text.parseDescriptionCommand(input)
        local choice = tonumber(text.removeWhitespace(input))

        if descriptionIndex and difficulties[descriptionIndex] then
            errorMessage = nil
            terminal.clear()
            display.showDifficultyInfo(difficulties[descriptionIndex])

            print("")
            print("Pressione ENTER para voltar.")
            local _ = io.read()
        elseif choice and difficulties[choice] then
            return difficulties[choice]
        else
            errorMessage = string.format(
                '(!) Entrada inválida. Use um número de 1 a %d ou um número seguido de "desc".',
                #difficulties
            )
        end
    end
end

return selectDifficulty
