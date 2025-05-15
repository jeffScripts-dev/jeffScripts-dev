-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
screenGui.Name = "JeffGUI"

-- Create the main frame
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 200)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- ESP Older Brother Toggle
local espOlderBrotherEnabled = false
local espBrotherButton = Instance.new("TextButton", frame)
espBrotherButton.Size = UDim2.new(1, 0, 0, 30)
espBrotherButton.Position = UDim2.new(0, 0, 0, 0)
espBrotherButton.Text = "Toggle ESP Older Brother"
espBrotherButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
espBrotherButton.TextColor3 = Color3.fromRGB(255, 255, 255)

espBrotherButton.MouseButton1Click:Connect(function()
    espOlderBrotherEnabled = not espOlderBrotherEnabled
    local target = workspace:FindFirstChild("older brother AI")
    if target and target:FindFirstChild("HumanoidRootPart") then
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

-- ESP All Players Button
local espPlayersButton = Instance.new("TextButton", frame)
espPlayersButton.Size = UDim2.new(1, 0, 0, 30)
espPlayersButton.Position = UDim2.new(0, 0, 0, 35)
espPlayersButton.Text = "ESP Players"
espPlayersButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
espPlayersButton.TextColor3 = Color3.fromRGB(255, 255, 255)

espPlayersButton.MouseButton1Click:Connect(function()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") and not character:FindFirstChild("ESPBox") then
                local box = Instance.new("BoxHandleAdornment")
                box.Name = "ESPBox"
                box.Adornee = character
                box.Size = Vector3.new(4, 5, 2)
                box.Color3 = Color3.fromRGB(0, 255, 0)
                box.AlwaysOnTop = true
                box.ZIndex = 10
                box.Transparency = 0.5
                box.Parent = character
            end
        end
    end
end)

-- Teleport to Secret Room
local teleportSecretButton = Instance.new("TextButton", frame)
teleportSecretButton.Size = UDim2.new(1, 0, 0, 30)
teleportSecretButton.Position = UDim2.new(0, 0, 0, 70)
teleportSecretButton.Text = "Teleport Secret Room"
teleportSecretButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
teleportSecretButton.TextColor3 = Color3.fromRGB(255, 255, 255)

teleportSecretButton.MouseButton1Click:Connect(function()
    local targetCFrame = CFrame.new(64.2544937, -14.3999996, -43.0745316, 0.0969430581, 2.94034463e-09, -0.995289922, -1.62844405e-08, 1, 1.36812506e-09, 0.995289922, 1.60751092e-08, 0.0969430581)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    hrp.CFrame = targetCFrame
end)

-- Teleport to Bed
local teleportBedButton = Instance.new("TextButton", frame)
teleportBedButton.Size = UDim2.new(1, 0, 0, 30)
tel noeportBedButton.Position = UDim2.new(0, 0, 0, 105)
teleportBedButton.Text = "Teleport to Bed"
teleportBedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
teleportBedButton.TextColor3 = Color3.fromRGB(255, 255, 255)

teleportBedButton.MouseButton1Click:Connect(function()
    local targetCFrame = CFrame.new(26.2586327, 25.8999939, -48.4194489, -0.0486038998, 3.89940169e-08, 0.998818159, 8.03263518e-08, 1, -3.51313645e-08, -0.998818159, 7.85238967e-08, -0.0486038998)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    hrp.CFrame = targetCFrame
end)

-- Teleport to Food
local teleportFoodButton = Instance.new("TextButton", frame)
teleportFoodButton.Size = UDim2.new(1, 0, 0, 30)
teleportFoodButton.Position = UDim2.new(0, 0, 0, 140)
teleportFoodButton.Text = "Teleport to Food"
teleportFoodButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
teleportFoodButton.TextColor3 = Color3.fromRGB(255, 255, 255)

teleportFoodButton.MouseButton1Click:Connect(function()
    local targetCFrame = CFrame.new(29.4028835, 5.60000038, -62.0844612, -0.999950349, 6.55502008e-09, 0.00996769313, 6.63377708e-09, 1, 7.86819143e-09, -0.00996769313, 7.93392374e-09, -0.999950349)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    hrp.CFrame = targetCFrame
end)
