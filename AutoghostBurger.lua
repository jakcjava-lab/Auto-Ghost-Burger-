-- Auto Ghost Burger Script for Forsaken (Roblox)
-- Uses the latest Rayfield UI Library

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusMenu/Rayfield/main/source.lua"))()

local Window = Rayfield:CreateWindow({
   Name = "Forsaken Cheats",
   Icon = 0,
   LoadingTitle = "Forsaken Hack",
   LoadingSubtitle = "by jakcjava-lab",
   ShowText = "Rayfield",
   Theme = "Default",
   ToggleUIKeybind = "K",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ForsakenAutoBurger",
      FileName = "ForsakenAutoBurgerSettings"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local Tab = Window:CreateTab("Auto Ghost Burger", 4483362458)

local Enabled = false

Tab:CreateToggle({
   Name = "Enable Auto Ghost Burger",
   CurrentValue = false,
   Flag = "AutoGhostBurger",
   Callback = function(Value)
      Enabled = Value
   end,
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
