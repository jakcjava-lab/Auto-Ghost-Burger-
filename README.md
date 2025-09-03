-- Auto Ghost Burger Script for Forsaken (Roblox)
-- Requires Rayfield UI Library

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua'))()

local Window = Rayfield:CreateWindow({
   Name = "Forsaken Cheats",
   LoadingTitle = "Forsaken Hack",
   LoadingSubtitle = "by jakcjava-lab",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ForsakenAutoBurger"
   }
})

local Tab = Window:CreateTab("Auto Ghost Burger", 4483362458) -- You can use any icon asset ID

local Enabled = false

Tab:CreateToggle({
   Name = "Enable Auto Ghost Burger",
   CurrentValue = false,
   Flag = "AutoGhostBurger",
   Callback = function(Value)
      Enabled = Value
   end,
})

-- Function to check if only you and killer are left
function IsLMS()
    -- Replace with actual Forsaken LMS detection logic
    local players = game.Players:GetPlayers()
    if #players == 2 then
        -- Find if killer is one of them (change 'Killer' to actual role check, if possible)
        for _, player in ipairs(players) do
            if player.Name == "Killer" or player.Team and player.Team.Name == "Killer" then
                return true
            end
        end
    end
    return false
end

-- Function to use Ghost Burger (replace with actual function or remote event call)
function UseGhostBurger()
    -- Example: If it's a remote event called "ActivateGhostBurger"
    local remote = game.ReplicatedStorage:FindFirstChild("ActivateGhostBurger")
    if remote then
        remote:FireServer()
    else
        -- Or whatever method triggers the ability
        print("Ghost Burger used!")
    end
end

-- Timer check loop
spawn(function()
    while true do
        wait(1)
        if Enabled then
            -- Replace with actual timer UI path!
            local timerText = (game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TimerLabel") or {}).Text
            if timerText == "1:13" and IsLMS() then
                UseGhostBurger()
                Rayfield:Notify({
                    Title = "Ghost Burger Used!",
                    Content = "Auto Ghost Burger activated at 1:13 in LMS.",
                    Duration = 5,
                })
            end
        end
    end
end)
