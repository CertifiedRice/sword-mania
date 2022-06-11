local Status = game.ReplicatedStorage.Status
local TimerDisplay = script.Parent.TimerDisplay

Status.Changed:Connect(function()
    TimerDisplay.Text = Status.Value
end)