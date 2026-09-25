local terminal = {}

function terminal.clear()
    if package.config:sub(1, 1) == "\\" then
        os.execute("cls")
    else
        os.execute("clear")
    end
end

function terminal.configureUTF8()
    if package.config:sub(1, 1) == "\\" then
        os.execute("chcp 65001 > nul")
    end
end

return terminal
