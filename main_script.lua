-- =====================================================================
-- KAITUN BLOX FRUITS v7 - FIX FAST ATTACK
-- =====================================================================

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")

-- ==================== CẤU HÌNH ====================
getgenv().KaitunSettings = getgenv().KaitunSettings or {
    Team = "Pirates",
    AutoLevel = true,
    AutoStats = true,
    StatsType = "Melee",
    AutoBusoHaki = true,
    FastAttack = true,
    BringMob = true,
    BringDistance = 25,
    BringRange = 2500,
    FarmHeight = 30,
}

-- ==================== ANTI-AFK ====================
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- ==================== REMOTES ====================
local CommF = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
local Modules = ReplicatedStorage:WaitForChild("Modules")
local Net = Modules:WaitForChild("Net")
local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = Net:WaitForChild("RE/RegisterHit")

-- ==================== TIỆN ÍCH ====================
local function GetChar() return LocalPlayer.Character end
local function GetRoot() 
    local c = GetChar()
    return c and c:FindFirstChild("HumanoidRootPart")
end
local function GetHum() 
    local c = GetChar()
    return c and c:FindFirstChild("Humanoid")
end
local function GetLevel() 
    local ok, v = pcall(function() return LocalPlayer.Data.Level.Value end)
    return ok and v or 1
end

local function IsSea1() return game.PlaceId == 2753915549 or game.PlaceId == 85211729168715 end
local function IsSea2() return game.PlaceId == 4442272183 or game.PlaceId == 79091703265657 end
local function IsSea3() return game.PlaceId == 7449423635 or game.PlaceId == 100117331123089 end

local function Distance(target)
    local root = GetRoot()
    if not root then return math.huge end
    if typeof(target) == "Vector3" then
        return (target - root.Position).Magnitude
    elseif target.Position then
        return (target.Position - root.Position).Magnitude
    end
    return math.huge
end

-- ==================== ENABLE SIMULATION RADIUS ====================
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if setscriptable and sethiddenproperty then
                setscriptable(LocalPlayer, "SimulationRadius", true)
                sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
                sethiddenproperty(LocalPlayer, "MaximumSimulationRadius", math.huge)
            end
        end)
    end
end)

-- ==================== TELEPORT ====================
local function TeleportTo(cf)
    local root = GetRoot()
    if not root then return end
    root.CFrame = cf
    pcall(function() root.AssemblyLinearVelocity = Vector3.new(0, 0, 0) end)
end

local function SmartMove(cf)
    local root = GetRoot()
    if not root then return end
    local dist = (root.Position - cf.Position).Magnitude
    if dist < 3000 then
        TeleportTo(cf)
    else
        local tween = TweenService:Create(root, TweenInfo.new(dist/500, Enum.EasingStyle.Linear), {CFrame = cf})
        tween:Play()
        tween.Completed:Wait()
    end
end

-- ==================== TRANG BỊ TOOL ====================
local function EquipTool(toolType)
    local char = GetChar()
    if not char then return false end
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if not backpack then return false end
    
    for _, t in pairs(char:GetChildren()) do
        if t:IsA("Tool") and (t.ToolTip == toolType or t.Name == toolType) then
            return true
        end
    end
    
    for _, t in pairs(backpack:GetChildren()) do
        if t:IsA("Tool") and (t.ToolTip == toolType or t.Name == toolType) then
            local hum = GetHum()
            if hum then hum:EquipTool(t) return true end
        end
    end
    return false
end

-- ==================== TÌM MOB ====================
local function FindMob(mobName)
    for _, folder in pairs({Workspace:FindFirstChild("Enemies"), ReplicatedStorage}) do
        if folder then
            for _, mob in pairs(folder:GetChildren()) do
                local match = false
                if type(mobName) == "string" then
                    match = (mob.Name == mobName or string.find(mob.Name, mobName))
                elseif type(mobName) == "table" then
                    for _, n in ipairs(mobName) do
                        if mob.Name == n or string.find(mob.Name, n) then match = true break end
                    end
                end
                if match and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 
                   and mob:FindFirstChild("HumanoidRootPart") then
                    return mob
                end
            end
        end
    end
    return nil
end

