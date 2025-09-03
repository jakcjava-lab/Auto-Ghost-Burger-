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

-- safer check for killer (adjust if Forsaken uses attributes/teams differently)
local function IsLMS()
    local players = game.Players:GetPlayers()
    if #players == 2 then
        for _, plr in ipairs(players) do
            if plr.Team and string.lower(plr.Team.Name) == "killer" then
                return true
            end
        end
    end
    return false
end

local function UseGhostBurger()
    local remote = game.ReplicatedStorage:FindFirstChild("ActivateGhostBurger")
    if remote then
        remote:FireServer()
    else
        warn("[AutoBurger] Ghost Burger Remote not found!")
    end
end

spawn(function()
    local used = false
    while task.wait(1) do
        if Enabled and not used then
            local gui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            local timerGui = gui:FindFirstChildWhichIsA("ScreenGui")
            local timerLabel = timerGui and timerGui:FindFirstChild("TimerLabel", true)

            local timerText = timerLabel and timerLabel.Text or nil
            if timerText == "1:13" and IsLMS() then
                UseGhostBurger()
                used = true -- stop spamming
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
