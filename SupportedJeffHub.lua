local placeId = game.PlaceId

if placeId == 15629601567 or placeId == 15877097792 then
    -- Strict Brother (main + round)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jeffScripts-dev/jeffScripts-dev/main/JeffHubStrictBrother.lua"))()

elseif placeId == 8929050629 or placeId == 12350891962 then
    -- Mo's Academy (lobby + game)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jeffScripts-dev/jeffScripts-dev/main/MoAdemy.lua"))()

elseif placeId == 13772394625 or placeId == 15234596844 then
    -- Blade Ball (main + training)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jeffScripts-dev/jeffScripts-dev/main/Bladeball.lua"))()

else
    warn("Unsupported game: " .. placeId)
    -- Optional: GUI label to say Unsupported Game
end
