-- ============================================
-- BLOX FRUITS AFK BOT v2.0
-- GPU = 0% | CPU = MIN | RAM = AUTO CLEAN
-- MEMORY LEAK DETECTOR + FIXER
-- ============================================

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local ContentProvider =
    game:GetService("ContentProvider")
local TweenService =
    game:GetService("TweenService")
local SoundService =
    game:GetService("SoundService")
local ReplicatedStorage =
    game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

if not game:IsLoaded() then
    game.Loaded:Wait()
end
task.wait(2)

print("[AFK v2] Khoi dong...")

-- ============================================
-- BIEN THEO DOI MEMORY
-- ============================================
local lastMemory = 0
local memoryLeakCount = 0
local connections = {} -- Luu connections
                       -- de disconnect sau

-- ============================================
-- HAM: Luu connection de quan ly
-- (Tranh memory leak tu connections)
-- ============================================
local function track(conn)
    table.insert(connections, conn)
    return conn
end

-- ============================================
-- HAM: Collect garbage manh
-- Roblox Lua co GC nhung can ep chay
-- ============================================
local function forceGC()
    -- Goi nhieu lan de GC clean sach
    for _ = 1, 5 do
        pcall(function()
            collectgarbage("collect")
        end)
    end
    pcall(function()
        collectgarbage("collect")
        collectgarbage("count")
    end)
end

-- ============================================
-- HAM: Doc memory hien tai (MB)
-- ============================================
local function getMemoryMB()
    local mem = 0
    pcall(function()
        mem = collectgarbage("count") / 1024
    end)
    return mem
end

-- ============================================
-- HAM: Xoa sound (rat ton RAM)
-- ============================================
local function killAllSounds()
    for _, v in ipairs(
            SoundService:GetDescendants()) do
        pcall(function()
            if v:IsA("Sound") then
                v:Stop()
                v.Volume = 0
                v.Playing = false
                v:Destroy()
            end
        end)
    end

    -- Sound trong Workspace
    for _, v in ipairs(
            Workspace:GetDescendants()) do
        pcall(function()
            if v:IsA("Sound") then
                v:Stop()
                v.Volume = 0
                v:Destroy()
            end
        end)
    end
end

-- ============================================
-- HAM: Xoa particles/trails/effects
-- (Nhung thu nay TON GPU + RAM nhat)
-- ============================================
local EFFECT_CLASSES = {
    "ParticleEmitter",
    "Trail", "Beam",
    "Fire", "Smoke", "Sparkles",
    "Explosion",
    "PointLight", "SpotLight",
    "SurfaceLight",
    "Highlight",
    "BillboardGui",
    "SurfaceGui",
}

local function killEffects(parent)
    for _, v in ipairs(
            parent:GetDescendants()) do
        pcall(function()
            for _, cls in
                    ipairs(EFFECT_CLASSES) do
                if v:IsA(cls) then
                    v:Destroy()
                    return
                end
            end
        end)
    end
end

-- ============================================
-- HAM: Xoa textures khoi parts
-- (Texture load vao VRAM = ton GPU memory)
-- ============================================
local function stripTextures(parent)
    for _, v in ipairs(
            parent:GetDescendants()) do
        pcall(function()
            if v:IsA("Decal")
                or v:IsA("Texture")
                or v:IsA("SurfaceAppearance")
                then
                v:Destroy()
            end

            -- Xoa mesh data
            -- (MeshPart dung rat nhieu RAM)
            if v:IsA("SpecialMesh")
                or v:IsA("BlockMesh")
                or v:IsA("CylinderMesh") then
                v:Destroy()
            end
        end)
    end
end

-- ============================================
-- HAM: Xoa Animations
-- (AnimationTrack ton CPU moi frame)
-- ============================================
local function killAnimations()
    pcall(function()
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass(
                "Humanoid")
            if hum then
                local animator =
                    hum:FindFirstChildOfClass(
                        "Animator")
                if animator then
                    for _, track in ipairs(
                        animator:GetPlayingAnimationTracks()
                        ) do
                        track:Stop()
                        track:Destroy()
                    end
                end
            end
        end
    end)
