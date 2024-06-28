
function convert(record)
    local result = {}
    for key, value in pairs(record) do
        local redacted_value = value  -- Initialize redacted_value with the original value

        -- Redact SSNs
        redacted_value, _ = string.gsub(redacted_value, '%d%d%d%-%d%d%-%d%d%d%d', 'REDACTED')

        -- Redact IP addresses
        redacted_value, _ = string.gsub(redacted_value, '%d+%.%d+%.%d+%.%d+', 'REDACTED')

        result[key] = redacted_value  -- Add the redacted value to the new table
    end
    return result

end



-- Entry point for Fluent Bit filter
function filter(tag, timestamp, record)
    if record["audit"] == "true" then
        local result = convert(record)
        return 1, timestamp, result
    else
        return 0, timestamp, record
    end

end

-- Return the filter object
return {
    filter = filter
}