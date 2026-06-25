local ConfigMap = {
    [92416421522960] = {
        url = "https://raw.githubusercontent.com/QuantumPH2/SlimeRNG/refs/heads/main/.lua"
    },
    [121864768012064] = {
        url = "https://raw.githubusercontent.com/QuantumPH2/Library/refs/heads/main/Fish%20it"
    },
    [93978595733734] = {
        url = "https://raw.githubusercontent.com/QuantumPH2/ViolenceDistrict/refs/heads/main/VD.lua"
    },
    [126884695634066] = {
        url = "https://raw.githubusercontent.com/zerotheking152-png/QuantumGAG/main/QHCommunity.lua"
    },
    [83369512629707] = {
        url = "https://raw.githubusercontent.com/zerotheking152-png/QuantumSAWAH/refs/heads/main/Community.lua"
    },
    [70411440483149] = {
        url = "https://raw.githubusercontent.com/QuantumPH2/100NIGHT/refs/heads/main/99NIGHTATSEA.lua"
    }
}

local config = ConfigMap[game.PlaceId]

if config and config.url then
    print("Loading script for PlaceId:", game.PlaceId)

    local success, response = pcall(function()
        return game:HttpGet(config.url)
    end)

    if success and response then
        local ok, err = pcall(function()
            loadstring(response)()
        end)

        if not ok then
            warn("Execute error:", err)
        end
    else
        warn("Fetch error:", response)
    end
else
    warn("Map tidak support:", game.PlaceId)
end