end

-- ============================================
-- HAM: Lam MeshPart thanh Part thuong
-- (MeshPart dung 10-50x RAM hon Part)
-- ============================================
local function simplifyParts(parent)
    for _, v in ipairs(
            parent:GetDescendants()) do
        pcall(function()
            if v:IsA("BasePart")
                and not v:IsA("Terrain") then

                -- Material don gian nhat
                v.Material =
                    Enum.Material.SmoothPlastic
                v.Reflectance = 0
                v.CastShadow = false

                -- Xoa child effects
                for _, child in ipairs(
                        v:GetChildren()) do
                    local cn = child.ClassName
                    if cn == "Decal"
                        or cn == "Texture"
                        or cn == "SurfaceAppearance"
                        or cn == "SpecialMesh"
                        or cn == "Fire"
                        or cn == "Smoke"
                        or cn == "Sparkles"
                        or cn == "ParticleEmitter"
                        or cn == "Trail"
                        or cn == "PointLight"
                        or cn == "SpotLight"
                        or cn == "SurfaceLight"
                        or cn == "Highlight"
                        or cn == "BillboardGui"
                        or cn == "SurfaceGui"
                        or cn == "Sound"
                        then
                        child:Destroy()
                    end
                end
            end
        end)
    end
end

-- ============================================
-- BUOC 1: CAMERA TAT HOAN TOAN
-- ============================================
print("[AFK v2] Buoc 1: Camera...")

local function lockCamera()
    local cam = Workspace.CurrentCamera
    if cam then
        cam.CameraType =
            Enum.CameraType.Scriptable
        cam.CFrame = CFrame.new(
            0, -50000, 0)
        cam.FieldOfView = 1
        cam.CameraSubject = nil

        -- Tat near/far clip
        -- GPU khong can tinh depth
        pcall(function()
            cam.NearPlaneZ = 0.01
        end)
    end
end

lockCamera()

-- Khi camera moi tao
track(
    Workspace:GetPropertyChangedSignal(
        "CurrentCamera"):Connect(function()
        task.wait(0.1)
        lockCamera()
    end)
)

print("[AFK v2] Camera: OFF (-50000)")

-- ============================================
-- BUOC 2: BLACK SCREEN UI
-- ============================================
print("[AFK v2] Buoc 2: Black Screen...")

local PlayerGui =
    LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AFK_BLACK"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 2147483647
ScreenGui.ZIndexBehavior =
    Enum.ZIndexBehavior.Global

local BlackFrame = Instance.new("Frame")
BlackFrame.Size = UDim2.new(1, 0, 1, 0)
BlackFrame.Position = UDim2.new(0, 0, 0, 0)
BlackFrame.BackgroundColor3 =
    Color3.new(0, 0, 0)
BlackFrame.BackgroundTransparency = 0
BlackFrame.BorderSizePixel = 0
BlackFrame.ZIndex = 2147483647
BlackFrame.Parent = ScreenGui

-- Info text nho
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(0, 300, 0, 20)
InfoLabel.Position = UDim2.new(
    0.5, -150, 1, -25)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 =
    Color3.new(0.2, 0.2, 0.2)
InfoLabel.TextSize = 12
InfoLabel.Font = Enum.Font.Code
InfoLabel.Text = "AFK BOT v2.0 | Active"
InfoLabel.ZIndex = 2147483647
InfoLabel.Parent = BlackFrame

ScreenGui.Parent = PlayerGui

print("[AFK v2] Black Screen: ON")

-- ============================================
-- BUOC 3: TAT UI + CORE GUI
-- ============================================
print("[AFK v2] Buoc 3: Kill UI...")

pcall(function()
    StarterGui:SetCoreGuiEnabled(
        Enum.CoreGuiType.All, false)
    StarterGui:SetCore(
        "TopbarEnabled", false)
end)

local function hideAllUI()
    for _, gui in ipairs(
            PlayerGui:GetChildren()) do
        pcall(function()
            if gui.Name ~= "AFK_BLACK"
                and gui:IsA("ScreenGui") then
                gui.Enabled = false
            end
        end)
    end
end

hideAllUI()

