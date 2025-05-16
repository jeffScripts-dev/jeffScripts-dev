-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
screenGui.Name = "JeffGUI"

-- Create the main frame
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 220, 0, 240)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Round corners for frame
local frameCorner = Instance.new("UICorner", frame)
frameCorner.CornerRadius = UDim.new(0, 8)

-- Function to create beautiful buttons
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

    -- Rounded corners
    local corner = Instance.new("UICorner", button)
    corner.CornerRadius = UDim.new(0, 6)

    -- Border
    local stroke = Instance.new("UIStroke", button)
    stroke.Color = Color3.fromRGB(70, 70, 70)
    stroke.Thickness = 1

    -- Hover effect
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    end)

    button.MouseButton1Click:Connect(callback)
end

-- ESP Toggle for Older Brother
local espOlderBrotherEnabled = false
createButton("Toggle ESP Older Brother", 10, frame, function()
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

-- ESP for Players
createButton("ESP Players", 50, frame, function()
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
createButton("Teleport Secret Room", 90, frame, function()
    local targetCFrame = CFrame.new(64.2544937, -14.3999996, -43.0745316, 0.0969430581, 2.94034463e-09, -0.995289922, -1.62844405e-08, 1, 1.36812506e-09, 0.995289922, 1.60751092e-08, 0.0969430581)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    character:WaitForChild("HumanoidRootPart").CFrame = targetCFrame
end)

-- Teleport to Bed
createButton("Teleport to Bed", 130, frame, function()
    local targetCFrame = CFrame.new(26.2586327, 25.8999939, -48.4194489, -0.0486038998, 3.89940169e-08, 0.998818159, 8.03263518e-08, 1, -3.51313645e-08, -0.998818159, 7.85238967e-08, -0.0486038998)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    character:WaitForChild("HumanoidRootPart").CFrame = targetCFrame
end)

-- Teleport to Food
createButton("Teleport to Food", 170, frame, function()
    local targetCFrame = CFrame.new(29.4028835, 5.60000038, -62.0844612, -0.999950349, 6.55502008e-09, 0.00996769313, 6.63377708e-09, 1, 7.86819143e-09, -0.00996769313, 7.93392374e-09, -0.999950349)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    character:WaitForChild("HumanoidRootPart").CFrame = targetCFrame
end)
