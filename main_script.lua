-- ============================================
-- AFK BOT v4.0 - NO CRASH EDITION
-- Fix: Khong deep scan workspace
-- Fix: Khong dung DescendantAdded spam
-- Fix: Nhe nhat co the
-- ============================================

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local SoundService =
    game:GetService("SoundService")
local Stats = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer

-- ============================================
-- BUOC 0: DOI GAME LOAD XONG THAT SU
-- ============================================
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Doi them de Blox Fruits load xong
task.wait(5)
print("[AFK v4] Bat dau...")

-- ============================================
-- BUOC 1: FPS CAP TRUOC TIEN
-- Giam tai ngay lap tuc
-- ============================================
pcall(function()
    setfpscap(20)
end)

pcall(function()
    settings().Rendering.QualityLevel =
        Enum.QualityLevel.Level01
end)

print("[AFK v4] FPS: 20, Quality: Min")

-- ============================================
-- BUOC 2: CAMERA LOCK
-- Quan trong nhat, lam truoc
-- ============================================
local function lockCamera()
    pcall(function()
        local cam = Workspace.CurrentCamera
        if not cam then return end
        cam.CameraType =
            Enum.CameraType.Scriptable
        cam.CFrame =
            CFrame.new(0, -50000, 0)
        cam.FieldOfView = 1
        cam.CameraSubject = nil
    end)
end

lockCamera()

Workspace:GetPropertyChangedSignal(
    "CurrentCamera"):Connect(function()
    task.wait(0.2)
    lockCamera()
end)

print("[AFK v4] Camera: Locked")

-- ============================================
-- BUOC 3: BLACK SCREEN
-- ============================================
local PlayerGui =
    LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AFK_v4"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 2147483647

local BlackFrame = Instance.new("Frame")
BlackFrame.Size = UDim2.new(1, 0, 1, 0)
BlackFrame.BackgroundColor3 =
    Color3.new(0, 0, 0)
BlackFrame.BackgroundTransparency = 0
BlackFrame.BorderSizePixel = 0
BlackFrame.ZIndex = 2147483647
BlackFrame.Parent = ScreenGui

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, 0, 0, 20)
InfoLabel.Position =
    UDim2.new(0, 5, 1, -22)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 =
    Color3.new(0.2, 0.2, 0.2)
InfoLabel.TextXAlignment =
    Enum.TextXAlignment.Left
InfoLabel.TextSize = 11
InfoLabel.Font = Enum.Font.Code
InfoLabel.Text = "AFK v4 | Loading..."
InfoLabel.ZIndex = 2147483647
InfoLabel.Parent = BlackFrame

ScreenGui.Parent = PlayerGui

print("[AFK v4] Black screen: ON")

-- ============================================
-- BUOC 4: TAT UI
-- ============================================
pcall(function()
    StarterGui:SetCoreGuiEnabled(
        Enum.CoreGuiType.All, false)
    StarterGui:SetCore(
        "TopbarEnabled", false)
end)

local function hideGUI()
    pcall(function()
        for _, gui in
                ipairs(PlayerGui:GetChildren())
                do
            if gui.Name ~= "AFK_v4"
                and gui:IsA("ScreenGui") then
                gui.Enabled = false
            end
        end
    end)
end

hideGUI()

PlayerGui.ChildAdded:Connect(function(child)
    -- Dung task.delay thay vi task.defer
    -- An toan hon voi so luong lon
    task.delay(0.1, function()
        pcall(function()
            if child.Name ~= "AFK_v4"
                and child:IsA("ScreenGui") then
                child.Enabled = false
            end
        end)
    end)
end)

print("[AFK v4] UI: Hidden")

-- ============================================
-- BUOC 5: LIGHTING
-- Don gian, khong loop
-- ============================================
pcall(function()
    for _, v in
            ipairs(Lighting:GetChildren()) do
        if v:IsA("PostEffect")
            or v:IsA("Sky")
            or v:IsA("Atmosphere") then
            v:Destroy()
        end
    end

    Lighting.GlobalShadows = false
    Lighting.Brightness = 0
    Lighting.Ambient = Color3.new(0, 0, 0)
    Lighting.OutdoorAmbient =
        Color3.new(0, 0, 0)
    Lighting.FogEnd = 0
    Lighting.ClockTime = 0
end)

Lighting.DescendantAdded:Connect(function(v)
    pcall(function()
        if v:IsA("PostEffect")
            or v:IsA("Sky")
            or v:IsA("Atmosphere") then
            v:Destroy()
        end
    end)
end)

print("[AFK v4] Lighting: Black")

-- ============================================
-- BUOC 6: CLEAN NHE - KHONG SCAN TOAN BO
-- Chi xoa folder decoration
-- TUYET DOI KHONG GetDescendants() ngay
-- ============================================

-- Chi xoa nhung folder CHINH xac dinh
local SAFE_DELETE_FOLDERS = {
    "Decor", "Decoration", "Decorations",
    "Effects", "VFX", "FX",
    "Sky", "Clouds",
    "MapEffects",
}

task.spawn(function()
    task.wait(1)
    for _, name in
            ipairs(SAFE_DELETE_FOLDERS) do
        pcall(function()
            local f =
                Workspace:FindFirstChild(name)
            if f then
                f:Destroy()
                print("[AFK v4] Deleted: "
                    .. name)
            end
        end)
        -- Doi giua moi folder
        task.wait(0.1)
    end
    print("[AFK v4] Folders: Cleaned")
end)

-- ============================================
-- BUOC 7: SCAN NHE - BATCH NHO
-- Thay vi 150/batch -> 50/batch
-- Them task.wait(0.1) thay vi task.wait()
-- De tranh freeze
-- ============================================

-- Danh sach class can xoa
local DELETE_SET = {
    ParticleEmitter = true,
    Trail = true,
    Beam = true,
    Fire = true,
    Smoke = true,
    Sparkles = true,
    Explosion = true,
    PointLight = true,
    SpotLight = true,
    SurfaceLight = true,
    Highlight = true,
    Decal = true,
    Texture = true,
    SurfaceAppearance = true,
    BillboardGui = true,
    SurfaceGui = true,
    Sound = true,
}

task.spawn(function()
    -- Doi 3 giay truoc khi scan
    -- De game on dinh truoc
    task.wait(3)

    print("[AFK v4] Bat dau scan nhe...")

    local descs = Workspace:GetDescendants()
    local total = #descs
    local removed = 0

    -- BATCH NHO: 50 object moi lan
    -- task.wait(0.1) giua cac batch
    -- = 500 object/giay (an toan)
    local BATCH = 50

    for i = 1, total, BATCH do
        -- Kiem tra tung object trong batch
        for j = i,
                math.min(
                    i + BATCH - 1,
                    total) do
            local v = descs[j]

            -- Check con ton tai khong
            if v and v.Parent then
                pcall(function()
                    local cn = v.ClassName

                    if DELETE_SET[cn] then
                        if cn == "Sound" then
                            v:Stop()
                        end
                        v:Destroy()
                        removed = removed + 1
                    elseif v:IsA("BasePart")
                        and not v:IsA("Terrain")
                        then
                        -- Chi tat shadow
                        -- KHONG thay 