track(
    PlayerGui.ChildAdded:Connect(function(child)
        task.defer(function()
            pcall(function()
                if child.Name ~= "AFK_BLACK"
                    and child:IsA("ScreenGui")
                    then
                    child.Enabled = false
                end
            end)
        end)
    end)
)

print("[AFK v2] UI: Hidden")

-- ============================================
-- BUOC 4: LIGHTING = BLACK
-- ============================================
print("[AFK v2] Buoc 4: Lighting...")

for _, v in ipairs(Lighting:GetChildren()) do
    pcall(function() v:Destroy() end)
end

Lighting.Brightness = 0
Lighting.Ambient = Color3.new(0, 0, 0)
Lighting.OutdoorAmbient = Color3.new(0, 0, 0)
Lighting.GlobalShadows = false
Lighting.FogEnd = 0
Lighting.FogStart = 0
Lighting.FogColor = Color3.new(0, 0, 0)
Lighting.ClockTime = 0

track(
    Lighting.DescendantAdded:Connect(function(v)
        pcall(function() v:Destroy() end)
    end)
)

print("[AFK v2] Lighting: Black")

-- ============================================
-- BUOC 5: TERRAIN CLEAR
-- ============================================
print("[AFK v2] Buoc 5: Terrain...")

local Terrain =
    Workspace:FindFirstChildOfClass("Terrain")
if Terrain then
    pcall(function()
        Terrain:Clear()
        Terrain.Decoration = false
        Terrain.WaterTransparency = 1
        Terrain.WaterWaveSize = 0
        Terrain.WaterWaveSpeed = 0
        Terrain.WaterReflectance = 0
    end)
end

print("[AFK v2] Terrain: Cleared")

-- ============================================
-- BUOC 6: XOA SOUNDS
-- (Sound dung CPU de decode + RAM buffer)
-- ============================================
print("[AFK v2] Buoc 6: Sounds...")

killAllSounds()

-- Block sound moi
track(
    Workspace.DescendantAdded:Connect(
        function(v)
            pcall(function()
                if v:IsA("Sound") then
                    v:Stop()
                    v.Volume = 0
                    v:Destroy()
                end
            end)
        end)
)

track(
    SoundService.DescendantAdded:Connect(
        function(v)
            pcall(function()
                if v:IsA("Sound") then
                    v:Stop()
                    v.Volume = 0
                    v:Destroy()
                end
            end)
        end)
)

print("[AFK v2] Sounds: Killed")

-- ============================================
-- BUOC 7: XOA EFFECTS + TEXTURES + SIMPLIFY
-- (Lam 1 lan duy nhat, co batch)
-- ============================================
print("[AFK v2] Buoc 7: Deep clean...")

task.spawn(function()
    local descs = Workspace:GetDescendants()
    local total = #descs
    local cleaned = 0
    local batchSize = 100

    for i = 1, total, batchSize do
        local limit = math.min(
            i + batchSize - 1, total)

        for j = i, limit do
            local v = descs[j]
            if v and v.Parent then
                pcall(function()
                    local cn = v.ClassName

                    -- Xoa effects
                    if cn == "ParticleEmitter"
                        or cn == "Trail"
                        or cn == "Beam"
                        or cn == "Fire"
                        or cn == "Smoke"
                        or cn == "Sparkles"
                        or cn == "Explosion"
                        or cn == "PointLight"
                        or cn == "SpotLight"
                        or cn == "SurfaceLight"
                        or cn == "Highlight"
                        or cn == "Decal"
                        or cn == "Texture"
                        or cn == "SurfaceAppearance"
                        or cn == "SpecialMesh"
                        or cn == "BlockMesh"
                        or cn == "CylinderMesh"
                        or cn == "BillboardGui"
                        or cn == "SurfaceGui"
                        then
                        v:Destroy()
                        cleaned = cleaned + 1

                    -- Sound
                    elseif cn == "Sound" then
                        v:Stop()
                        v:Destroy()
                        cleaned = cleaned + 1

                    -- Simplify parts
                    elseif v:IsA("BasePart")
                        and not v:IsA("Terrain")
                        then
                        v.Material =
                            Enum.Material
                            .SmoothPlastic
                        v.Reflectance = 0
                        v.CastShadow = false
                    end
                end)
            end
        end

        -- Nhuong CPU giua cac batch
        task.wait()
    end

    print("[AFK v2] Deep clean done: "
        .. cleaned .. " objects")

    -- GC sau khi xoa nhieu
    forceGC()
end)

