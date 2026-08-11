-- =====================================================================
-- KAITUN BLOX FRUITS v4 - FIX LỖI NIL + AUTO TEAM
-- =====================================================================

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TeleportService = game:GetService("TeleportService")

-- ==================== CẤU HÌNH ====================
getgenv().KaitunSettings = getgenv().KaitunSettings or {
    Team = "Pirates",
    AutoLevel = true,
    AutoStats = true,
    StatsType = "Melee",
    AutoBusoHaki = true,
    AutoKenHaki = true,
    AttackHeight = 20,
}

-- ==================== ANTI-AFK ====================
LocalPlayer.Idled:Connect(function()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

-- ==================== BIẾN ====================
local Running = true
local CommF = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")

-- ==================== HÀM AN TOÀN LẤY GUI ====================
local function SafeGetChooseTeam()
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    if not pg then return nil end
    
    -- Duyệt tất cả ScreenGui để tìm ChooseTeam
    for _, gui in pairs(pg:GetChildren()) do
        -- Kiểm tra trực tiếp trong ScreenGui
        local ct = gui:FindFirstChild("ChooseTeam")
        if ct then return ct end
        
        -- Kiểm tra "Main" ScreenGui
        if gui.Name == "Main" then
            local ct2 = gui:FindFirstChild("ChooseTeam")
            if ct2 then return ct2 end
        end
    end
    
    -- Tìm sâu hơn
    for _, desc in pairs(pg:GetDescendants()) do
        if desc.Name == "ChooseTeam" then
            return desc
        end
    end
    
    return nil
end

-- ==================== TIỆN ÍCH ====================
local function GetChar() return LocalPlayer.Character end
local function GetRoot() 
    local c = GetChar()
    if not c then return nil end
    return c:FindFirstChild("HumanoidRootPart")
end
local function GetHum() 
    local c = GetChar()
    if not c then return nil end
    return c:FindFirstChild("Humanoid")
end
local function GetLevel() 
    local ok, v = pcall(function() return LocalPlayer.Data.Level.Value end)
    return ok and v or 1
end

-- Kiểm tra đã chọn team chưa (AN TOÀN)
local function IsTeamChosen()
    local ct = SafeGetChooseTeam()
    if not ct then return true end -- Không có GUI = đã chọn rồi
    
    local ok, visible = pcall(function() return ct.Visible end)
    if not ok then return true end
    
    return not visible
end

-- =====================================================================
-- ==================== 🎯 AUTO CHỌN TEAM (FIX NIL) ==================== 
-- =====================================================================

local function FireClickTeam(team)
    local success = false
    local chooseTeam = SafeGetChooseTeam()
    
    if not chooseTeam then
        return true -- Không có GUI = xong
    end
    
    -- ============ P1: PATH CHUẨN ============
    pcall(function()
        local container = chooseTeam:FindFirstChild("Container")
        if not container then return end
        
        local buttons = container:FindFirstChild("Buttons")
        if not buttons then return end
        
        local teamFrame = buttons:FindFirstChild(team)
        if not teamFrame then return end
        
        local frame = teamFrame:FindFirstChild("Frame")
        if not frame then return end
        
        local imageButton = frame:FindFirstChild("ImageButton")
        if not imageButton then return end
        
        pcall(function() firesignal(imageButton.MouseButton1Click) end)
        pcall(function() firesignal(imageButton.MouseButton1Down) end)
        pcall(function() firesignal(imageButton.MouseButton1Up) end)
        pcall(function() firesignal(imageButton.Activated) end)
        
        print("[Kaitun] ✅ [P1] Fire signal path chuẩn: " .. team)
        success = true
    end)
    
    task.wait(0.3)
    if IsTeamChosen() then return true end
    
    -- ============ P2: DUYỆT TẤT CẢ BUTTON ============
    pcall(function()
        for _, desc in pairs(chooseTeam:GetDescendants()) do
            if desc:IsA("ImageButton") or desc:IsA("TextButton") then
                local ancestor = desc
                local isTeam = false
                for i = 1, 6 do
                    if not ancestor then break end
                    if ancestor.Name == team then
                        isTeam = true
                        break
                    end
                    ancestor = ancestor.Parent
                end
                
                if isTeam then
                    pcall(function() firesignal(desc.MouseButton1Click) end)
                    pcall(function() firesignal(desc.MouseButton1Down) end)
                    pcall(function() firesignal(desc.Activated) end)
                    print("[Kaitun] ✅ [P2] Fire button: " .. desc.Name)
                    success = true
                end
            end
        end
    end)
    
    task.wait(0.3)
    if IsTeamChosen() then return true end
    
    -- ============ P3: SET TEAM DIRECTLY ============
    pcall(function()
        for _, teamObj in pairs(game.Teams:GetChildren()) do
            if teamObj.Name == team then
                LocalPlayer.Team = teamObj
                LocalPlayer.TeamColor = teamObj.TeamColor
                print("[Kaitun] ✅ [P3] Set Team property: " .. team)
                success = true
            end
        end
    end)
    
    task.wait(0.3)
    if IsTeamChosen() then return true end
    
    -- ============ P4: VIRTUAL INPUT CLICK ============
    pcall(function()
        local ct = SafeGetChooseTeam()
        if not ct or not ct.Visible then return end
        
        -- Tìm bất kỳ button nào có tên team
        for _, desc in pairs(ct:GetDescendants()) do
            local ancestor = desc
            local isTeam = false
            for i = 1, 6 do
                if not ancestor then break end
                if ancestor.Name == team then
                    isTeam = true
                    break
                end
                ancestor = ancestor.Parent
            end
            
            if isTeam and (desc:IsA("ImageButton") or desc:IsA("TextButton") or desc:IsA("Frame")) then
                local pos = desc.AbsolutePosition
                local size = desc.AbsoluteSize
                if size.X > 0 and size.Y > 0 then
                    local clickX = pos.X + size.X / 2
                    local clickY = pos.Y + size.Y / 2
                    
                    VirtualInputManager:SendMouseButtonEvent(clickX, clickY, 0, true, game, 0)
                    task.wait(0.1)
                    VirtualInputManager:SendMouseButtonEvent(clickX, clickY, 0, false, game, 0)
                    print("[Kaitun] ✅ [P4] VirtualClick (" .. clickX .. ", " .. clickY .. ")")
                    success = true
                    break
                end
            end
        end
    end)
    
    return success
end

-- Auto chọn team task
task.spawn(function()
    task.wait(3)
    
    -- Wait PlayerGui
    local pg = LocalPlayer:WaitForChild("PlayerGui", 15)
    if not pg then
        warn("[Kaitun] Không tìm thấy PlayerGui!")
        return
    end
    
    -- Chờ GUI ChooseTeam xuất hiện (tối đa 20s)
    local waitStart = tick()
    while tick() - waitStart < 20 do
        local ct = SafeGetChooseTeam()
        if ct then
            local ok, vis = pcall(function() return ct.Visible end)
            if ok and vis then break end
        end
        task.wait(0.5)
    end
    
    if IsTeamChosen() then
        print("[Kaitun] ℹ️ Đã chọn team hoặc không cần chọn")
        return
    end
    
    -- Xác định team
    local team = getgenv().KaitunSettings.Team
    if string.lower(team) == "marines" or string.lower(team) == "marine" then
        team = "Marines"
    else
        team = "Pirates"
    end
    
    print("[Kaitun] 🎯 Đang chọn team: " .. team)
    
    local attempts = 0
    while attempts < 30 and Running do
        if IsTeamChosen() then break end
        attempts = attempts + 1
        print("[Kaitun] Lần thử #" .. attempts)
        FireClickTeam(team)
        task.wait(1.5)
    end
    
    if IsTeamChosen() then
        print("[Kaitun] ✅✅✅ CHỌN TEAM " .. team .. " THÀNH CÔNG!")
    else
        warn("[Kaitun] ❌ Không chọn được team!")
    end
end)

-- =====================================================================
-- ==================== BẢNG QUEST ====================
-- =====================================================================
local Quests = {
    {1,   9,   "BanditQuest1",   1, "Bandit",           CFrame.new(1060.9, 16.4, 1547.7),   CFrame.new(1073, 17, 1442)},
    {10,  14,  "BanditQuest1",   2, "Monkey",           CFrame.new(1060.9, 16.4, 1547.7),   CFrame.new(-1447, 55, 20)},
    {15,  29,  "JungleQuest",    1, "Monkey",           CFrame.new(-1601.6, 36.7, 152.7),   CFrame.new(-1447, 55, 20)},
    {30,  39,  "JungleQuest",    2, "Gorilla",          CFrame.new(-1601.6, 36.7, 152.7),   CFrame.new(-1141, 40, -496)},
    {40,  59,  "BuggyQuest1",    1, "Pirate",           CFrame.new(-1140, 4.7, 3828),       CFrame.new(-1187, 15, 3830)},
    {60,  74,  "BuggyQuest1",    2, "Brute",            CFrame.new(-1140, 4.7, 3828),       CFrame.new(-1179, 15, 4287)},
    {75,  89,  "MarineQuest2",   1, "Marine Lieutenant",CFrame.new(-5040, 28, 4324),        CFrame.new(-4842, 55, 4123)},
    {90,  99,  "MarineQuest2",   2, "Marine Captain",   CFrame.new(-5040, 28, 4324),        CFrame.new(-4842, 55, 4123)},
    {100, 119, "SkyQuest",       1, "Sky Bandit",       CFrame.new(-4842.5, 717.7, -2623.6),CFrame.new(-4842, 733, -2623)},
    {120, 149, "SkyQuest",       2, "Dark Master",      CFrame.new(-4842.5, 717.7, -2623.6),CFrame.new(-5117, 439, -2637)},
    {150, 174, "PrisonerQuest",  1, "Prisoner",         CFrame.new(5309.4, 1.2, 474.6),     CFrame.new(4831, 1, 719)},
    {175, 199, "PrisonerQuest",  2, "Dangerous Prisoner",CFrame.new(5309.4, 1.2, 474.6),    CFrame.new(4831, 1, 719)},
    {200, 224, "ColosseumQuest", 1, "Toga Warrior",     CFrame.new(-1577.5, 7.4, -2984.4),  CFrame.new(-1615, 45, -2937)},
    {225, 249, "ColosseumQuest", 2, "Gladiator",        CFrame.new(-1577.5, 7.4, -2984.4),  CFrame.new(-1774, 45, -2942)},
    {250, 274, "MagmaQuest",     1, "Military Soldier", CFrame.new(-5316.5, 12.2, 8517.7),  CFrame.new(-5745, 15, 8747)},
    {275, 299, "MagmaQuest",     2, "Military Spy",     CFrame.new(-5316.5, 12.2, 8517.7),  CFrame.new(-5316, 76, 8517)},
    {300, 324, "FishmanQuest",   1, "Fishman Warrior",  CFrame.new(61122.8, 18.4, 1569.5),  CFrame.new(61332, 39, 1428)},
    {325, 374, "FishmanQuest",   2, "Fishman Commando", CFrame.new(61122.8, 18.4, 1569.5),  CFrame.new(61332, 39, 1428)},
    {375, 399, "SkyExp1Quest",   1, "God's Guard",      CFrame.new(-4721.5, 845.4, -1954.9),CFrame.new(-4610, 872, -1912)},
    {400, 449, "SkyExp1Quest",   2, "Shanda",           CFrame.new(-7861.5, 5546.5, -380.3),CFrame.new(-7907, 5575, -320)},
    {450, 474, "SkyExp2Quest",   1, "Royal Squad",      CFrame.new(-7906.7, 5634.1, -1411.9),CFrame.new(-7677, 5657, -1522)},
    {475, 524, "SkyExp2Quest",   2, "Royal Soldier",    CFrame.new(-7906.7, 5634.1, -1411.9),CFrame.new(-7677, 5657, -1522)},
    {525, 574, "FountainQuest",  1, "Galley Pirate",    CFrame.new(5258.2, 38.5, 4050.1),   CFrame.new(5464, 76, 4111)},
    {575, 624, "FountainQuest",  2, "Galley Captain",   CFrame.new(5258.2, 38.5, 4050.1),   CFrame.new(5464, 76, 4111)},
}

local function GetQuestForLevel(lv)
    for _, q in ipairs(Quests) do
        if lv >= q[1] and lv <= q[2] then return q end
    end
    return Quests[#Quests]
end

local function GetCurrentSea()
    local pid = game.PlaceId
    if pid == 2753915549 then return 1 end
    if pid == 4442272183 then return 2 end
    if pid == 7449423635 then return 3 end
    return 1
end

-- ==================== NO-CLIP ====================
RunService.Stepped:Connect(function()
    pcall(function()
        local char = GetChar()
        if char then
            for _, p in pairs(char:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end
    end)
end)

-- ==================== TÌM MOB ====================
local function FindMob(mobName)
    local root = GetRoot()
    if not root then return nil end
    local nearest, nearDist = nil, math.huge
    local enemies = Workspace:FindFirstChild("Enemies")
    if enemies then
        for _, m in pairs(enemies:GetChildren()) do
            if m.Name == mobName then
                local mr = m:FindFirstChild("HumanoidRootPart")
                local mh = m:FindFirstChildOfClass("Humanoid")
                if mr and mh and mh.Health > 0 then
                    local d = (root.Position - mr.Position).Magnitude
                    if d < nearDist then nearDist = d; nearest = m end
                end
            end
        end
    end
    return nearest
end

-- ==================== TRANG BỊ MELEE ====================
local function EquipMelee()
    local char = GetChar()
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    
    for _, t in pairs(char:GetChildren()) do
        if t:IsA("Tool") then return end
    end
    
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if not backpack then return end
    
    local meleeList = {"Godhuman","Dragon Talon","Electric Claw","Sharkman Karate","Death Step","Superhuman","Dragon Breath","Electric","Water Kung Fu","Dark Step","Black Leg","Combat"}
    for _, name in ipairs(meleeList) do
        local tool = backpack:FindFirstChild(name)
        if tool then hum:EquipTool(tool); return end
    end
    
    for _, t in pairs(backpack:GetChildren()) do
        if t:IsA("Tool") then hum:EquipTool(t); return end
    end
end

-- ==================== FAST ATTACK ====================
local function FastAttackSetup()
    pcall(function()
        local ps = LocalPlayer:FindFirstChild("PlayerScripts")
        if not ps then return end
        local cfMod = ps:FindFirstChild("CombatFramework")
        if not cfMod then return end
        
        local CF = require(cfMod)
        local rc = debug.getupvalue(CF.setEquipped, 2)
        if not rc then return end
        rc.timeToNextAttack = 0
        rc.attacking = false
        rc.blocking = false
        rc.humanoid = GetHum()
    end)
end

local function AttackClick()
    pcall(function()
        local mouse = LocalPlayer:GetMouse()
        mouse.Button1Down:Fire()
        task.wait()
        mouse.Button1Up:Fire()
    end)
    pcall(function()
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        task.wait()
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end)
end

-- ==================== AUTO STATS ====================
task.spawn(function()
    while Running do
        task.wait(1)
        if getgenv().KaitunSettings.AutoStats then
            pcall(function()
                for i = 1, 5 do
                    CommF:InvokeServer("AddPoint", getgenv().KaitunSettings.StatsType, 1)
                end
            end)
        end
    end
end)

-- ==================== HAKI ====================
task.spawn(function()
    while Running do
        task.wait(5)
        pcall(function()
            local char = GetChar()
            if not char then return end
            if getgenv().KaitunSettings.AutoBusoHaki and not char:FindFirstChild("HasBuso") then
                CommF:InvokeServer("Buso")
            end
            if getgenv().KaitunSettings.AutoKenHaki and not char:FindFirstChild("KenTrue") then
                CommF:InvokeServer("Ken")
            end
        end)
    end
end)

-- ==================== FAST ATTACK LOOP ====================
task.spawn(function()
    while Running do
        task.wait(0.1)
        FastAttackSetup()
    end
end)

-- ==================== MAIN FARM ====================
task.spawn(function()
    task.wait(10) -- Chờ chọn team + load
    
    while Running do
        task.wait(0.2)
        pcall(function()
            if not getgenv().KaitunSettings.AutoLevel then return end
            
            local char = GetChar()
            local root = GetRoot()
            local hum = GetHum()
            if not char or not root or not hum or hum.Health <= 0 then
                task.wait(3)
                return
            end
            
            -- Skip nếu còn GUI chọn team
            if not IsTeamChosen() then return end
            
            local lv = GetLevel()
            local q = GetQuestForLevel(lv)
            if not q then return end
            
            local questName = q[3]
            local questLevel = q[4]
            local mobName = q[5]
            local npcCF = q[6]
            local mobAreaCF = q[7]
            
            -- Kiểm tra quest (AN TOÀN)
            local hasQuest = false
            pcall(function()
                local pg = LocalPlayer:FindFirstChild("PlayerGui")
                if not pg then return end
                local mainGui = pg:FindFirstChild("Main")
                if not mainGui then return end
                local questGui = mainGui:FindFirstChild("Quest")
                if questGui and questGui.Visible then
                    hasQuest = true
                end
            end)
            
            if not hasQuest then
                print("[Kaitun] Nhận quest: " .. questName .. " Lv " .. questLevel)
                root.CFrame = npcCF + Vector3.new(0, 5, 0)
                task.wait(0.5)
                pcall(function()
                    CommF:InvokeServer("StartQuest", questName, questLevel)
                end)
                task.wait(0.5)
                return
            end
            
            EquipMelee()
            local mob = FindMob(mobName)
            
            if not mob then
                print("[Kaitun] Không có " .. mobName .. ", di chuyển...")
                root.CFrame = mobAreaCF + Vector3.new(math.random(-30,30), 20, math.random(-30,30))
                task.wait(2)
                return
            end
            
            local mobRoot = mob:FindFirstChild("HumanoidRootPart")
            local mobHum = mob:FindFirstChildOfClass("Humanoid")
            if not mobRoot or not mobHum then return end
            
            local farmStart = tick()
            while Running and mob and mob.Parent and mobRoot and mobHum and mobHum.Health > 0 do
                root = GetRoot()
                if not root then break end
                
                local h = getgenv().KaitunSettings.AttackHeight
                local mobPos = mobRoot.Position
                root.CFrame = CFrame.new(
                    Vector3.new(mobPos.X, mobPos.Y + h, mobPos.Z),
                    mobPos
                )
                root.Velocity = Vector3.new(0, 0, 0)
                pcall(function() root.AssemblyLinearVelocity = Vector3.new(0, 0, 0) end)
                
                EquipMelee()
                AttackClick()
                
                if tick() - farmStart > 20 then break end
                task.wait(0.1)
            end
        end)
    end
end)

-- ==================== LOG ====================
task.spawn(function()
    local lastLv = GetLevel()
    while Running do
        task.wait(15)
        pcall(function()
            local cur = GetLevel()
            if cur ~= lastLv then
                print("[Kaitun] ⬆️ Level: " .. cur)
                lastLv = cur
            end
        end)
    end
end)

print([[
╔══════════════════════════════════════════════════════╗
║     KAITUN BLOX FRUITS v4 - FIX LỖI NIL             ║
║     Auto Team + Auto Farm + Fast Attack             ║
╚══════════════════════════════════════════════════════╝
]])
print("[Kaitun] Level: " .. GetLevel() .. " | Sea: " .. GetCurrentSea() .. " | Team: " .. getgenv().KaitunSettings.Team)
