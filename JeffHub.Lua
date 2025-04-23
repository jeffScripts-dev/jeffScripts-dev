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
      Name = "Yarhm Hub",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-Yarhm-MM2-Script-10591"))()
         end)
      end,
   })
end)

-- Blox Fruits Tab
task.delay(0.6, function()
   local BFTab = Window:CreateTab("Blox Fruits", 4483362458)

   BFTab:CreateButton({
      Name = "W Azure Hub",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AzureHubX/AzureHub/main/Main.lua"))()
         end)
      end,
   })

   BFTab:CreateButton({
      Name = "Redz Hub",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/HUB/main/BloxFruit.lua"))()
         end)
      end,
   })

   BFTab:CreateButton({
      Name = "Astral Hub",
      Callback = function()
         pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ASTRALHUB/ASTRAL/main/BloxFruit.lua"))()
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
