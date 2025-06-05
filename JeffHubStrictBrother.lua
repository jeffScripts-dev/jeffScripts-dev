local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")

-- Criação da ScreenGui
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "JeffGUI"

-- Criação do Frame
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 220, 0, 280)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local frameCorner = Instance.new("UICorner", frame)
frameCorner.CornerRadius = UDim.new(0, 8)

-- Função para criar botões
local function createButton(text, positionY, parent, callback)
	local button = Instance.new("TextButton", parent)
	button.Size = UDim2.new(1, -20, 0, 35)
	button.Position = UDim2.new(0, 10, 0, positionY)
	button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	button.Text = text
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.GothamBold
	button.TextSize = 14
	button.AutoButtonColor = false

	local corner = Instance.new("UICorner", button)
	corner.CornerRadius = UDim.new(0, 6)

	local stroke = Instance.new("UIStroke", button)
	stroke.Color = Color3.fromRGB(70, 70, 70)
	stroke.Thickness = 1

	button.MouseEnter:Connect(function()
		button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	end)
	button.MouseLeave:Connect(function()
		button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	end)

	button.MouseButton1Click:Connect(callback)
end

-- BOTÕES
createButton("Toggle ESP Older Brother", 10, frame, function()
	local espOlderBrotherEnabled = false
	local target = workspace:FindFirstChild("older brother AI")
	if target and target:FindFirstChild("HumanoidRootPart") then
		espOlderBrotherEnabled = not espOlderBrotherEnabled
		if espOlderBrotherEnabled then
			local box = Instance.new("BoxHandleAdornment")
			box.Name = "ESPBox"
			box.Adornee = target
			box.Size = Vector3.new(4, 5, 2)
			box.Color3 = Color3.fromRGB(255, 0, 0)
			box.AlwaysOnTop = true
			box.ZIndex = 10
			box.Transparency = 0.5
			box.Parent = target
		else
			local oldBox = target:FindFirstChild("ESPBox")
			if oldBox then oldBox:Destroy() end
		end
	end
end)

createButton("ESP Players", 50, frame, function()
	for _, plr in ipairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local char = plr.Character
			if char and char:FindFirstChild("HumanoidRootPart") and not char:FindFirstChild("ESPBox") then
				local box = Instance.new("BoxHandleAdornment")
				box.Name = "ESPBox"
				box.Adornee = char
				box.Size = Vector3.new(4, 5, 2)
				box.Color3 = Color3.fromRGB(0, 255, 0)
				box.AlwaysOnTop = true
				box.ZIndex = 10
				box.Transparency = 0.5
				box.Parent = char
			end
		end
	end
end)

createButton("Teleport Secret Room", 90, frame, function()
	local targetCFrame = CFrame.new(64.25, -14.4, -43.07)
	local char = player.Character or player.CharacterAdded:Wait()
	char:WaitForChild("HumanoidRootPart").CFrame = targetCFrame
end)

createButton("Teleport to Bed", 130, frame, function()
	local targetCFrame = CFrame.new(26.25, 25.9, -48.41)
	local char = player.Character or player.CharacterAdded:Wait()
	char:WaitForChild("HumanoidRootPart").CFrame = targetCFrame
end)

createButton("Teleport to Food", 170, frame, function()
	local targetCFrame = CFrame.new(29.4, 5.6, -62.08)
	local char = player.Character or player.CharacterAdded:Wait()
	char:WaitForChild("HumanoidRootPart").CFrame = targetCFrame
end)

-- DETECTOR DE DISTÂNCIA DO OLDER BROTHER
local detectorLabel = Instance.new("TextLabel", frame)
detectorLabel.Name = "Older Brother Studs — Check if Is Coming"
detectorLabel.Size = UDim2.new(1, -20, 0, 40)
detectorLabel.Position = UDim2.new(0, 10, 0, 215)
detectorLabel.BackgroundTransparency = 1
detectorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
detectorLabel.Font = Enum.Font.GothamBold
detectorLabel.TextSize = 14
detectorLabel.TextWrapped = true
detectorLabel.Text = "🔍 Aguardando Older Brother..."

runService.RenderStepped:Connect(function()
	local olderBrother = workspace:FindFirstChild("older brother AI")
	local hrp = olderBrother and olderBrother:FindFirstChild("HumanoidRootPart")
	local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

	if hrp and myHRP then
		local distance = (myHRP.Position - hrp.Position).Magnitude
		if distance <= 85 then
			detectorLabel.Text = "✅ Older Brother Coming ("..math.floor(distance).." studs)"
			detectorLabel.TextColor3 = Color3.fromRGB(255, 85, 85)
		elseif distance <= 145 then
			detectorLabel.Text = "❌ Older Brother No Coming ("..math.floor(distance).." studs)"
			detectorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		else
			detectorLabel.Text = "❌ Older Brother Far Away ("..math.floor(distance).." studs)"
			detectorLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
		end
	else
		detectorLabel.Text = "❌ Older Brother Not Found"
		detectorLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	end
end)