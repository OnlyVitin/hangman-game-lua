local text = {}

function text.formatMaskedWord(maskedWord)
    local formattedWord = table.concat(maskedWord, " ")
    formattedWord = formattedWord:gsub("^.", string.upper)

    return formattedWord
end

function text.createMaskedWord(word)
    local maskedWord = {}

    for i = 1, #word do
        maskedWord[i] = "*"
    end

    return maskedWord
end

function text.removeWhitespace(input)
    return input:gsub("%s+", "")
end

function text.normalizeText(value)
    local valueWithoutSpace = text.removeWhitespace(value)
    return valueWithoutSpace:lower()
end

function text.parseDescriptionCommand(input)
    input = text.normalizeText(input)

    local choice = input:match("^(%d+)desc$")

    if choice then
        return tonumber(choice)
    end

    return nil
end

return text
