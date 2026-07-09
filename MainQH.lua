local Loader = {
    Name = "QH Script Loader",
    Version = "1.0.0",
    Author = "QuantumPH2",
}

local Scripts = {
    [92416421522960]  = { name = "Slime RNG",        url = "https://raw.githubusercontent.com/QuantumPH2/SlimeRNG/refs/heads/main/.lua" },
    [121864768012064] = { name = "Fish It",          url = "https://raw.githubusercontent.com/QuantumPH2/LibraryQH/refs/heads/main/fishdih.lua" },
    [93978595733734]  = { name = "Violence District", url = "https://raw.githubusercontent.com/QuantumPH2/ViolenceDistrict/refs/heads/main/VD.lua" },
    [126884695634066] = { name = "QH Community",     url = "https://raw.githubusercontent.com/zerotheking152-png/QuantumGAG/main/QHCommunity.lua" },
    [83369512629707]  = { name = "Quantum Sawah",    url = "https://raw.githubusercontent.com/zerotheking152-png/QuantumSAWAH/refs/heads/main/Community.lua" },
    [139802517550914] = { name = "99 Night At Sea",  url = "https://raw.githubusercontent.com/QuantumPH2/100NIGHT/refs/heads/main/99NIGHTATSEA.lua" },
}

local PlaceId = game.PlaceId
local GameInfo = Scripts[PlaceId]

if not GameInfo then
    warn(string.format("[%s v%s] Game tidak terdaftar (PlaceId: %d)", Loader.Name, Loader.Version, PlaceId))
    return
end

print(string.format("[%s] Memuat: %s | PlaceId: %d", Loader.Name, GameInfo.name, PlaceId))

local ok, source = pcall(game.HttpGet, game, GameInfo.url)

if not ok then
    warn(string.format("[%s] Fetch gagal: %s", Loader.Name, tostring(source)))
    return
end

local ran, err = pcall(loadstring(source))

if not ran then
    warn(string.format("[%s] Execute gagal: %s", Loader.Name, tostring(err)))
else
    print(string.format("[%s] %s berhasil dimuat!", Loader.Name, GameInfo.name))
end
