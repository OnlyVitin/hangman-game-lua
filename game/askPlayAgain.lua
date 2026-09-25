local text = require("utils.text")

local function askPlayAgain()
    while true do
        print("")
        print("Deseja jogar novamente? [s/n]")

        local answer = text.normalizeInput(io.read())

        if answer == "s" then
            return true
        elseif answer == "n" then
            return false
        else
            print("Digite apenas 's' ou 'n'.")
        end
    end
end

return askPlayAgain
