--[[
    SCRIPT KAITUN BLOX FRUIT - TỰ ĐỘNG FARM LEVEL 1 TỚI MAX + GODHUMAN
    Dành cho executor hỗ trợ
]]

-- Kiểm tra game
if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- ====== CẤU HÌNH ======
_G.KaitunConfig = {
    -- Tự động mua và nâng cấp
    AutoBuyStats = true,        -- Tự động phân bổ điểm
    AutoBuyFightingStyle = true, -- Tự động mua các style
    AutoUpgradeGear = true,     -- Tự động nâng cấp vũ khí
    
    -- Khoảng cách
    Distance = 25,
    
    -- Skill settings
    UseSkills = {
        Z = true,
        X = true,
        C = true,
        V = true,
        F = true,
    },
    
    -- Godhuman requirements
    Godhuman = {
        Enabled = true,
        -- Các yêu cầu sẽ được kiểm tra tự động
    },
}

-- ====== HÀM HỖ TRỢ ======
local function GetLevel()
    return Player.Data and Player.Data.Level and Player.Data.Level.Value or 0
end

local function GetDistance(pos1, pos2)
    return (pos1 - pos2).Magnitude
end

local function Teleport(position)
    local dist = GetDistance(HumanoidRootPart.Position, position.Position or position)
    if dist > 5 then
        local tween = TweenService:Create(HumanoidRootPart, TweenInfo.new(dist / 9999999), {CFrame = position})
        tween:Play()
        task.wait(dist / 9999999 + 0.1)
    end
end

local function EquipTool(toolName)
    local tool = Player.Backpack:FindFirstChild(toolName) or Player.Character:FindFirstChild(toolName)
    if tool then
        if tool.Parent ~= Player.Character then
            Humanoid:EquipTool(tool)
        end
        return true
    end
    return false
end

local function UseSkill(skill, position)
    local tool = Player.Character:FindFirstChildOfClass("Tool")
    if tool and tool:FindFirstChild("RemoteEvent") then
        tool.RemoteEvent:FireServer(skill, position)
    end
end

local function FindNearestMob(position, range)
    local nearest = nil
    local minDist = range or 500
    
    for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
        local hrp = enemy:FindFirstChild("HumanoidRootPart")
        local hum = enemy:FindFirstChild("Humanoid")
        if hrp and hum and hum.Health > 0 then
            local dist = GetDistance(position, hrp.Position)
            if dist < minDist then
                minDist = dist
                nearest = enemy
            end
        end
    end
    return nearest
end

