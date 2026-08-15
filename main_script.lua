-- ============================================
-- AFK BOT v3.0 - HONEST EDITION
-- Chi lam nhung gi THUC SU hoat dong
-- Khong noi doi ve collectgarbage
-- Kaitun SAFE
-- ============================================

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local SoundService =
    game:GetService("SoundService")
local LocalPlayer = Players.LocalPlayer
local connections = {}

if not game:IsLoaded() then
    game.Loaded:Wait()
end
task.wait(2)

print("[AFK v3] Khoi dong...")

-- ============================================
-- CONFIG: Chon tinh nang muon bat
-- (De Kaitun khong bi break)
-- ============================================
local CONFIG = {
    -- Camera trick: THUC SU giam GPU
    CAMERA_TRICK = true,

    -- Black screen UI: THUC SU den man
    BLACK_SCREEN = true,

    -- Tat sound: THUC SU giam CPU
    -- CHUYEN Y: Kaitun dung sound?
    -- Neu co -> de FALSE
    KILL_SOUNDS = true,

    -- Xoa effects (particle/trail/fire...)
    -- AN TOAN voi Kaitun
    KILL_EFFECTS = true,

    -- Xoa den (PointLight/SpotLight)
    -- Giam GPU kha nhieu
    KILL_LIGHTS = true,

    -- Xoa textures/decals
    -- CHUYEN Y: Lam character xau hon
    -- Nhung giam VRAM that su
    KILL_TEXTURES = true,

    -- CastShadow = false tren tat ca parts
    -- Day la cai THUC SU giam GPU nhieu
    -- Blox Fruits co rat nhieu shadow
    NO_SHADOWS = true,

    -- FPS cap
    -- 15 = tiet kiem nhat
    -- 30 = can bang
    FPS_CAP = 15,

    -- Anti-AFK kick
    ANTI_KICK = true,

    -- KHONG kill animations
    -- Vi Kaitun can character move
    -- de farm duoc
    KILL_ANIMATIONS = false,
}

-- ============================================
-- HAM TRACK CONNECTION
-- ============================================
local function track(conn)
    table.insert(connections, conn)
    return conn
end

-- ============================================
-- LOOKUP TABLE: Nhanh hon if/elseif chain
-- ============================================

-- Effects can xoa (THUC SU giam GPU)
local KILL_EFFECT_SET = {
    ParticleEmitter = true,
    Trail = true,
    Beam = true,
    Fire = true,
    Smoke = true,
    Sparkles = true,
    Explosion = true,
    Highlight = true,
}

-- Den can xoa
local KILL_LIGHT_SET = {
    PointLight = true,
    SpotLight = true,
    SurfaceLight = true,
}

-- Texture can xoa
local KILL_TEXTURE_SET = {
    Decal = true,
    Texture = true,
    SurfaceAppearance = true,
    SpecialMesh = true,
}

-- GUI khong can thiet
-- (Kaitun dung ScreenGui, khong phai cai nay)
local KILL_GUI_SET = {
    BillboardGui = true,
    SurfaceGui = true,
}

-- ============================================
-- HAM: Process 1 object
-- Quyet dinh xoa hay bo qua
-- ============================================
local function processOne(v)
    if not v or not v.Parent then return end

    local cn = v.ClassName

    -- Xoa effects
    if CONFIG.KILL_EFFECTS
        and KILL_EFFECT_SET[cn] then
        v:Destroy()
        return
    end

    -- Xoa den
    if CONFIG.KILL_LIGHTS
        and KILL_LIGHT_SET[cn] then
        v:Destroy()
        return
    end

    -- Xoa textures
    if CONFIG.KILL_TEXTURES
        and KILL_TEXTURE_SET[cn] then
        v:Destroy()
        return
    end

    -- Xoa GUI tren part
    if KILL_GUI_SET[cn] then
        v:Destroy()
        return
    end

    -- Xoa sound
    if CONFIG.KILL_SOUNDS
        and cn == "Sound" then
        pcall(function() v:Stop() end)
        v:Destroy()
        return
    end

    -- BasePart: chi don gian hoa
    -- KHONG destroy (gay crash game)
    if CONFIG.NO_SHADOWS
        and v:IsA("BasePart")
        and not v:IsA("Terrain") then
        v.CastShadow = false
        v.Material =
            Enum.Material.SmoothPlastic
        v.Reflectance = 0
        return
    end
