-- =====================================================================
-- KAITUN BLOX FRUITS v5 FINAL - Dựa trên NTT HUB
-- Auto Team + Auto Farm + Fast Attack + Full 3 Sea
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
local HttpService = game:GetService("HttpService")

-- ==================== CẤU HÌNH ====================
getgenv().KaitunSettings = getgenv().KaitunSettings or {
    Team = "Pirates",           -- "Pirates" hoặc "Marines"
    AutoLevel = true,
    AutoStats = true,
    StatsType = "Melee",        -- "Melee", "Defense", "Sword", "Gun", "Demon Fruit"
    AutoBusoHaki = true,
    FastAttack = true,
    AttackDistance = 25,
    ShowLog = true,
}

_G.distance = getgenv().KaitunSettings.AttackDistance

-- ==================== ANTI-AFK ====================
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- ==================== REMOTES ====================
local CommF = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")

-- ==================== HÀM TIỆN ÍCH ====================
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

local function Log(msg)
    if getgenv().KaitunSettings.ShowLog then
        print("[Kaitun] " .. msg)
    end
end

-- ==================== CHECK SEA (từ NTT HUB) ====================
local function IsSea1()
    return game.PlaceId == 2753915549 or game.PlaceId == 85211729168715
end
local function IsSea2()
    return game.PlaceId == 4442272183 or game.PlaceId == 79091703265657
end
local function IsSea3()
    return game.PlaceId == 7449423635 or game.PlaceId == 100117331123089
end

-- ==================== KHOẢNG CÁCH ====================
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

-- ==================== TWEEN VỚI PART PROXY (Kỹ thuật NTT HUB) ====================
if not Workspace:FindFirstChild("p_ntt") then
    local part = Instance.new("Part")
    part.Name = "p_ntt"
    part.Size = Vector3.new(5, 5, 5)
    part.Position = Vector3.new(0, 10, 0)
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 1
    part.Parent = Workspace
end

local function TweenTo(targetCFrame)
    local root = GetRoot()
    if not root then return end
    local proxy = Workspace:FindFirstChild("p_ntt")
    if not proxy then return end
    
    -- Nếu proxy quá xa player thì reset
    if (proxy.Position - root.Position).Magnitude >= 201 then
        local reset = TweenService:Create(proxy, TweenInfo.new(0), {CFrame = root.CFrame})
        reset:Play()
    else
        local dist = (targetCFrame.Position - root.Position).Magnitude
        local speed
        if dist >= 300 then
            speed = 150
        elseif dist < 100 then
            speed = 9999999
        else
            speed = 500
        end
        
        -- Nếu proxy dưới nước thì kéo lên
        if proxy.CFrame.Y < -2 then
            proxy.CFrame = CFrame.new(proxy.CFrame.X, proxy.CFrame.Y + 5, proxy.CFrame.Z)
        end
        
        local tween = TweenService:Create(proxy, TweenInfo.new(dist/speed), {CFrame = targetCFrame})
        tween:Play()
        root.CFrame = proxy.CFrame
    end
end

-- ==================== TRANG BỊ TOOL (từ NTT HUB) ====================
local function EquipTool(toolType)
    local char = GetChar()
    if not char then return end
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if not backpack then return end
    
    -- Check đã cầm chưa
    for _, t in pairs(char:GetChildren()) do
        if t:IsA("Tool") then
            if t.ToolTip == toolType or t.Name == toolType then
                return true
            end
        end
    end
    
    -- Equip từ backpack
    for _, t in pairs(backpack:GetChildren()) do
        if t:IsA("Tool") then
            if t.ToolTip == toolType or t.Name == toolType then
                local hum = GetHum()
                if hum then
                    hum:EquipTool(t)
                    return true
                end
            end
        end
    end
    return false
end

local function EquipMelee() return EquipTool("Melee") end
local function EquipSword() return EquipTool("Sword") end
local function EquipFruit() return EquipTool("Blox Fruit") end
local function EquipGun() return EquipTool("Gun") end

-- ==================== TÌM MOB (từ NTT HUB) ====================
local function FindMob(mobName)
    local root = GetRoot()
    if not root then return nil end
    
    for _, folder in pairs({Workspace:FindFirstChild("Enemies"), ReplicatedStorage}) do
        if folder then
            for _, mob in pairs(folder:GetChildren()) do
                if type(mobName) == "string" then
                    if (mob.Name == mobName or string.find(mob.Name, mobName)) 
                       and mob:FindFirstChild("Humanoid") 
                       and mob.Humanoid.Health > 0 
                       and mob:FindFirstChild("HumanoidRootPart") then
                        return mob
                    end
                elseif type(mobName) == "table" then
                    for _, name in ipairs(mobName) do
                        if (mob.Name == name or string.find(mob.Name, name)) 
                           and mob:FindFirstChild("Humanoid") 
                           and mob.Humanoid.Health > 0 
                           and mob:FindFirstChild("HumanoidRootPart") then
                            return mob
                        end
                    end
                end
            end
        end
    end
    return nil
