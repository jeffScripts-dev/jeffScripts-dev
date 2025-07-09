local Library = {}

function Library:CreateWindow(title)
    local window = {}
    window.Title = title or "Window"
    window.Tabs = {}

    -- Criar Frame principal
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = window.Title .. "GUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game:GetService("CoreGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    -- Título
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 0, 30)
    TitleLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TitleLabel.TextColor3 = Color3.new(1,1,1)
    TitleLabel.Text = window.Title
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.TextSize = 18
    TitleLabel.Parent = MainFrame

    -- Container para abas (tabs)
    local TabsContainer = Instance.new("Frame")
    TabsContainer.Name = "TabsContainer"
    TabsContainer.Size = UDim2.new(1, 0, 1, -30)
    TabsContainer.Position = UDim2.new(0, 0, 0, 30)
    TabsContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TabsContainer.Parent = MainFrame

    -- Container para botões das abas
    local TabButtonsFrame = Instance.new("Frame")
    TabButtonsFrame.Name = "TabButtons"
    TabButtonsFrame.Size = UDim2.new(1, 0, 0, 30)
    TabButtonsFrame.Position = UDim2.new(0, 0, 0, 0)
    TabButtonsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TabButtonsFrame.Parent = TabsContainer

    -- Container para conteúdo da aba
    local TabContentFrame = Instance.new("Frame")
    TabContentFrame.Name = "TabContent"
    TabContentFrame.Size = UDim2.new(1, 0, 1, -30)
    TabContentFrame.Position = UDim2.new(0, 0, 0, 30)
    TabContentFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TabContentFrame.Parent = TabsContainer

    function window:AddTab(name)
        local tab = {}
        tab.Name = name

        -- Botão da aba
        local tabButton = Instance.new("TextButton")
        tabButton.Size = UDim2.new(0, 100, 1, 0)
        tabButton.Position = UDim2.new(#self.Tabs * 0, 100, 0, 0)
        tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        tabButton.Text = name
        tabButton.TextColor3 = Color3.new(1,1,1)
        tabButton.Parent = TabButtonsFrame

        -- Frame de conteúdo da aba
        local tabFrame = Instance.new("Frame")
        tabFrame.Size = UDim2.new(1, 0, 1, 0)
        tabFrame.BackgroundTransparency = 1
        tabFrame.Visible = false
        tabFrame.Parent = TabContentFrame

        tab.ContentFrame = tabFrame

        -- Mostrar aba ao clicar
        tabButton.MouseButton1Click:Connect(function()
            -- Esconder todas abas
            for _, v in pairs(self.Tabs) do
                v.ContentFrame.Visible = false
                v.Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            end
            tabFrame.Visible = true
            tabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        end)

        tab.Button = tabButton

        -- Métodos para adicionar elementos na aba
        function tab:Button(btnName, callback)
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -20, 0, 30)
            btn.Position = UDim2.new(0, 10, 0, (#tabFrame:GetChildren()) * 35)
            btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            btn.TextColor3 = Color3.new(1,1,1)
            btn.Text = btnName
            btn.Font = Enum.Font.SourceSansBold
            btn.TextSize = 16
            btn.Parent = tabFrame

            btn.MouseButton1Click:Connect(function()
                if callback then
                    callback()
                end
            end)
        end

        function tab:Toggle(toggleName, callback)
            local toggleFrame = Instance.new("Frame")
            toggleFrame.Size = UDim2.new(1, -20, 0, 30)
            toggleFrame.Position = UDim2.new(0, 10, 0, (#tabFrame:GetChildren()) * 35)
            toggleFrame.BackgroundTransparency = 1
            toggleFrame.Parent = tabFrame

            local toggleLabel = Instance.new("TextLabel")
            toggleLabel.Size = UDim2.new(0.8, 0, 1, 0)
            toggleLabel.BackgroundTransparency = 1
            toggleLabel.Text = toggleName
            toggleLabel.TextColor3 = Color3.new(1,1,1)
            toggleLabel.Font = Enum.Font.SourceSans
            toggleLabel.TextSize = 16
            toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            toggleLabel.Parent = toggleFrame

            local toggleBtn = Instance.new("TextButton")
            toggleBtn.Size = UDim2.new(0.2, -10, 1, 0)
            toggleBtn.Position = UDim2.new(0.8, 10, 0, 0)
            toggleBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            toggleBtn.TextColor3 = Color3.new(1,1,1)
            toggleBtn.Text = "OFF"
            toggleBtn.Font = Enum.Font.SourceSansBold
            toggleBtn.TextSize = 16
            toggleBtn.Parent = toggleFrame

            local toggled = false

            toggleBtn.MouseButton1Click:Connect(function()
                toggled = not toggled
                if toggled then
                    toggleBtn.Text = "ON"
                    toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
                else
                    toggleBtn.Text = "OFF"
                    toggleBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
                end

                if callback then
                    callback(toggled)
                end
            end)
        end

        function tab:Textbox(textName, placeholder, callback)
            local boxFrame = Instance.new("Frame")
            boxFrame.Size = UDim2.new(1, -20, 0, 30)
            boxFrame.Position = UDim2.new(0, 10, 0, (#tabFrame:GetChildren()) * 35)
            boxFrame.BackgroundTransparency = 1
            boxFrame.Parent = tabFrame

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(0.4, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = textName
            label.TextColor3 = Color3.new(1,1,1)
            label.Font = Enum.Font.SourceSans
            label.TextSize = 16
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = boxFrame

            local textBox = Instance.new("TextBox")
            textBox.Size = UDim2.new(0.6, -10, 1, 0)
            textBox.Position = UDim2.new(0.4, 10, 0, 0)
            textBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            textBox.TextColor3 = Color3.new(1,1,1)
            textBox.PlaceholderText = placeholder or ""
            textBox.ClearTextOnFocus = false
            textBox.Font = Enum.Font.SourceSans
            textBox.TextSize = 16
            textBox.Parent = boxFrame

            textBox.FocusLost:Connect(function(enterPressed)
                if enterPressed and callback then
                    callback(textBox.Text)
                end
            end)
        end

        table.insert(self.Tabs, tab)
        if #self.Tabs == 1 then
            -- Mostrar a primeira aba por padrão
            tabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            tabFrame.Visible = true
        end

        return tab
    end

    return window
end

return Library