local function FindQuest()
    local level = GetLevel()
    
    -- Sea 1: Level 1-700
    if game.PlaceId == 2753915549 then
        if level <= 9 then
            return {Name = "Bandit", Quest = "BanditQuest1", QuestLevel = 1, QuestPos = CFrame.new(1062, 17, 1548), MobPos = CFrame.new(1039, 80, 1592)}
        elseif level <= 14 then
            return {Name = "Monkey", Quest = "JungleQuest", QuestLevel = 1, QuestPos = CFrame.new(-1600, 37, 157), MobPos = CFrame.new(-1776, 75, 48)}
        elseif level <= 29 then
            return {Name = "Gorilla", Quest = "JungleQuest", QuestLevel = 2, QuestPos = CFrame.new(-1600, 37, 157), MobPos = CFrame.new(-1321, 82, -457)}
        elseif level <= 39 then
            return {Name = "Pirate", Quest = "BuggyQuest1", QuestLevel = 1, QuestPos = CFrame.new(-1140, 5, 3829), MobPos = CFrame.new(-1148, 59, 3996)}
        elseif level <= 59 then
            return {Name = "Brute", Quest = "BuggyQuest1", QuestLevel = 2, QuestPos = CFrame.new(-1140, 5, 3829), MobPos = CFrame.new(-1134, 94, 4318)}
        elseif level <= 74 then
            return {Name = "Desert Bandit", Quest = "DesertQuest", QuestLevel = 1, QuestPos = CFrame.new(897, 6, 4389), MobPos = CFrame.new(1054, 53, 4490)}
        elseif level <= 89 then
            return {Name = "Desert Officer", Quest = "DesertQuest", QuestLevel = 2, QuestPos = CFrame.new(897, 6, 4389), MobPos = CFrame.new(1561, 15, 4274)}
        elseif level <= 99 then
            return {Name = "Snow Bandit", Quest = "SnowQuest", QuestLevel = 1, QuestPos = CFrame.new(1388, 87, -1298), MobPos = CFrame.new(1420, 120, -1414)}
        elseif level <= 119 then
            return {Name = "Snowman", Quest = "SnowQuest", QuestLevel = 2, QuestPos = CFrame.new(1388, 87, -1298), MobPos = CFrame.new(1220, 138, -1489)}
        elseif level <= 149 then
            return {Name = "Chief Petty Officer", Quest = "MarineQuest2", QuestLevel = 1, QuestPos = CFrame.new(-5038, 29, 4324), MobPos = CFrame.new(-4761, 75, 4461)}
        elseif level <= 174 then
            return {Name = "Sky Bandit", Quest = "SkyQuest", QuestLevel = 1, QuestPos = CFrame.new(-4840, 718, -2621), MobPos = CFrame.new(-4954, 365, -2911)}
        elseif level <= 189 then
            return {Name = "Dark Master", Quest = "SkyQuest", QuestLevel = 2, QuestPos = CFrame.new(-4840, 718, -2621), MobPos = CFrame.new(-5181, 448, -2173)}
        elseif level <= 209 then
            return {Name = "Prisoner", Quest = "PrisonerQuest", QuestLevel = 1, QuestPos = CFrame.new(5307, 2, 473), MobPos = CFrame.new(5246, 73, 356)}
        elseif level <= 249 then
            return {Name = "Dangerous Prisoner", Quest = "PrisonerQuest", QuestLevel = 2, QuestPos = CFrame.new(5307, 2, 473), MobPos = CFrame.new(5665, 73, 664)}
        elseif level <= 299 then
            return {Name = "Toga Warrior", Quest = "ColosseumQuest", QuestLevel = 1, QuestPos = CFrame.new(-1579, 7, -2985), MobPos = CFrame.new(-1780, 45, -2735)}
        elseif level <= 324 then
            return {Name = "Military Soldier", Quest = "MagmaQuest", QuestLevel = 1, QuestPos = CFrame.new(-5315, 12, 8517), MobPos = CFrame.new(-5615, 59, 8446)}
        elseif level <= 449 then
            return {Name = "Military Spy", Quest = "MagmaQuest", QuestLevel = 2, QuestPos = CFrame.new(-5315, 12, 8517), MobPos = CFrame.new(-5729, 116, 8623)}
        elseif level <= 474 then
            return {Name = "God's Guard", Quest = "SkyExp1Quest", QuestLevel = 1, QuestPos = CFrame.new(-4723, 845, -1952), MobPos = CFrame.new(-4628, 867, -1939)}
        elseif level <= 524 then
            return {Name = "Shanda", Quest = "SkyExp1Quest", QuestLevel = 2, QuestPos = CFrame.new(-7861, 5546, -380), MobPos = CFrame.new(-7686, 5601, -441)}
        elseif level <= 549 then
            return {Name = "Royal Squad", Quest = "SkyExp2Quest", QuestLevel = 1, QuestPos = CFrame.new(-7905, 5636, -1412), MobPos = CFrame.new(-7635, 5637, -1411)}
        elseif level <= 624 then
            return {Name = "Royal Soldier", Quest = "SkyExp2Quest", QuestLevel = 2, QuestPos = CFrame.new(-7905, 5636, -1412), MobPos = CFrame.new(-7838, 5681, -1791)}
        elseif level <= 649 then
            return {Name = "Galley Pirate", Quest = "FountainQuest", QuestLevel = 1, QuestPos = CFrame.new(5258, 39, 4049), MobPos = CFrame.new(5560, 152, 4002)}
        elseif level <= 699 then
            return {Name = "Galley Captain", Quest = "FountainQuest", QuestLevel = 2, QuestPos = CFrame.new(5258, 39, 4049), MobPos = CFrame.new(5528, 90, 4856)}
        elseif level <= 1000 then
            -- Travel to Sea 2
            ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
            return nil
        end
    end
    
    -- Sea 2: Level 700-1500
    if game.PlaceId == 4442272183 then
        if level <= 724 then
            return {Name = "Raider", Quest = "Area1Quest", QuestLevel = 1, QuestPos = CFrame.new(-428, 73, 1836), MobPos = CFrame.new(-477, 100, 2325)}
        elseif level <= 774 then
            return {Name = "Mercenary", Quest = "Area1Quest", QuestLevel = 2, QuestPos = CFrame.new(-428, 73, 1836), MobPos = CFrame.new(-857, 136, 1488)}
        elseif level <= 874 then
            return {Name = "Swan Pirate", Quest = "Area2Quest", QuestLevel = 1, QuestPos = CFrame.new(636, 73, 918), MobPos = CFrame.new(931, 152, 1192)}
        elseif level <= 899 then
            return {Name = "Marine Lieutenant", Quest = "MarineQuest3", QuestLevel = 1, QuestPos = CFrame.new(-2441, 73, -3218), MobPos = CFrame.new(-2922, 153, -3089)}
        elseif level <= 949 then
            return {Name = "Marine Captain", Quest = "MarineQuest3", QuestLevel = 2, QuestPos = CFrame.new(-2441, 73, -3218), MobPos = CFrame.new(-2007, 120, -3204)}
        elseif level <= 974 then
            return {Name = "Zombie", Quest = "ZombieQuest", QuestLevel = 1, QuestPos = CFrame.new(-5495, 49, -795), MobPos = CFrame.new(-5727, 126, -728)}
        elseif level <= 999 then
            return {Name = "Vampire", Quest = "ZombieQuest", QuestLevel = 2, QuestPos = CFrame.new(-5495, 49, -795), MobPos = CFrame.new(-5922, 42, -1085)}
        elseif level <= 1049 then
            return {Name = "Snow Trooper", Quest = "SnowMountainQuest", QuestLevel = 1, QuestPos = CFrame.new(607, 402, -5373), MobPos = CFrame.new(539, 428, -5546)}
        elseif level <= 1099 then
            return {Name = "Winter Warrior", Quest = "SnowMountainQuest", QuestLevel = 2, QuestPos = CFrame.new(607, 402, -5373), MobPos = CFrame.new(1397, 466, -5203)}
        elseif level <= 1124 then
            return {Name = "Lab Subordinate", Quest = "IceSideQuest", QuestLevel = 1, QuestPos = CFrame.new(-6228, 81, -4854), MobPos = CFrame.new(-5940, 175, -4357)}
        elseif level <= 1174 then
            return {Name = "Horned Warrior", Quest = "IceSideQuest", QuestLevel = 2, QuestPos = CFrame.new(-6228, 81, -4854), MobPos = CFrame.new(-6273, 85, -6088)}
        elseif level <= 1199 then
            return {Name = "Magma Ninja", Quest = "FireSideQuest", QuestLevel = 1, QuestPos = CFrame.new(-5402, 29, -5372), MobPos = CFrame.new(-5736, 178, -5731)}
        elseif level <= 1249 then
            return {Name = "Lava Pirate", Quest = "FireSideQuest", QuestLevel = 2, QuestPos = CFrame.new(-5402, 29, -5372), MobPos = CFrame.new(-5036, 86, -5009)}
        elseif level <= 1274 then
            return {Name = "Ship Deckhand", Quest = "ShipQuest1", QuestLevel = 1, QuestPos = CFrame.new(1039, 125, 32911), MobPos = CFrame.new(1245, 129, 33052)}
        elseif level <= 1299 then
            return {Name = "Ship Engineer", Quest = "ShipQuest1", QuestLevel = 2, QuestPos = CFrame.new(1039, 125, 32911), MobPos = CFrame.new(917, 44, 32783)}
        elseif level <= 1324 then
            return {Name = "Ship Steward", Quest = "ShipQuest2", QuestLevel = 1, QuestPos = CFrame.new(969, 125, 33245), MobPos = CFrame.new(951, 130, 33444)}
        elseif level <= 1349 then
            return {Name = "Ship Officer", Quest = "ShipQuest2", QuestLevel = 2, QuestPos = CFrame.new(969, 125, 33245), MobPos = CFrame.new(614, 181, 33294)}
        elseif level <= 1374 then
            return {Name = "Arctic Warrior", Quest = "FrostQuest", QuestLevel = 1, QuestPos = CFrame.new(5667, 29, -6484), MobPos = CFrame.new(5993, 58, -6175)}
        elseif level <= 1424 then
            return {Name = "Snow Lurker", Quest = "FrostQuest", QuestLevel = 2, QuestPos = CFrame.new(5667, 29, -6484), MobPos = CFrame.new(5557, 58, -6598)}
        elseif level <= 1449 then
            return {Name = "Sea Soldier", Quest = "ForgottenQuest", QuestLevel = 1, QuestPos = CFrame.new(-3054, 237, -10146), MobPos = CFrame.new(-3520, 75, -9724)}
        elseif level <= 1500 then
            return {Name = "Water Fighter", Quest = "ForgottenQuest", QuestLevel = 2, QuestPos = CFrame.new(-3054, 237, -10146), MobPos = CFrame.new(-3435, 291, -10502)}
        elseif level <= 2000 then
            -- Travel to Sea 3
            ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
            return nil
        end
    end
    
    -- Sea 3: Level 1500-2550
    if game.PlaceId == 7449423635 then
        if level <= 1524 then
            return {Name = "Pirate Millionaire", Quest = "PiratePortQuest", QuestLevel = 1, QuestPos = CFrame.new(-290, 44, 5580), MobPos = CFrame.new(-506, 82, 5569)}
        elseif level <= 1574 then
            return {Name = "Pistol Billionaire", Quest = "PiratePortQuest", QuestLevel = 2, QuestPos = CFrame.new(-290, 44, 5580), MobPos = CFrame.new(46, 135, 6076)}
        elseif level <= 1599 then
            return {Name = "Dragon Crew Warrior", Quest = "AmazonQuest", QuestLevel = 1, QuestPos = CFrame.new(5834, 52, -1103), MobPos = CFrame.new(6298, 110, -1087)}
        elseif level <= 1624 then
            return {Name = "Dragon Crew", Quest = "AmazonQuest", QuestLevel = 2, QuestPos = CFrame.new(5834, 52, -1103), MobPos = CFrame.new(6710, 427, 115)}
        elseif level <= 1649 then
            return {Name = "Female Islander", Quest = "AmazonQuest2", QuestLevel = 1, QuestPos = CFrame.new(5447, 602, 750), MobPos = CFrame.new(4647, 793, 777)}
        elseif level <= 1699 then
            return {Name = "Giant Islander", Quest = "AmazonQuest2", QuestLevel = 2, QuestPos = CFrame.new(5447, 602, 750), MobPos = CFrame.new(4921, 670, -9)}
        elseif level <= 1724 then
            return {Name = "Marine Commodore", Quest = "MarineTreeIsland", QuestLevel = 1, QuestPos = CFrame.new(2179, 29, -6739), MobPos = CFrame.new(2440, 127, -7373)}
        elseif level <= 1774 then
            return {Name = "Marine Rear Admiral", Quest = "MarineTreeIsland", QuestLevel = 2, QuestPos = CFrame.new(2179, 29, -6739), MobPos = CFrame.new(3786, 192, -7080)}
        elseif level <= 1799 then
            return {Name = "Fishman Raider", Quest = "DeepForestIsland3", QuestLevel = 1, QuestPos = CFrame.new(-10585, 332, -8759), MobPos = CFrame.new(-10532, 375, -8267)}
        elseif level <= 1824 then
            return {Name = "Fishman Captain", Quest = "DeepForestIsland3", QuestLevel = 2, QuestPos = CFrame.new(-10585, 332, -8759), MobPos = CFrame.new(-10308, 376, -8790)}
        elseif level <= 1849 then
            return {Name = "Forest Pirate", Quest = "DeepForestIsland", QuestLevel = 1, QuestPos = CFrame.new(-13234, 333, -7627), MobPos = CFrame.new(-13498, 391, -7908)}
        elseif level <= 1899 then
            return {Name = "Mythological Pirate", Quest = "DeepForestIsland", QuestLevel = 2, QuestPos = CFrame.new(-13234, 333, -7627), MobPos = CFrame.new(-13506, 581, -6984)}
        elseif level <= 1924 then
            return {Name = "Jungle Pirate", Quest = "DeepForestIsland2", QuestLevel = 1, QuestPos = CFrame.new(-12683, 391, -9901), MobPos = CFrame.new(-12091, 448, -10562)}
        elseif level <= 1974 then
            return {Name = "Musketeer Pirate", Quest = "DeepForestIsland2", QuestLevel = 2, QuestPos = CFrame.new(-12683, 391, -9901), MobPos = CFrame.new(-13335, 447, -9916)}
        elseif level <= 1999 then
            return {Name = "Reborn Skeleton", Quest = "HauntedQuest1", QuestLevel = 1, QuestPos = CFrame.new(-9481, 142, 5568), MobPos = CFrame.new(-8762, 177, 6178)}
        elseif level <= 2024 then
            return {Name = "Living Zombie", Quest = "HauntedQuest1", QuestLevel = 2, QuestPos = CFrame.new(-9481, 142, 5568), MobPos = CFrame.new(-10081, 238, 5915)}
        elseif level <= 2049 then
            return {Name = "Demonic Soul", Quest = "HauntedQuest2", QuestLevel = 1, QuestPos = CFrame.new(-9515, 172, 6078), MobPos = CFrame.new(-9568, 205, 6042)}
        elseif level <= 2074 then
            return {Name = "Posessed Mummy", Quest = "HauntedQuest2", QuestLevel = 2, QuestPos = CFrame.new(-9515, 172, 6078), MobPos = CFrame.new(-9683, 30, 6359)}
        elseif level <= 2099 then
            return {Name = "Peanut Scout", Quest = "NutsIslandQuest", QuestLevel = 1, QuestPos = CFrame.new(-2103, 38, -10192), MobPos = CFrame.new(-1938, 93, -10194)}
        elseif level <= 2124 then
            return {Name = "Peanut President", Quest = "NutsIslandQuest", QuestLevel = 2, QuestPos = CFrame.new(-2103, 38, -10192), MobPos = CFrame.new(-1955, 81, -10534)}
        elseif level <= 2149 then
            return {Name = "Ice Cream Chef", Quest = "IceCreamIslandQuest", QuestLevel = 1, QuestPos = CFrame.new(-819, 66, -10965), MobPos = CFrame.new(-875, 119, -11034)}
        elseif level <= 2199 then
            return {Name = "Ice Cream Commander", Quest = "IceCreamIslandQuest", QuestLevel = 2, QuestPos = CFrame.new(-819, 66, -10965), MobPos = CFrame.new(-697, 173, -11213)}
        elseif level <= 2249 then
            return {Name = "Cookie Crafter", Quest = "CakeQuest1", QuestLevel = 1, QuestPos = CFrame.new(-2021, 38, -12030), MobPos = CFrame.new(-2289, 92, -12042)}
        elseif level <= 2274 then
            return {Name = "Baking Staff", Quest = "CakeQuest2", QuestLevel = 1, QuestPos = CFrame.new(-1930, 38, -12840), MobPos = CFrame.new(-1770, 81, -12207)}
        elseif level <= 2299 then
            return {Name = "Head Baker", Quest = "CakeQuest2", QuestLevel = 2, QuestPos = CFrame.new(-1930, 38, -12840), MobPos = CFrame.new(-2314, 106, -12929)}
        elseif level <= 2324 then
            return {Name = "Cocoa Warrior", Quest = "ChocQuest1", QuestLevel = 1, QuestPos = CFrame.new(233, 25, -12198), MobPos = CFrame.new(142, 69, -12255)}
        elseif level <= 2349 then
            return {Name = "Chocolate Bar Battler", Quest = "ChocQuest1", QuestLevel = 2, QuestPos = CFrame.new(233, 25, -12198), MobPos = CFrame.new(602, 74, -12582)}
        elseif level <= 2374 then
            return {Name = "Sweet Thief", Quest = "ChocQuest2", QuestLevel = 1, QuestPos = CFrame.new(149, 25, -12774), MobPos = CFrame.new(-99, 141, -12261)}
        elseif level <= 2399 then
            return {Name = "Candy Rebel", Quest = "ChocQuest2", QuestLevel = 2, QuestPos = CFrame.new(149, 25, -12774), MobPos = CFrame.new(723, 67, -12590)}
        elseif level <= 2424 then
            return {Name = "Candy Pirate", Quest = "CandyQuest1", QuestLevel = 1, QuestPos = CFrame.new(-1147, 14, -14446), MobPos = CFrame.new(-1409, 71, -14846)}
        elseif level <= 2449 then
            return {Name = "Snow Demon", Quest = "CandyQuest1", QuestLevel = 2, QuestPos = CFrame.new(-1147, 14, -14446), MobPos = CFrame.new(-847, 115, -14409)}
        elseif level <= 2474 then
            return {Name = "Isle Outlaw", Quest = "TikiQuest1", QuestLevel = 1, QuestPos = CFrame.new(-16547, 56, -174), MobPos = CFrame.new(-16303, 138, -148)}
        elseif level <= 2499 then
            return {Name = "Island Boy", Quest = "TikiQuest1", QuestLevel = 2, QuestPos = CFrame.new(-16546, 56, -174), MobPos = CFrame.new(-16851, 193, -150)}
        elseif level <= 2524 then
            return {Name = "Sun-Kissed Warrior", Quest = "TikiQuest2", QuestLevel = 1, QuestPos = CFrame.new(-16539, 56, 1052), MobPos = CFrame.new(-16404, 161, 1017)}
        elseif level <= 2550 then
            return {Name = "Isle Champion", Quest = "TikiQuest2", QuestLevel = 2, QuestPos = CFrame.new(-16539, 56, 1052), MobPos = CFrame.new(-16747, 128, 1013)}
        end
    end
    
    return nil
