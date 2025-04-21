local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

local Window = redzlib:MakeWindow({
    Title = "Jeff Hub : Spray Paint",
    SubTitle = "by Jeff",
    SaveFolder = "Spray Paint | redz lib v5.lua"
})

local Tab1 = Window:MakeTab({"Main", "cherry"})

Tab1:AddButton({
    "Draw Pixel Heart",
    function()
        print("Auto Drawing Starting...")

        local heart = {
            "0110 0110",
            "1111 1111",
            "11111111",
            " 111111",
            "  1111",
            "   11"
        }

        local UIS = game:GetService("UserInputService")
        local VIM = game:GetService("VirtualInputManager")
        local mouse = game.Players.LocalPlayer:GetMouse()

        local startX = mouse.X
        local startY = mouse.Y

        local pixelSize = 5 -- space between pixels

        for y, row in ipairs(heart) do
            for x = 1, #row do
                if row:sub(x, x) == "1" then
                    local moveX = startX + ((x - 1) * pixelSize)
                    local moveY = startY + ((y - 1) * pixelSize)

                    VIM:SendMouseMove(moveX, moveY)
                    task.wait(0.01)
                    VIM:SendMouseButtonEvent(moveX, moveY, 0, true, game, 0)
                    task.wait(0.01)
                    VIM:SendMouseButtonEvent(moveX, moveY, 0, false, game, 0)
                end
            end
        end

        print("Auto Draw Done")
    end
})
