-- Salve esse script como Code.lua no seu GitHub (repositório público)

return function()
    local library = {}

    function library:CreateWindow(title)
        local window = {}

        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "ExploitUI_"..tostring(math.random(1000,9999))
        ScreenGui.Parent = game:GetService("CoreGui")

        local Main = Instance.new("Frame", ScreenGui)
        Main.Size = UDim2.new(0, 500, 0, 300)
        Main.Position = UDim2.new(0.5, -250, 0.5, -150)
        Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        Main.Active = true
        Main.Draggable = true
        Main.BorderSizePixel = 0

        local TopBar = Instance.new("TextLabel", Main)
        TopBar.Size = UDim2.new(1, 0, 0, 30)
        TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TopBar.Text = title
        TopBar.TextColor3 = Color3.fromRGB(255, 255, 255)
        TopBar.Font = Enum.Font.SourceSansBold
        TopBar.TextSize = 18

        local TabsHolder = Instance.new("Frame", Main)
        TabsHolder.Position = UDim2.new(0, 0, 0, 30)
        TabsHolder.Size = UDim2.new(0, 120, 1, -30)
        TabsHolder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        TabsHolder.BorderSizePixel = 0

        local UIListTabs = Instance.new("UIListLayout", TabsHolder)
        UIListTabs.SortOrder = Enum.SortOrder.LayoutOrder
        UIListTabs.Padding = UDim.new(0, 4)

        local PagesHolder = Instance.new("Frame", Main)
        PagesHolder.Position = UDim2.new(0, 120, 0, 30)
        PagesHolder.Size = UDim2.new(1, -120, 1, -30)
        PagesHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        PagesHolder.BorderSizePixel = 0

        local function clearPages()
            for _, child in pairs(PagesHolder:GetChildren()) do
                if child:IsA("ScrollingFrame") then
                    child.Visible = false
                end
            end
        end

        function window:CreateTab(name)
            local tab = {}

            local TabButton = Instance.new("TextButton", TabsHolder)
            TabButton.Size = UDim2.new(1, 0, 0, 30)
            TabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabButton.Font = Enum.Font.SourceSans
            TabButton.TextSize = 14
            TabButton.Text = name

            local Page = Instance.new("ScrollingFrame", PagesHolder)
            Page.Size = UDim2.new(1, 0, 1, 0)
            Page.CanvasSize = UDim2.new(0, 0, 0, 0)
            Page.ScrollBarThickness = 6
            Page.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            Page.Visible = false

            local UIListPage = Instance.new("UIListLayout", Page)
            UIListPage.SortOrder = Enum.SortOrder.LayoutOrder
            UIListPage.Padding = UDim.new(0, 6)

            UIListPage:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                Page.CanvasSize = UDim2.new(0, 0, 0, UIListPage.AbsoluteContentSize.Y + 10)
            end)

            TabButton.MouseButton1Click:Connect(function()
                clearPages()
                Page.Visible = true
            end)

            -- Exibe a primeira aba automaticamente ao criar
            if #PagesHolder:GetChildren() == 0 then
                Page.Visible = true
            end

            function tab:CreateButton(text, callback)
                local Button = Instance.new("TextButton", Page)
                Button.Size = UDim2.new(1, -10, 0, 30)
                Button.Position = UDim2.new(0, 5, 0, 0)
                Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                Button.Text = text
                Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                Button.Font = Enum.Font.SourceSans
                Button.TextSize = 14
                Button.AutoButtonColor = true
                Button.MouseButton1Click:Connect(callback)
            end

            function tab:CreateToggle(text, callback)
                local Toggle = Instance.new("TextButton", Page)
                Toggle.Size = UDim2.new(1, -10, 0, 30)
                Toggle.Position = UDim2.new(0, 5, 0, 0)
                Toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
                Toggle.Font = Enum.Font.SourceSans
                Toggle.TextSize = 14

                local state = false
                Toggle.Text = "[ OFF ] " .. text

                Toggle.MouseButton1Click:Connect(function()
                    state = not state
                    Toggle.Text = (state and "[ ON ] " or "[ OFF ] ") .. text
                    callback(state)
                end)
            end

            return tab
        end

        return window
    end

    return library
end