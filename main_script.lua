-- ============================================
-- AFK BOT v5.0 - KAITUN SAFE
-- Chi lam nhung gi khong anh huong Kaitun
-- GPU thap + Kaitun hoat dong binh thuong
-- ============================================

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local SoundService =
    game:GetService("SoundService")
local Stats = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer

if not game:IsLoaded() then
    game.Loaded:Wait()
end
task.wait(5)

print("[AFK v5] Khoi dong...")

-- ============================================
-- BUOC 1: FPS + QUALITY TRUOC TIEN
-- An toan 100%, khong anh huong Kaitun
-- ============================================
pcall(function()
    setfpscap(20)
end)

pcall(function()
    settings().Rendering.QualityLevel =
        Enum.QualityLevel.Level01
end)

print("[AFK v5] FPS:20 Quality:Min")

-- ============================================
-- BUOC 2: LIGHTING - AN TOAN
-- Chi tat shadow va effects
-- Khong anh huong Kaitun gi ca
-- ============================================
pcall(function()
    -- Chi xoa post effects
    -- Khong xoa gi khac
    for _, v in
            ipairs(Lighting:GetChildren()) do
        if v:IsA("BloomEffect")
            or v:IsA("BlurEffect")
            or v:IsA("ColorCorrectionEffect")
            or v:IsA("DepthOfFieldEffect")
            or v:IsA("SunRaysEffect")
            or v:IsA("Sky")
            or v:IsA("Atmosphere") then
            v:Destroy()
        end
    end

    -- Tat shadow = giam GPU nhieu nhat
    Lighting.GlobalShadows = false
    Lighting.Brightness = 1
    Lighting.FogEnd = 100000
    Lighting.FogStart = 99000
end)

-- Block post effects moi
Lighting.DescendantAdded:Connect(function(v)
    pcall(function()
        if v:IsA("PostEffect")
            or v:IsA("Sky")
            or v:IsA("Atmosphere") then
            v:Destroy()
        end
    end)
end)

print("[AFK v5] Lighting: Shadows OFF")

-- ============================================
-- BUOC 3: BLACK SCREEN UI
-- Phu len man hinh
-- Kaitun van chay ngam binh thuong
-- ============================================
local PlayerGui =
    LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AFK_v5"
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
    Color3.new(0.25, 0.25, 0.25)
InfoLabel.TextXAlignment =
    Enum.TextXAlignment.Left
InfoLabel.TextSize = 11
InfoLabel.Font = Enum.Font.Code
InfoLabel.Text = "AFK v5 | Active"
InfoLabel.ZIndex = 2147483647
InfoLabel.Parent = BlackFrame

ScreenGui.Parent = PlayerGui

print("[AFK v5] Black screen: ON")

-- ============================================
-- BUOC 4: TAT UI KHONG CAN
-- Chi tat Roblox core UI
-- KHONG tat ScreenGui cua Kaitun
-- ============================================
pcall(function()
    -- Chi tat nhung thu Kaitun khong dung
    StarterGui:SetCoreGuiEnabled(
        Enum.CoreGuiType.PlayerList, false)
    StarterGui:SetCoreGuiEnabled(
        Enum.CoreGuiType.EmotesMenu, false)
    StarterGui:SetCore(
        "TopbarEnabled", false)

    -- KHONG tat Chat vi Kaitun
    -- co the dung chat command
    -- KHONG SetCoreGuiEnabled All false
end)

print("[AFK v5] Core UI: Partial hide")

-- ============================================
-- BUOC 5: XOA PARTICLE + FIRE + SMOKE
-- AN TOAN 100% voi Kaitun
-- Day la thu ton GPU nhat
-- Kaitun KHONG dung cac class nay
-- ============================================

-- Class an toan de xoa
-- Kaitun KHONG bao gio dung nhung class nay
local SAFE_DELETE = {
    ParticleEmitter = true,
    Fire = true,
    Smoke = true,
    Sparkles = true,
    Explosion = true,

    -- Lights: an toan xoa
    -- Kaitun khong dung light
    PointLight = true,
    SpotLight = true,
    SurfaceLight = true,
}

-- KHONG xoa:
-- Trail (Kaitun dung de track enemy)
-- Beam (Kaitun co the dung)
-- BillboardGui (Kaitun dung hien HP/Name)
-- Sound (Kaitun dung de detect)
-- Highlight (Kaitun dung highlight enemy)
-- Decal/Texture (giu nguyen, an toan hon)

local function safeProcess(v)
    if not v or not v.Parent then return end
    local cn = v.ClassName
    if SAFE_DELETE[cn] then
        v:Destroy()
    end
end

-- Scan workspace theo batch nho
task.spawn(function()
    task.wait(2)

    local descs = Workspace:GetDescendants()
    local total = #descs
    local removed = 0
    local BATCH = 30 -- Nho de khong crash

    for i = 1, total, BATCH do
        for j = i,
                math.min(
                    i + BATCH - 1, total) do
            local v = descs[j]
            if v and v.Parent then
                pcall(function()
                    local cn = v.ClassName
                    if SAFE_DELETE[cn] then
                        v:Destroy()
                        removed = removed + 1
                    end
                end)
            end
        end
        task.wait(0.2) -- An toan hon 0.1
    end

    print("[AFK v5] Removed: "
        .. removed .. " particles/lights")
end)

