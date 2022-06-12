local DS = game:GetService("DataStoreService"):GetDataStore("SaveData")
game.Players.PlayerAdded:Connect(function(player)
    wait()
    local playerkey = "id_"..player.UserId
    local save1 = player.leaderstats.Cash 
    local save2 = player.leaderstats.Kills
    local save3 = player.leaderstats.Deaths
    local save4 = player.leaderstats.Levels

    local GetSaved = DS:GetAsync(playerkey)
    if GetSaved then 
        save1.Value = GetSaved[1]
        save2.Value = GetSaved[2]
        save3.Value = GetSaved[3]
        save4.Value = GetSaved[4]
    else
        local NumberForSaving = {save1.Value, save2.Value, save3.Value, save4.Value}
        DS:SetAsync(playerkey, NumberForSaving)
    end
end)

game.Players.PlayerRemoving:Connect(function(player)
    DS:SetAsync("id_"..player.UserId, {player.leaderstats.Cash.Value, player.leaderstats.Kills.Value, player.leaderstats.Deaths.Value, player.leaderstats.Levels.Value})
end)