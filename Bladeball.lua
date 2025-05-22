if game.PlaceId == 13772394625 or game.PlaceId == 15234596844 then
    -- Create the ScreenGui
    local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
    screenGui.Name = "JeffGUI"

    -- Create the main frame
    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 220, 0, 180)
    frame.Position = UDim2.new(0, 20, 0, 20)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true

    local frameCorner = Instance.new("UICorner", frame)
    frameCorner.CornerRadius = UDim.new(0, 8)

    -- Function to create buttons
    local function createButton(text, positionY, callback)
        local button = Instance.new("TextButton", frame)
        button.Size = UDim2.new(1, -20, 0, 35)
        button.Position = UDim2.new(0, 10, 0, positionY)
        button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        button.Text = text
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.GothamBold
        button.TextSize = 14
        button.AutoButtonColor = false

        Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)
        Instance.new("UIStroke", button).Color = Color3.fromRGB(70, 70, 70)

        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        end)
        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        end)

        button.MouseButton1Click:Connect(callback)
    end

    -- Auto Parry
    createButton("Auto Parry", 10, function()
        loadstring([[
            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local VirtualInputManager = game:GetService("VirtualInputManager")
            local Player = Players.LocalPlayer
            local Cooldown = tick()
            local Parried = false
            local Connection = nil

            local function GetBall()
                for _, Ball in ipairs(workspace.Balls:GetChildren()) do
                    if Ball:GetAttribute("realBall") then return Ball end
                end
            end

            local function ResetConnection()
                if Connection then Connection:Disconnect() Connection = nil end
            end

            workspace.Balls.ChildAdded:Connect(function()
                local Ball = GetBall()
                if not Ball then return end
                ResetConnection()
                Connection = Ball:GetAttributeChangedSignal("target"):Connect(function()
                    Parried = false
                end)
            end)

            RunService.PreSimulation:Connect(function()
                local Ball = GetBall()
                local HRP = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                if not Ball or not HRP then return end
                local Speed = Ball.zoomies.VectorVelocity.Magnitude
                local Distance = (HRP.Position - Ball.Position).Magnitude
                local ETA = Distance / Speed
                if Ball:GetAttribute("target") == Player.Name and not Parried and ETA <= 0.65 then
                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                    Parried = true
                    Cooldown = tick()
                end
                if Parried and (tick() - Cooldown) >= 1 then
                    Parried = false
                end
            end)
        ]])()
    end)

    -- Auto Spam
    createButton("Auto Spam", 55, function()
        loadstring([[
            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local VirtualInputManager = game:GetService("VirtualInputManager")
            local Workspace = game:GetService("Workspace")

            local Player = Players.LocalPlayer
            local AutoParryEnabled = true
            local AutoSpamEnabled = true
            local SpamETA = 0.5
            local ClicksPerFrame = 10

            local function Click()
                VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
            end

            local function GetBall()
                for _, Ball in ipairs(Workspace.Balls:GetChildren()) do
                    if Ball:GetAttribute("realBall") then return Ball end
                end
            end

            local Cooldown = tick()
            local Parried = false
            local Connection = nil

            local function ResetConnection()
                if Connection then Connection:Disconnect() Connection = nil end
            end

            Workspace.Balls.ChildAdded:Connect(function()
                local Ball = GetBall()
                if not Ball then return end
                ResetConnection()
                Connection = Ball:GetAttributeChangedSignal("target"):Connect(function()
                    Parried = false
                end)
            end)

            RunService.PreSimulation:Connect(function()
                local Ball = GetBall()
                local HRP = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                if not Ball or not HRP then return end

                local Zoomies = Ball:FindFirstChild("zoomies")
                local Speed = Zoomies and Zoomies:FindFirstChild("VectorVelocity") and Zoomies.VectorVelocity.Magnitude or 75
                local Distance = (HRP.Position - Ball.Position).Magnitude
                local ETA = Distance / Speed
                local Target = Ball:GetAttribute("target")

                if AutoParryEnabled and Target == Player.Name and not Parried and ETA <= 0.65 then
                    Click()
                    Parried = true
                    Cooldown = tick()
                end

                if AutoSpamEnabled and Target == Player.Name and ETA <= SpamETA then
                    for _ = 1, ClicksPerFrame do Click() end
                end

                if Parried and (tick() - Cooldown) >= 1 then
                    Parried = false
                end
            end)
        ]])()
    end)

    -- Manual Spam
    createButton("Manual Spam", 100, function()
        loadstring([[
            local UserInputService = game:GetService("UserInputService")
            local VirtualInputManager = game:GetService("VirtualInputManager")

            local ScreenGui = Instance.new("ScreenGui")
            ScreenGui.Name = "ManualSpamGUI"
            ScreenGui.ResetOnSpawn = false
            ScreenGui.IgnoreGuiInset = true
            ScreenGui.Parent = game.CoreGui

            local Frame = Instance.new("Frame")
            Frame.Size = UDim2.new(0, 200, 0, 60)
            Frame.Position = UDim2.new(0.05, 0, 0.1, 0)
            Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
            Frame.BorderSizePixel = 0
            Frame.Active = true
            Frame.Draggable = true
            Frame.Parent = ScreenGui
            Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

            local TextButton = Instance.new("TextButton")
            TextButton.Size = UDim2.new(1, -20, 1, -20)
            TextButton.Position = UDim2.new(0, 10, 0, 10)
            TextButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            TextButton.Text = "Manual Spam: OFF"
            TextButton.Font = Enum.Font.GothamBold
            TextButton.TextSize = 18
            TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextButton.AutoButtonColor = false
            TextButton.Parent = Frame
            Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 6)

            local spamming = false
            local function spamClick()
                while spamming do
                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                    task.wait()
                end
            end

            TextButton.MouseButton1Click:Connect(function()
                spamming = not spamming
                TextButton.Text = spamming and "Manual Spam: ON" or "Manual Spam: OFF"
                if spamming then task.spawn(spamClick) end
            end)
        ]])()
    end)
end