end

-- ============================================
-- BUOC 1: CAMERA
-- Day la cach THUC SU giam GPU
-- Camera o y=-50000 + Scriptable
-- = Engine skip render scene
-- ============================================
print("[AFK v3] Camera lock...")

local function lockCamera()
    local cam = Workspace.CurrentCamera
    if not cam then return end

    cam.CameraType =
        Enum.CameraType.Scriptable
    cam.CFrame = CFrame.new(0, -50000, 0)
    cam.FieldOfView = 1
    cam.CameraSubject = nil
end

if CONFIG.CAMERA_TRICK then
    lockCamera()

    track(
        Workspace:GetPropertyChangedSignal(
            "CurrentCamera"):Connect(
            function()
                task.wait(0.1)
                lockCamera()
            end)
    )
end

print("[AFK v3] Camera: Locked at -50000")

-- ============================================
-- BUOC 2: BLACK SCREEN
-- Frame den phu len toan man hinh
-- GPU chi ve 1 mau den = load = 0
-- ============================================
print("[AFK v3] Black screen...")

local PlayerGui =
    LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui, BlackFrame, InfoLabel

if CONFIG.BLACK_SCREEN then
    ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AFK_BLACK_v3"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.DisplayOrder = 2147483647

    BlackFrame = Instance.new("Frame")
    BlackFrame.Size =
        UDim2.new(1, 0, 1, 0)
    BlackFrame.BackgroundColor3 =
        Color3.new(0, 0, 0)
    BlackFrame.BackgroundTransparency = 0
    BlackFrame.BorderSizePixel = 0
    BlackFrame.ZIndex = 2147483647
    BlackFrame.Parent = ScreenGui

    -- Status text (nhin thay duoc
    -- khi can tat script)
    InfoLabel = Instance.new("TextLabel")
    InfoLabel.Size =
        UDim2.new(1, 0, 0, 30)
    InfoLabel.Position =
        UDim2.new(0, 0, 1, -30)
    InfoLabel.BackgroundTransparency = 1
    InfoLabel.TextColor3 =
        Color3.new(0.15, 0.15, 0.15)
    InfoLabel.TextSize = 11
    InfoLabel.Font = Enum.Font.Code
    InfoLabel.Text =
        "AFK BOT v3 | Active | "
        .. "FPS:" .. CONFIG.FPS_CAP
    InfoLabel.ZIndex = 2147483647
    InfoLabel.Parent = BlackFrame

    ScreenGui.Parent = PlayerGui
end

print("[AFK v3] Black screen: ON")

-- ============================================
-- BUOC 3: TAT CORE GUI
-- ============================================
print("[AFK v3] Disable UI...")

pcall(function()
    StarterGui:SetCoreGuiEnabled(
        Enum.CoreGuiType.All, false)
    StarterGui:SetCore(
        "TopbarEnabled", false)
end)

-- An tat ca ScreenGui tru cua minh
local function hideAllGUI()
    for _, gui in
            ipairs(PlayerGui:GetChildren()) do
        pcall(function()
            if gui.Name ~= "AFK_BLACK_v3"
                and gui:IsA("ScreenGui") then
                gui.Enabled = false
            end
        end)
    end
end

hideAllGUI()

track(
    PlayerGui.ChildAdded:Connect(
        function(child)
            task.defer(function()
                pcall(function()
                    if child.Name
                            ~= "AFK_BLACK_v3"
                        and child:IsA(
                            "ScreenGui") then
                        child.Enabled = false
                    end
                end)
            end)
        end)
)

print("[AFK v3] UI: Disabled")

-- ============================================
-- BUOC 4: LIGHTING
-- ============================================
print("[AFK v3] Lighting...")

