-- Black Screen Only
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local PlayerGui =
    LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BlackScreen"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 2147483647

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.BackgroundTransparency = 0
Frame.BorderSizePixel = 0
Frame.ZIndex = 2147483647
Frame.Parent = ScreenGui

ScreenGui.Parent = PlayerGui

print("Black Screen: ON")
