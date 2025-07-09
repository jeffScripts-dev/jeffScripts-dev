return function()
    local library = {}

    function library:CreateWindow(title)
        local window = {}

        local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
        local Main = Instance.new("Frame", ScreenGui)
        Main.Size = UDim2.new(0, 500, 0, 300)
        Main.Position = UDim2.new(0.5, -250, 0.5, -150)
        Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        Main.Active = true
        Main.Draggable = true
        Main.BorderSizePixel = 0
        Main.Name = "JeffWindow_"..tostring(math.random(1000,9999))

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

        local UIList = Instance.new("UIListLayout", TabsHolder)
        UIList.SortOrder = Enum.SortOrder.LayoutOrder
        UIList.Padding = UDim.new(0, 4)

        local PagesHolder = Instance.new("Frame", Main)
        PagesHolder.Position = UDim2.new(0, 120, 0, 30)
        PagesHolder.Size = UDim2.new(1, -120, 1, -30)
        PagesHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        PagesHolder.BorderSizePixel = 0

        function window:CreateTab(tabName)
            local tab = {}

            local TabButton = Instance.new("TextButton", TabsHolder)
            TabButton.Size = UDim2.new(1, 0, 0, 30)
            TabButton.Text = tabName
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            TabButton.Font = Enum.Font.SourceSans
            TabButton.TextSize = 14

            local Page = Instance.new("ScrollingFrame", PagesHolder)
            Page.Size = UDim2.new(1, 0, 1, 0)
            Page.CanvasSize = UDim2.new(0, 0, 0, 0)
            Page.ScrollBarThickness = 6
            Page.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            Page.Visible = false

            local PageLayout = Instance.new("UIListLayout", Page)
            PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
            PageLayout.Padding = UDim.new(0, 6)

            local function updateCanvas()
                Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 10)
            end
            PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)

            -- Trocar aba
            TabButton.MouseButton1Click:Connect(function()
                for _, child in ipairs(PagesHolder:GetChildren()) do
                    if child:IsA("ScrollingFrame") then
                        child.Visible = false
                    end
                end
                Page.Visible = true
            end)

            function tab:CreateButton(text, callback)
                local btn = Instance.new("TextButton", Page)
                btn.Size = UDim2.new(1, -10, 0, 30)
                btn.Position = UDim2.new(0, 5, 0, 0)
                btn.Text = text
                btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                btn.Font = Enum.Font.SourceSans
                btn.TextSize = 14
                btn.MouseButton1Click:Connect(callback)
            end

            function tab:CreateToggle(text, callback)
                local toggle = Instance.new("TextButton", Page)
                toggle.Size = UDim2.new(1, -10, 0, 30)
                toggle.Position = UDim2.new(0, 5, 0, 0)
                toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
                toggle.Font = Enum.Font.SourceSans
                toggle.TextSize = 14

                local state = false
                toggle.Text = "[ OFF ] " .. text

                toggle.MouseButton1Click:Connect(function()
                    state = not state
                    toggle.Text = (state and "[ ON ] " or "[ OFF ] ") .. text
                    callback(state)
                end)
            end

            return tab
        end

        return window
    end

    return library
end