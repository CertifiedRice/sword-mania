-- Time

local roundLength = 60
local intermissionLength = 3

-- Values

local Status = game.ReplicatedStorage.Status

local InRound = game.ReplicatedStorage.InRound
--Spawns
local LobbySpawn = game.Workspace.Lobby.LobbySpawn
local MapSpawn = game.Workspace.Map.MapSpawn

-- Tools

InRound.Changed:Connect(function()
    if InRound.Value == true then 
        for _, player in pairs(game.Players:GetChildren()) do 
            local char = player.Character
            player.Character.Humanoid.Sit = true
            wait(.5)
            player.Character.Humanoid.Sit = false

            char.HumanoidRootPart.CFrame = MapSpawn.CFrame
    end
else
    for _, player in pairs(game.Players:GetChildren()) do 
        local char = player.Character
        char.HumanoidRootPart.CFrame = LobbySpawn.CFrame
    end
end

end)


local function roundTimer()
    while wait() do
        for i = intermissionLength, 0, -1 do
            InRound.Value = false
            wait(1)
            Status.Value = "Intermission: ".. i .. " seconds left!"
        end
        for i = roundLength, 0, -1 do
             InRound.Value = true
             wait(1)
             Status.Value = "Game: ".. i.. " seconds left!"
        end
    end
end

spawn(roundTimer)