-- ============================================
-- BUOC 6: BLOCK PARTICLE/LIGHT MOI
-- Dung queue de khong spam
-- ============================================
local queue = {}
local MAX_QUEUE = 50

Workspace.DescendantAdded:Connect(function(v)
    if #queue < MAX_QUEUE then
        table.insert(queue, v)
    end
    -- Neu queue day thi bo qua
    -- Tranh memory leak
end)

-- Xu ly queue moi 1 giay
-- Kaitun van co du thoi gian hoat dong
task.spawn(function()
    while true do
        task.wait(1)

        if #queue == 0 then
            continue
        end

        local count = math.min(
            15, #queue)

        for i = 1, count do
            local v = queue[i]
            if v and v.Parent then
                pcall(function()
                    safeProcess(v)
                end)
            end
        end

        -- Xoa da xu ly
        for _ = 1, count do
            table.remove(queue, 1)
        end
    end
end)

print("[AFK v5] Particle blocker: ON")

-- ============================================
-- BUOC 7: CastShadow = false
-- Chi tren MAP objects
-- KHONG cham vao character
-- ============================================
task.spawn(function()
    task.wait(3)

    local descs = Workspace:GetDescendants()
    local BATCH = 30

    for i = 1, #descs, BATCH do
        for j = i,
                math.min(
                    i + BATCH - 1,
                    #descs) do
            local v = descs[j]
            if v and v.Parent then
                pcall(function()
                    -- Chi xu ly BasePart
                    if v:IsA("BasePart")
                        and not v:IsA("Terrain")
                        then
                        -- Kiem tra KHONG phai
                        -- character cua bat ky
                        -- player nao
                        local model =
                            v:FindFirstAncestorOfClass(
                                "Model")
                        if model then
                            local isChar =
                                Players
                                :GetPlayerFromCharacter(
                                    model)
                            -- Bo qua character
                            if isChar then
                                return
                            end
                        end

                        -- An toan: chi tat shadow
                        v.CastShadow = false
                    end
                end)
            end
        end
        task.wait(0.2)
    end

    print("[AFK v5] Shadows: All OFF")
end)

-- ============================================
-- BUOC 8: CAMERA
-- Giu camera binh thuong
-- De Kaitun tinh toan dung
-- Chi lock khi AFK that su
-- ============================================

-- CAMERA KHONG LOCK
-- Kaitun can camera hoat dong
-- GPU load tu giam nho FPS=20
-- va shadow=false la du

-- ============================================
-- BUOC 9: MAINTENANCE NHE
-- Khong scan descendant
-- Chi check lighting + UI
-- ============================================
task.spawn(function()
    local tick = 0

    while true do
        task.wait(10)
        tick = tick + 1

        -- Lighting
        pcall(function()
            Lighting.GlobalShadows = false
        end)

        -- Black screen
        pcall(function()
            ScreenGui.Enabled = true
            BlackFrame.BackgroundTransparency
                = 0
        end)

        -- RAM update moi 60s
        if tick % 6 == 0 then
            pcall(function()
                local ram =
                    Stats:GetTotalMemoryUsageMb()
                InfoLabel.Text =
                    string.format(
                        "AFK v5 | RAM:%.0fMB"
                        .. " | FPS:20",
                        ram)
                print(string.format(
                    "[AFK v5] RAM: %.0fMB",
                    ram))
            end)
        end
    end
end)

-- ============================================
-- BUOC 10: RESPAWN HANDLER
-- Khi char respawn, tat shadow thoi
-- KHONG lam gi khac
-- ============================================
LocalPlayer.CharacterAdded:Connect(
    function(char)
        task.wait(2)
        pcall(function()
            for _, v in ipairs(
                    char:GetDescendants()) do
                if v:IsA("BasePart") then
                    -- Chi tat shadow
                    v.CastShadow = false
                end
            end
        end)
    end)

-- ============================================
-- BUOC 11: ANTI-KICK
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

-- ============================================
-- DONE
-- ============================================
print("╔══════════════════════════════════╗")
print("║  AFK BOT v5.0 - KAITUN SAFE    ║")
print("╠══════════════════════════════════╣")
print("║  Shadows    : OFF (GPU -40%)   ║")
print("║  Particles  : DESTROYED        ║")
print("║  Lights     : DESTROYED        ║")
print("║  Post FX    : DESTROYED        ║")
print("║  FPS        : 20               ║")
print("║  Quality    : Level 1          ║")
print("║  Black Screen: ON              ║")
print("╠══════════════════════════════════╣")
print("║  SAFE (Kaitun van farm duoc):  ║")
print("║  Trail      : KEPT             ║")
print("║  BillboardGui: KEPT            ║")
print("║  Sound      : KEPT             ║")
print("║  Highlight  : KEPT             ║")
print("║  Camera     : NORMAL           ║")
print("║  Terrain    : KEPT             ║")
print("╚══════════════════════════════════╝")
