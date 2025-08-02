-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Toggle = Instance.new("TextButton")
local Status = Instance.new("TextLabel")

ScreenGui.Name = "BrainrotFinder"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

Frame.Name = "Main"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Position = UDim2.new(0.35, 0, 0.35, 0)
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Active = true
Frame.Draggable = true

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "🧠 Brainrot Finder"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

Toggle.Name = "ToggleButton"
Toggle.Parent = Frame
Toggle.Position = UDim2.new(0.1, 0, 0.4, 0)
Toggle.Size = UDim2.new(0.8, 0, 0, 30)
Toggle.Text = "🔎 Ativar Busca"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Toggle.Font = Enum.Font.Gotham
Toggle.TextSize = 16

Status.Name = "Status"
Status.Parent = Frame
Status.Position = UDim2.new(0.1, 0, 0.75, 0)
Status.Size = UDim2.new(0.8, 0, 0, 30)
Status.Text = "Status: Inativo"
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.Font = Enum.Font.Gotham
Status.TextSize = 14
Status.TextWrapped = true

-- Lista de Brainrots Raros (God/Secret/etc.)
local brainrotsRaros = {
    "La Vacca Saturno Saturita",
    "Tralalero Tralala",
    "Odin din din din",
    "Matteo",
    "Los Tralaleritos",
    "Graipuss Medussi",
   "Chimpanzini Spiderini",
   "Las Vaquitas Saturnitas",
}

-- Função para checar se é raro
local function ehBrainrotRaro(brainrot)
    for _, raro in pairs(brainrotsRaros) do
        if string.lower(brainrot) == string.lower(raro) then
            return true, raro
        end
    end
    return false
end

-- Toggle da busca
local ativo = false
Toggle.MouseButton1Click:Connect(function()
    ativo = not ativo
    Toggle.Text = ativo and "⏹️ Parar Busca" or "🔎 Ativar Busca"
    Status.Text = ativo and "Status: Buscando..." or "Status: Inativo"

    if ativo then
        coroutine.wrap(function()
            while ativo do
                local achou = false

                -- Verifica todos os jogadores
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then
                        local success, brainrot = pcall(function()
                            return player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("Brainrot").Value
                        end)

                        if success and brainrot then
                            local raro, nome = ehBrainrotRaro(brainrot)
                            if raro then
                                Status.Text = "🎯 Eu acho que é: " .. nome
                                warn("🎯 Eu acho que é: " .. nome)
                                ativo = false
                                Toggle.Text = "🔎 Ativar Busca"
                                return
                            end
                        end
                    end
                end

                -- Server Hop automático
                if not achou then
                    Status.Text = "🔁 Server Hop..."
                    local TeleportService = game:GetService("TeleportService")
                    local HttpService = game:GetService("HttpService")
                    local PlaceId = 109983668079237 -- ID fixo que você forneceu

                    local function pegarServidorDisponivel()
                        local servidores = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data
                        for _, server in ipairs(servidores) do
                            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                                return server.id
                            end
                        end
                        return nil
                    end

                    local servidor = pegarServidorDisponivel()
                    if servidor then
                        TeleportService:TeleportToPlaceInstance(PlaceId, servidor, game.Players.LocalPlayer)
                    else
                        Status.Text = "❌ Nenhum servidor disponível"
                    end
                end

                task.wait(5)
            end
        end)()
    end
end)