-- ==================== 🔥 BRING ALL MOB (Fix không bay quá cao) ====================
local function BringAllMobs(mobName)
    if not getgenv().KaitunSettings.BringMob then return end
    local root = GetRoot()
    if not root then return end
    local enemies = Workspace:FindFirstChild("Enemies")
    if not enemies then return end
    
    -- Kéo mob về DƯỚI player (không bay lên trời)
    local bringPos = root.CFrame * CFrame.new(0, -getgenv().KaitunSettings.BringDistance, 0)
    
    for _, mob in pairs(enemies:GetChildren()) do
        local match = false
        if type(mobName) == "string" then
            match = (mob.Name == mobName)
        elseif type(mobName) == "table" then
            for _, n in ipairs(mobName) do
                if mob.Name == n then match = true break end
            end
        end
        
        if match then
            local hrp = mob:FindFirstChild("HumanoidRootPart")
            local h = mob:FindFirstChild("Humanoid")
            if hrp and h and h.Health > 0 then
                local dist = (hrp.Position - root.Position).Magnitude
                if dist <= getgenv().KaitunSettings.BringRange then
                    hrp.CFrame = bringPos
                    hrp.CanCollide = false
                    pcall(function()
                        hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    end)
                end
            end
        end
    end
end

-- =====================================================================
-- ==================== 🎯 FAST ATTACK - FIX HOÀN TOÀN ====================
-- =====================================================================
-- Từ code NTT HUB: cần format đúng args[4] và fire RegisterAttack per mob

local function GetAllHitsInRange(range)
    local root = GetRoot()
    if not root then return {} end
    local hits = {}
    
    -- Duyệt Enemies
    local enemies = Workspace:FindFirstChild("Enemies")
    if enemies then
        for _, mob in pairs(enemies:GetChildren()) do
            local hrp = mob:FindFirstChild("HumanoidRootPart")
            local h = mob:FindFirstChild("Humanoid")
            local head = mob:FindFirstChild("Head")
            if hrp and h and h.Health > 0 and head 
               and (hrp.Position - root.Position).Magnitude <= range then
                table.insert(hits, mob)
            end
        end
    end
    
    return hits
end

-- Fast Attack theo NTT HUB (format đúng)
local function FastAttackAll()
    pcall(function()
        local char = GetChar()
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        local tool = char:FindFirstChildOfClass("Tool")
        if not tool then return end
        
        local toolType = tool.ToolTip
        if not (toolType == "Melee" or toolType == "Sword") then return end
        
        local hits = GetAllHitsInRange(65)
        if #hits == 0 then return end
        
        -- ============ CÁCH 1: NTT HUB Original Format ============
        local args = {
            [1] = nil,            -- Head của mob đầu tiên
            [2] = {},             -- Array chứa {mob, hrp}
            [4] = "078da341",    -- Magic string từ NTT HUB
        }
        
        for i, mob in ipairs(hits) do
            RegisterAttack:FireServer(0) -- Fire attack cho mỗi mob
            if not args[1] then 
                args[1] = mob.Head 
            end
            args[2][i] = {
                [1] = mob,
                [2] = mob.HumanoidRootPart,
            }
        end
        
        RegisterHit:FireServer(unpack(args))
    end)
end

-- ============ CÁCH 2: Backup - Simple RegisterHit ============
local function SimpleAttack()
    pcall(function()
        local char = GetChar()
        if not char then return end
        local tool = char:FindFirstChildOfClass("Tool")
        if not tool then return end
        if tool.ToolTip ~= "Melee" and tool.ToolTip ~= "Sword" then return end
        
        local hits = GetAllHitsInRange(65)
        if #hits == 0 then return end
        
        local bladehits = {}
        for i, mob in ipairs(hits) do
            table.insert(bladehits, {mob, mob.HumanoidRootPart})
        end
        
        RegisterAttack:FireServer()
        RegisterHit:FireServer(hits[1].Head, bladehits)
    end)
end

-- ============ CÁCH 3: Fire ClickToAttack (backup nữa) ============
local function ToolActivate()
    pcall(function()
        local char = GetChar()
        if not char then return end
        local tool = char:FindFirstChildOfClass("Tool")
        if not tool then return end
        tool:Activate()
    end)
end

-- ==================== LOOP FAST ATTACK ====================
-- Chạy nhiều loop với các cách khác nhau để đảm bảo hit

-- Loop 1: Original NTT HUB (nhanh nhất)
task.spawn(function()
    while task.wait(0.05) do
        if getgenv().KaitunSettings.FastAttack then
            FastAttackAll()
        end
    end
end)

