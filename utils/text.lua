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
    local withoutWhitespace = input:gsub("%s+", "")
    return withoutWhitespace
end

function text.toLowercase(input)
    return string.lower(input)
end

function text.normalizeInput(input)
    input = text.removeWhitespace(input)
    input = text.toLowercase(input)

    return input
end

function text.parseDescriptionCommand(input)
    input = text.normalizeInput(input)

    local choice = input:match("^(%d+)desc$")

    if choice then
        return tonumber(choice)
    end

    return nil
end

return text
