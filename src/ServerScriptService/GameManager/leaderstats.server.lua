game.Players.PlayerAdded:Connect(function(player)
    local leaderstats = Instance.new("Folder", player)
    leaderstats.Name = "leaderstats"

    local cash = Instance.new("IntValue", leaderstats)
    cash.Name = "Cash"
    cash.Value = 0

    local kills = Instance.new("IntValue", leaderstats)
    kills.Name = "Kills"
    kills.Value = 0

    local deaths = Instance.new("IntValue", leaderstats)
    deaths.Name = "Deaths"
    deaths.Value = 0

    player.CharacterAdded:Connect(function(character)
        local humanoid = character:FindFirstChild("Humanoid")
        
        humanoid.Died:Connect(function()
            deaths.Value = deaths.Value + 1
            local tag = humanoid:FindFirstChild("creator")
            local killer = tag.Value
            if tag and killer then
                killer.leaderstats:FindFirstChild("Kills").Value = killer.leaderstats:FindFirstChild("Kills").Value + 1
            end
        end)

        character:WaitForChild("Humanoid").Died:Connect(function()
            local clone = game.ServerStorage.Cash:Clone()
            clone.Parent = game.Workspace
            clone.Position = character.Head.Position
            clone.Ignore.Value = character.Name
        end)
    end)
end)