-- Loop 2: Simple attack (backup)
task.spawn(function()
    while task.wait(0.1) do
        if getgenv().KaitunSettings.FastAttack then
            SimpleAttack()
        end
    end
end)

-- Loop 3: Tool Activate
task.spawn(function()
    while task.wait(0.15) do
        if getgenv().KaitunSettings.FastAttack then
            ToolActivate()
        end
    end
end)

-- Loop 4: Advanced attack (từ code cuối NTT HUB - dùng Modules Net)
task.spawn(function()
    while task.wait(0.05) do
        pcall(function()
            if not getgenv().KaitunSettings.FastAttack then return end
            local char = GetChar()
            if not char then return end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then return end
            local tool = char:FindFirstChildOfClass("Tool")
            if not tool then return end
            if tool.ToolTip ~= "Melee" and tool.ToolTip ~= "Sword" then return end
            
            local bladehits = {}
            local enemies = Workspace:FindFirstChild("Enemies")
            if not enemies then return end
            
            for _, mob in pairs(enemies:GetChildren()) do
                if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") 
                   and mob.Humanoid.Health > 0
                   and (mob.HumanoidRootPart.Position - root.Position).Magnitude <= 65 then
                    table.insert(bladehits, mob)
                end
            end
            
            if #bladehits == 0 then return end
            
            local args = {[1] = nil, [2] = {}, [4] = "078da341"}
            for r, v in pairs(bladehits) do
                RegisterAttack:FireServer(0)
                if not args[1] then args[1] = v.Head end
                args[2][r] = {[1] = v, [2] = v.HumanoidRootPart}
            end
            RegisterHit:FireServer(unpack(args))
        end)
    end
end)

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