end

-- ==================== BUG MOB - KÉO MOB VỀ (từ NTT HUB sjr_bx) ====================
local function BugMob(mobName)
    local root = GetRoot()
    if not root then return end
    local enemies = Workspace:FindFirstChild("Enemies")
    if not enemies then return end
    
    for _, mob in pairs(enemies:GetChildren()) do
        local match = false
        if type(mobName) == "string" then
            match = mob.Name == mobName
        elseif type(mobName) == "table" then
            for _, n in ipairs(mobName) do
                if mob.Name == n then match = true; break end
            end
        end
        
        if match and mob:FindFirstChild("HumanoidRootPart") 
           and Distance(mob.HumanoidRootPart) <= 250 then
            mob.HumanoidRootPart.CFrame = root.CFrame * CFrame.new(0, _G.distance * -1, 0)
            mob.HumanoidRootPart.CanCollide = false
            pcall(function()
                setscriptable(LocalPlayer, "SimulationRadius", true)
                sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            end)
        end
    end
end

-- ==================== ATTACK (từ NTT HUB sjr_aq) ====================
local function AttackWithSkill(skill, position)
    local char = GetChar()
    if not char then return end
    
    for _, tool in pairs(char:GetChildren()) do
        if tool.ClassName == "Tool" then
            pcall(function()
                tool.RemoteEvent:FireServer(position)
            end)
            
            local hum = char:FindFirstChild("Humanoid")
            if hum then
                for _, rf in pairs(hum:GetChildren()) do
                    if rf.ClassName == "RemoteFunction" then
                        pcall(function()
                            rf:InvokeServer(skill, position)
                        end)
                    end
                end
            end
            
            pcall(function()
                tool.RemoteEvent:FireServer(position)
            end)
        end
    end
end

-- ==================== FAST ATTACK - CLICK M1 ====================
local function FastAttackClick()
    pcall(function()
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end)
end

-- ==================== FAST ATTACK ADVANCED (từ script obfuscated NTT) ====================
local FastAttackLoop
local function SetupFastAttack()
    if FastAttackLoop then return end
    
    FastAttackLoop = RunService.Heartbeat:Connect(function()
        if not getgenv().KaitunSettings.FastAttack then return end
        pcall(function()
            local char = GetChar()
            if not char then return end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then return end
            local tool = char:FindFirstChildOfClass("Tool")
            if not tool then return end
            
            local toolType = tool.ToolTip
            if not (toolType == "Melee" or toolType == "Sword") then return end
            
            -- Tìm mobs trong bán kính 60
            local hits = {}
            local firstMob = nil
            local firstPart = nil
            
            for _, folder in pairs({Workspace:FindFirstChild("Enemies"), Workspace:FindFirstChild("Characters")}) do
                if folder then
                    for _, ent in pairs(folder:GetChildren()) do
                        if ent ~= char then
                            local hrp = ent:FindFirstChild("HumanoidRootPart")
                            local h = ent:FindFirstChild("Humanoid")
                            local head = ent:FindFirstChild("Head")
                            if hrp and h and h.Health > 0 and head 
                               and (hrp.Position - root.Position).Magnitude <= 60 then
                                if not firstMob then
                                    firstMob = ent
                                    firstPart = head
                                end
                                table.insert(hits, {ent, hrp})
                            end
                        end
                    end
                end
            end
            
            if firstMob and firstPart and #hits > 0 then
                local Net = ReplicatedStorage:FindFirstChild("Modules")
                if Net then Net = Net:FindFirstChild("Net") end
                if Net then
                    local ra = Net:FindFirstChild("RE/RegisterAttack")
                    local rh = Net:FindFirstChild("RE/RegisterHit")
                    if ra and rh then
                        pcall(function()
                            ra:FireServer()
                            rh:FireServer(firstPart, hits)
                        end)
                    end
                end
            end
        end)
    end)
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

-- ==================== BẢNG QUEST FULL (từ NTT HUB sjr_aw) ====================
-- Format: {MobName, QuestName, QuestLevel, NPC_CFrame, Mob_Area_CFrame}
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

-- ==================== STORE FRUIT ====================
local function StoreFruit()
    local sources = {GetChar() and GetChar():GetChildren() or {}, LocalPlayer.Backpack:GetChildren()}
    for i = 1, 2 do
        for _, tool in pairs(sources[i]) do
            if tool.ClassName == "Tool" and string.find(tool.Name, "Fruit") then
                pcall(function()
                    CommF:InvokeServer("StoreFruit", string.gsub(tool.Name, " Fruit", "") .. "-" .. string.gsub(tool.Name, " Fruit", ""), tool)
                end)
            end
        end
    end
end

