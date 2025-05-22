if game.PlaceId == 8929050629 or game.PlaceId == 12350891962 then
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    screenGui.Name = "JeffHubMoAcademy"

    -- Main frame with scroll
    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 270, 0, 350)
    frame.Position = UDim2.new(0, 20, 0, 20)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true

    local frameCorner = Instance.new("UICorner", frame)
    frameCorner.CornerRadius = UDim.new(0, 8)

    -- Scrolling frame inside main frame
    local scrollingFrame = Instance.new("ScrollingFrame", frame)
    scrollingFrame.Size = UDim2.new(1, -10, 1, -10)
    scrollingFrame.Position = UDim2.new(0, 5, 0, 5)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.ScrollBarThickness = 5
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 600)
    scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

    -- UIListLayout inside scrolling frame for buttons
    local listLayout = Instance.new("UIListLayout", scrollingFrame)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 8)

    -- Function to create buttons inside scrolling frame
    local function createButton(text, callback)
        local button = Instance.new("TextButton", scrollingFrame)
        button.Size = UDim2.new(1, -10, 0, 35)
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

    -- ESP toggles
    local espMoNPCsEnabled = false
    createButton("Toggle ESP Mo NPCs (Red)", function()
        espMoNPCsEnabled = not espMoNPCsEnabled
        for _, npc in ipairs(workspace:GetChildren()) do
            if npc.Name:find("Mo NPC") then
                local existingBox = npc:FindFirstChild("ESPBox")
                if espMoNPCsEnabled and not existingBox then
                    local box = Instance.new("BoxHandleAdornment")
                    box.Name = "ESPBox"
                    box.Adornee = npc:FindFirstChild("HumanoidRootPart") or npc.PrimaryPart or npc:FindFirstChildWhichIsA("BasePart")
                    box.Size = Vector3.new(4, 5, 2)
                    box.Color3 = Color3.fromRGB(255, 0, 0)
                    box.AlwaysOnTop = true
                    box.ZIndex = 10
                    box.Transparency = 0.5
                    box.Parent = npc
                elseif not espMoNPCsEnabled and existingBox then
                    existingBox:Destroy()
                end
            end
        end
    end)

    local espPlayersEnabled = false
    createButton("Toggle ESP Players (Green)", function()
        espPlayersEnabled = not espPlayersEnabled
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                local char = plr.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local existingBox = char:FindFirstChild("ESPBox")
                    if espPlayersEnabled and not existingBox then
                        local box = Instance.new("BoxHandleAdornment")
                        box.Name = "ESPBox"
                        box.Adornee = char.HumanoidRootPart
                        box.Size = Vector3.new(4, 5, 2)
                        box.Color3 = Color3.fromRGB(0, 255, 0)
                        box.AlwaysOnTop = true
                        box.ZIndex = 10
                        box.Transparency = 0.5
                        box.Parent = char
                    elseif not espPlayersEnabled and existingBox then
                        existingBox:Destroy()
                    end
                end
            end
        end
    end)

    -- Teleport buttons
    createButton("Teleport to Gym", function()
        local targetCFrame = CFrame.new(-39, 3, 68)
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        char:WaitForChild("HumanoidRootPart").CFrame = targetCFrame
    end)

    createButton("Teleport to Cafeteria", function()
        local targetCFrame = CFrame.new(-33, 3, 14)
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        char:WaitForChild("HumanoidRootPart").CFrame = targetCFrame
    end)

    createButton("Teleport to Classroom", function()
        local targetCFrame = CFrame.new(-27, 3, -38)
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        char:WaitForChild("HumanoidRootPart").CFrame = targetCFrame
    end)

    createButton("Teleport to Locker Room", function()
        local targetCFrame = CFrame.new(-69, 3, -39)
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        char:WaitForChild("HumanoidRootPart").CFrame = targetCFrame
    end)

    createButton("Teleport to Principal’s Office", function()
        local targetCFrame = CFrame.new(-5, 5, -93)
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        char:WaitForChild("HumanoidRootPart").CFrame = targetCFrame
    end)

    -- Fast attack toggles for Hammer and Crowbar (assuming remote setup)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Remotes = ReplicatedStorage:WaitForChild("Remotes")
    local UseItem = Remotes:WaitForChild("UseItem")
    local PlayerData = require(LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerData"))

    local fastAttackHammerEnabled = false
    createButton("Toggle Fast Attack (Hammer)", function()
        fastAttackHammerEnabled = not fastAttackHammerEnabled
        if fastAttackHammerEnabled then
            spawn(function()
                while fastAttackHammerEnabled do
                    local hammer = PlayerData.Items.Hammer
                    if hammer then
                        UseItem:FireServer(hammer)
                    end
                    wait(0.15)
                end
            end)
        end
    end)

    local fastAttackCrowbarEnabled = false
    createButton("Toggle Fast Attack (Crowbar)", function()
        fastAttackCrowbarEnabled = not fastAttackCrowbarEnabled
        if fastAttackCrowbarEnabled then
            spawn(function()
                while fastAttackCrowbarEnabled do
                    local crowbar = PlayerData.Items.Crowbar
                    if crowbar then
                        UseItem:FireServer(crowbar)
                    end
                    wait(0.15)
                end
            end)
        end
    end)
end