-- ==================== BẢNG QUEST ====================
local function GetQuest()
    local lv = GetLevel()
    
    if IsSea1() then
        if lv <= 9 then return {"Bandit","BanditQuest1",1,CFrame.new(1062,17,1548),CFrame.new(1039,80,1592)}
        elseif lv <= 14 then return {"Monkey","JungleQuest",1,CFrame.new(-1600,37,157),CFrame.new(-1776,75,48)}
        elseif lv <= 29 then return {"Gorilla","JungleQuest",2,CFrame.new(-1600,37,157),CFrame.new(-1321,82,-457)}
        elseif lv <= 39 then return {"Pirate","BuggyQuest1",1,CFrame.new(-1140,5,3829),CFrame.new(-1148,59,3996)}
        elseif lv <= 59 then return {"Brute","BuggyQuest1",2,CFrame.new(-1140,5,3829),CFrame.new(-1134,94,4318)}
        elseif lv <= 74 then return {"Desert Bandit","DesertQuest",1,CFrame.new(897,6,4389),CFrame.new(1054,53,4490)}
        elseif lv <= 89 then return {"Desert Officer","DesertQuest",2,CFrame.new(897,6,4389),CFrame.new(1561,15,4274)}
        elseif lv <= 99 then return {"Snow Bandit","SnowQuest",1,CFrame.new(1388,87,-1298),CFrame.new(1420,120,-1414)}
        elseif lv <= 119 then return {"Snowman","SnowQuest",2,CFrame.new(1388,87,-1298),CFrame.new(1220,138,-1489)}
        elseif lv <= 149 then return {"Chief Petty Officer","MarineQuest2",1,CFrame.new(-5038,29,4324),CFrame.new(-4761,75,4461)}
        elseif lv <= 174 then return {"Sky Bandit","SkyQuest",1,CFrame.new(-4840,718,-2621),CFrame.new(-4954,365,-2911)}
        elseif lv <= 189 then return {"Dark Master","SkyQuest",2,CFrame.new(-4840,718,-2621),CFrame.new(-5181,448,-2173)}
        elseif lv <= 209 then return {"Prisoner","PrisonerQuest",1,CFrame.new(5307,2,473),CFrame.new(5246,73,356)}
        elseif lv <= 249 then return {"Dangerous Prisoner","PrisonerQuest",2,CFrame.new(5307,2,473),CFrame.new(5665,73,664)}
        elseif lv <= 299 then return {"Toga Warrior","ColosseumQuest",1,CFrame.new(-1579,7,-2985),CFrame.new(-1780,45,-2735)}
        elseif lv <= 324 then return {"Military Soldier","MagmaQuest",1,CFrame.new(-5315,12,8517),CFrame.new(-5615,59,8446)}
        elseif lv <= 449 then return {"Military Spy","MagmaQuest",2,CFrame.new(-5315,12,8517),CFrame.new(-5729,116,8623)}
        elseif lv <= 474 then return {"God's Guard","SkyExp1Quest",1,CFrame.new(-4723,845,-1952),CFrame.new(-4628,867,-1939)}
        elseif lv <= 524 then return {"Shanda","SkyExp1Quest",2,CFrame.new(-7861,5546,-380),CFrame.new(-7686,5601,-441)}
        elseif lv <= 549 then return {"Royal Squad","SkyExp2Quest",1,CFrame.new(-7905,5636,-1412),CFrame.new(-7635,5637,-1411)}
        elseif lv <= 624 then return {"Royal Soldier","SkyExp2Quest",2,CFrame.new(-7905,5636,-1412),CFrame.new(-7838,5681,-1791)}
        elseif lv <= 649 then return {"Galley Pirate","FountainQuest",1,CFrame.new(5258,39,4049),CFrame.new(5560,152,4002)}
        else return {"Galley Captain","FountainQuest",2,CFrame.new(5258,39,4049),CFrame.new(5528,90,4856)}
        end
    end
    
    if IsSea2() then
        if lv <= 724 then return {"Raider","Area1Quest",1,CFrame.new(-428,73,1836),CFrame.new(-477,100,2325)}
        elseif lv <= 774 then return {"Mercenary","Area1Quest",2,CFrame.new(-428,73,1836),CFrame.new(-857,136,1488)}
        elseif lv <= 874 then return {"Swan Pirate","Area2Quest",1,CFrame.new(636,73,918),CFrame.new(931,152,1192)}
        elseif lv <= 899 then return {"Marine Lieutenant","MarineQuest3",1,CFrame.new(-2441,73,-3218),CFrame.new(-2922,153,-3089)}
        elseif lv <= 949 then return {"Marine Captain","MarineQuest3",2,CFrame.new(-2441,73,-3218),CFrame.new(-2007,120,-3204)}
        elseif lv <= 974 then return {"Zombie","ZombieQuest",1,CFrame.new(-5495,49,-795),CFrame.new(-5727,126,-728)}
        elseif lv <= 999 then return {"Vampire","ZombieQuest",2,CFrame.new(-5495,49,-795),CFrame.new(-5922,42,-1085)}
        elseif lv <= 1049 then return {"Snow Trooper","SnowMountainQuest",1,CFrame.new(607,402,-5373),CFrame.new(539,428,-5546)}
        elseif lv <= 1099 then return {"Winter Warrior","SnowMountainQuest",2,CFrame.new(607,402,-5373),CFrame.new(1397,466,-5203)}
        elseif lv <= 1124 then return {"Lab Subordinate","IceSideQuest",1,CFrame.new(-6228,81,-4854),CFrame.new(-5940,175,-4357)}
        elseif lv <= 1174 then return {"Horned Warrior","IceSideQuest",2,CFrame.new(-6228,81,-4854),CFrame.new(-6273,85,-6088)}
        elseif lv <= 1199 then return {"Magma Ninja","FireSideQuest",1,CFrame.new(-5402,29,-5372),CFrame.new(-5736,178,-5731)}
        elseif lv <= 1249 then return {"Lava Pirate","FireSideQuest",2,CFrame.new(-5402,29,-5372),CFrame.new(-5036,86,-5009)}
        elseif lv <= 1274 then return {"Ship Deckhand","ShipQuest1",1,CFrame.new(1039,125,32911),CFrame.new(1245,129,33052)}
        elseif lv <= 1299 then return {"Ship Engineer","ShipQuest1",2,CFrame.new(1039,125,32911),CFrame.new(917,44,32783)}
        elseif lv <= 1324 then return {"Ship Steward","ShipQuest2",1,CFrame.new(969,125,33245),CFrame.new(951,130,33444)}
        elseif lv <= 1349 then return {"Ship Officer","ShipQuest2",2,CFrame.new(969,125,33245),CFrame.new(614,181,33294)}
        elseif lv <= 1374 then return {"Arctic Warrior","FrostQuest",1,CFrame.new(5667,29,-6484),CFrame.new(5993,58,-6175)}
        elseif lv <= 1424 then return {"Snow Lurker","FrostQuest",2,CFrame.new(5667,29,-6484),CFrame.new(5557,58,-6598)}
        elseif lv <= 1449 then return {"Sea Soldier","ForgottenQuest",1,CFrame.new(-3054,237,-10146),CFrame.new(-3520,75,-9724)}
        else return {"Water Fighter","ForgottenQuest",2,CFrame.new(-3054,237,-10146),CFrame.new(-3435,291,-10502)}
        end
    end
    
    if IsSea3() then
        if lv <= 1524 then return {"Pirate Millionaire","PiratePortQuest",1,CFrame.new(-290,44,5580),CFrame.new(-506,82,5569)}
        elseif lv <= 1574 then return {"Pistol Billionaire","PiratePortQuest",2,CFrame.new(-290,44,5580),CFrame.new(46,135,6076)}
        elseif lv <= 1599 then return {"Dragon Crew Warrior","AmazonQuest",1,CFrame.new(5834,52,-1103),CFrame.new(6298,110,-1087)}
        elseif lv <= 1624 then return {"Dragon Crew","AmazonQuest",2,CFrame.new(5834,52,-1103),CFrame.new(6710,427,115)}
        elseif lv <= 1649 then return {"Female Islander","AmazonQuest2",1,CFrame.new(5447,602,750),CFrame.new(4647,793,777)}
        elseif lv <= 1699 then return {"Giant Islander","AmazonQuest2",2,CFrame.new(5447,602,750),CFrame.new(4921,670,-9)}
        elseif lv <= 1724 then return {"Marine Commodore","MarineTreeIsland",1,CFrame.new(2179,29,-6739),CFrame.new(2440,127,-7373)}
        elseif lv <= 1774 then return {"Marine Rear Admiral","MarineTreeIsland",2,CFrame.new(2179,29,-6739),CFrame.new(3786,192,-7080)}
        elseif lv <= 1799 then return {"Fishman Raider","DeepForestIsland3",1,CFrame.new(-10585,332,-8759),CFrame.new(-10532,375,-8267)}
        elseif lv <= 1824 then return {"Fishman Captain","DeepForestIsland3",2,CFrame.new(-10585,332,-8759),CFrame.new(-10308,376,-8790)}
        elseif lv <= 1849 then return {"Forest Pirate","DeepForestIsland",1,CFrame.new(-13234,333,-7627),CFrame.new(-13498,391,-7908)}
        elseif lv <= 1899 then return {"Mythological Pirate","DeepForestIsland",2,CFrame.new(-13234,333,-7627),CFrame.new(-13506,581,-6984)}
        elseif lv <= 1924 then return {"Jungle Pirate","DeepForestIsland2",1,CFrame.new(-12683,391,-9901),CFrame.new(-12091,448,-10562)}
        elseif lv <= 1974 then return {"Musketeer Pirate","DeepForestIsland2",2,CFrame.new(-12683,391,-9901),CFrame.new(-13335,447,-9916)}
        elseif lv <= 1999 then return {"Reborn Skeleton","HauntedQuest1",1,CFrame.new(-9481,142,5568),CFrame.new(-8762,177,6178)}
        elseif lv <= 2024 then return {"Living Zombie","HauntedQuest1",2,CFrame.new(-9481,142,5568),CFrame.new(-10081,238,5915)}
        elseif lv <= 2049 then return {"Demonic Soul","HauntedQuest2",1,CFrame.new(-9515,172,6078),CFrame.new(-9568,205,6042)}
        elseif lv <= 2074 then return {"Posessed Mummy","HauntedQuest2",2,CFrame.new(-9515,172,6078),CFrame.new(-9683,30,6359)}
        elseif lv <= 2099 then return {"Peanut Scout","NutsIslandQuest",1,CFrame.new(-2103,38,-10192),CFrame.new(-1938,93,-10194)}
        elseif lv <= 2124 then return {"Peanut President","NutsIslandQuest",2,CFrame.new(-2103,38,-10192),CFrame.new(-1955,81,-10534)}
        elseif lv <= 2149 then return {"Ice Cream Chef","IceCreamIslandQuest",1,CFrame.new(-819,66,-10965),CFrame.new(-875,119,-11034)}
        elseif lv <= 2199 then return {"Ice Cream Commander","IceCreamIslandQuest",2,CFrame.new(-819,66,-10965),CFrame.new(-697,173,-11213)}
        elseif lv <= 2249 then return {"Cookie Crafter","CakeQuest1",1,CFrame.new(-2021,38,-12030),CFrame.new(-2289,92,-12042)}
        elseif lv <= 2274 then return {"Baking Staff","CakeQuest2",1,CFrame.new(-1930,38,-12840),CFrame.new(-1770,81,-12207)}
        elseif lv <= 2299 then return {"Head Baker","CakeQuest2",2,CFrame.new(-1930,38,-12840),CFrame.new(-2314,106,-12929)}
        elseif lv <= 2324 then return {"Cocoa Warrior","ChocQuest1",1,CFrame.new(233,25,-12198),CFrame.new(142,69,-12255)}
        elseif lv <= 2349 then return {"Chocolate Bar Battler","ChocQuest1",2,CFrame.new(233,25,-12198),CFrame.new(602,74,-12582)}
        elseif lv <= 2374 then return {"Sweet Thief","ChocQuest2",1,CFrame.new(149,25,-12774),CFrame.new(-99,141,-12261)}
        elseif lv <= 2399 then return {"Candy Rebel","ChocQuest2",2,CFrame.new(149,25,-12774),CFrame.new(723,67,-12590)}
        elseif lv <= 2424 then return {"Candy Pirate","CandyQuest1",1,CFrame.new(-1147,14,-14446),CFrame.new(-1409,71,-14846)}
        elseif lv <= 2449 then return {"Snow Demon","CandyQuest1",2,CFrame.new(-1147,14,-14446),CFrame.new(-847,115,-14409)}
        elseif lv <= 2474 then return {"Isle Outlaw","TikiQuest1",1,CFrame.new(-16547,56,-174),CFrame.new(-16303,138,-148)}
        elseif lv <= 2499 then return {"Island Boy","TikiQuest1",2,CFrame.new(-16546,56,-174),CFrame.new(-16851,193,-150)}
        elseif lv <= 2524 then return {"Sun-Kissed Warrior","TikiQuest2",1,CFrame.new(-16539,56,1052),CFrame.new(-16404,161,1017)}
        else return {"Isle Champion","TikiQuest2",2,CFrame.new(-16539,56,1052),CFrame.new(-16747,128,1013)}
        end
    end
