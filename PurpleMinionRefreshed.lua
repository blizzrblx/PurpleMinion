local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer

local Mouse = Players.LocalPlayer:GetMouse()

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Actives = {
    ClickToMove = {
        Speed = 100,
        Enabled = false,
    },
    Player = {

    },
    Visuals = {
        HighlightEnabled = false,
        NametagEnabled = false,
        LineEnabled = false,
        HighlightColor = Color3.fromRGB(255,0,0),
        NametagColor = Color3.fromRGB(255,0,0),
        
    },
    Fun = {

    },
}

local Window = WindUI:CreateWindow({
    Title = "Purple Minion Hub",
    Icon = "code-xml",
    Author = "by Blizzrblx",
    Folder = "Purple Minion Hub",
})

local ClickTab = Window:Tab({
    Title = "Click To Move +",
    Icon = "arrow",
    Locked = false,
})
local PlayerTab = Window:Tab({
    Title = "Player",
    Icon = "user",
    Locked = false
})
local VisualsTab = Window:Tab({
    Title = "Visuals",
    Icon = "eye",
    Locked = false
})
local FunTab = Window:Tab({
    Title = "Fun",
    Icon = "laugh",
    Locked = false
})
local ConfigTab = Window:Tab({
    Title = "Config",
    Icon = "cog",
    Locked = false
})

UserInputService.InputBegan:Connect(function(input,gp)
    if gp then return end
    if Actives.ClickToMove.Enabled == false then return end
    if input.UserInputType = Enum.UserInputType.MouseButton1 then
        local target = Mouse.Hit.Position
        local Character = Player.Character

        local Distance = (target - Character:GetPivot().Position).Magnitude
        local time = Distance/Actives.ClickToMove.Speed
        local Tweendata = Tweeninfo.new(time)
        local Tween = game:GetService("TweenService"):Create(Character.HumanoidRootPart,Tweendata,{Position = target + Vector3.new(0,3,0)})
        Tween:Play()
    end
end)
