-- =====================================================================
-- KAITUN BLOX FRUITS COMPLETE - FARM Lv1 TO MAX + GODHUMAN
-- ĐÃ FIX TOÀN BỘ: Auto Team, Farm, Attack, Stats, Equip
-- =====================================================================

if not game:IsLoaded() then
    game.Loaded:Wait()
end

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
getgenv().KaitunSettings = {
    Team = "Pirates",
    AutoLevel = true,
    FastAttack = true,
    AutoGodhuman = true,
    AutoStats = true,
    StatsType = "Melee",
    AutoBusoHaki = true,
    AutoKenHaki = true,
    AttackHeight = 15,
    HopServerAfterLevel = false,
    TargetMaxLevel = 2550,
}

-- ==================== ANTI-AFK ====================
LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
end)

-- ==================== BIẾN TOÀN CỤC ====================
local _Running = true
local _TeamChosen = false
local _CurrentTarget = nil

-- ==================== HÀM TIỆN ÍCH ====================

local function GetChar()
    return LocalPlayer.Character
end

local function GetRoot()
    local char = GetChar()
    if char then
        return char:FindFirstChild("HumanoidRootPart")
    end
    return nil
end

local function GetHumanoid()
    local char = GetChar()
    if char then
        return char:FindFirstChild("Humanoid")
    end
    return nil
end

local function GetPlayerLevel()
    local success, level = pcall(function()
        return LocalPlayer.Data.Level.Value
    end)
    if success then
        return level
    end
    return 1
end

local function GetPlayerBeli()
    local success, beli = pcall(function()
        return LocalPlayer.Data.Beli.Value
    end)
    if success then
        return beli
    end
    return 0
end

local function GetPlayerFragments()
    local success, frag = pcall(function()
        return LocalPlayer.Data.Fragments.Value
    end)
    if success then
        return frag
    end
    return 0
end

-- ==================== BẢNG QUEST THEO LEVEL ====================
-- Mỗi entry: {MinLevel, MaxLevel, QuestName, QuestLevelArg, MobName, Island/AreaCFrame}
-- QuestName = tên quest gửi lên server
-- MobName = tên mob cần giết (match trong Workspace.Enemies)