end

-- ==================== AUTO CHỌN TEAM ====================
task.spawn(function()
    task.wait(3)
    for i = 1, 20 do
        pcall(function()
            local pg = LocalPlayer:FindFirstChild("PlayerGui")
            if not pg then return end
            local minimal = pg:FindFirstChild("Main (minimal)")
            local mainGui = pg:FindFirstChild("Main")
            local needChoose = false
            if minimal then needChoose = true
            elseif mainGui then
                local ct = mainGui:FindFirstChild("ChooseTeam")
                if ct and ct.Visible then needChoose = true end
            end
            if needChoose then
                CommF:InvokeServer("SetTeam", getgenv().KaitunSettings.Team)
            end
        end)
        task.wait(1)
    end
end)

task.spawn(function()
    while task.wait(2) do
        pcall(function()
            local pg = LocalPlayer:FindFirstChild("PlayerGui")
            if pg and pg:FindFirstChild("Main (minimal)") then
                CommF:InvokeServer("SetTeam", getgenv().KaitunSettings.Team)
            end
        end)
    end
end)

-- ==================== AUTO STATS ====================
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if not getgenv().KaitunSettings.AutoStats then return end
            local points = LocalPlayer.Data.Points.Value
            if points > 0 then
                for i = 1, 3 do
                    CommF:InvokeServer("AddPoint", getgenv().KaitunSettings.StatsType, 1)
                end
            end
        end)
    end