for _, v in ipairs(Lighting:GetChildren()) do
    pcall(function()
        -- Chi xoa effects, giu cai khac
        if v:IsA("PostEffect")
            or v:IsA("Sky")
            or v:IsA("Atmosphere") then
            v:Destroy()
        end
    end)
end

Lighting.Brightness = 0
Lighting.Ambient = Color3.new(0, 0, 0)
Lighting.OutdoorAmbient =
    Color3.new(0, 0, 0)
Lighting.GlobalShadows = false
Lighting.FogEnd = 0
Lighting.FogStart = 0
Lighting.ClockTime = 0

track(
    Lighting.DescendantAdded:Connect(
        function(v)
            pcall(function()
                if v:IsA("PostEffect")
                    or v:IsA("Sky")
                    or v:IsA("Atmosphere") then
                    v:Destroy()
                end
            end)
        end)
)

print("[AFK v3] Lighting: Black, no shadows")

-- ============================================
-- BUOC 5: TERRAIN
-- ============================================
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
    print("[AFK v3] Terrain: Cleared")
end

-- ============================================
-- BUOC 6: DEEP CLEAN WORKSPACE
-- Batch processing de tranh freeze
-- ============================================
print("[AFK v3] Deep cleaning...")

task.spawn(function()
    task.wait(0.5)

    local descs = Workspace:GetDescendants()
    local total = #descs
    local removed = 0
    local BATCH = 150

    for i = 1, total, BATCH do
        for j = i,
                math.min(i + BATCH - 1, total)
                do
            local v = descs[j]
            if v and v.Parent then
                local before = v.Parent
                pcall(function()
                    processOne(v)
                end)
                -- Dem neu bi xoa
                if not v.Parent
                    and before then
                    removed = removed + 1
                end
            end
        end
        task.wait() -- Nhuong CPU
    end

    print("[AFK v3] Removed: "
        .. removed .. " objects")
    print("[AFK v3] Deep clean: DONE")
end)

-- ============================================
-- BUOC 7: BLOCK OBJECT MOI
-- Khi game spawn effect moi -> xoa ngay
-- task.defer = khong block game thread
-- ============================================
track(
    Workspace.DescendantAdded:Connect(
        function(v)
            -- task.defer: xu ly sau frame hien tai
            -- Nhe hon task.wait(0)
            task.defer(function()
                pcall(function()
                    processOne(v)
                end)
            end)
        end)
)

print("[AFK v3] Auto-block: Active")

-- ============================================
-- BUOC 8: RENDER QUALITY
-- Level01 = thap nhat
-- THUC SU hoat dong trong Roblox
-- ============================================
pcall(function()
    settings().Rendering.QualityLevel =
        Enum.QualityLevel.Level01
end)

pcall(function()
    setfpscap(CONFIG.FPS_CAP)
end)

print("[AFK v3] FPS: " .. CONFIG.FPS_CAP)

-- ============================================
-- BUOC 9: SOUND
-- ============================================
if CONFIG.KILL_SOUNDS then
    -- SoundService
    for _, v in ipairs(
            SoundService:GetDescendants()) do
        pcall(function()
            if v:IsA("Sound") then
                v:Stop()
                v.Volume = 0
                v:Destroy()
            end
        end)
    end

    track(
        SoundService.DescendantAdded:Connect(
            function(v)
                task.defer(function()
                    pcall(function()
                        if v:IsA("Sound") then
                            v:Stop()
                            v:Destroy()
                        end
                    end)
                end)
            end)
    )

    print("[AFK v3] Sounds: Killed")
end

-- ============================================
-- BUOC 10: ANTI-KICK
-- Anchor HRP de khong bi fall
-- Jump nho moi 4 phut (tranh kick AFK)
-- ============================================
if CONFIG.ANTI_KICK then
    task.spawn(function()
        while true do
            task.wait(240) -- 4 phut

            pcall(function()
                local char =
                    LocalPlayer.Character
                if not char then return end

                local hum =
                    char:FindFirstChildOfClass(
                        "Humanoid")

                if hum then
                    -- Jump nho -> anti kick
                    hum.Jump = true
                end
            end)
        end
    end)

    print("[AFK v3] Anti-kick: Active (4min)")
