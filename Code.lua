-- GUI Exploit estilo Dark - com botão, toggle, label e draggable
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ExploitDarkUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Frame principal
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 220, 0, 180)
Frame.Position = UDim2.new(0.5, -110, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

-- Título
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Text = "STEAL A BRAINROT"
Title.Font = Enum.Font.GothamBlack
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.BorderSizePixel = 0
Title.Parent = Frame

-- Aba "MAIN"
local Tab = Instance.new("TextLabel")
Tab.Size = UDim2.new(1, 0, 0, 25)
Tab.Position = UDim2.new(0, 0, 0, 30)
Tab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Tab.Text = "MAIN"
Tab.Font = Enum.Font.GothamBold
Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab.TextSize = 14
Tab.BorderSizePixel = 0
Tab.Parent = Frame

-- Label de Status
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -20, 0, 25)
StatusLabel.Position = UDim2.new(0, 10, 0, 60)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: Aguardando..."
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusLabel.TextSize = 13
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = Frame

-- Botão
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 180, 0, 30)
Button.Position = UDim2.new(0, 20, 0, 95)
Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Button.Text = "Executar Script"
Button.Font = Enum.Font.GothamBold
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextSize = 14
Button.BorderSizePixel = 0
Button.Parent = Frame

Button.MouseButton1Click:Connect(function()
	StatusLabel.Text = "Status: Script executado!"
end)

-- Toggle "Float"
local ToggleText = Instance.new("TextLabel")
ToggleText.Size = UDim2.new(0, 140, 0, 25)
ToggleText.Position = UDim2.new(0, 10, 0, 135)
ToggleText.BackgroundTransparency = 1
ToggleText.Text = "Float"
ToggleText.Font = Enum.Font.GothamBold
ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleText.TextSize = 14
ToggleText.TextXAlignment = Enum.TextXAlignment.Left
ToggleText.Parent = Frame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 20, 0, 20)
ToggleButton.Position = UDim2.new(0, 180, 0, 138)
ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = ""
ToggleButton.Parent = Frame

local toggled = false

ToggleButton.MouseButton1Click:Connect(function()
	toggled = not toggled
	ToggleButton.BackgroundColor3 = toggled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(40, 40, 40)
	StatusLabel.Text = "Status: Float " .. (toggled and "ON" or "OFF")
end)
