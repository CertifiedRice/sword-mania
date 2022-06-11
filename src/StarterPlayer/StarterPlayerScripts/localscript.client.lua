local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Status = game.ReplicatedStorage.Status

local Roact = require(ReplicatedStorage.roact)

local app = Roact.createElement("ScreenGui", {}, {
    TimerDisplay = Roact.createElement("TextLabel", {
        Size = UDim2.new(1,0, 0, 50),
        BackgroundTransparency = .5,
        TextScaled = true,
        TextColor3 = Color3.new(255, 255, 255),
        BackgroundColor3 = Color3.new(0.192156, 0.192156, 0.188235),
        Text = "Timer"
    }, {
        UICorner = Roact.createElement("UICorner"),
    }),
})
Roact.mount(app, Players.LocalPlayer.PlayerGui)