-- =====================================================================
-- ==================== 🎯 AUTO CHỌN TEAM (100% CHÍNH XÁC) ================
-- =====================================================================
task.spawn(function()
    task.wait(2)
    
    -- Cách chính xác nhất từ NTT HUB
    for i = 1, 20 do
        pcall(function()
            local pg = LocalPlayer:FindFirstChild("PlayerGui")
            if not pg then return end
            
            -- Check "Main (minimal)" - GUI hiện khi chưa chọn team
            local minimal = pg:FindFirstChild("Main (minimal)")
            local mainGui = pg:FindFirstChild("Main")
            local needChoose = false
            
            if minimal then
                needChoose = true
            elseif mainGui then
                local ct = mainGui:FindFirstChild("ChooseTeam")
                if ct and ct.Visible then
                    needChoose = true
                end
            end
            
            if needChoose then
                Log("Đang chọn team: " .. getgenv().KaitunSettings.Team)
                CommF:InvokeServer("SetTeam", getgenv().KaitunSettings.Team)
            end
        end)
        task.wait(1)
    end
end)

-- Loop check team liên tục (từ NTT HUB - cuối script)
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

-- ==================== AUTO BUSO HAKI ====================
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

-- ==================== FAST ATTACK SETUP ====================
SetupFastAttack()

-- ==================== MAIN FARM LOOP (từ NTT HUB) ====================
task.spawn(function()
    task.wait(8) -- Chờ chọn team + load
    
    while task.wait() do
        pcall(function()
            if not getgenv().KaitunSettings.AutoLevel then return end
            
            local char = GetChar()
            local root = GetRoot()
            local hum = GetHum()
            if not char or not root or not hum or hum.Health <= 0 then
                task.wait(2)
                return
            end
            
            -- Skip nếu còn GUI chọn team
            local pg = LocalPlayer:FindFirstChild("PlayerGui")
            if pg and pg:FindFirstChild("Main (minimal)") then return end
            
            local lv = GetLevel()
            
            -- Auto travel sea theo level
            if IsSea1() and lv >= 700 then
                CommF:InvokeServer("TravelDressrosa")
                task.wait(5)
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
                -- Chưa nhận quest -> đến NPC nhận
                TweenTo(npcCF)
                if Distance(npcCF) <= 10 then
                    task.wait(1)
                    Log("Nhận quest: " .. questName .. " Lv " .. questLevel)
                    CommF:InvokeServer("StartQuest", questName, questLevel)
                end
            else
                -- Đã có quest -> farm mob
                local mob = FindMob(mobName)
                if mob then
                    EquipMelee()
                    TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, _G.distance, 0))
                    -- Bug mob về gần player
                    BugMob(mobName)
                else
                    TweenTo(mobAreaCF)
                end
                
                -- Check nếu quest hiện tại không đúng thì reset
                if questGui and questGui.Container and questGui.Container.QuestTitle and questGui.Container.QuestTitle.Title then
                    if not string.find(questGui.Container.QuestTitle.Title.Text, mobName) then
                        questGui.Visible = false
                    end
                end
            end
        end)
    end
end)

-- ==================== BUG MOB LOOP (song song main farm) ====================
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if not getgenv().KaitunSettings.AutoLevel then return end
            local pg = LocalPlayer:FindFirstChild("PlayerGui")
            local main = pg and pg:FindFirstChild("Main")
            local questGui = main and main:FindFirstChild("Quest")
            if questGui and questGui.Visible then
                local quest = GetQuest()
                if quest then
                    BugMob(quest[1])
                end
            end
        end)
    end
end)

-- ==================== AUTO REJOIN ====================
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == "ErrorPrompt" then
        pcall(function()
            ReplicatedStorage.__ServerBrowser:InvokeServer("teleport", game.JobId)
        end)
    end
end)

-- ==================== LOG ====================
task.spawn(function()
    local lastLv = GetLevel()
    while task.wait(10) do
        pcall(function()
            local cur = GetLevel()
            if cur ~= lastLv then
                Log("⬆️ Level: " .. cur .. " (+" .. (cur - lastLv) .. ")")
                lastLv = cur
            end
        end)
    end
end)

print([[
╔══════════════════════════════════════════════════════╗
║  🎯 KAITUN BLOX FRUITS v5 FINAL - Based on NTT HUB  ║
║  ✅ Auto Team | Auto Farm | Fast Attack | Bug Mob   ║
║  ✅ Full Sea 1/2/3 - Level 1 to Max                 ║
╚══════════════════════════════════════════════════════╝
]])
Log("Level: " .. GetLevel() .. " | Sea: " .. (IsSea1() and "1" or IsSea2() and "2" or IsSea3() and "3" or "?"))
Log("Team: " .. getgenv().KaitunSettings.Team .. " | Stats: " .. getgenv().KaitunSettings.StatsType)
Log("Đang khởi động auto farm...")