local QuestTable = {
    -- ===== SEA 1 (First Sea) =====
    {1, 9, "BanditQuest1", 1, "Bandit", CFrame.new(-1142, 5, 3830)},
    {10, 14, "BanditQuest1", 2, "Bandit", CFrame.new(-1142, 5, 3830)},
    {15, 29, "MonkeyQuest1", 1, "Monkey", CFrame.new(-1456, 36, 563)},
    {30, 39, "MonkeyQuest1", 2, "Gorilla", CFrame.new(-1456, 36, 563)},
    {40, 59, "PirateQuest1", 1, "Pirate", CFrame.new(-1185, 5, 4308)},
    {60, 74, "BuggyQuest1", 1, "Brute", CFrame.new(-1135, 5, 4253)},
    {75, 89, "MarineQuest1", 1, "Marine Recruit", CFrame.new(-2590, 7, 2060)},
    {90, 99, "MarineQuest1", 2, "Marine Corporal", CFrame.new(-2590, 7, 2060)},
    {100, 119, "SkyExp1Quest", 1, "Sky Bandit", CFrame.new(-4863, 717, -2622)},
    {120, 149, "SkyExp1Quest", 2, "Dark Master", CFrame.new(-4863, 717, -2622)},
    {150, 174, "PirateQuest2", 1, "Pirate", CFrame.new(-1185, 5, 4308)},
    {175, 199, "GreenZoneQuest", 1, "Toga Warrior", CFrame.new(-2354, 73, -3153)},
    {200, 224, "GreenZoneQuest", 2, "Lizard Warrior", CFrame.new(-2354, 73, -3153)},
    {225, 249, "PiratePortQuest", 1, "Pirate", CFrame.new(-289, 44, 4345)},
    {250, 274, "PiratePortQuest", 2, "Brute", CFrame.new(-289, 44, 4345)},
    {275, 299, "DesertQuest1", 1, "Desert Bandit", CFrame.new(912, 6, 4407)},
    {300, 324, "DesertQuest1", 2, "Desert Officer", CFrame.new(912, 6, 4407)},
    {325, 374, "SnowQuest1", 1, "Snow Bandit", CFrame.new(1352, 87, -1308)},
    {375, 399, "SnowQuest1", 2, "Snowman", CFrame.new(1352, 87, -1308)},
    {400, 449, "IceSideQuest", 1, "Chief Petty Officer", CFrame.new(5275, 5, 5765)},
    {450, 474, "IceSideQuest", 2, "Vice Admiral", CFrame.new(5275, 5, 5765)},
    {475, 524, "FireSideQuest", 1, "Magma Ninja", CFrame.new(-5235, 12, 8516)},
    {525, 549, "FireSideQuest", 2, "Magma Ninja", CFrame.new(-5235, 12, 8516)},
    {550, 599, "SkyQuest1", 1, "Sky Bandit", CFrame.new(-4863, 717, -2622)},
    {600, 624, "SkyQuest1", 2, "Dark Master", CFrame.new(-4863, 717, -2622)},
    {625, 649, "ColosseumQuest", 1, "Toga Warrior", CFrame.new(-1580, 7, -2987)},
    {650, 699, "ColosseumQuest", 2, "Gladiator", CFrame.new(-1580, 7, -2987)},
    
    -- ===== SEA 2 (Second Sea) =====
    {700, 724, "AreaNewQuest2", 1, "Raider", CFrame.new(-429, 73, 1836)},
    {725, 774, "AreaNewQuest2", 2, "Mercenary", CFrame.new(-429, 73, 1836)},
    {775, 799, "RoseQuest1", 1, "Swan Pirate", CFrame.new(-391, 134, -184)},
    {800, 849, "RoseQuest2", 1, "Factory Staff", CFrame.new(-391, 134, -184)},
    {850, 874, "SharkQuest1", 1, "Marine Commodore", CFrame.new(-2063, 24, 801)},
    {875, 899, "SharkQuest2", 1, "Marine Rear Admiral", CFrame.new(-2063, 24, 801)},
    {900, 949, "Area2Quest1", 1, "Fishman Warrior", CFrame.new(61123, 19, 1582)},
    {950, 974, "Area2Quest1", 2, "Fishman Commando", CFrame.new(61123, 19, 1582)},
    {975, 999, "FrozenQuest1", 1, "Yeti", CFrame.new(-6068, 15, -4834)},
    {1000, 1049, "FrozenQuest2", 1, "Yeti", CFrame.new(-6068, 15, -4834)},
    {1050, 1099, "ForgottenQuest1", 1, "Ghost", CFrame.new(-3061, 296, -10466)},
    {1100, 1124, "ForgottenQuest2", 1, "Ghost", CFrame.new(-3061, 296, -10466)},
    {1125, 1174, "PirateVillageQuest1", 1, "Pirate Millionaire", CFrame.new(-289, 44, 4345)},
    {1175, 1199, "PirateVillageQuest2", 1, "Pirate Millionaire", CFrame.new(-289, 44, 4345)},
    {1200, 1249, "MinotaurQuest", 1, "Minotaur", CFrame.new(-1580, 7, -2987)},
    {1250, 1274, "ColosseumQuest2", 1, "Gladiator", CFrame.new(-1580, 7, -2987)},
    {1275, 1324, "GraveyardQuest", 1, "Zombie", CFrame.new(-5513, 9, -794)},
    {1325, 1374, "GraveyardQuest2", 1, "Vampire", CFrame.new(-5513, 9, -794)},
    {1375, 1424, "SnowMtnQuest", 1, "Snow Lurker", CFrame.new(597, 399, -5370)},
    {1425, 1474, "IceCastleQuest", 1, "Arctic Warrior", CFrame.new(5668, 30, -6484)},
    {1475, 1524, "ForgottenQuest3", 1, "Reborn Skeleton", CFrame.new(-3061, 296, -10466)},
    {1525, 1574, "LavaSideQuest", 1, "Magma Ninja", CFrame.new(-5235, 12, 8516)},
    
    -- ===== SEA 3 (Third Sea) =====
    {1575, 1624, "PortQuest3_1", 1, "Pirate", CFrame.new(-290, 6, 5347)},
    {1625, 1674, "PortQuest3_2", 1, "Pirate", CFrame.new(-290, 6, 5347)},
    {1675, 1724, "HydraQuest1", 1, "Hydra Island Pirate", CFrame.new(5245, 15, 325)},
    {1725, 1774, "HydraQuest2", 1, "Hydra Island Pirate", CFrame.new(5245, 15, 325)},
    {1775, 1824, "GreatTreeQuest1", 1, "Jungle Pirate", CFrame.new(2284, 26, -6720)},
    {1825, 1874, "GreatTreeQuest2", 1, "Jungle Pirate", CFrame.new(2284, 26, -6720)},
    {1875, 1924, "CastleQuest1", 1, "Castle Guard", CFrame.new(-5115, 296, -3350)},
    {1925, 1974, "CastleQuest2", 1, "Castle Guard", CFrame.new(-5115, 296, -3350)},
    {1975, 2024, "HauntedQuest1", 1, "Haunted Spirit", CFrame.new(-9515, 145, 5765)},
    {2025, 2074, "HauntedQuest2", 1, "Haunted Spirit", CFrame.new(-9515, 145, 5765)},
    {2075, 2124, "TikiQuest1", 1, "Tiki Warrior", CFrame.new(-12044, 332, -7565)},
    {2125, 2174, "TikiQuest2", 1, "Tiki Warrior", CFrame.new(-12044, 332, -7565)},
    {2175, 2224, "MansionQuest1", 1, "Mansion Guard", CFrame.new(-12730, 380, -7543)},
    {2225, 2274, "MansionQuest2", 1, "Mansion Guard", CFrame.new(-12730, 380, -7543)},
    {2275, 2324, "CursedQuest1", 1, "Cursed Skeleton", CFrame.new(916, 170, 33436)},
    {2325, 2374, "CursedQuest2", 1, "Cursed Skeleton", CFrame.new(916, 170, 33436)},
    {2375, 2424, "ForgottenQuest4", 1, "Reborn Skeleton", CFrame.new(-3061, 296, -10466)},
    {2425, 2474, "LeafQuest1", 1, "Leaf Island Pirate", CFrame.new(-2834, 55, -3568)},
    {2475, 2549, "LeafQuest2", 1, "Leaf Island Pirate", CFrame.new(-2834, 55, -3568)},
}