end

-- ====== HÀM NÂNG CẤP ======
local function AutoUpgradeStats()
    if not _G.KaitunConfig.AutoBuyStats then return end
    
    local points = Player.Data and Player.Data.Points and Player.Data.Points.Value or 0
    if points <= 0 then return end
    
    -- Ưu tiên nâng Melee và Defense trước
    local stats = {
        {Name = "Melee", Value = Player.Data.Melee and Player.Data.Melee.Value or 0},
        {Name = "Defense", Value = Player.Data.Defense and Player.Data.Defense.Value or 0},
        {Name = "Sword", Value = Player.Data.Sword and Player.Data.Sword.Value or 0},
        {Name = "Demon Fruit", Value = Player.Data["Demon Fruit"] and Player.Data["Demon Fruit"].Value or 0},
    }
    
    -- Tìm stat thấp nhất để nâng
    local lowest = stats[1]
    for _, stat in ipairs(stats) do
        if stat.Value < lowest.Value then
            lowest = stat
        end
    end
    
    ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", lowest.Name, points)
    task.wait(0.3)
end

-- ====== HÀM MUA FIGHTING STYLE ======
local FightingStyles = {
    -- Sea 1
    {Name = "BlackLeg", NPC = "Dark Step Teacher", Cost = 2500, Position = CFrame.new(-1442, 29, -28), Sea = 1},
    {Name = "Electro", NPC = "Mad Scientist", Cost = 5000, Position = CFrame.new(-4885, 718, -2592), Sea = 1},
    {Name = "FishmanKarate", NPC = "Water Kung-fu Teacher", Cost = 7500, Position = CFrame.new(62068, 5, 1417), Sea = 1},
    
    -- Sea 2
    {Name = "DragonClaw", NPC = "Sabi", Cost = 150000, Position = CFrame.new(-2391, 73, -3637), Sea = 2},
    {Name = "DeathStep", NPC = "Phoeyu, the Reformed", Cost = 250000, Position = CFrame.new(-2824, 73, -3528), Sea = 2},
    {Name = "SharkmanKarate", NPC = "Sharkman Teacher", Cost = 500000, Position = CFrame.new(-2508, 73, -4210), Sea = 2},
    {Name = "ElectricClaw", NPC = "Previous Hero", Cost = 500000, Position = CFrame.new(-6010, 73, -3556), Sea = 2},
    
    -- Sea 3
    {Name = "DragonTalon", NPC = "Uzoth", Cost = 3000000, Position = CFrame.new(-11040, 355, -8412), Sea = 3},
    {Name = "Superhuman", NPC = "Martial Arts Master", Cost = 3000000, Position = CFrame.new(-5833, 73, -4290), Sea = 2},
    {Name = "Godhuman", NPC = "Ancient Monk", Cost = 5000000, Position = CFrame.new(-11341, 330, -8576), Sea = 3},
    {Name = "SanguineArt", NPC = "Shafi", Cost = 5000000, Position = CFrame.new(-9786, 157, 6260), Sea = 3},
}

