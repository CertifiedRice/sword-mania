local Status = game.ReplicatedStorage.Status
local TimerDisplay = game.Players.LocalPlayer.PlayerGui.RoactTree.TimerDisplay

Status.Changed:Connect(function()
    TimerDisplay.Text = Status.Value
end)