-- ==================== TÌM QUEST PHÙ HỢP VỚI LEVEL ====================
local function GetQuestForLevel(level)
    for _, quest in ipairs(QuestTable) do
        if level >= quest[1] and level <= quest[2] then
            return {
                QuestName = quest[3],
                QuestLevel = quest[4],
                MobName = quest[5],
                AreaCFrame = quest[6],
            }
        end
    end
    -- Nếu không tìm thấy quest phù hợp, dùng quest cuối cùng
    local lastQuest = QuestTable[#QuestTable]
    return {
        QuestName = lastQuest[3],
        QuestLevel = lastQuest[4],
        MobName = lastQuest[5],
        AreaCFrame = lastQuest[6],
    }
end

-- ==================== TÌM QUÁI GẦN NHẤT THEO TÊN ====================
local function FindNearestMob(mobName)
    local root = GetRoot()
    if not root then return nil end
    
    local nearestMob = nil
    local nearestDist = math.huge
    
    -- Tìm trong Enemies folder
    local enemiesFolder = Workspace:FindFirstChild("Enemies")
    if not enemiesFolder then return nil end
    
    for _, mob in pairs(enemiesFolder:GetChildren()) do
        local mobRoot = mob:FindFirstChild("HumanoidRootPart")
        local mobHum = mob:FindFirstChild("Humanoid")
        
        if mobRoot and mobHum and mobHum.Health > 0 then
            -- So sánh tên mob
            if string.find(mob.Name, mobName) or mob.Name == mobName then
                local dist = (root.Position - mobRoot.Position).Magnitude
                if dist < nearestDist then
                    nearestDist = dist
                    nearestMob = mob
                end
            end
        end
    end
    
    return nearestMob
end

-- ==================== TÌM BẤT KỲ QUÁI NÀO GẦN NHẤT ====================
local function FindAnyNearestMob()
    local root = GetRoot()
    if not root then return nil end
    
    local nearestMob = nil
    local nearestDist = math.huge
    
    local enemiesFolder = Workspace:FindFirstChild("Enemies")
    if not enemiesFolder then return nil end
    
    for _, mob in pairs(enemiesFolder:GetChildren()) do
        local mobRoot = mob:FindFirstChild("HumanoidRootPart")
        local mobHum = mob:FindFirstChild("Humanoid")
        
        if mobRoot and mobHum and mobHum.Health > 0 then
            local dist = (root.Position - mobRoot.Position).Magnitude
            if dist < nearestDist then
                nearestDist = dist
                nearestMob = mob
            end
        end
    end
    
    return nearestMob
end

-- ==================== TWEEN ĐẾN VỊ TRÍ ====================
local _tweening = false

local function TweenTo(targetCFrame, speed)
    local root = GetRoot()
    if not root then return end
    
    speed = speed or 200
    local distance = (root.Position - targetCFrame.Position).Magnitude
    local tweenTime = distance / speed
    if tweenTime < 0.1 then tweenTime = 0.1 end
    if tweenTime > 15 then tweenTime = 15 end
    
    _tweening = true
    local tweenInfo = TweenInfo.new(tweenTime, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(root, tweenInfo, {CFrame = targetCFrame})
    tween:Play()
    tween.Completed:Wait()
    _tweening = false
end

local function TweenToFast(targetCFrame)
    local root = GetRoot()
    if not root then return end
    root.CFrame = targetCFrame
end

-- ==================== TẤN CÔNG (CLICK CHUỘT) ====================
local function ClickAttack()
    -- Giả lập click chuột trái để đánh
    pcall(function()
        -- Cách 1: VirtualInputManager
        VirtualInputManager:SendMouseButtonEvent(
            Workspace.CurrentCamera.ViewportSize.X / 2,
            Workspace.CurrentCamera.ViewportSize.Y / 2,
            0, true, game, 1
        )
        task.wait()
        VirtualInputManager:SendMouseButtonEvent(
            Workspace.CurrentCamera.ViewportSize.X / 2,
            Workspace.CurrentCamera.ViewportSize.Y / 2,
            0, false, game, 1
        )
    end)
end

-- ==================== CHỌN TEAM ====================
local function ChooseTeam()
    pcall(function()
        local team = getgenv().KaitunSettings.Team
        -- Cách 1: Gọi remote
        ReplicatedStorage.Remotes.CommF_:InvokeServer("SetTeam", team)
    end)
end

-- ==================== NHẬN QUEST ====================
local function HasQuest(questName)
    -- Kiểm tra xem đã có quest chưa
    local success, result = pcall(function()
        local questGui = LocalPlayer.PlayerGui:FindFirstChild("Main")
        if questGui then
            local questFrame = questGui:FindFirstChild("Quest")
            if questFrame and questFrame.Visible then
                return true
            end
        end
        return false
    end)
    return success and result
end

local function StartQuest(questName, questLevel)
    pcall(function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", questName, questLevel)
    end)
end

-- ==================== AUTO STATS ====================
local function DoAutoStats()
    if not getgenv().KaitunSettings.AutoStats then return end
    pcall(function()
        local statsType = getgenv().KaitunSettings.StatsType
        -- Thêm nhiều điểm cùng lúc
        for i = 1, 3 do
            ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", statsType, 1)
        end
    end)
end

-- ==================== AUTO BUSO HAKI ====================
local function DoBusoHaki()
    if not getgenv().KaitunSettings.AutoBusoHaki then return end
    pcall(function()
        local char = GetChar()
        if char then
            local hasBuso = char:FindFirstChild("HasBuso")
            if not hasBuso or hasBuso.Value == false then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
            end
        end
    end)
end

-- ==================== AUTO KEN HAKI ====================
local function DoKenHaki()
    if not getgenv().KaitunSettings.AutoKenHaki then return end
    pcall(function()
        local char = GetChar()
        if char then
            local hasKen = char:FindFirstChild("HasKen")
            if not hasKen or hasKen.Value == false then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("Ken")
            end
        end
    end)
end

-- ==================== AUTO EQUIP TOOL ====================
local function EquipTool(toolName)
    pcall(function()
        local char = GetChar()
        if not char then return end
        
        -- Tìm tool trong backpack
        for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
            if tool:IsA("Tool") and string.find(tool.Name:lower(), toolName:lower()) then
                tool.Parent = char
                return
            end
        end
    end)
end

local function EquipBestMelee()
    pcall(function()
        local char = GetChar()
        if not char then return end
        
        -- Danh sách melee ưu tiên (từ tốt nhất đến tệ nhất)
        local meleeList = {
            "Godhuman", "Dragon Talon", "Electric Claw",
            "Sharkman Karate", "Death Step", "Superhuman",
            "Dragon Breath", "Electric", "Water Kung Fu",
            "Dark Step", "Black Leg", "Combat"
        }
        
        -- Tìm và trang bị melee tốt nhất
        for _, meleeName in ipairs(meleeList) do
            -- Kiểm tra trong backpack
            for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                if tool:IsA("Tool") and tool.Name == meleeName then
                    tool.Parent = char
                    return
                end
            end
            -- Kiểm tra đã trang bị chưa
            for _, tool in pairs(char:GetChildren()) do
                if tool:IsA("Tool") and tool.Name == meleeName then
                    return -- Đã trang bị rồi
                end
            end
        end
    end)
end

-- ==================== TELEPORT GIỮA CÁC SEA ====================
local function GetCurrentSea()
    -- Kiểm tra sea hiện tại dựa trên PlaceId
    local placeId = game.PlaceId
    if placeId == 2753915549 then return 1 end   -- First Sea
    if placeId == 4442272183 then return 2 end   -- Second Sea
    if placeId == 7449423635 then return 3 end   -- Third Sea
    return 1
end

local function GetRequiredSea(level)
    if level < 700 then return 1 end
    if level < 1575 then return 2 end
    return 3
end

local function TeleportToSea(seaNumber)
    pcall(function()
        local placeIds = {
            [1] = 2753915549,
            [2] = 4442272183,
            [3] = 7449423635,
        }
        local targetPlaceId = placeIds[seaNumber]
        if targetPlaceId and targetPlaceId ~= game.PlaceId then
            TeleportService:Teleport(targetPlaceId)
        end
    end)
end

-- ==================== HOP SERVER ====================
local function HopServer()
    pcall(function()
        local servers = {}
        local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
        local data = HttpService:JSONDecode(game:HttpGet(url))
        for _, server in pairs(data.data) do
            if type(server) == "table" and server.playing and server.playing < server.maxPlayers and server.id ~= game.JobId then
                table.insert(servers, server.id)
            end
        end
        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)])
        end
    end)