local function CheckStyleRequirements(styleName)
    local styleData
    for _, s in ipairs(FightingStyles) do
        if s.Name == styleName then
            styleData = s
            break
        end
    end
    if not styleData then return false end
    
    -- Kiểm tra level yêu cầu
    local requirements = {
        BlackLeg = 1,
        Electro = 30,
        FishmanKarate = 50,
        DragonClaw = 300,
        DeathStep = 400,
        SharkmanKarate = 500,
        ElectricClaw = 600,
        DragonTalon = 1500,
        Superhuman = 700,
        Godhuman = 1500,
        SanguineArt = 2000,
    }
    
    local requiredLevel = requirements[styleName] or 1
    if GetLevel() < requiredLevel then return false end
    
    -- Kiểm tra tiền
    local money = Player.Data and Player.Data.Beli and Player.Data.Beli.Value or 0
    if money < styleData.Cost then return false end
    
    return true
end

local function BuyFightingStyle(styleName)
    if not _G.KaitunConfig.AutoBuyFightingStyle then return end
    
    -- Kiểm tra đã có style chưa
    if Player.Backpack:FindFirstChild(styleName) or Player.Character:FindFirstChild(styleName) then
        return true
    end
    
    -- Tìm NPC tương ứng
    for _, style in ipairs(FightingStyles) do
        if style.Name == styleName then
            if CheckStyleRequirements(styleName) then
                local npc = Workspace.NPCs:FindFirstChild(style.NPC)
                if npc and npc:FindFirstChild("HumanoidRootPart") then
                    Teleport(npc.HumanoidRootPart.CFrame)
                    task.wait(1)
                    
                    -- Mua style
                    local success, result = pcall(function()
                        return ReplicatedStorage.Remotes.CommF_:InvokeServer("Buy" .. styleName)
                    end)
                    
                    if success then
                        print("✅ Đã mua fighting style: " .. styleName)
                        return true
                    end
                    
                    -- Thử cách khác cho DragonClaw
                    if styleName == "DragonClaw" then
                        pcall(function()
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
                            task.wait(0.5)
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
                        end)
                    end
                end
            end
            break
        end
    end
    return false
