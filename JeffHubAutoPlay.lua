local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "Jeff Hub : Monday Morning Misery",
    IntroText = "Jeff Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest"
})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://123798026223578",
	PremiumOnly = false
})

Tab:AddLabel("This only works at 4k. Have fun!")

local playing = false
getgenv().restartautoplayss = function()
	if getgenv().ors then
		getgenv().ors:Disconnect()
		getgenv().ors = nil
	end
	if getgenv().newgui then
		getgenv().newgui:Disconnect()
		getgenv().newgui = nil
	end
	playing = false
end

Tab:AddToggle({
	Name = "Auto Play 4k",
	Default = false,
	Callback = function(Value)
		if not Value then
			getgenv().restartautoplayss()
			return
		end
		if playing then return end
		playing = true

		local keybinds = {0x41, 0x53, 0x57, 0x44} -- A, S, W, D
		local localplr = game.Players.LocalPlayer

		local notes = {}
		local hitnotes = {}
		local toremove = {}
		local alreadypressed = {}
		local dup = {Left = 1, Down = 2, Up = 3, Right = 4}
		local side = "Right"
		local upscroll = false

		local function getside()
			for _, v in pairs(game.ReplicatedStorage.ComplexMatches:GetChildren()) do
				for _, p in pairs(v:GetChildren()) do
					if p.Name == localplr.Name then
						side = (p.PlayerType.Value == 1 and "Left") or "Right"
					end
				end
			end
			for _, v in pairs(game.ReplicatedStorage.Matches:GetChildren()) do
				if v.Participants.Value == nil then
					local isOwner = v.Owner.Value and v.Owner.Value.Name == localplr.Name
					local isOpponent = v.Opponent.Value and v.Opponent.Value.Name == localplr.Name
					if isOwner or isOpponent then
						local ptype = isOwner and v.Owner.PlayerType.Value or v.Opponent.PlayerType.Value
						side = (ptype == 1 and "Left") or "Right"
					end
				end
			end
		end

		local function docol(v)
			if v:IsA("Frame") then
				local cnum = v.Name
				v.ChildAdded:Connect(function(c)
					if c:IsA("ImageLabel") or c.Name == "LongNote" then
						table.insert(notes, {c, cnum})
					end
				end)
			end
		end

		local function domn(v)
			hitnotes[v.Name] = v
		end

		local function dag(v)
			getside()
			for _, dir in pairs(v[side].Notes:GetChildren()) do
				docol(dir)
			end
			coroutine.wrap(function()
				v[side]:WaitForChild("MainArrowContainer", math.huge)
				for _, arrow in pairs(v[side].MainArrowContainer:GetChildren()) do
					domn(arrow)
				end
			end)()
		end

		local arrowgui = localplr.PlayerGui.ScreenGui:FindFirstChild("ArrowGui", true)
		if arrowgui and not arrowgui.Parent:FindFirstChild("Bop") then
			dag(arrowgui)
		end

		getgenv().newgui = localplr.PlayerGui.ScreenGui:FindFirstChild("Bop", true).ChildAdded:Connect(function(child)
			if child.Name == "ArrowGui" then
				dag(child)
			end
		end)

		getgenv().ors = game:GetService("RunService").RenderStepped:Connect(function()
			for _, v in pairs(keybinds) do
				keyrelease(v)
			end

			local arrowgui = localplr.PlayerGui.ScreenGui:FindFirstChild("ArrowGui", true)
			if arrowgui and arrowgui:FindFirstChild(side) and arrowgui[side]:FindFirstChild("MainArrowContainer") then
				local hitContainer = arrowgui[side].MainArrowContainer
				if #hitContainer:GetChildren() == 0 then return end

				upscroll = hitContainer:GetChildren()[1].AbsolutePosition.Y < localplr.PlayerGui.ScreenGui.AbsoluteSize.Y / 2
				local cnotes = notes

				for i, v in pairs(cnotes) do
					local note = v[1]
					local direction = v[2]
					if typeof(note) == "Instance" and note and note.Parent ~= nil then
						local hitY = hitnotes[direction].AbsolutePosition.Y
						local noteY = note.AbsolutePosition.Y
						local distance = math.abs(hitY - noteY)

						local posCheck = distance <= 20
						if posCheck then
							local kb = keybinds[dup[direction]]
							if not alreadypressed[note] then
								keypress(kb)
								alreadypressed[note] = true

								if note.Name == "LongNote" then
									task.delay(0.15, function()
										keyrelease(kb)
									end)
								else
									keyrelease(kb)
								end
							end
							toremove[i] = true
						end
					else
						toremove[i] = true
					end
				end

				for i in pairs(toremove) do
					notes[i] = nil
					toremove[i] = nil
				end
				alreadypressed = {}
			end
		end)
	end    
})