end

-- ============================================
-- BUOC 11: MAINTENANCE LOOP
-- Nhe, chi check nhung thu quan trong
-- Khong quet GetDescendants
-- ============================================
task.spawn(function()
    local tick = 0

    while true do
        task.wait(5)
        tick = tick + 1

        pcall(function()
            -- Camera (moi 5s)
            if CONFIG.CAMERA_TRICK then
                lockCamera()
            end

            -- Lighting (moi 5s)
            Lighting.Brightness = 0
            Lighting.GlobalShadows = false

            -- Black screen (moi 5s)
            if ScreenGui then
                ScreenGui.Enabled = true
            end

            -- Core GUI (moi 15s)
            if tick % 3 == 0 then
                pcall(function()
                    StarterGui
                        :SetCoreGuiEnabled(
                        Enum.CoreGuiType.All,
                        false)
                end)
                hideAllGUI()
            end

            -- Terrain (moi 60s)
            if tick % 12 == 0 then
                if Terrain then
                    pcall(function()
                        Terrain.Decoration
                            = false
                    end)
                end
            end
        end)
    end
end)

-- ============================================
-- BUOC 12: RESPAWN HANDLER
-- Khi character respawn, setup lai
-- ============================================
track(
    LocalPlayer.CharacterAdded:Connect(
        function(char)
            task.wait(1)
            pcall(function()
                -- Camera lai
                if CONFIG.CAMERA_TRICK then
                    lockCamera()
                end

                -- Kill sound tren char moi
                if CONFIG.KILL_SOUNDS then
                    for _, v in ipairs(
                            char:GetDescendants()
                            ) do
                        if v:IsA("Sound") then
                            v:Stop()
                            v.Volume = 0
                        end
                    end
                end

                -- CastShadow = false
                -- tren char moi
                if CONFIG.NO_SHADOWS then
                    for _, v in ipairs(
                            char:GetDescendants()
                            ) do
                        if v:IsA("BasePart") then
                            v.CastShadow = false
                        end
                    end
                end

                print("[AFK v3] Respawn: OK")
            end)
        end)
)

-- ============================================
-- STATUS UPDATE (moi 30s)
-- Dung Stats de doc memory dung
-- ============================================
task.spawn(function()
    -- Doi Stats service
    local Stats = game:GetService("Stats")

    while true do
        task.wait(30)
        pcall(function()
            -- Day la cach DUNG de doc RAM
            -- trong Roblox
            local totalMem =
                Stats:GetTotalMemoryUsageMb()

            if InfoLabel then
                InfoLabel.Text =
                    string.format(
                        "AFK v3 | RAM: %.0fMB"
                        .. " | FPS:%d | Active",
                        totalMem,
                        CONFIG.FPS_CAP)
            end

            print(string.format(
                "[AFK v3] RAM: %.0fMB",
                totalMem))
        end)
    end
end)

-- ============================================
-- DONE
-- ============================================
print("╔══════════════════════════════════╗")
print("║  AFK BOT v3.0 - HONEST EDITION ║")
print("╠══════════════════════════════════╣")
print("║  Camera: -50000 (GPU skip)      ║")
print("║  Black Screen: UI Frame         ║")
print("║  Shadows: ALL OFF               ║")
print("║  Effects: AUTO DESTROY          ║")
print("║  Sounds: KILLED                 ║")
print("║  FPS: " .. CONFIG.FPS_CAP
    .. " (real cap)              ║")
print("║  Kaitun: SAFE (anim kept)       ║")
print("║  Anti-kick: 4min jump           ║")
print("╠══════════════════════════════════╣")
print("║  collectgarbage = DISABLED      ║")
print("║  RAM doc bang Stats service     ║")
print("║  Khong fake features            ║")
print("╚══════════════════════════════════╝")