end

-- ====== AUTO GODHUMAN ======
local function AutoGodhuman()
    if not _G.KaitunConfig.Godhuman.Enabled then return end
    
    -- Chỉ chạy khi level >= 1500
    if GetLevel() < 1500 then return end
    
    -- Kiểm tra đã có Godhuman chưa
    if Player.Backpack:FindFirstChild("Godhuman") or Player.Character:FindFirstChild("Godhuman") then
        return
    end
    
    print("🔄 Bắt đầu tiến trình lên Godhuman...")
    
    -- 1. Mua Superhuman trước
    if not BuyFightingStyle("Superhuman") then
        print("⚠️ Chưa có Superhuman, đang mua...")
        if not Player.Backpack:FindFirstChild("Superhuman") and not Player.Character:FindFirstChild("Superhuman") then
            -- Cần đủ điều kiện mua Superhuman
            print("📌 Cần: Level 700+, 3,000,000 Beli, có các style cơ bản")
            return
        end
    end
    
    -- 2. Kiểm tra các yêu cầu cho Godhuman
    local requiredStyles = {"BlackLeg", "Electro", "FishmanKarate", "DragonClaw", "DeathStep", "SharkmanKarate", "ElectricClaw", "DragonTalon", "Superhuman"}
    local hasAllStyles = true
    
    for _, style in ipairs(requiredStyles) do
        if not Player.Backpack:FindFirstChild(style) and not Player.Character:FindFirstChild(style) then
            print("📌 Thiếu style: " .. style .. " - Đang mua...")
            BuyFightingStyle(style)
            hasAllStyles = false
        end
    end
    
    -- 3. Kiểm tra tiền mua Godhuman
    local money = Player.Data and Player.Data.Beli and Player.Data.Beli.Value or 0
    if money < 5000000 then
        print("⚠️ Cần 5,000,000 Beli để mua Godhuman, đ
