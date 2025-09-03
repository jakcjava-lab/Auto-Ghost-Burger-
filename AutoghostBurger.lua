-- Auto Ghost Burger Script for Forsaken (Roblox)
-- Uses Orion UI Library

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/p3arl/Orion/main/Orion.lua"))()

local Window = OrionLib:MakeWindow({
    Name = "Forsaken Cheats",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "ForsakenAutoBurger"
})

local Enabled = false

local Tab = Window:MakeTab({
    Name = "Auto Ghost Burger",
    Icon = "rbxassetid://4483362458"
})

Tab:AddToggle({
    Name = "Enable Auto Ghost Burger",
    Default = false,
    Callback = function(Value)
        Enabled = Value
    end
})

function IsLMS()
    local players = game.Players:GetPlayers()
    if #players == 2 then
        for _, player in ipairs(players) do
            if player.Name == "Killer" or (player.Team and player.Team.Name == "Killer") then
                return true
            end
        end
    end
    return false
end

function UseGhostBurger()
    local remote = game.ReplicatedStorage:FindFirstChild("ActivateGhostBurger")
    if remote then
        remote:FireServer()
    else
        print("Ghost Burger used!")
    end
end

spawn(function()
    while true do
        wait(1)
        if Enabled then
            local timerLabel = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TimerLabel")
            local timerText = timerLabel and timerLabel.Text or nil
            if timerText == "1:13" and IsLMS() then
                UseGhostBurger()
                OrionLib:MakeNotification({
                    Name = "Ghost Burger Used!",
                    Content = "Auto Ghost Burger activated at 1:13 in LMS.",
                    Image = "rbxassetid://4483362458",
                    Time = 5
                })
            end
        end
    end
end)

OrionLib:Init()
