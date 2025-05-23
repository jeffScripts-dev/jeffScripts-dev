local placeId = game.PlaceId

local moAcademyIds = {
    [8929050629] = true,
    [12350891962] = true,
    [9000622508] = true,
}

local strictBrotherIds = {
    [15629601567] = true,
    [15877097792] = true,
}

local bladeBallIds = {
    [13772394625] = true,
    [15234596844] = true,
}

if moAcademyIds[placeId] then
    print("Loading Mo's Academy GUIs...")
    local espCode = game:HttpGet("https://raw.githubusercontent.com/jeffScripts-dev/jeffScripts-dev/main/MoAcademy_ESP.lua")
    local teleportCode = game:HttpGet("https://raw.githubusercontent.com/jeffScripts-dev/jeffScripts-dev/main/MoAcademy_Teleport.lua")

    local success1, err1 = pcall(loadstring(espCode))
    if not success1 then
        warn("Falha ESP GUI:", err1)
    end

    local success2, err2 = pcall(loadstring(teleportCode))
    if not success2 then
        warn("Falha Teleport GUI:", err2)
    end

elseif strictBrotherIds[placeId] then
    print("Loading Strict Brother script...")
    local code = game:HttpGet("https://raw.githubusercontent.com/jeffScripts-dev/jeffScripts-dev/main/StrictBrother.lua")
    local success, err = pcall(loadstring(code))
    if not success then
        warn("Erro Strict Brother:", err)
    end

elseif bladeBallIds[placeId] then
    print("Loading Blade Ball script...")
    local code = game:HttpGet("https://raw.githubusercontent.com/jeffScripts-dev/jeffScripts-dev/main/BladeBall.lua")
    local success, err = pcall(loadstring(code))
    if not success then
        warn("Erro Blade Ball:", err)
    end

else
    warn("Jogo não suportado:", placeId)
end