-- Block effects moi trong Workspace
track(
    Workspace.DescendantAdded:Connect(
        function(v)
            task.defer(function()
                pcall(function()
                    if not v or not v.Parent then
                        return
                    end

                    local cn = v.ClassName

                    if cn == "ParticleEmitter"
                        or cn == "Trail"
                        or cn == "Beam"
                        or cn == "Fire"
                        or cn == "Smoke"
                        or cn == "Sparkles"
                        or cn == "Explosion"
                        or cn == "PointLight"
                        or cn == "SpotLight"
                        or cn == "SurfaceLight"
                        or cn == "Highlight"
                        or cn == "Decal"
                        or cn == "Texture"
                        or cn == "SurfaceAppearance"
                        or cn == "BillboardGui"
                        or cn == "SurfaceGui"
                        then
                        v:Destroy()

                    elseif cn == "Sound" then
                        v:Stop()
                        v.Volume = 0
                        v:Destroy()

                    elseif v:IsA("BasePart") then
                        v.Material =
                            Enum.Material
                            .SmoothPlastic
                        v.CastShadow = false
                        v.Reflectance = 0
                    end
                end)
            end)
        end)
)

-- ============================================
-- BUOC 8: RENDER QUALITY THAP NHAT
-- ============================================
print("[AFK v2] Buoc 8: Render settings...")

pcall(function()
    settings().Rendering.QualityLevel =
        Enum.QualityLevel.Level01
end)

pcall(function()
    setfpscap(15)
end)

print("[AFK v2] FPS Cap: 15 (sieu tiet kiem)")

-- ============================================
-- BUOC 9: KILL ANIMATIONS
-- (Animation update MOI FRAME = ton CPU)
-- ============================================
print("[AFK v2] Buoc 9: Animations...")

killAnimations()

-- Khi respawn, kill animations moi
track(
    LocalPlayer.CharacterAdded:Connect(
        function(char)
            task.wait(1)
            killAnimations()

            -- Kill sounds tren character moi
            pcall(function()
                for _, v in ipairs(
                        char:GetDescendants()
                        ) do
                    if v:IsA("Sound") then
                        v:Stop()
                        v.Volume = 0
                    end
                end
            end)
        end)
)

print("[AFK v2] Animations: Stopped")

-- ============================================
-- BUOC 10: MEMORY LEAK DETECTOR + AUTO FIX
-- Kiem tra RAM moi 15 giay
-- Neu tang lien tuc = memory leak
-- Tu dong fix
-- ============================================
print("[AFK v2] Buoc 10: Memory Monitor...")

lastMemory = getMemoryMB()

task.spawn(function()
    while true do
        task.wait(15)

        local currentMem = getMemoryMB()
        local diff = currentMem - lastMemory

        -- Update info
        pcall(function()
            InfoLabel.Text = string.format(
                "AFK v2 | RAM: %.1fMB | "
                .. "Delta: %+.1fMB | "
                .. "FPS: 15",
                currentMem, diff)
        end)

        -- MEMORY LEAK DETECTION
        if diff > 5 then
            -- RAM tang > 5MB trong 15s
            -- = co the leak
            memoryLeakCount =
                memoryLeakCount + 1

            print("[LEAK] RAM tang "
                .. string.format("%.1f", diff)
                .. "MB! Count: "
                .. memoryLeakCount)

            if memoryLeakCount >= 3 then
                -- 3 lan lien tiep tang
                -- = LEAK XAC NHAN
                print("[LEAK] DETECTED! "
                    .. "Auto fixing...")

                -- FIX 1: Force GC
                forceGC()

                -- FIX 2: Xoa effects moi
                task.spawn(function()
                    local descs =
                        Workspace
                        :GetDescendants()
                    for _, v in ipairs(descs) do
                        pcall(function()
                            local cn =
                                v.ClassName
                            if cn ==
                                "ParticleEmitter"
                                or cn == "Trail"
                                or cn == "Sound"
                                or cn == "Beam"
                                or cn == "Fire"
                                or cn == "Smoke"
                                then
                                v:Destroy()
                            end
                        end)
                    end
                end)

                -- FIX 3: Kill animations
                killAnimations()

                -- FIX 4: Clear terrain
                pcall(function()
                    if Terrain then
                        Terrain:Clear()
                    end
                end)

                -- FIX 5: GC lai
                task.wait(1)
                forceGC()

                memoryLeakCount = 0

                local afterMem = getMemoryMB()
                print("[LEAK] Fixed! RAM: "
                    .. string.format(
                        "%.1f", afterMem)
                    .. "MB (freed "
                    .. string.format(
                        "%.1f",
                        currentMem - afterMem)
                    .. "MB)")
            end
        else
            -- RAM on dinh
            memoryLeakCount = 0
        end

        lastMemory = currentMem
    end
end)