end)

-- ==================== AUTO BUSO ====================
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if not getgenv().KaitunSettings.AutoBusoHaki then return end
            local char = GetChar()
            if char and not char:FindFirstChild("HasBuso") then
                CommF:InvokeServer("Buso")
            end
        end)
    end
end)

-- ==================== MAIN FARM ====================
local farmStuckPos = nil
task.spawn(function()
    task.wait(8)
    
    while task.wait() do
        pcall(function()
            if not getgenv().KaitunSettings.AutoLevel then return end
            
            local char = GetChar()
            local root = GetRoot()
            local hum = GetHum()
            if not char or not root or not hum or hum.Health <= 0 then
                task.wait(2)
                farmStuckPos = nil
                return
            end
            
            local pg = LocalPlayer:FindFirstChild("PlayerGui")
            if pg and pg:FindFirstChild("Main (minimal)") then return end
            
            local lv = GetLevel()
            
            if IsSea1() and lv >= 700 then
                CommF:InvokeServer("TravelDressrosa")
                task.wait(5)
                farmStuckPos = nil
                return
            end
            
            if IsSea2() and lv >= 1250 and lv < 1350 and Distance(CFrame.new(931,126,33132)) >= 5000 then
                CommF:InvokeServer("requestEntrance", Vector3.new(923.21, 126.98, 32852.83))
                task.wait(3)
                return
            end
            
            local quest = GetQuest()
            if not quest then return end
            
            local mobName = quest[1]
            local questName = quest[2]
            local questLevel = quest[3]
            local npcCF = quest[4]
            local mobAreaCF = quest[5]
            
            local main = pg and pg:FindFirstChild("Main")
            local questGui = main and main:FindFirstChild("Quest")
            
            if questGui and questGui.Visible == false then
                farmStuckPos = nil
                SmartMove(npcCF)
                if Distance(npcCF) <= 10 then
                    task.wait(0.5)
                    CommF:InvokeServer("StartQuest", questName, questLevel)
                    task.wait(0.5)
                end
            else
                if not farmStuckPos then
                    -- Vị trí đứng: TRÊN CAO area mob (không quá cao)
                    farmStuckPos = mobAreaCF + Vector3.new(0, getgenv().KaitunSettings.FarmHeight, 0)
                end
                
                if Distance(farmStuckPos) > 15 then
                    SmartMove(CFrame.new(farmStuckPos.Position or farmStuckPos))
                    return
                end
                
                -- Giữ vị trí
                root.CFrame = CFrame.new(farmStuckPos.Position or farmStuckPos)
                pcall(function() root.AssemblyLinearVelocity = Vector3.new(0, 0, 0) end)
                
                -- Equip melee
                EquipTool("Melee")
                
                -- Bring mob
                BringAllMobs(mobName)
                
                -- Check quest sai
                if questGui.Container and questGui.Container:FindFirstChild("QuestTitle") 
                   and questGui.Container.QuestTitle:FindFirstChild("Title") then
                    local title = questGui.Container.QuestTitle.Title.Text
                    if not string.find(title, mobName) then
                        questGui.Visible = false
                    end
                end
            end
        end)
    end
end)

