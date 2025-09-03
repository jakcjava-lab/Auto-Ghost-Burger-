-- Auto Ghost Burger Script for Forsaken (Roblox)
-- Credits: Zen UI Edition

local Zen = loadstring(game:HttpGet("https://raw.githubusercontent.com/AbstractPoo/ZEN/main/Zen.lua"))()

local Window = Zen:CreateWindow("Forsaken Cheats | Powered by Zen UI")

local Tab = Window:CreateTab("Auto Ghost Burger")
local Enabled = false

Tab:CreateToggle("Enable Auto Ghost Burger", false, function(Value)
    Enabled = Value
end)

-- Killer check
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

-- Ghost Burger remote
local function UseGhostBurger()
    local remote = game.ReplicatedStorage:FindFirstChild("ActivateGhostBurger")
    if remote then
        remote:FireServer()
        Zen:Notify("Ghost Burger Used!", "Auto Ghost Burger activated. | Zen UI")
    else
        warn("[AutoBurger] Ghost Burger Remote not found!")
    end
end

-- Loop
task.spawn(function()
    local used = false
    while task.wait(1) do
        if Enabled and not used then
            local gui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
            local timerLabel = gui and gui:FindFirstChild("TimerLabel", true)

            local timerText = timerLabel and timerLabel.Text or nil
            if timerText == "1:13" and IsLMS() then
                UseGhostBurger()
                used = true
            end
        end
    end
end)
