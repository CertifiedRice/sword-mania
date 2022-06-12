-- Time

local roundLength = 60
local intermissionLength = 15


-- Values

local Status = game.ReplicatedStorage.Status
local minPlayers = game.ReplicatedStorage.minPlayers
local InRound = game.ReplicatedStorage.InRound
--Spawns
local LobbySpawn = game.Workspace.Lobby.LobbySpawn
local GreenGrassLandSpawn = game.Workspace.Maps.GreenGrassLand.MapSpawn 
local DessertSpawn = game.Workspace.Maps.Desert.MapSpawn

-- Map pick
local MapNumber = 0 
MapNumber = math.random(1, 21)

InRound.Changed:Connect(function()
    if InRound.Value == true then 
        for _, player in pairs(game.Players:GetChildren()) do 
            local char = player.Character
            player.Character.Humanoid.Sit = true
            wait(.5)
            player.Character.Humanoid.Sit = false

            -- print("Map ID:"..MapNumber)

            if MapNumber == 1 then
                char.HumanoidRootPart.CFrame = GreenGrassLandSpawn.CFrame
            elseif MapNumber == 5 then
                char.HumanoidRootPart.CFrame = GreenGrassLandSpawn.CFrame
            elseif MapNumber == 9 then
                char.HumanoidRootPart.CFrame = GreenGrassLandSpawn.CFrame
            elseif MapNumber == 4 then
                char.HumanoidRootPart.CFrame = GreenGrassLandSpawn.CFrame
            elseif MapNumber == 8 then
                char.HumanoidRootPart.CFrame = GreenGrassLandSpawn.CFrame
            elseif MapNumber == 12 then
                char.HumanoidRootPart.CFrame = GreenGrassLandSpawn.CFrame
            elseif MapNumber == 16 then
                char.HumanoidRootPart.CFrame = GreenGrassLandSpawn.CFrame
            elseif MapNumber == 20 then
                char.HumanoidRootPart.CFrame = GreenGrassLandSpawn.CFrame
            elseif MapNumber == 2 then
                char.HumanoidRootPart.CFrame = DessertSpawn.CFrame
            elseif MapNumber == 6 then
                char.HumanoidRootPart.CFrame = DessertSpawn.CFrame
            elseif MapNumber == 10 then
                char.HumanoidRootPart.CFrame = DessertSpawn.CFrame
            elseif MapNumber == 14 then
                char.HumanoidRootPart.CFrame = DessertSpawn.CFrame
            else
                char.HumanoidRootPart.CFrame = DessertSpawn.CFrame
            end
    end
else
    for _, player in pairs(game.Players:GetChildren()) do 
        local char = player.Character
        char.HumanoidRootPart.CFrame = LobbySpawn.CFrame
        MapNumber = math.random(1, 21)
    end
end

end)

local function roundTimer()
    -- wait until there is more then 2 players
    while #game.Players:GetChildren() < 2 do
        wait(1)
        Status.Value = "Atleast 2 players is required to play the game!"
    end

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