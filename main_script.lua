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
    setfpscap(15)
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
                        -- KHONG thay doi gi them
                        v.CastShadow = false
                    end
                end)
            end
        end

        -- Cho 0.1s giua batch
        -- = khong freeze game
        task.wait(0.1)
    end

    print("[AFK v4] Scan xong: "
        .. removed .. " removed")
end)

-- ============================================
-- BUOC 8: BLOCK OBJECT MOI - AN TOAN
-- QUAN TRONG: Dung throttle
-- Neu dung DescendantAdded thuan tuy
-- Blox Fruits spam -> queue tran -> crash
-- ============================================

-- Throttle: xu ly toi da 10 object/giay
local pendingObjects = {}
local isProcessing = false

Workspace.DescendantAdded:Connect(function(v)
    -- Chi them vao queue, KHONG xu ly ngay
    table.insert(pendingObjects, v)
end)

-- Xu ly queue moi 0.5 giay
-- Khong bi spam
task.spawn(function()
    while true do
        task.wait(0.5)

        if #pendingObjects == 0 then
            continue
        end

        -- Lay toi da 20 object moi lan
        local toProcess = math.min(
            20, #pendingObjects)

        for i = 1, toProcess do
            local v = pendingObjects[i]
            if v and v.Parent then
                pcall(function()
                    local cn = v.ClassName

                    if DELETE_SET[cn] then
                        if cn == "Sound" then
                            pcall(function()
                                v:Stop()
                            end)
                        end
                        v:Destroy()
                    elseif v:IsA("BasePart")
                        and not v:IsA("Terrain")
                        then
                        v.CastShadow = false
                    end
                end)
            end
        end

        -- Xoa nhung object da xu ly
        for i = 1, toProcess do
            table.remove(pendingObjects, 1)
        end
    end
end)

print("[AFK v4] Object blocker: Active")

-- ============================================
-- BUOC 9: SOUND SERVICE CLEAN
-- ============================================
task.spawn(function()
    task.wait(2)
    pcall(function()
        for _, v in ipairs(
                SoundService:GetDescendants())
                do
            if v:IsA("Sound") then
                pcall(function()
                    v:Stop()
                    v.Volume = 0
                end)
            end
        end
    end)
    print("[AFK v4] Sounds: Muted")
end)

-- ============================================
-- BUOC 10: TERRAIN CLEAN NHE
-- Khong Clear() ngay - qua nang
-- Chi tat decoration + water
-- ============================================
task.spawn(function()
    task.wait(2)
    pcall(function()
        local t =
            Workspace:FindFirstChildOfClass(
                "Terrain")
        if t then
            t.Decoration = false
            t.WaterTransparency = 1
            t.WaterWaveSize = 0
            t.WaterWaveSpeed = 0
            -- Clear() sau khi on dinh
            task.wait(3)
            pcall(function() t:Clear() end)
            print("[AFK v4] Terrain: Cleared")
        end
    end)
end)

-- ============================================
-- BUOC 11: MAINTENANCE - SIEU NHE
-- Chi update nhung gi can thiet
-- Khong scan descendant trong loop
-- ============================================
task.spawn(function()
    local counter = 0

    while true do
        task.wait(5)
        counter = counter + 1

        -- Camera (moi 5s)
        lockCamera()

        -- Lighting (moi 5s)
        pcall(function()
            Lighting.GlobalShadows = false
            Lighting.Brightness = 0
        end)

        -- Black screen (moi 5s)
        pcall(function()
            if ScreenGui then
                ScreenGui.Enabled = true
            end
        end)

        -- UI (moi 15s)
        if counter % 3 == 0 then
            pcall(function()
                StarterGui:SetCoreGuiEnabled(
                    Enum.CoreGuiType.All,
                    false)
            end)
            hideGUI()
        end

        -- Queue cleanup (moi 30s)
        -- Tranh pendingObjects qua lon
        if counter % 6 == 0 then
            if #pendingObjects > 100 then
                -- Xoa queue cu neu qua lon
                -- Tranh memory leak
                local keep = {}
                local start = math.max(
                    1,
                    #pendingObjects - 50)
                for i = start,
                        #pendingObjects do
                    table.insert(
                        keep,
                        pendingObjects[i])
                end
                pendingObjects = keep
            end
        end

        -- RAM update (moi 30s)
        if counter % 6 == 0 then
            pcall(function()
                local ram =
                    Stats:GetTotalMemoryUsageMb()
                InfoLabel.Text =
                    string.format(
                        "AFK v4 | RAM:%.0fMB"
                        .. " | FPS:20 | OK",
                        ram)
            end)
        end
    end
end)

-- ============================================
-- BUOC 12: RESPAWN HANDLER
-- ============================================
LocalPlayer.CharacterAdded:Connect(
    function(char)
        task.wait(1.5)
        pcall(function()
            lockCamera()

            -- Tat shadow tren character
            for _, v in ipairs(
                    char:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CastShadow = false
                end
                if v:IsA("Sound") then
                    v:Stop()
                    v.Volume = 0
                end
            end

            print("[AFK v4] Respawn: Setup OK")
        end)
    end)

-- ============================================
-- BUOC 13: ANTI-KICK (4 PHUT)
-- ============================================
task.spawn(function()
    while true do
        task.wait(240)
        pcall(function()
            local char = LocalPlayer.Character
            if not char then return end
            local hum =
                char:FindFirstChildOfClass(
                    "Humanoid")
            if hum then
                hum.Jump = true
            end
        end)
    end
end)

print("[AFK v4] Anti-kick: ON")

-- ============================================
-- DONE
-- ============================================
InfoLabel.Text =
    "AFK v4 | Active | FPS:20"

print("╔════════════════════════════════╗")
print("║  AFK BOT v4.0 - NO CRASH     ║")
print("╠════════════════════════════════╣")
print("║  Camera : -50000              ║")
print("║  Black  : ON                  ║")
print("║  FPS    : 20                  ║")
print("║  Batch  : 50obj/0.1s (safe)  ║")
print("║  Queue  : 20obj/0.5s (safe)  ║")
print("║  Crash  : FIXED               ║")
print("╚════════════════════════════════╝")