-- ==================== BRING MOB LOOP RIÊNG ====================
RunService.Heartbeat:Connect(function()
    if not getgenv().KaitunSettings.AutoLevel then return end
    if not getgenv().KaitunSettings.BringMob then return end
    
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    local main = pg and pg:FindFirstChild("Main")
    local questGui = main and main:FindFirstChild("Quest")
    
    if questGui and questGui.Visible and farmStuckPos then
        local quest = GetQuest()
        if quest then
            BringAllMobs(quest[1])
        end
    end
end)

-- ==================== RESET FARM POS ====================
task.spawn(function()
    local lastLv = GetLevel()
    while task.wait(3) do
        local cur = GetLevel()
        if cur ~= lastLv then
            local diff = cur - lastLv
            if diff > 5 or diff < 0 then
                farmStuckPos = nil
            end
            lastLv = cur
            print("[Kaitun] ⬆️ Level: " .. cur)
        end
    end
end)

-- ==================== AUTO REJOIN ====================
pcall(function()
    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
        if child.Name == "ErrorPrompt" then
            pcall(function()
                ReplicatedStorage.__ServerBrowser:InvokeServer("teleport", game.JobId)
            end)
        end
    end)
end)

print([[
╔══════════════════════════════════════════════════════╗
║  🎯 KAITUN v7 - FIX FAST ATTACK                      ║
║  ✅ 4 loops attack song song                         ║
║  ✅ Args format đúng NTT HUB                         ║
║  ✅ Bring all + Attack all                           ║
╚══════════════════════════════════════════════════════╝
]])
print("[Kaitun] Level: " .. GetLevel() .. " | Team: " .. getgenv().KaitunSettings.Team)