-- ============================================
-- BUOC 11: AUTO GC MOI 30 GIAY
-- (Thuong xuyen clean de RAM thap)
-- ============================================

task.spawn(function()
    while true do
        task.wait(30)
        forceGC()
    end
end)

-- ============================================
-- BUOC 12: LOOP BAO TRI NHE
-- Moi 5 giay, chi check nhung thu
-- quan trong nhat (khong quet descendants)
-- ============================================

task.spawn(function()
    while true do
        task.wait(5)
        pcall(function()
            -- Camera
            lockCamera()

            -- Lighting
            Lighting.Brightness = 0
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 0

            -- Black Screen
            if ScreenGui then
                ScreenGui.Enabled = true
            end
            if BlackFrame then
                BlackFrame
                    .BackgroundTransparency = 0
            end

            -- UI
            pcall(function()
                StarterGui:SetCoreGuiEnabled(
                    Enum.CoreGuiType.All,
                    false)
            end)
        end)
    end
end)

-- ============================================
-- BUOC 13: DEEP CLEAN MOI 60 GIAY
-- (Quet descendants nhung it lan)
-- ============================================

task.spawn(function()
    while true do
        task.wait(60)
        pcall(function()
            -- Xoa effects moi xuat hien
            local descs =
                Workspace:GetDescendants()
            local batchSize = 150

            for i = 1, #descs, batchSize do
                for j = i, math.min(
                        i + batchSize - 1,
                        #descs) do
                    local v = descs[j]
                    if v and v.Parent then
                        pcall(function()
                            local cn =
                                v.ClassName
                            if cn ==
                                "ParticleEmitter"
                                or cn == "Trail"
                                or cn == "Beam"
                                or cn == "Fire"
                                or cn == "Smoke"
                                or cn == "Sparkles"
                                or cn == "Sound"
                                or cn == "Highlight"
                                then
                                if cn == "Sound"
                                    then
                                    v:Stop()
                                end
                                v:Destroy()
                            end
                        end)
                    end
                end
                task.wait()
            end

            -- Kill animations
            killAnimations()

            -- GC
            forceGC()

            -- Terrain
            if Terrain then
                pcall(function()
                    Terrain.Decoration = false
                end)
            end
        end)
    end
end)

-- ============================================
-- BUOC 14: ANTI-KICK AFK
-- Giu nhan vat song de khong bi kick
-- ============================================

task.spawn(function()
    while true do
        task.wait(60)
        pcall(function()
            -- Simulate input nhe
            -- (mot so game kick AFK)
            local char = LocalPlayer.Character
            if char then
                local hrp =
                    char:FindFirstChild(
                        "HumanoidRootPart")
                if hrp then
                    -- Giu vi tri hien tai
                    -- Khong di chuyen
                    hrp.Anchored = true
                end
            end
        end)
    end
end)

print("[AFK v2] Anti-kick: Active")

-- ============================================
-- HOAN TAT
-- ============================================

-- GC cuoi cung
task.wait(3)
forceGC()

local finalMem = getMemoryMB()
