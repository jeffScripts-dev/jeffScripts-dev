local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Jeff Hub : FE Edition",
   LoadingTitle = "Loading Jeff Hub...",
   LoadingSubtitle = "By Jeff",
   Theme = "Default",
   ConfigurationSaving = {
      Enabled = true,
      FileName = "JeffHub"
   },
   KeySystem = true,
   KeySettings = {
      Title = "Jeff Hub",
      Subtitle = "Key System",
      Note = "Key is: Welcome",
      FileName = "Key",
      SaveKey = true,
      Key = {"Welcome"}
   }
})

-- FE Scripts Tab
task.delay(0.2, function()
   local FETab = Window:CreateTab("FE Scripts", 4483362458)

   FETab:CreateButton({
      Name = "Infinite Yield",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
         end)
      end,
   })

   FETab:CreateButton({
      Name = "AnnaBypasser (Chat Bypass)",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-AnnaBypasser-ChatBypasser-27330"))()
         end)
      end,
   })
end)

-- MM2 Scripts Tab
task.delay(0.4, function()
   local MM2Tab = Window:CreateTab("MM2 Scripts", 4483362458)

   MM2Tab:CreateButton({
      Name = "Yarhm Hub (Working)",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-YARHM-12403"))()
         end)
      end,
   })
end)

-- Blox Fruits Tab
task.delay(0.6, function()
   local BFTab = Window:CreateTab("Blox Fruits", 4483362458)

   -- W Azure Hub
   BFTab:CreateButton({
      Name = "W Azure Hub (Auto Farm, Teleport, No Key)",
      Callback = function()
         pcall(function()
            getgenv().Team = "Pirates"
            getgenv().FixCrash = false
            getgenv().FixCrash2 = false
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
         end)
      end,
   })

   -- Redz Hub
   BFTab:CreateButton({
      Name = "Redz Hub V2 (Auto Farm, Fruit ESP, No Key)",
      Callback = function()
         pcall(function()
            local Settings = {
               JoinTeam = "Pirates",
               Translator = true
            }
            loadstring(game:HttpGet("https://raw.githubusercontent.com/newredz/BloxFruits/refs/heads/main/Source.luau"))(Settings)
         end)
      end,
   })

   -- Astral Hub
   BFTab:CreateButton({
      Name = "Astral Hub (Auto Farm, Boss, ESP)",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Astral-v1-Auto-Dragon-Auto-Dojo-and-More-28167"))()
         end)
      end,
   })
end)

-- Funky Friday Tab
task.delay(0.8, function()
   local FFTab = Window:CreateTab("Funky Friday", 4483362458)

   FFTab:CreateButton({
      Name = "Null Fire (Mobile Script)",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Funky-Friday-Fire-Hub-18850"))()
         end)
      end,
   })
end)

-- Blade Ball Tab
task.delay(1.0, function()
   local BladeBallTab = Window:CreateTab("Blade Ball Scripts", 4483362458)

   BladeBallTab:CreateButton({
      Name = "FFJ Hub V2 (Mobile Friendly)",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Blade-Ball-FFJ-Hub-V2-15772"))()
         end)
      end,
   })

   BladeBallTab:CreateButton({
      Name = "LN Hub V3 (Auto Parry + Abilities)",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/No6No6No7yt/Lumin-Hub/main/BladeV3.lua"))()
         end)
      end,
   })

   BladeBallTab:CreateButton({
      Name = "Plutonium Hub (Auto Farm)",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua"))()
         end)
      end,
   })

   BladeBallTab:CreateButton({
      Name = "BeanzHub (Mobile Parry)",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/pid4k/scripts/main/BeanzHub.lua"))()
         end)
      end,
   })
end)

-- Dead Rails Tab
task.delay(1.2, function()
   local DeadRailsTab = Window:CreateTab("Dead Rails Scripts", 4483362458)

   -- Tora IsMe Script (Working)
   DeadRailsTab:CreateButton({
      Name = "Tora IsMe Script (Working)",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/tora-xyz/IsMe/main/IsMe.lua"))()
         end)
      end,
   })

   -- Null Fire (Dead Rails Alpha) Script
   DeadRailsTab:CreateButton({
      Name = "Null Fire (Dead Rails Alpha)",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Dead-Rails-Alpha-NullFire-32921"))()
         end)
      end,
   })
end)

-- Da Hood Tab
task.delay(1.6, function()
   local DaHoodTab = Window:CreateTab("Da Hood", 4483362458)

   DaHoodTab:CreateButton({
      Name = "Bypass Anti-Cheat (Must Run First)",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Da-Hood-Anti-Cheat-Bypass-12517"))()
         end)
      end,
   })

   -- Placeholder for more Da Hood scripts
   DaHoodTab:CreateButton({
      Name = "More Da Hood Scripts Coming Soon!",
      Callback = function()
         print("More Da Hood scripts coming soon!")
      end,
   })
end)