end

-- ==================== NO CLIP (để không bị kẹt) ====================
task.spawn(function()
    RunService.Stepped:Connect(function()
        pcall(function()
            local char = GetChar()
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end)
end)

-- ==================== LOOP CHỌN TEAM ====================
task.spawn(function()
    while _Running do
        task.wait(1)
        if not _TeamChosen then
            pcall(function()
                -- Kiểm tra GUI chọn team
                local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
                if playerGui then
                    local mainGui = playerGui:FindFirstChild("Main")
                    if mainGui then
                        local chooseTeam = mainGui:FindFirstChild("ChooseTeam")
                        if chooseTeam and chooseTeam.Visible then
                            -- Click nút team
                            local team = getgenv().KaitunSettings.Team
                            if team == "Pirates" then
                                -- Tìm nút Pirates
                                for _, btn in pairs(chooseTeam:GetDescendants()) do
                                    if btn:IsA("TextButton") or btn:IsA("ImageButton") then
                                        if string.find(btn.Name:lower(), "pirate") or 
                                           (btn:FindFirstChild("Title") and string.find(btn.Title.Text:lower(), "pirate")) then
                                            -- Fire click
                                            firesignal(btn.MouseButton1Click)
                                            _TeamChosen = true
                                            break
                                        end
                                    end
                                end
                            elseif team == "Marines" then
                                for _, btn in pairs(chooseTeam:GetDescendants()) do
                                    if btn:IsA("TextButton") or btn:IsA("ImageButton") then
                                        if string.find(btn.Name:lower(), "marine") or 
                                           (btn:FindFirstChild("Title") and string.find(btn.Title.Text:lower(), "marine")) then
                                            firesignal(btn.MouseButton1Click)
                                            _TeamChosen = true
                                            break
                                        end
                                    end
                                end
                            end
                            
                            -- Cách 2: Gọi remote trực tiếp
                            if not _TeamChosen then
                                ChooseTeam()
                                task.wait(2)
                                -- Kiểm tra lại
                                if not chooseTeam.Visible then
                                    _TeamChosen = true
                                end
                            end
                        else
                            _TeamChosen = true -- Đã chọn team rồi
                        end
                    end
                end
            end)
        end
    end
end)

-- ==================== LOOP AUTO STATS ====================
task.spawn(function()
    while _Running do
        task.wait(0.5)
        pcall(DoAutoStats)
    end
end)

-- ==================== LOOP BUSO + KEN HAKI ====================
task.spawn(function()
    while _Running do
        task.wait(3)
        pcall(DoBusoHaki)
        pcall(DoKenHaki)
    end
end)

-- ==================== LOOP EQUIP MELEE ====================
task.spawn(function()
    while _Running do
        task.wait(5)
        pcall(EquipBestMelee)
    end
end)

-- ==================== MAIN FARM LOOP ====================
task.spawn(function()
    -- Chờ game load hoàn toàn
    task.wait(5)
    
    while _Running do
        task.wait(0.1)
        pcall(function()
            if not getgenv().KaitunSettings.AutoLevel then return end
            
            local char = GetChar()
            local root = GetRoot()
            local hum = GetHumanoid()
            if not char or not root or not hum or hum.Health <= 0 then
                task.wait(2)
                return
            end
            
            local playerLevel = GetPlayerLevel()
            
            -- Kiểm tra sea
            local requiredSea = GetRequiredSea(playerLevel)
            local currentSea = GetCurrentSea()
            if requiredSea ~= currentSea then
                print("[Kaitun] Cần chuyển sang Sea " .. requiredSea .. "!")
                TeleportToSea(requiredSea)
                task.wait(10)
                return
            end
            
            -- Lấy quest phù hợp với level
            local questData = GetQuestForLevel(playerLevel)
            if not questData then
                print("[Kaitun] Không tìm thấy quest cho level " .. playerLevel)
                task.wait(3)
                return
            end
            
            -- Kiểm tra có quest chưa, nếu chưa thì nhận quest
            local questStarted = false
            pcall(function()
                local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
                if playerGui then
                    local mainGui = playerGui:FindFirstChild("Main")
                    if mainGui then
                        local questFrame = mainGui:FindFirstChild("Quest")
                        if questFrame and questFrame.Visible then
                            -- Kiểm tra nội dung quest
                            local container = questFrame:FindFirstChild("Container")
                            if container then
                                local questTitle = container:FindFirstChild("QuestTitle")
                                if questTitle then
                                    questStarted = true
                                end
                            end
                        end
                    end
                end
            end)
            
            -- Nhận quest nếu chưa có
            if not questStarted then
                -- Tween đến khu vực quest
                print("[Kaitun] Đang di chuyển đến khu vực quest: " .. questData.QuestName)
                TweenTo(questData.AreaCFrame * CFrame.new(0, 30, 0), 250)
                task.wait(1)
                
                -- Nhận quest
                StartQuest(questData.QuestName, questData.QuestLevel)
                task.wait(1)
                StartQuest(questData.QuestName, questData.QuestLevel) -- Gọi 2 lần cho chắc
                task.wait(0.5)
            end
            
            -- Tìm mob phù hợp
            local targetMob = FindNearestMob(questData.MobName)
            
            -- Nếu không tìm thấy mob theo tên, tìm bất kỳ mob nào gần nhất
            if not targetMob then
                targetMob = FindAnyNearestMob()
            end
            
            -- Nếu vẫn không có mob, tween đến khu vực quest
            if not targetMob then
                print("[Kaitun] Không tìm thấy mob, di chuyển đến khu vực quest...")
                TweenTo(questData.AreaCFrame * CFrame.new(0, 30, 0), 250)
                task.wait(2)
                return
            end
            
            _CurrentTarget = targetMob
            
            -- Farm mob
            local mobRoot = targetMob:FindFirstChild("HumanoidRootPart")
            local mobHum = targetMob:FindFirstChild("Humanoid")
            
            if mobRoot and mobHum and mobHum.Health > 0 then
                -- Tween lên trên đầu quái
                local attackHeight = getgenv().KaitunSettings.AttackHeight
                local targetCFrame = mobRoot.CFrame * CFrame.new(0, attackHeight, 0)
                
                -- Di chuyển nhanh đến quái
                root.CFrame = targetCFrame
                
                -- Giữ vị trí trên đầu quái và đánh
                local attackStartTime = tick()
                while targetMob and targetMob.Parent and mobHum and mobHum.Health > 0 and _Running do
                    -- Cập nhật vị trí
                    root = GetRoot()
                    if not root then break end
                    
                    mobRoot = targetMob:FindFirstChild("HumanoidRootPart")
                    mobHum = targetMob:FindFirstChild("Humanoid")
                    if not mobRoot or not mobHum or mobHum.Health <= 0 then break end
                    
                    -- Giữ vị trí trên đầu quái
                    root.CFrame = mobRoot.CFrame * CFrame.new(0, attackHeight, 0)
                    root.Velocity = Vector3.new(0, 0, 0)
                    
                    -- Tấn công
                    ClickAttack()
                    
                    -- Bật Buso Haki
                    DoBusoHaki()
                    
                    -- Timeout sau 30 giây
                    if tick() - attackStartTime > 30 then
                        print("[Kaitun] Timeout đánh mob, chuyển target...")
                        break
                    end
                    
                    task.wait(0.15)
                end
            end
            
            _CurrentTarget = nil
        end)
    end
end)

-- ==================== ANTI-STUCK ====================
task.spawn(function()
    local lastLevel = GetPlayerLevel()
    local lastLevelChangeTime = tick()
    
    while _Running do
        task.wait(10)
        pcall(function()
            local currentLevel = GetPlayerLevel()
            if currentLevel ~= lastLevel then
                lastLevel = currentLevel
                lastLevelChangeTime = tick()
                print("[Kaitun] Level: " .. currentLevel)
            end
            
            -- Nếu 5 phút không lên level -> có thể bị kẹt
            if tick() - lastLevelChangeTime > 300 then
                print("[Kaitun] Có thể bị kẹt, đang reset...")
                local root = GetRoot()
                if root then
                    root.CFrame = root.CFrame * CFrame.new(0, 100, 0)
                end
                lastLevelChangeTime = tick()
            end
        end)
    end
end)

-- ==================== AUTO GODHUMAN (kiểm tra định kỳ) ====================
task.spawn(function()
    while _Running do
        task.wait(60)
        pcall(function()
            if not getgenv().KaitunSettings.AutoGodhuman then return end
            local level = GetPlayerLevel()
            if level >= 2000 then
                -- Kiểm tra đã có Godhuman chưa
                local hasGodhuman = false
                for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if tool.Name == "Godhuman" then hasGodhuman = true break end
                end
                if not hasGodhuman and GetChar() then
                    for _, tool in pairs(GetChar():GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Godhuman" then hasGodhuman = true break end
                    end
                end
                
                if not hasGodhuman then
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyGodhuman")
                end
            end
        end)
    end
end)

-- ==================== HOP SERVER (nếu bật) ====================
task.spawn(function()
    while _Running do
        task.wait(30)
        pcall(function()
            if getgenv().KaitunSettings.HopServerAfterLevel then
                local level = GetPlayerLevel()
                if level >= getgenv().KaitunSettings.TargetMaxLevel then
                    print("[Kaitun] Đã đạt max level! Hop server...")
                    HopServer()
                end
            end
        end)
    end
end)

-- ==================== THÔNG BÁO ====================
print("╔══════════════════════════════════════════════════════╗")
print("║     KAITUN BLOX FRUITS - FIXED COMPLETE SCRIPT      ║")
print("║     Auto Farm + Attack + Quest + Team + Stats       ║")
print("║     Level 1 to Max - All Features Active            ║")
print("╚══════════════════════════════════════════════════════╝")
print("[Kaitun] Script loaded! Current Level: " .. GetPlayerLevel())
print("[Kaitun] Current Sea: " .. GetCurrentSea())
print("[Kaitun] Team: " .. getgenv().KaitunSettings.Team)
print("[Kaitun] Stats: " .. getgenv().KaitunSettings.StatsType)
print("[Kaitun] Starting auto farm...")
