-- Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Jeff Hub | Blade Ball",
    LoadingTitle = "Loading…",
    LoadingSubtitle = "by Jeff", -- your name added here
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "JeffHubConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
})

-- Main Tab
local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Main Features")

-- Auto Parry Toggle
local AutoParryEnabled = false
Tab:CreateToggle({
    Name = "Auto Parry",
    CurrentValue = false,
    Flag = "AutoParryFlag",
    Callback = function(Value)
        AutoParryEnabled = Value
        if Value then
            local RunService = game:GetService("RunService") or game:FindFirstDescendant("RunService")
            local Players = game:GetService("Players") or game:FindFirstDescendant("Players")
            local VirtualInputManager = game:GetService("VirtualInputManager") or game:FindFirstDescendant("VirtualInputManager")

            local Player = Players.LocalPlayer
            local Cooldown = tick()
            local Parried = false
            local Connection = nil

            local function GetBall()
                for _, Ball in ipairs(workspace.Balls:GetChildren()) do
                    if Ball:GetAttribute("realBall") then
                        return Ball
                    end
                end
            end

            local function ResetConnection()
                if Connection then
                    Connection:Disconnect()
                    Connection = nil
                end
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
                if not AutoParryEnabled then return end
                local Ball, HRP = GetBall(), Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                if not Ball or not HRP then return end

                local Speed = Ball.zoomies.VectorVelocity.Magnitude
                local Distance = (HRP.Position - Ball.Position).Magnitude

                if Ball:GetAttribute("target") == Player.Name and not Parried and Distance / Speed <= 0.65 then
                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                    Parried = true
                    Cooldown = tick()

                    if (tick() - Cooldown) >= 1 then
                        Parried = false
                    end
                end
            end)
        end
    end,
})

-- Manual Spam Button
Tab:CreateButton({
    Name = "Manual Spam",
    Callback = function()
        if not game:IsLoaded() then
            game.Loaded:Wait()
        end

        local v = game:GetService("VirtualInputManager")
        local s = Instance.new("ScreenGui")
        s.Parent = game.CoreGui

        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0, 200, 0, 50)
        b.Position = UDim2.new(0.5, -100, 0.5, -25)
        b.AnchorPoint = Vector2.new(0.5, 0.5)
        b.BackgroundColor3 = Color3.new(0, 0, 0)
        b.BorderSizePixel = 2
        b.BorderColor3 = Color3.new(1, 1, 1)
        b.Text = "MANUAL SPAM"
        b.TextColor3 = Color3.new(1, 1, 1)
        b.TextScaled = true
        b.Font = Enum.Font.LuckiestGuy
        b.TextXAlignment = Enum.TextXAlignment.Center
        b.TextYAlignment = Enum.TextYAlignment.Center
        b.Parent = s

        local t = false
        b.MouseButton1Click:Connect(function()
            t = not t
            b.Text = t and "ON" or "OFF"
            while t do
                v:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                wait()
            end
        end)

        local d, i, ds, sp
        local function u(input)
            local delta = input.Position - ds
            b.Position = UDim2.new(sp.X.Scale, sp.X.Offset + delta.X, sp.Y.Scale, sp.Y.Offset + delta.Y)
        end

        b.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                d = true
                ds = input.Position
                sp = b.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        d = false
                    end
                end)
            end
        end)

        b.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                i = input
            end
        end)

        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if d and input == i then
                u(input)
            end
        end)
    end,
})

-- Keybind Test
Tab:CreateKeybind({
    Name = "Keybind Test (G / F / K)",
    CurrentKeybind = "G",
    HoldToInteract = false,
    Flag = "KeybindTest",
    Callback = function(Keybind)
        -- No code inside because you wanted it empty
    end,
})

-- Credits Tab
local CreditsTab = Window:CreateTab("Credits", 4483362458)
CreditsTab:CreateSection("Thanks")

CreditsTab:CreateButton({
    Name = "By Jeff",
    Callback = function()
        print("Thanks")
    end,
})

CreditsTab:CreateButton({
    Name = "Script help: ChatGPT",
    Callback = function()
        print("Thanks for support")
    end,
})