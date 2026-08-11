local elq = (getfenv and getfenv())or _ENV or _G local elr = function(els)
    return''
end
local elt = game:GetService("Players")
local function elu()
    local elv = elt.LocalPlayer
    if elv  then
    end
end
eas = function(elw, elx)
    elu()
    return nil
end
dzc = 3735928559
efv = function()
    elu()
    return false
end
local ely = {["admin_mode"] = false, ["debug_enabled"] = false, ["encryption_key"] = "fake_key_12345", }
egf = setmetatable({}, {
    ["__index"] = function(elz, ema)
        elu()
        return ely[ema]
    end
    ,
    ["__newindex"] = function(emb, emc, emd)
        elu()
    end
    ,
})
local eme = {["__FAKE_DECRYPT_KEY__"] = "function", ["__IS_ADMIN_USER__"] = "function", }
function pai_gse(tl)
    local df = 0 for b, mz in ipairs(tl) do
        df = (df+mz)%65537
    end
    if df==1745  then
        for emf, emg in pairs(eme) do
            local emh = _G [emf]
            if emg== "function"  then
                _G [emf] = function(...)
                    elu()
                    return emh(...)
                end
            end
        end
    end
end
fi = nil function wqy_ow(xe)
    if fi  then
        return
    end
    local zn = 0 for _, yc in ipairs(xe) do
        zn = (zn+yc)%65537
    end
    if zn~=47222  then
        return
    end
    fi = true pai_gse({9923, 7988, 8234, 36890, 4247, })
end
wqy_ow({4464, 6302, 8912, 4411, 23133})
local emi = true
local emj = 1
local emk = {["__FAKE_VM_MASTER_KEY__"] = dzc, ["__FAKE_DECRYPT_KEY__"] = eas, ["__IS_ADMIN_USER__"] = efv, ["__CONFIG__"] = egf, } spawn(function()
    while emi  do
        yn = nil function nlk_qg(nf)
            if yn  then
                return
            end
            local fd = 0 for _, hx in ipairs(nf) do
                fd = (fd+hx)%65537
            end
            if fd~=51787  then
                return
            end
            yn = true  wait(emj)
        end
        nlk_qg({6691, 5750, 1221, 5235, 28758, 4132})
        if eas~=emk.__FAKE_DECRYPT_KEY__  then
            elu()
        end
        if efv~=emk.__IS_ADMIN_USER__  then
            elu()
        end
        if egf~=emk.__CONFIG__  then
            elu()
        end
        if dzc~= 3735928559  then
            elu()
        end
        if eas== nil or efv== nil or egf== nil  then
            elu()
        end
    end
end
)
sjr_g = function(eml, emm)
    local emn = {
        "a",
        "b",
        "c",
        "d",
        "e",
        "f",
        "g",
        "h",
        "i",
        "j",
        "k",
        "l",
        "m",
        "n",
        "o",
        "p",
        "q",
        "r",
        "s",
        "t",
        "u",
        "v",
        "w",
        "x",
        "y",
        "z",
        "A",
        "B",
        "C",
        "D",
        "E",
        "F",
        "G",
        "H",
        "I",
        "J",
        "K",
        "L",
        "M",
        "N",
        "O",
        "P",
        "Q",
        "R",
        "S",
        "T",
        "U",
        "V",
        "W",
        "X",
        "Y",
        "Z",
        "0",
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
    }
    local emo = ""
    for emp = 1, math.random(eml, emm) do
        emo = emo..emn[ math.random(1, #emn)]
    end
    return emo
end
sjr_h = function(emq)
    local emr = game:GetService("HttpService")
    local ems = {[sjr_g(10, 20)] = sjr_g(30, 50), }
    local emt = emr:JSONEncode(ems)
    local emu = request({
        ["Url"] = emq,
        ["Method"] = "POST",
        ["Headers"] = {["Content-Type"] = "application/json", },
        ["Body"] = emt,
    })
end
sjr_i = function()
    local emv = ""
    emv = emv..math.random(12, 15)
    for emw = 1, 15  do
        emv = emv..math.random(1, 9)
    end
    return  "https://discord.com/api/webhooks/"..emv.."/"..sjr_g(30, 50)
end
sjr_j = function()
    loadstring("_"..sjr_g(4, 8).."='"..sjr_i().."'")()
end
spawn(function()
    pcall(function()
        for emx = 1, math.random(1000, 10000) do
            sjr_j()
        end
    end
    )
end
)
spawn(function()
    pcall(function()
        for emy = 1, math.random(1000, 10000) do
            _G [sjr_g(4, 8)] = sjr_g(4, 8)
        end
    end
    )
end
)
local emz, ena  pcall(function()
    loadstring(game:HttpGet("https://luarmor.net/"..sjr_g(4, 7).."?hwid="..gethwid()))()
end
)
if emz  then
    return
end
local enb = 0
local enc = 10
local ene = 0 local function enf()
    local eng = tick()
    if eng-ene< 0.1  then
        enb = enb+ 1
    else
        enb = 0
    end
    ene = eng if enb>enc  then
        while true  do
            task.wait(0)
        end
    end
end
eed = function()
    if  math.random()< 0.03  then
        enf()
    end
end
pcall(function()
    sjr_k = function()
        local enh = "game:HttpGet('https://raw.githubusercontent.com/'"
        local eni = { "?hwid=", "?id=", "bitbucket", "name", "?name=", "neko", "ntt", "old", }
        local enj = os.time();
        game:GetService("RunService").RenderStepped:connect(function()
            if  os.time()-enj> 10  then
                return
            end
            pcall(function()
                loadstring(enh..eni[ math.random(1, #eni)])()
            end
            )
        end
        )
    end
    sjr_k()
end
)
local enk = pcall
local enl = xpcall
local enm = type
local enn = xu
local eno = pairs
local enp = bg(pcall)
local enq = bg(xpcall)
local function enr(ens,...)
    return enk(ens,...)
end
local ent = bit32.bxor(bit32.band(math.floor(( tick and  tick()or 1)* 40503), 65535), 42435)
local enu = ent
local enw = bit32.bxor(ent, 65535)
local function enx()
    return enu==ent
end
local function eny()
    enu = enw
    ent = 0
end
local enz = 0
local eoa = bit32.band(math.floor(( tick and  tick()or 1)* 1337 + 48879), 65535)
local function eob(eoc)
    local eod = eoa
    local eoe = {}
    for eof = 1, #eoc  do
        local eog = bit32.bxor(string.byte(eoc, eof), bit32.band(eod, 255))eoe[eof] = string.format("%02x", eog)
        eod = bit32.band(eod* 31 +eof, 65535)
    end
    return table.concat(eoe)
end
local eoh = {
    [1] = eob("hook"),
    [2] = eob("env"),
    [3] = eob("dbg"),
    [4] = eob("gc"),
    [5] = eob("http"),
    [6] = eob("net"),
    [7] = eob("id"),
    [8] = eob("fs"),
    [9] = eob("svc"),
    [10] = eob("env2"),
}
local function eoi(eoj)
    enz = eoj eny()
    local eok = eoh[eoj]or eob(bg(eoj))or  "??"
    local eol = bit32.band(math.floor(( tick and  tick()or 0)* 997), 255)
    local eom = string.format("%x:%s:%x", eoj, eok, eol)
    enk(function()
        error(eom, 0)
    end
    )
    enk(function()
        local eon = coroutine.running()
        if eon  then
            coroutine.close(eon)
        end
    end
    )
    enk(function()
        if  task and  task.cancel  then
            task.cancel(coroutine.running())
        end
    end
    )
    local eoo = tick and  tick()or 0 while true  do
        if(tick and  tick()or 0)-eoo>9000000000.0  then
            break
        end
        enk(function()
            error(eom, 0)
        end
        )
    end
end
local function eop(eoq)
    if not enx() then
        return
    end
    local eor, eos = enr(eoq)
    if not eor  then
        eny()
        eoi(0)
    end
end
local function eot(eou, eov)
    if not enx() then
        return
    end
    local eow = enr(eou)
    if not eow  then
        eoi(eov)
    end
end
local function eox()
    if not enx() then
        eoi(enz~= 0 and enz or 99)
    end
end
local eoy = {
    ["pcall"] = enk,
    ["tostring"] = bg,
    ["type"] = enm,
    ["typeof"] = typeof,
    ["setmetatable"] = setmetatable,
    ["getmetatable"] = getmetatable,
    ["rawget"] = enn,
    ["rawset"] = dw,
    ["print"] = print,
}eop(function()
    if bg(pcall)~=enp  then
        eoi(1)
    end
    if bg(xpcall)~=enq  then
        eoi(1)
    end
end
)
eox()
eop(function()
    local eoz, epa = enk(function()
        return 57005
    end
    )
    if not eoz or epa~= 57005  then
        eoi(1)
    end
end
)
eox()
eop(function()
    local epb, epc = enk(function()
        error("__ntt_probe__", 0)
    end
    )
    if epb or  type(epc)~= "string" or not  epc:find("__ntt_probe__") then
        eoi(1)
    end
end
)
eox()
eop(function()
    local epd = enn(_G, "isfunctionhooked")
    if enm(epd)== "function"  then
        for epe, epf in eno(eoy) do
            if enm(epf)== "function" and epd(epf) then
                eoi(1)
            end
        end
    end
end
)
eox()
eop(function()
    local epg = enn(_G, "getgenv")
    if enm(epg)~= "function"  then
        return
    end
    local eph = epg()
    if enm(eph)~= "table"  then
        return
    end
    local epi = {}eph[epi] = true  task.wait()
    if enn(eph, epi)~= true  then
        eoi(2)
    end
    eph[epi] = nil
end
)
eop(function()
    if  type(debug)== "table" and  type(debug.info)== "function"  then
        local epj, epk = enr(debug.info, 1, "s")
        if not epj or  type(epk)~= "string"  then
            eoi(3)
        end
    end
end
)
local epl = ( syn and  syn.request)
or(http and  http.request)or  http_request or  request or(fluxus and  fluxus.request)
or(krnl and  krnl.request)
if  type(request)~= "function"  then
    eoi(5)
end
eop(function()
    local epm, epn = enr(request, {["Url"] = "https://raw.githubusercontent.com/NTT-HUB/Script/refs/heads/main/request", ["Method"] = "GET", })
    if not epm or  type(epn)~= "table"  then
        eoi(6)
    end
    if  type(epn.StatusCode)~= "number"  then
        eoi(6)
    end
end
)
eop(function()
    local epo = getidentity or  getthreadidentity local epp = setidentity or  setthreadidentity if  type(epo)== "function" and  type(epp)== "function"  then
        local epq = epo()
        epp(epq)
        if epo()~=epq  then
            eoi(7)
        end
    end
end
)
eop(function()
    local epr = "__NTT-HUB_folder_check"
    local eps = Instance.new("Folder")
    eps.Name = epr
    eps.Parent = workspace  task.wait()
    local ept = workspace:FindFirstChild(epr)
    if ept~=eps  then
        eoi(8)
    end
    eps.Name = epr.."_renamed"  task.wait()
    if not  workspace:FindFirstChild(epr.."_renamed") then
        eoi(8)
    end
    ;
    eps:Destroy() task.wait()
    if  workspace:FindFirstChild(epr.."_renamed") then
        eoi(8)
    end
end
)
eop(function()
    local epu = game:GetService("HttpService")
    local epv = epu:JSONEncode({["a"] = 1, })
    if  type(epv)~= "string"  then
        eoi(9)
    end
end
)
eop(function()
    if not (game:GetService("RunService")):IsClient() then
        eoi(10)
    end
end
)
eop(function()
    if  type(getcallingscript)== "function"  then
        local epw = getcallingscript()
        if epw and epw~=script  then
        end
    end
end
)
eop(function()
    if  type(hookfunction)== "function"  then
        local sjr_cv = function()
            return 1
        end
        local epx = hookfunction(sjr_cv, function()
            return 2
        end
        )
        if sjr_cv()~= 2  then
        end
    end
end
)
eop(function()
    if  typeof(script)~= "Instance"  then
    end
end
)
eop(function()
    local epy = {} setmetatable(epy, {})
    if  getmetatable(epy)== nil  then
        eoi(9)
    end
end
)
eop(function()
    if  type(clonefunction)== "function"  then
        local epz = clonefunction(eoy.pcall)
        if epz==eoy.pcall  then
        end
        local eqa = epz(function()
            return 123
        end
        )
        if not eqa  then
        end
    end
end
)
if not enx() then
    eoi(enz~= 0 and enz or 99)
end
if enu~=ent  then
    eoi(99)
end
local eqb, eqc = pcall(function()
    ego = game:HttpGet("https://raw.githubusercontent.com/NTT-HUB/Script/refs/heads/main/run-request")
end
)
if eqc  then
    return
end
if not  _G.getlink or not  _G.key or not  _G.index_key  then
    return
end
if not  string.find(_G.getlink, "nekokawaii.workers.dev") then
    return
end
_G.distance = 25
_G.name_game = "Blox_Fruit0"
_G.Setting = {
    ["server_live"] = { "Server : Select", },
    ["tool_select"] = { "Tool : Melee", },
    ["level"] = { false, },
    ["mobnear"] = { false, },
    ["material_select"] = { "Material : Select", },
    ["material"] = { false, },
    ["mastery_fruit"] = { false, },
    ["mastery_health"] = {35, },
    ["skillfruit"] = {
        ["Z"] = true,
        ["X"] = true,
        ["C"] = true,
        ["V"] = true,
        ["F"] = true,
    },
    ["up_melee"] = { false, },
    ["up_health"] = { false, },
    ["up_sword"] = { false, },
    ["up_gun"] = { false, },
    ["up_fruit"] = { false, },
    ["autorejoin"] = { false, },
    ["blackscreen"] = { false, },
    ["attack"] = { true, },
    ["autochest"] = { false, },
    ["chesthop"] = { false, },
    ["chestfruitspawn"] = { true, },
    ["chestfruitdrop"] = { true, },
    ["chestfruitstore"] = { true, },
    ["chestdarkbeard"] = { true, },
    ["chestadmin"] = { true, },
    ["cheststop"] = { false, },
    ["styler_select"] = { "Styler : Select", },
    ["buystyler"] = { false, },
    ["randomfruit"] = { false, },
    ["randombone"] = { false, },
    ["boss1"] = {
        ["The Gorilla King"] = false,
        ["Bobby"] = false,
        ["The Saw"] = false,
        ["Yeti"] = false,
        ["Mob Leader"] = false,
        ["Vice Admiral"] = false,
        ["Warden"] = false,
        ["Chief Warden"] = false,
        ["Saber Expert"] = false,
        ["Swan"] = false,
        ["Magma Admiral"] = false,
        ["Fishman Lord"] = false,
        ["Wysper"] = false,
        ["Thunder God"] = false,
        ["Cyborg"] = false,
        ["Greybeard"] = false,
    },
    ["boss2"] = {
        ["Diamond"] = false,
        ["Jeremy"] = false,
        ["Orbitus"] = false,
        ["Don Swan"] = false,
        ["Darkbeard"] = true,
        ["Smoke Admiral"] = false,
        ["Cursed Captain"] = false,
        ["Awakened Ice Admiral"] = false,
        ["Tide Keeper"] = false,
    },
    ["boss3"] = {
        ["Stone"] = false,
        ["Island Empress"] = false,
        ["Kilo Admiral"] = false,
        ["Captain Elephant"] = false,
        ["Beautiful Pirate"] = false,
        ["Longma"] = false,
        ["Soul Reaper"] = false,
        ["Cake Queen"] = false,
        ["rip_indra True Form"] = true,
        ["Cake Prince"] = true,
        ["Dough King"] = true,
    },
    ["killboss"] = { false, },
    ["factory"] = { false, },
    ["bartilo"] = { false, },
    ["katakuri"] = { false, },
    ["elite"] = { false, },
    ["elitehop"] = { false, },
    ["saber"] = { false, },
    ["rengoku"] = { false, },
    ["swordlegend"] = { false, },
    ["yama"] = { false, },
    ["scyther"] = { false, },
    ["tushita"] = { false, },
    ["guitar"] = { false, },
    ["cdk"] = { false, },
    ["esp_player"] = { false, },
    ["esp_island"] = { false, },
    ["esp_fruit"] = { false, },
    ["fruit_spawn"] = { false, },
    ["fruit_drop"] = { false, },
    ["fruit_store"] = { false, },
    ["seaevent_tool"] = { "Tool : Select", },
    ["seaevent_multitool"] = {["Melee"] = true, ["Blox Fruit"] = true, ["Sword"] = true, ["Gun"] = true, },
    ["skill"] = {
        ["Z"] = true,
        ["X"] = true,
        ["C"] = true,
        ["V"] = true,
        ["F"] = true,
    },
    ["seaevent_lv"] = { "Level : 1", },
    ["seaevent_mob"] = {
        ["Terrorshark"] = true,
        ["Shark"] = true,
        ["Piranha"] = true,
        ["Ghost Ship"] = true,
        ["Sea Beast"] = true,
    },
    ["roughsea"] = { true, },
    ["speedboat"] = { false, },
    ["speedboat_value"] = {100, },
    ["seaevent_start"] = { false, },
    ["seaevent_drive"] = { false, },
    ["mirage"] = { false, },
    ["tpgear"] = { false, },
    ["kitsune"] = { false, },
    ["azure"] = { false, },
    ["random_azure"] = { false, },
    ["aim_player"] = { "Player : Select", },
    ["aim_tp"] = { false, },
    ["aim_select"] = { false, },
    ["aim_near"] = { false, },
    ["aim_gui"] = { false, },
    ["aim_value"] = {150, },
    ["antistun"] = { false, },
    ["player"] = { "Player : Select", },
    ["skillplayerselect"] = { false, },
    ["skillplayernear"] = { false, },
    ["skillplayernear0"] = {400, },
    ["om"] = { true, },
    ["of"] = { true, },
    ["os"] = { true, },
    ["og"] = { true, },
    ["mz"] = { true, },
    ["mdz"] = {100, },
    ["mx"] = { true, },
    ["mdx"] = {100, },
    ["mc"] = { true, },
    ["mdc"] = {100, },
    ["sz"] = { true, },
    ["sdz"] = {100, },
    ["sx"] = { true, },
    ["sdx"] = {100, },
    ["gz"] = { true, },
    ["gdz"] = {100, },
    ["gx"] = { true, },
    ["gdx"] = {100, },
    ["fz"] = { true, },
    ["fdz"] = {100, },
    ["fx"] = { true, },
    ["fdx"] = {100, },
    ["fc"] = { true, },
    ["fdc"] = {100, },
    ["fv"] = { true, },
    ["fdv"] = {100, },
    ["ff"] = { true, },
    ["fdf"] = {100, },
    ["skillauto"] = {
        ["Z"] = true,
        ["X"] = true,
        ["C"] = true,
        ["V"] = true,
        ["F"] = true,
    },
    ["skillauto_near"] = {falae, },
    ["skillauto_value"] = {100, },
    ["water"] = { false, },
    ["walkspeed"] = { false, },
    ["jumpower"] = { false, },
    ["infjump"] = { false, },
    ["jump_value"] = {35, },
    ["speed_value"] = {100, },
    ["minkv4"] = { false, },
    ["raid_select"] = { "Chip : Select", },
    ["raid_buy"] = { false, },
    ["raid_tp"] = { false, },
    ["raid_start"] = { false, },
    ["raid_island"] = { false, },
    ["raid_aura"] = { false, },
    ["awakening"] = { false, },
    ["raidlaw_tp"] = { false, },
    ["raidlaw_buy"] = { false, },
    ["raidlaw_start"] = { false, },
    ["raidlaw"] = { false, },
    ["race_v2"] = { false, },
    ["race_v3"] = { false, },
    ["race_door"] = { false, },
    ["race_trial"] = { false, },
    ["race_kill"] = { false, },
    ["teleport_select"] = { "Island : Select", },
    ["_end"] = { "_end", },
}
local function eqd()
    if  readfile and  writefile and  isfile and  isfolder  then
        if not  isfolder("NTT HUB") then
            makefolder("NTT HUB")
        end
        if not  isfolder("NTT HUB/Save Script/") then
            makefolder("NTT HUB/Save Script/")
        end
        local eqe = "NTT HUB/Save Script/".._G.name_game..".json"
        if not  isfile(eqe)or  readfile(eqe)=="" then
            writefile(eqe, (game:GetService("HttpService")):JSONEncode(_G.Setting))
        else
            local eqf, eqg = pcall(function()
                return (game:GetService("HttpService")):JSONDecode(readfile(eqe))
            end
            )
            if eqf  then
                for eqh, eqi in pairs(eqg) do
                    _G.Setting [eqh] = eqi
                end
            else
                writefile(eqe, (game:GetService("HttpService")):JSONEncode(_G.Setting))
            end
        end
    else
        return  warn("Status : Undetected Executor")
    end
end
local function eqj()
    if  readfile and  writefile and  isfile and  isfolder  then
        local eqk = "NTT HUB/Save Script/".._G.name_game..".json"
        if not  isfile(eqk) then
            eqd()
        else
            local eql = {}
            for eqm, eqn in pairs(_G.Setting) do
                eql[eqm] = eqn
            end
            writefile(eqk, (game:GetService("HttpService")):JSONEncode(eql))
        end
    else
        return  warn("Status : Undetected Executor")
    end
end
eqd()
if  _G.linkdis == nil  then
    _G.linkdis = 111
end
local eqo = Instance.new("ScreenGui")
local eqp = Instance.new("Frame")
local eqq = Instance.new("TextLabel")
local sjr_db = Instance.new("TextLabel")
local eqr = Instance.new("ScrollingFrame")
local eqs = Instance.new("ScrollingFrame")
local eqt = Instance.new("ScrollingFrame")
local equ = Instance.new("ScrollingFrame")
local eqv = Instance.new("ScrollingFrame")
local eqw = Instance.new("ScrollingFrame")
local eqx = Instance.new("ScrollingFrame")
local eqy = Instance.new("ScrollingFrame")
local eqz = Instance.new("ScrollingFrame")
local era = Instance.new("ScrollingFrame")
local erb = Instance.new("ScrollingFrame")
local erc = Instance.new("ScrollingFrame")
local erd = Instance.new("ScrollingFrame")
local ere = Instance.new("ScrollingFrame")
local erf = Instance.new("ScrollingFrame")
local erg = Instance.new("Frame")
local erh = Instance.new("ScrollingFrame")
dzx = Instance.new("Frame")
local eri = Instance.new("TextButton")
local erj = Instance.new("TextButton")
local erk = Instance.new("TextButton")
local erl = Instance.new("TextButton")
local erm = Instance.new("TextButton")
local ern = Instance.new("TextButton")
local ero = Instance.new("TextButton")
local erp = Instance.new("TextButton")
local erq = Instance.new("TextButton")
local err = Instance.new("TextButton")
local ers = Instance.new("TextButton")
local ert = Instance.new("TextButton")
local eru = Instance.new("TextButton")
local erv = Instance.new("TextButton")
local erw = Instance.new("TextButton")
ehq = Instance.new("TextButton")
eif = Instance.new("ScrollingFrame")
egr = Instance.new("ScrollingFrame")
ekh = Instance.new("ScrollingFrame")
ekj = Instance.new("TextLabel")
eiv = Instance.new("TextButton")
eat = Instance.new("TextLabel")
ejp = Instance.new("TextButton")
ecw = Instance.new("TextLabel")
efd = Instance.new("TextButton")
ejj = Instance.new("TextLabel")
eis = Instance.new("TextButton")
eeb = Instance.new("TextLabel")
egh = Instance.new("TextButton")
elo = Instance.new("TextLabel")
edf = Instance.new("TextButton")
edr = Instance.new("TextLabel")
ejw = Instance.new("TextButton")
ejm = Instance.new("TextLabel")
ecj = Instance.new("TextButton")
ebx = Instance.new("TextLabel")
dzy = Instance.new("TextButton")
eiy = Instance.new("TextLabel")
eha = Instance.new("TextButton")
dyz = Instance.new("TextLabel")
elk = Instance.new("TextButton")
ebc = Instance.new("TextLabel")
ecv = Instance.new("TextButton")
dyv = Instance.new("TextLabel")
eiu = Instance.new("TextButton")
dzw = Instance.new("TextLabel")
ejv = Instance.new("TextButton")
egs = Instance.new("TextLabel")
eef = Instance.new("TextButton")
dyu = Instance.new("TextLabel")
ehx = Instance.new("TextButton")
elp = Instance.new("TextLabel")
eci = Instance.new("TextButton")
dzu = Instance.new("TextLabel")
eiw = Instance.new("TextButton")
edl = Instance.new("TextLabel")
eli = Instance.new("TextButton")
eew = Instance.new("TextLabel")
egm = Instance.new("TextButton")
dzp = Instance.new("TextLabel")
eeg = Instance.new("TextButton")
efx = Instance.new("TextLabel")
ekz = Instance.new("TextButton")
egj = Instance.new("TextLabel")
ect = Instance.new("TextButton")
ehn = Instance.new("ScrollingFrame")
eae = Instance.new("TextLabel")
edn = Instance.new("TextButton")
ejk = Instance.new("TextLabel")
eem = Instance.new("TextButton")
elf = Instance.new("TextLabel")
dyx = Instance.new("TextButton")
eau = Instance.new("TextLabel")
eiq = Instance.new("TextButton")
edd = Instance.new("ScrollingFrame")
ehz = Instance.new("ScrollingFrame")
ehu = Instance.new("ScrollingFrame")
egx = Instance.new("TextLabel")
ejf = Instance.new("TextButton")
dzb = Instance.new("TextLabel")
ekv = Instance.new("TextButton")
egc = Instance.new("TextLabel")
eev = Instance.new("TextButton")
ear = Instance.new("TextLabel")
edp = Instance.new("TextButton")
eju = Instance.new("TextLabel")
eck = Instance.new("TextButton")
eda = Instance.new("TextLabel")
egu = Instance.new("TextButton")
ecb = Instance.new("TextLabel")
ehf = Instance.new("TextButton")
eaf = Instance.new("TextLabel")
eek = Instance.new("TextButton")
egn = Instance.new("TextLabel")
efl = Instance.new("TextButton")
ell = Instance.new("TextLabel")
ejq = Instance.new("TextButton")
eij = Instance.new("TextLabel")
eki = Instance.new("TextButton")
egq = Instance.new("TextLabel")
efs = Instance.new("TextButton")
ela = Instance.new("TextLabel")
edz = Instance.new("TextButton")
edm = Instance.new("TextLabel")
egk = Instance.new("TextButton")
edg = Instance.new("TextLabel")
ekd = Instance.new("TextButton")
ejr = Instance.new("TextLabel")
efm = Instance.new("TextButton")
edt = Instance.new("TextLabel")
efe = Instance.new("TextButton")
eco = Instance.new("TextLabel")
ebn = Instance.new("TextButton")
egw = Instance.new("TextLabel")
ece = Instance.new("TextButton")
eaa = Instance.new("TextLabel")
ebk = Instance.new("TextButton")
ebj = Instance.new("ScrollingFrame")
ebl = Instance.new("ScrollingFrame")
edx = Instance.new("ScrollingFrame")
edc = Instance.new("ScrollingFrame")
ejh = Instance.new("ScrollingFrame")
egz = Instance.new("TextLabel")
edb = Instance.new("TextButton")
edq = Instance.new("TextLabel")
dza = Instance.new("TextButton")
ebi = Instance.new("TextLabel")
ecd = Instance.new("TextButton")
efr = Instance.new("TextLabel")
ebw = Instance.new("TextButton")
eaq = Instance.new("TextLabel")
eff = Instance.new("TextButton")
egy = Instance.new("TextLabel")
eaj = Instance.new("TextButton")
ebq = Instance.new("TextLabel")
eks = Instance.new("TextButton")
ecg = Instance.new("TextLabel")
ehs = Instance.new("TextButton")
dzz = Instance.new("TextLabel")
ebo = Instance.new("TextButton")
eje = Instance.new("TextLabel")
ehb = Instance.new("TextButton")
dzg = Instance.new("TextLabel")
eac = Instance.new("TextButton")
ebf = Instance.new("TextLabel")
egl = Instance.new("TextButton")
efb = Instance.new("TextLabel")
ecc = Instance.new("TextButton")
ekl = Instance.new("TextLabel")
efz = Instance.new("TextButton")
ekc = Instance.new("ScrollingFrame")
eal = Instance.new("ScrollingFrame")
ehv = Instance.new("ScrollingFrame")
eds = Instance.new("TextLabel")
egb = Instance.new("TextButton")
ees = Instance.new("TextLabel")
ecy = Instance.new("TextButton")
eho = Instance.new("TextLabel")
ehw = Instance.new("TextButton")
eay = Instance.new("TextLabel")
eku = Instance.new("TextButton")
efc = Instance.new("TextLabel")
ekq = Instance.new("TextButton")
efp = Instance.new("TextLabel")
eep = Instance.new("TextButton")
dzm = Instance.new("TextLabel")
ekm = Instance.new("TextButton")
ecq = Instance.new("TextLabel")
eey = Instance.new("TextButton")
eid = Instance.new("TextLabel")
ehj = Instance.new("TextButton")
ege = Instance.new("ScrollingFrame")
efu = Instance.new("TextLabel")
efw = Instance.new("TextButton")
eap = Instance.new("TextLabel")
eke = Instance.new("TextButton")
ecx = Instance.new("ScrollingFrame")
elc = Instance.new("TextLabel")
edw = Instance.new("TextButton")
edk = Instance.new("TextLabel")
eab = Instance.new("TextButton")
ecn = Instance.new("TextLabel")
eak = Instance.new("TextButton")
efh = Instance.new("TextLabel")
een = Instance.new("TextButton")
dzq = Instance.new("TextLabel")
ehh = Instance.new("TextButton")
ejl = Instance.new("TextLabel")
ekn = Instance.new("TextButton")
ehi = Instance.new("TextLabel")
ebp = Instance.new("TextButton")
eej = Instance.new("TextLabel")
eei = Instance.new("TextButton")
egi = Instance.new("TextLabel")
ebb = Instance.new("TextButton")
ejn = Instance.new("TextLabel")
ecr = Instance.new("TextButton")
eaw = Instance.new("TextLabel")
ebs = Instance.new("TextButton")
ekf = Instance.new("TextLabel")
eah = Instance.new("TextButton")
ecf = Instance.new("TextLabel")
dzr = Instance.new("TextButton")
dyw = Instance.new("TextLabel")
ead = Instance.new("TextButton")
egp = Instance.new("TextLabel")
dzh = Instance.new("TextButton")
ebm = Instance.new("TextLabel")
ekb = Instance.new("TextButton")
ejs = Instance.new("TextLabel")
ehl = Instance.new("TextButton")
eln = Instance.new("TextLabel")
eeu = Instance.new("TextButton")
ean = Instance.new("TextLabel")
eer = Instance.new("TextButton")
dzi = Instance.new("TextLabel")
ekg = Instance.new("TextButton")
dzl = Instance.new("TextLabel")
eeq = Instance.new("TextButton")
elh = Instance.new("TextLabel")
ehm = Instance.new("TextButton")
ech = Instance.new("TextLabel")
ekw = Instance.new("TextButton")
ehc = Instance.new("TextLabel")
eja = Instance.new("TextButton")
eky = Instance.new("TextLabel")
ekk = Instance.new("TextButton")
ecz = Instance.new("TextLabel")
edv = Instance.new("TextButton")
efy = Instance.new("TextLabel")
ejz = Instance.new("TextButton")
ebv = Instance.new("TextLabel")
eam = Instance.new("TextButton")
edy = Instance.new("TextLabel")
egg = Instance.new("TextButton")
ejc = Instance.new("ScrollingFrame")
eht = Instance.new("TextLabel")
dzt = Instance.new("TextButton")
efk = Instance.new("TextLabel")
eia = Instance.new("TextButton")
eka = Instance.new("TextLabel")
eit = Instance.new("TextButton")
ebd = Instance.new("TextLabel")
ebe = Instance.new("TextButton")
eik = Instance.new("TextLabel")
ehr = Instance.new("TextButton")
eeo = Instance.new("TextLabel")
efj = Instance.new("TextButton")
ecu = Instance.new("TextLabel")
ecm = Instance.new("TextButton")
ecl = Instance.new("TextLabel")
ekr = Instance.new("TextButton")
efo = Instance.new("TextLabel")
elg = Instance.new("TextButton")
dzs = Instance.new("TextLabel")
ehe = Instance.new("TextButton")
ebt = Instance.new("TextLabel")
ebr = Instance.new("TextButton")
eig = Instance.new("TextBox")
eao = Instance.new("ScrollingFrame")
ede = Instance.new("TextLabel")
ekx = Instance.new("TextButton")
eec = Instance.new("ScrollingFrame")
ebu = Instance.new("ScrollingFrame")
eee = Instance.new("TextButton")
eby = Instance.new("TextButton")
edh = Instance.new("TextButton")
eav = Instance.new("TextButton")
ebg = Instance.new("TextButton")
edi = Instance.new("TextButton")
efg = Instance.new("TextButton")
eir = Instance.new("TextButton")
ejx = Instance.new("TextButton")
eld = Instance.new("TextButton")
ecs = Instance.new("TextButton")
ejo = Instance.new("TextButton")
elb = Instance.new("TextButton")
eji = Instance.new("TextButton")
edj = Instance.new("TextButton")
eip = Instance.new("TextButton")
ejd = Instance.new("TextButton")
eko = Instance.new("TextButton")
eba = Instance.new("TextButton")
eie = Instance.new("TextButton")
efq = Instance.new("TextButton")
eih = Instance.new("TextButton")
ehk = Instance.new("TextButton")
eea = Instance.new("TextButton")
egv = Instance.new("TextLabel")
efi = Instance.new("TextLabel")
ehp = Instance.new("TextLabel")
eiz = Instance.new("TextLabel")
dzj = Instance.new("TextLabel")
ejg = Instance.new("TextLabel")
eex = Instance.new("TextLabel")
eet = Instance.new("TextLabel")
ejb = Instance.new("TextLabel")
eft = Instance.new("TextLabel")
dzn = Instance.new("TextLabel")
ejt = Instance.new("TextLabel")
eai = Instance.new("TextLabel")
efn = Instance.new("TextLabel")
ehd = Instance.new("TextLabel")
ele = Instance.new("TextLabel")
ekp = Instance.new("TextLabel")
dzo = Instance.new("TextLabel")
eix = Instance.new("TextLabel")
dyy = Instance.new("TextLabel")
ecp = Instance.new("TextLabel")
dze = Instance.new("TextLabel")
dzk = Instance.new("TextLabel")
eeh = Instance.new("TextLabel")
_G._ = function(erx)
    if erx== "fake"  then
        return false
    else
        return  _G.Setting [erx][1]
    end
end
_G.__ = function(ery, erz)
    _G.Setting [ery][1] = erz eqj()
end
dzf = _G._ eic = _G.__ sjr_l = function(esa)
    esa.Name = "name1"
    esa.Parent = game.CoreGui esa.ZIndexBehavior = Enum.ZIndexBehavior ["Sibling"]
end
sjr_m = function(esb, esc, esd, ese, esf, esg, esh)
    esb.Parent = ese
    esb.BackgroundColor3 = Color3.fromRGB(240, 230, 255)
    esb.Position = esg
    esb.Size = UDim2.new(0, 498, 0, 30)
    esb.BorderColor3 = Color3.fromRGB(150, 100, 220)
    esb.Font = Enum.Font ["Ubuntu"]
    esb.Text = ""
    esb.TextColor3 = Color3.fromRGB(50, 10, 80)
    esb.TextSize = 14
    esb.TextWrapped = true
    esb.TextXAlignment = Enum.TextXAlignment ["Left"]
    local esi = Instance.new("UICorner")
    esi.CornerRadius = UDim.new(0, 8)
    esi.Parent = esb
    esc.Name = "name2"
    esc.Parent = esb
    esc.BackgroundColor3 = Color3.fromRGB(220, 200, 255)
    esc.Size = UDim2.new(0, 180, 0, 30)
    esc.BorderColor3 = Color3.fromRGB(150, 100, 220)
    esc.Font = Enum.Font ["SourceSans"]
    esc.Text = esf
    esc.TextColor3 = Color3.fromRGB(50, 10, 80)
    esc.TextSize = 18
    esc.TextXAlignment = Enum.TextXAlignment ["Left"]
    local esj = Instance.new("UICorner")
    esj.CornerRadius = UDim.new(0, 8)
    esj.Parent = esc
    esd.Name = "name3"
    esd.Parent = esb
    esd.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
    esd.Position = UDim2.new(0.94, 0, 0.12, 0)
    esd.Size = UDim2.new(0, 20, 0, 20)
    esd.BorderColor3 = Color3.fromRGB(150, 100, 220)
    esd.Font = Enum.Font ["SourceSans"]
    esd.TextColor3 = Color3.fromRGB(255, 255, 255)
    esd.TextSize = 30
    local esk = Instance.new("UICorner")
    esk.CornerRadius = UDim.new(0, 6)
    esk.Parent = esd if dzf(esh) then
        esd.Text = "X"
    else
        esd.Text = ""
    end
end
_G.ntt_autopos = function(esl)
    local esm = 0
    local esn = {0.001, }
    for eso = 1, 99  do
        table.insert(esn, esm+esl*eso)
    end
    return esn
end
_G.ntt_mainscrollingframe = {}
sjr_n = function(esp, esq, esr, ess)
    table.insert(_G.ntt_mainscrollingframe, esp)
    esp.Name = "name1"
    esp.Parent = eqp
    esp.Active = true
    esp.BackgroundColor3 = Color3.fromRGB(235, 220, 255)
    esp.BackgroundTransparency = 0
    esp.BorderSizePixel = 0
    esp.Size = UDim2.new(0, 498, 0, 230)
    esp.ScrollBarThickness = 0
    esp.Position = UDim2.new(0.205, 0, 0.13, 0)
    esp.Visible = esr
    local est = Instance.new("UICorner")
    est.CornerRadius = UDim.new(0, 10)
    est.Parent = esp
    local esu = Instance.new("UIStroke")
    esu.Color = Color3.fromRGB(150, 100, 220)
    esu.Thickness = 1
    esu.Parent = esp if ess~= nil  then
        local esv = _G.ntt_autopos(ess)
        spawn(function()
            while  task.wait() do
                pcall(function()
                    local esw = {}
                    for esx, esy in  ipairs(esp:GetChildren()) do
                        if  esy:IsA("GuiObject") then
                            table.insert(esw, esy)
                        end
                    end
                    for esz = 1, #esw  do
                        esw[esz].Position = UDim2.new(0, 0, esv[esz], 0)
                    end
                end
                )
            end
        end
        )
    end
end
sjr_o = function(eta, etb, etc)
    local etd = Instance.new("TextLabel")
    etd.Parent = eta
    etd.BackgroundColor3 = Color3.fromRGB(150, 100, 220)
    etd.Position = UDim2.new(0, 0, etc, 0)
    etd.Size = UDim2.new(0, 498, 0, 30)
    etd.BorderColor3 = Color3.fromRGB(150, 100, 220)
    etd.Font = Enum.Font ["SourceSansBold"]
    etd.Text = etb
    etd.TextColor3 = Color3.fromRGB(250, 250, 250)
    etd.TextSize = 18
    etd.TextWrapped = true
    local ete = Instance.new("UICorner")
    ete.CornerRadius = UDim.new(0, 8)
    ete.Parent = etd
end
sjr_p = function(etf, etg, eth)
    etf.Parent = etg
    etf.BackgroundColor3 = Color3.fromRGB(220, 200, 255)
    etf.Position = UDim2.new(0, 0, 0, 0)
    etf.Size = UDim2.new(0, 120, 0, 30)
    etf.Font = Enum.Font ["Ubuntu"]
    etf.BorderColor3 = Color3.fromRGB(150, 100, 220)
    etf.Text = " "..eth etf.TextColor3 = Color3.fromRGB(50, 10, 80)
    etf.TextSize = 14
    etf.TextWrapped = false
    etf.TextXAlignment = Enum.TextXAlignment ["Left"]
end
sjr_q = function(eti, etj, etk, etl, etm, etn)
    eti.Parent = etk
    eti.BackgroundColor3 = Color3.fromRGB(240, 230, 255)
    eti.Position = UDim2.new(0, 0, etm, 0)
    eti.Size = UDim2.new(0, 498, 0, 30)
    eti.BorderColor3 = Color3.fromRGB(150, 100, 220)
    eti.Font = Enum.Font ["Ubuntu"]
    eti.Text = " "..etl eti.TextColor3 = Color3.fromRGB(50, 10, 80)
    eti.TextSize = 14
    eti.TextWrapped = true
    eti.TextXAlignment = Enum.TextXAlignment ["Left"]
    local eto = Instance.new("UICorner")
    eto.CornerRadius = UDim.new(0, 8)
    eto.Parent = eti
    etj.Name = "name2"
    etj.Parent = eti
    etj.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
    etj.Position = UDim2.new(0.94, 0, 0.12, 0)
    etj.Size = UDim2.new(0, 20, 0, 20)
    etj.BorderColor3 = Color3.fromRGB(150, 100, 220)
    etj.Font = Enum.Font ["GothamBold"]
    etj.Text = ""
    etj.TextColor3 = Color3.fromRGB(255, 255, 255)
    etj.TextSize = 14
    etj.TextScaled = true
    etj.ClipsDescendants = true
    local etp = Instance.new("UICorner")
    etp.CornerRadius = UDim.new(0, 6)
    etp.Parent = etj if dzf(etn) then
        etj.Text = "X"
    end
end
sjr_r = function(etq, etr, ets, ett, etu, etv, etw)
    etq.Parent = ett
    etq.BackgroundColor3 = Color3.fromRGB(240, 230, 255)
    etq.Position = UDim2.new(0, 0, etv, 0)
    etq.Size = UDim2.new(0, 498, 0, 30)
    etq.BorderColor3 = Color3.fromRGB(150, 100, 220)
    etq.Font = Enum.Font ["Ubuntu"]
    etq.Text = ""
    etq.TextColor3 = Color3.fromRGB(50, 10, 80)
    etq.TextSize = 14
    etq.TextWrapped = true
    etq.TextXAlignment = Enum.TextXAlignment ["Left"]
    local etx = Instance.new("UICorner")
    etx.CornerRadius = UDim.new(0, 8)
    etx.Parent = etq
    etr.Name = "name2"
    etr.Parent = etq
    etr.BackgroundColor3 = Color3.fromRGB(220, 200, 255)
    etr.Size = UDim2.new(0, 350, 0, 30)
    etr.BorderColor3 = Color3.fromRGB(150, 100, 220)
    etr.Font = Enum.Font ["SourceSans"]
    etr.Text = " "..etu etr.TextColor3 = Color3.fromRGB(50, 10, 80)
    etr.TextSize = 18
    etr.TextXAlignment = Enum.TextXAlignment ["Left"]
    local ety = Instance.new("UICorner")
    ety.CornerRadius = UDim.new(0, 8)
    ety.Parent = etr
    local etz = Instance.new("TextLabel")
    etz.Name = "name4"
    etz.Parent = etr
    etz.Size = UDim2.new(0, 30, 0, 30)
    etz.Font = Enum.Font ["SourceSans"]
    etz.Text = "ð "
    etz.TextColor3 = Color3.fromRGB(255, 255, 255)
    etz.TextSize = 22
    etz.BackgroundTransparency = 1
    etz.AnchorPoint = Vector2.new(1, 0)
    etz.Position = UDim2.new(1, 0, 0, 0);
    (etr.MouseButton1Click):Connect(function()
        d(etz)
    end
    )
    ets.Name = "name3"
    ets.Parent = etq
    ets.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
    ets.Position = UDim2.new(0.94, 0, 0.12, 0)
    ets.Size = UDim2.new(0, 20, 0, 20)
    ets.BorderColor3 = Color3.fromRGB(150, 100, 220)
    ets.Font = Enum.Font ["SourceSans"]
    ets.TextColor3 = Color3.fromRGB(255, 255, 255)
    ets.TextSize = 30
    local eua = Instance.new("UICorner")
    eua.CornerRadius = UDim.new(0, 6)
    eua.Parent = ets if dzf(etw) then
        ets.Text = "X"
    else
        ets.Text = ""
    end
end
sjr_s = function(eub, euc, eud, eue, euf, eug)
    for euh = 1, #eud  do
        if euh== 1  then
            sjr_t(eub, euc, eud[euh], eue.." : "..eud[euh], UDim2.new(0, 0, 0, 0), eug)
        elseif euh>= 2  then
            sjr_t(eub, euc, eud[euh], eue.." : "..eud[euh], UDim2.new(0, 0, euf*(euh- 1), 0), eug)
        end
    end
end
sjr_t = function(eui, euj, euk, eul, eum, eun)
    eii = Instance.new("TextLabel")
    eii.Parent = euj
    eii.BackgroundColor3 = Color3.fromRGB(240, 230, 255)
    eii.Position = eum
    eii.Size = UDim2.new(0, 230, 0, 20)
    eii.BorderColor3 = Color3.fromRGB(150, 100, 220)
    eii.Font = Enum.Font ["Ubuntu"]
    eii.Text = euk
    eii.TextColor3 = Color3.fromRGB(50, 10, 80)
    eii.TextSize = 14
    eii.TextWrapped = true
    eii.TextXAlignment = Enum.TextXAlignment ["Left"]
    local euo = Instance.new("UICorner")
    euo.CornerRadius = UDim.new(0, 6)
    euo.Parent = eii
    dzv = Instance.new("TextButton")
    dzv.Parent = eii
    dzv.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
    dzv.Position = UDim2.new(0.72, 0, 0, 0)
    dzv.Size = UDim2.new(0, 65, 0, 20)
    dzv.BorderColor3 = Color3.fromRGB(150, 100, 220)
    dzv.Font = Enum.Font ["SourceSans"]
    dzv.Text = "Button"
    dzv.TextColor3 = Color3.fromRGB(255, 255, 255)
    dzv.TextSize = 14
    local eup = Instance.new("UICorner")
    eup.CornerRadius = UDim.new(0, 6)
    eup.Parent = dzv ;
    (dzv.MouseButton1Down):connect(function()
        eui.Text = " "..eul euj.Visible = false eic(eun, eui.Text)
    end
    )
end
_G.ntt_farmain_table = {}
_G.ntt_frame = function(euq)
    if euq.Visible  then
        for eur = 1, # _G.ntt_farmain_table  do
            _G.ntt_farmain_table [eur].Visible = false
        end
    else
        for eus = 1, # _G.ntt_farmain_table  do
            _G.ntt_farmain_table [eus].Visible = false
        end
        euq.Visible = true
    end
end
egd = Instance.new("TextButton")
egd.Name = "ntt_sframe"
egd.Parent = eqp
egd.Active = true
egd.BackgroundColor3 = Color3.fromRGB(240, 230, 255)
egd.BackgroundTransparency = 1
egd.BorderColor3 = Color3.fromRGB(150, 100, 220)
egd.Position = UDim2.new(0.6, 0, 0.1, 0)
egd.Size = UDim2.new(0, 250, 0, 245)
egd.ZIndex = 2
egd.Text = "" spawn(function()
    while  wait() do
        pcall(function()
            egd.Visible = false for eut = 1, # _G.ntt_farmain_table  do
                if  _G.ntt_farmain_table [eut].Visible  then
                    egd.Visible = true
                end
            end
        end
        )
    end
end
)
sjr_u = function(euu, euv)
    table.insert(_G.ntt_farmain_table, euu)
    euu.Name = "name1"
    euu.Parent = euv
    euu.Active = true
    euu.BackgroundColor3 = Color3.fromRGB(235, 220, 255)
    euu.BorderColor3 = Color3.fromRGB(150, 100, 220)
    euu.Position = UDim2.new(0.6, 0, 0.1, 0)
    euu.Size = UDim2.new(0, 250, 0, 245)
    euu.BorderSizePixel = 1
    euu.ZIndex = 3
    euu.Visible = false
    euu.Draggable = false
    local euw = Instance.new("UICorner")
    euw.CornerRadius = UDim.new(0, 10)
    euw.Parent = euu
end
sjr_v = function(eux, euy, euz, eva, evb)
    eux.Name = "name1"
    eux.Parent = eva
    eux.BackgroundColor3 = Color3.fromRGB(240, 230, 255)
    eux.Position = UDim2.new(0.18, 0, 0.23, 0)
    eux.Size = UDim2.new(0, 640, 0, 280)
    eux.BorderColor3 = Color3.fromRGB(150, 100, 220)
    eux.Active = true
    eux.Draggable = false
    eux.Visible = false
    euy.Parent = eux
    euy.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
    euy.BackgroundTransparency = 0
    euy.Position = UDim2.new(0, 0, 0, 0)
    euy.Size = UDim2.new(0, 640, 0, 26)
    euy.Font = Enum.Font ["SourceSansBold"]
    euy.Text = " "..evb euy.TextColor3 = Color3.fromRGB(255, 255, 255)
    euy.TextSize = 18
    euy.TextWrapped = true
    euy.TextXAlignment = Enum.TextXAlignment ["Left"]
    euy.BorderColor3 = Color3.fromRGB(150, 100, 220)
    euz.Name = "name3"
    euz.Parent = eux
    euz.Active = true
    euz.BackgroundColor3 = Color3.fromRGB(220, 200, 255)
    euz.Size = UDim2.new(0, 120, 0, 250)
    euz.ScrollBarThickness = 0
    euz.BorderColor3 = Color3.fromRGB(150, 100, 220)
    euz.Position = UDim2.new(0, 0, 0.1, 0)
    local evc = game:GetService("UserInputService")
    local evd = false
    local eve local evf ;
    (euy.InputBegan):Connect(function(evg)
        if evg.UserInputType == Enum.UserInputType ["MouseButton1"]or evg.UserInputType == Enum.UserInputType ["Touch"] then
            evd = true
            eve = evg.Position evf = eux.Position
        end
    end
    );
    (evc.InputChanged):Connect(function(evh)
        if evd and(evh.UserInputType == Enum.UserInputType ["MouseMovement"]or evh.UserInputType == Enum.UserInputType ["Touch"]) then
            local evi = evh.Position -eve eux.Position = UDim2.new(evf.X ["Scale"], evf.X ["Offset"]+evi.X, evf.Y ["Scale"], evf.Y ["Offset"]+evi.Y)
        end
    end
    );
    (evc.InputEnded):Connect(function(evj)
        if evj.UserInputType == Enum.UserInputType ["MouseButton1"]or evj.UserInputType == Enum.UserInputType ["Touch"] then
            evd = false
        end
    end
    )
    local evk = {0, }
    for evl = 1, 100  do
        table.insert(evk, dm(evk[evl])+ 0.06)
    end
    spawn(function()
        while  task.wait() do
            pcall(function()
                if#euz:GetChildren()> 0  then
                    local evm = {}
                    for evn, evo in  ipairs(euz:GetChildren()) do
                        if  evo:IsA("GuiObject")and not  evo:IsA("UICorner") then
                            table.insert(evm, evo)
                        end
                    end
                    for evp = 1, #evm  do
                        evm[evp].Position = UDim2.new(0, 0, evk[evp], 0)
                    end
                end
            end
            )
        end
    end
    )
end
sjr_w = function(evq, evr, evs, evt, evu)
    evq.Parent = evs
    evq.BackgroundColor3 = Color3.fromRGB(235, 220, 255)
    evq.Position = UDim2.new(0, 0, evu, 0)
    evq.Size = UDim2.new(0, 498, 0, 30)
    evq.Font = Enum.Font ["Ubuntu"]
    evq.BackgroundTransparency = 1
    evq.Text = ""
    evq.TextColor3 = Color3.fromRGB(50, 10, 80)
    evq.TextSize = 14
    evq.TextWrapped = true
    evq.TextXAlignment = Enum.TextXAlignment ["Left"]
    evr.Name = "name2"
    evr.Parent = evq
    evr.BackgroundColor3 = Color3.fromRGB(220, 200, 255)
    evr.Size = UDim2.new(0, 350, 0, 30)
    evr.BorderColor3 = Color3.fromRGB(150, 100, 220)
    evq.BorderSizePixel = 1
    evr.Font = Enum.Font ["SourceSans"]
    evr.Text = " "..evt evr.TextColor3 = Color3.fromRGB(50, 10, 80)
    evr.TextSize = 18
    evr.TextXAlignment = Enum.TextXAlignment ["Left"]
    local evv = Instance.new("UICorner")
    evv.CornerRadius = UDim.new(0, 8)
    evv.Parent = evr
    local evw = Instance.new("TextLabel")
    evw.Name = "name3"
    evw.Parent = evr
    evw.Size = UDim2.new(0, 30, 0, 30)
    evw.Font = Enum.Font ["SourceSans"]
    evw.Text = "ð "
    evw.TextColor3 = Color3.fromRGB(130, 80, 200)
    evw.TextSize = 22
    evw.BackgroundTransparency = 1
    evw.AnchorPoint = Vector2.new(1, 0)
    evw.Position = UDim2.new(1, 0, 0, 0);
    (evr.MouseButton1Click):Connect(function()
        d(evw)
    end
    )
end
sjr_x = function(evx, evy, evz, ewa, ewb, ewc, ewd)
    evx.Parent = evz
    evx.BackgroundColor3 = Color3.fromRGB(240, 230, 255)
    evx.Position = UDim2.new(0, 0, ewc, 0)
    evx.Size = UDim2.new(0, 498, 0, 30)
    evx.BorderColor3 = Color3.fromRGB(150, 100, 220)
    evx.Font = Enum.Font ["Ubuntu"]
    evx.Text = ewa
    evx.TextColor3 = Color3.fromRGB(50, 10, 80)
    evx.TextSize = 14
    evx.TextWrapped = true
    evx.TextXAlignment = Enum.TextXAlignment ["Left"]
    local ewe = Instance.new("UICorner")
    ewe.CornerRadius = UDim.new(0, 8)
    ewe.Parent = evx
    evy.Name = "name2"
    evy.Parent = evx
    evy.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
    evy.Position = UDim2.new(ewd, 0, 0, 0)
    evy.Size = UDim2.new(0, 30, 0, 30)
    evy.Font = Enum.Font ["Ubuntu"]
    evy.BackgroundTransparency = 1
    evy.Text = ewb
    evy.TextColor3 = Color3.fromRGB(50, 10, 80)
    evy.TextSize = 14
end
sjr_y = function(ewf, ewg, ewh, ewi, ewj)
    ewf.Name = "button"
    ewf.Parent = ewh
    ewf.BackgroundColor3 = Color3.fromRGB(240, 230, 255)
    ewf.Position = UDim2.new(0, 0, ewj, 0)
    ewf.Size = UDim2.new(0, 498, 0, 30)
    ewf.BorderColor3 = Color3.fromRGB(150, 100, 220)
    ewf.Font = Enum.Font ["Ubuntu"]
    ewf.Text = ewi
    ewf.TextColor3 = Color3.fromRGB(50, 10, 80)
    ewf.TextSize = 14
    ewf.TextWrapped = true
    ewf.TextXAlignment = Enum.TextXAlignment ["Left"]
    local ewk = Instance.new("UICorner")
    ewk.CornerRadius = UDim.new(0, 8)
    ewk.Parent = ewf
    ewg.Name = "name2"
    ewg.Parent = ewf
    ewg.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
    ewg.Position = UDim2.new(0.825, 0, 0.05, 0)
    ewg.Size = UDim2.new(0, 80, 0, 25)
    ewg.BorderColor3 = Color3.fromRGB(150, 100, 220)
    ewg.Font = Enum.Font ["SourceSans"]
    ewg.Text = "Button"
    ewg.TextColor3 = Color3.fromRGB(255, 255, 255)
    ewg.TextSize = 16
    local ewl = Instance.new("UICorner")
    ewl.CornerRadius = UDim.new(0, 8)
    ewl.Parent = ewg
end
sjr_z = function(ewm, ewn, ewo, ewp)
    ewm.Parent = ewn
    ewm.BackgroundColor3 = Color3.fromRGB(250, 245, 255)
    ewm.Position = UDim2.new(0, 0, ewp, 0)
    ewm.Size = UDim2.new(0, 498, 0, 30)
    ewm.BorderColor3 = Color3.fromRGB(150, 100, 220)
    ewm.Font = Enum.Font ["Ubuntu"]
    ewm.Text = ewo
    ewm.TextColor3 = Color3.fromRGB(50, 10, 80)
    ewm.TextSize = 14
    ewm.TextWrapped = true
    ewm.TextXAlignment = Enum.TextXAlignment ["Left"]
    local ewq = Instance.new("UICorner")
    ewq.CornerRadius = UDim.new(0, 8)
    ewq.Parent = ewm
end
sjr_aa = function(ewr, ews, ewt, ewu)
    local ewv = Instance.new("TextLabel")
    ewv.Parent = ewr
    ewv.BackgroundColor3 = Color3.fromRGB(240, 230, 255)
    ewv.Position = ewt
    ewv.Size = UDim2.new(0, 230, 0, 20)
    ewv.BorderColor3 = Color3.fromRGB(150, 100, 220)
    ewv.Font = Enum.Font ["Ubuntu"]
    ewv.Text = ews
    ewv.TextColor3 = Color3.fromRGB(50, 10, 80)
    ewv.TextSize = 14
    ewv.TextWrapped = true
    ewv.TextXAlignment = Enum.TextXAlignment ["Left"]
    local eww = Instance.new("UICorner")
    eww.CornerRadius = UDim.new(0, 6)
    eww.Parent = ewv
    local ewx = Instance.new("TextButton")
    ewx.Parent = ewv
    ewx.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
    ewx.Position = UDim2.new(0.72, 0, 0, 0)
    ewx.Size = UDim2.new(0, 65, 0, 20)
    ewx.BorderColor3 = Color3.fromRGB(150, 100, 220)
    ewx.Font = Enum.Font ["SourceSans"]
    ewx.Text = "On"
    ewx.TextColor3 = Color3.fromRGB(255, 255, 255)
    ewx.TextSize = 14
    local ewy = Instance.new("UICorner")
    ewy.CornerRadius = UDim.new(0, 6)
    ewy.Parent = ewx if ewu[ewv.Text ]== false  then
        ewx.Text = "Off"
        ewx.BackgroundColor3 = Color3.fromRGB(220, 200, 255)
        ewx.TextColor3 = Color3.fromRGB(50, 10, 80)
    end
    ;
    (ewx.MouseButton1Down):connect(function()
        if ewu[ewv.Text ] then
            ewx.Text = "Off" ewu[ewv.Text ] = false ewx.BackgroundColor3 = Color3.fromRGB(220, 200, 255)
            ewx.TextColor3 = Color3.fromRGB(50, 10, 80)
        else
            ewx.Text = "On" ewu[ewv.Text ] = true ewx.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
            ewx.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        eqj()
    end
    )
    if ewu[ewv.Text ] then
        ewx.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
        ewx.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        ewx.BackgroundColor3 = Color3.fromRGB(220, 200, 255)
        ewx.TextColor3 = Color3.fromRGB(50, 10, 80)
    end
end
sjr_ab = function(ewz, exa, exb, exc)
    eii = #exa for exd = 1, eii  do
        if exd== 1  then
            sjr_aa(ewz, exa[exd], UDim2.new(0, 0, 0, 0), exc)
        elseif exd>= 2  then
            sjr_aa(ewz, exa[exd], UDim2.new(0, 0, exb*(exd- 1), 0), exc)
        end
    end
end
sjr_ac = function(exe, exf, exg, exh, exi, exj)
    if dzf(exj)>exh  then
        eic(exj, exh)
    end
    local exk = Instance.new("TextLabel", exe)
    exk.BackgroundColor3 = Color3.fromRGB(240, 230, 255)
    exk.Position = UDim2.new(0, 0, exi, 0)
    exk.Size = UDim2.new(0, 498, 0, 30)
    exk.BorderColor3 = Color3.fromRGB(150, 100, 220)
    exk.Font = Enum.Font ["Ubuntu"]
    exk.Text = ""
    exk.TextColor3 = Color3.fromRGB(50, 10, 80)
    exk.TextSize = 14
    exk.TextWrapped = true
    exk.TextXAlignment = Enum.TextXAlignment ["Left"]
    local exl = Instance.new("UICorner")
    exl.CornerRadius = UDim.new(0, 8)
    exl.Parent = exk
    local exm = Instance.new("Frame", exk)
    exm.AnchorPoint = Vector2.new(0.5, 0.5)
    exm.Position = UDim2.new(0.27, 0, 0.5, 0)
    exm.Size = UDim2.new(0.5, 0, 0, 6)
    exm.BackgroundColor3 = Color3.fromRGB(200, 180, 240)
    exm.BorderSizePixel = 0
    exm.Name = "Bar"
    local exn = Instance.new("UICorner")
    exn.CornerRadius = UDim.new(1, 0)
    exn.Parent = exm
    local exo = Instance.new("Frame", exm)
    exo.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
    exo.BorderSizePixel = 0
    exo.Size = UDim2.new(0, 0, 1, 0)
    exo.Name = "Fill"
    local exp = Instance.new("UICorner")
    exp.CornerRadius = UDim.new(1, 0)
    exp.Parent = exo
    local exq = Instance.new("Frame", exm)
    exq.Size = UDim2.new(0, 14, 0, 14)
    exq.AnchorPoint = Vector2.new(0.5, 0.5)
    exq.Position = UDim2.new(0, 0, 0.5, 0)
    exq.BackgroundColor3 = Color3.fromRGB(180, 130, 230)
    exq.BorderSizePixel = 0
    exq.Name = "Knob"
    local exr = Instance.new("UICorner")
    exr.CornerRadius = UDim.new(1, 0)
    exr.Parent = exq
    local exs = Instance.new("TextLabel", exk)
    exs.AnchorPoint = Vector2.new(0.5, 0.5)
    exs.Position = UDim2.new(0.85, 0, 0.5, 0)
    exs.BackgroundTransparency = 1
    exs.TextColor3 = Color3.fromRGB(50, 10, 80)
    exs.TextScaled = true
    exs.Font = Enum.Font ["Ubuntu"]
    exs.TextXAlignment = Enum.TextXAlignment ["Left"]
    exs.Size = UDim2.new(0.6, 0, 0.5, 0)
    local ext = game:GetService("UserInputService")
    local exu = false
    local function exv(exw)
        local exx = exm.AbsolutePosition ["X"]
        local exy = exm.AbsoluteSize ["X"]
        local exz = math.clamp(exw-exx, 0, exy)
        local eya = exz/exy local eyb = math.floor(exg+eya*(exh-exg))
        eic(exj, eyb)
        exo.Size = UDim2.new(eya, 0, 1, 0)
        exq.Position = UDim2.new(eya, 0, 0.5, 0)
        exs.Text = exf.." : "..dm(eyb)
    end
    ;
    (exq.InputBegan):Connect(function(eyc)
        if eyc.UserInputType == Enum.UserInputType ["MouseButton1"]or eyc.UserInputType == Enum.UserInputType ["Touch"] then
            exu = true
        end
    end
    );
    (ext.InputChanged):Connect(function(eyd)
        if exu and(eyd.UserInputType == Enum.UserInputType ["MouseMovement"]or eyd.UserInputType == Enum.UserInputType ["Touch"]) then
            exv(eyd.Position ["X"])
        end
    end
    );
    (ext.InputEnded):Connect(function(eye)
        if eye.UserInputType == Enum.UserInputType ["MouseButton1"]or eye.UserInputType == Enum.UserInputType ["Touch"] then
            exu = false
        end
    end
    )
    local eyf = (dzf(exj)-exg)/(exh-exg)
    exo.Size = UDim2.new(eyf, 0, 1, 0)
    exq.Position = UDim2.new(eyf, 0, 0.5, 0)
    exs.Text = exf.." : "..bg(dzf(exj))
end
sjr_ad = function(eyg, eyh)
    local eyi = Instance.new("TextButton")
    local eyj = Instance.new("UICorner")
    eyj.CornerRadius = UDim.new(0, 12)
    eyi.Parent = eyh
    eyi.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
    eyi.Position = UDim2.new(0.15, 0, 0.27, 0)
    eyi.Size = UDim2.new(0, 50, 0, 50)
    eyi.Font = Enum.Font ["ArialBold"]
    eyi.Text = "Open"
    eyi.TextColor3 = Color3.fromRGB(255, 255, 255)
    eyi.TextSize = 20
    eyi.BorderColor3 = Color3.fromRGB(150, 100, 220)
    eyi.Active = true
    eyi.Draggable = true
    eyj.Parent = eyi ;
    (eyi.MouseButton1Down):connect(function()
        if eyg.Visible  then
            eyi.Text = "Open"
            eyg.Visible = false
        else
            eyi.Text = "Close"
            eyg.Visible = true
        end
    end
    )
end
sjr_ae = function(eyk, eyl)
    local eym = Instance.new("ImageButton")
    local eyn = Instance.new("UICorner")
    eyn.CornerRadius = UDim.new(0, 12)
    eym.Parent = eyl
    eym.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
    eym.Position = UDim2.new(0.15, 0, 0.27, 0)
    eym.Size = UDim2.new(0, 50, 0, 50)
    eym.Image = "rbxassetid://88025466559424"
    eym.BorderColor3 = Color3.fromRGB(150, 100, 220)
    eym.BackgroundTransparency = 0
    eym.Active = true
    eym.Draggable = true
    eyn.Parent = eym ;
    (eym.MouseButton1Click):Connect(function()
        if eyk.Visible  then
            eyk.Visible = false
        else
            eyk.Visible = true
        end
    end
    )
end
sjr_af = function()
    if  game.PlaceId == 2753915549 or  game.PlaceId ==85211729168715  then
        return true
    end
end
sjr_ah = function()
    if  game.PlaceId ==4442272183 or  game.PlaceId ==79091703265657  then
        return true
    end
end
sjr_ai = function()
    if  game.PlaceId ==7449423635 or  game.PlaceId ==100117331123089  then
        return true
    end
end
sjr_l(eqo)
sjr_v(eqp, eqq, erh, eqo, ( "NTT HUB | Main | ".._G.linkdis))
sjr_ae(eqp, eqo)
sjr_db.Name = "sea"
sjr_db.Parent = eqp
sjr_db.BackgroundTransparency = 1
sjr_db.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
sjr_db.BorderSizePixel = 0
sjr_db.Position = UDim2.new(0.85, 0, 0, 0)
sjr_db.Size = UDim2.new(0, 90, 0, 26)
sjr_db.Font = Enum.Font ["Ubuntu"]
sjr_db.TextColor3 = Color3.fromRGB(255, 255, 255)
sjr_db.TextSize = 14
sjr_db.Text = "Blox Fruit" sjr_n(eqr, eqp, true, 0.02)
eqr.CanvasSize = UDim2.new(0, 0, 0, 2000)
sjr_n(eqs, eqp, false, 0.06)
sjr_n(equ, eqp, false, 0.06)
sjr_n(eqv, eqp, false, 0.06)
sjr_n(eqw, eqp, false, 0.06)
sjr_n(eqt, eqp, false, 0.06)
sjr_n(eqx, eqp, false, 0.02)
eqx.CanvasSize = UDim2.new(0, 0, 0, 2000)
sjr_n(eqy, eqp, false, 0.06)
sjr_n(eqz, eqp, false, 0.06)
sjr_n(era, eqp, false, 0.06)
sjr_n(erb, eqp, false, 0.06)
sjr_n(erc, eqp, false, 0.06)
sjr_n(erd, eqp, false, 0.06)
sjr_n(ere, eqp, false, 0.06)
sjr_n(erf, eqp, false, 0.02)
erf.CanvasSize = UDim2.new(0, 0, 0, 2000)
sjr_p(eri, erh, "Main", UDim2.new(0, 0, 0, 0))
sjr_p(erj, erh, "Chest", UDim2.new(0, 0, 0, 0))
sjr_p(erl, erh, "Shop", UDim2.new(0, 0, 0, 0))
sjr_p(erm, erh, "Boss", UDim2.new(0, 0, 0, 0))
sjr_p(ern, erh, "Item", UDim2.new(0, 0, 0, 0))
sjr_p(erk, erh, "Esp/Fruit", UDim2.new(0, 0, 0, 0))
if sjr_ah()or sjr_ai() then
    sjr_p(ero, erh, "Sea Event", UDim2.new(0, 0, 0, 0))
    sjr_p(ers, erh, "Race", UDim2.new(0, 0, 0, 0))
    sjr_p(err, erh, "Raid", UDim2.new(0, 0, 0, 0))
end
sjr_p(erp, erh, "AimBot", UDim2.new(0, 0, 0, 0))
sjr_p(erw, erh, "Aimbot V2", UDim2.new(0, 0, 0, 0))
sjr_p(erq, erh, "Player/Miss", UDim2.new(0, 0, 0, 0))
sjr_p(ert, erh, "Server Live", UDim2.new(0, 0, 0, 0))
sjr_p(eru, erh, "Server", UDim2.new(0, 0, 0, 0))
sjr_p(erv, erh, "Teleport", UDim2.new(0, 0, 0, 0))
edu = {0, }
function neb_gsf(rx)
    local ks = 0 for b, fl in ipairs(rx) do
        ks = (ks+fl)%65537
    end
    if ks==22098  then
        for eyo = 1, 100  do
            table.insert(edu, dm(edu[eyo])+ 0.05)
        end
    end
end
sy = nil function npw_gc(pi)
    if sy  then
        return
    end
    local dv = 0 for _, va in ipairs(pi) do
        dv = (dv+va)%65537
    end
    if dv~=22233  then
        return
    end
    sy = true neb_gsf({8004, 423, 3470, 2391, 7810, })
end
npw_gc({1278, 702, 9809, 7475, 2969})
spawn(function()
    while  task.wait() do
        pcall(function()
            if#erh:GetChildren()> 0  then
                for eyp = 1, #erh:GetChildren() do
                    erh:GetChildren()[eyp].Position = UDim2.new(0, 0, edu[eyp], 0)
                end
            end
        end
        )
    end
end
)
if not (game.Workspace):FindFirstChild("p_ntt") then
    local eyq = Instance.new("Part")
    eyq.Name = "p_ntt"
    eyq.Parent = game.Workspace eyq.Size = Vector3.new(5, 5, 5)
    eyq.Position = Vector3.new(0, 10, 0)
    eyq.Anchored = true
    eyq.CanCollide = false
    eyq.Transparency = 1
end
sjr_aj = function(eyr)
    if(game.Workspace ["p_ntt"].Position - game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].Position).Magnitude >= 201  then
        local eys = (game:GetService("TweenService")):Create(game.Workspace ["p_ntt"], TweenInfo.new(0), {["CFrame"] = game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].CFrame, });
        eys:Play()
    else
        local eyt = (eyr.Position - game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].Position).Magnitude if eyt>= 300  then
            dzd = 150
        elseif eyt< 300  then
            dzd = 500
        elseif eyt< 100  then
            dzd = 9999999
        end
        if  game.Workspace ["p_ntt"].CFrame ["Y"]< -2  then
            game.Workspace ["p_ntt"].CFrame = CFrame.new(game.Workspace ["p_ntt"].CFrame ["X"], game.Workspace ["p_ntt"].CFrame ["Y"]+ 5, game.Workspace ["p_ntt"].CFrame ["Z"])
        end
        local eys = (game:GetService("TweenService")):Create(game.Workspace ["p_ntt"], TweenInfo.new(eyt/dzd), {["CFrame"] = eyr, });
        eys:Play() game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].CFrame = game.Workspace ["p_ntt"].CFrame
    end
end
sjr_ak = function(eyu)
    local eyv = (eyu.Position - game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].Position).Magnitude dzd = 9999999
    local eyw = (game:GetService("TweenService")):Create(game.Players ["LocalPlayer"].Character ["HumanoidRootPart"], TweenInfo.new(eyv/dzd), {["CFrame"] = eyu, });
    eyw:Play()
end
sjr_al = function(eyx, eyy)
    local eyz = {}
    for eza, ezb in pairs(eyx) do
        if eyy== 1  then
            if ezb  then
                table.insert(eyz, eza)
            end
        elseif eyy== 2  then
            table.insert(eyz, eza)
        end
    end
    return eyz
end
sjr_am = function()
    sjr_cd("Melee")
end
sjr_an = function()
    sjr_cd("Sword")
end
sjr_ao = function()
    sjr_cd("Blox Fruit")
end
sjr_ap = function()
    sjr_cd("Gun")
end
sjr_aq = function(ezc, ezd)
    for eze, ezf in pairs((game.Players ["LocalPlayer"].Character):GetChildren()) do
        if ezf.ClassName == "Tool"  then
            ekt = ezf.Name
            local ezg = {[1] = ezd, };
            (game:GetService("Players").LocalPlayer ["Character"]):FindFirstChild(ekt).RemoteEvent:FireServer(unpack(ezg))
            for ezh = 1, #(game.Players ["LocalPlayer"].Character ["Humanoid"]):GetChildren() do
                if (game.Players ["LocalPlayer"].Character ["Humanoid"]):GetChildren()[ezh].ClassName == "RemoteFunction"  then ((game.Players ["LocalPlayer"].Character ["Humanoid"]):GetChildren()[ezh]):InvokeServer(ezc, ezd)
            end
        end
        local ezg = {[1] = ezd, };
        (game:GetService("Players").LocalPlayer ["Character"]):FindFirstChild(ekt).RemoteEvent:FireServer(unpack(ezg))
    end
end
end
sjr_ar = function(ezi)
    if(ezi- game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].Position).Magnitude < 300  then
        for ezj, ezk in pairs(_G.Setting ["skill"]) do
            if ezk  then
                sjr_aq(ezj, ezi)
            end
        end
    end
end
sjr_as = function(ezl)
    for ezm, ezn in pairs(_G.Setting ["skill"]) do
        if ezn  then
            sjr_aq(ezm, ezl)
        end
    end
end
sjr_at = function(ezo)
    for ezp, ezq in pairs(_G.Setting ["skillfruit"]) do
        if ezq  then
            sjr_aq(ezp, ezo)
        end
    end
end
sjr_au = function(ezr)
    for ezs, ezt in pairs(_G.Setting ["skillauto"]) do
        if ezt  then
            sjr_aq(ezs, ezr)
        end
    end
end
sjr_av = function()
    loadstring("\nlocal PlaceID = game.PlaceId\n          local AllIDs = {}\n          local foundAnything = \"\"\n          local actualHour = os.date(\"!*t\").hour\n          local Deleted = false\n          function TPReturner()\n              local Site;\n              if foundAnything == \"\" then\n                  Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))\n              else\n                  Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))\n              end\n              local ID = \"\"\n              if Site.nextPageCursor and Site.nextPageCursor ~= \"null\" and Site.nextPageCursor ~= nil then\n                  foundAnything = Site.nextPageCursor\n              end\n              local num = 0;\n              for i,v in pairs(Site.data) do\n                  local Possible = true\n                  ID = tostring(v.id)\n                  if tonumber(v.maxPlayers) > tonumber(v.playing) then\n                      for _,Existing in pairs(AllIDs) do\n                          if num ~= 0 then\n                              if ID == tostring(Existing) then\n                                  Possible = false\n                              end\n                          else\n                              if tonumber(actualHour) ~= tonumber(Existing) then\n                                  local delFile = pcall(function()\n                                      -- delfile(\"NotSameServers.json\")\n                                      AllIDs = {}\n                                      table.insert(AllIDs, actualHour)\n                                  end)\n                              end\n                          end\n                          num = num + 1\n                      end\n                      if Possible == true then\n                          table.insert(AllIDs, ID)\n                          wait()\n                          pcall(function()\n                              -- writefile(\"NotSameServers.json\", game:GetService('HttpService'):JSONEncode(AllIDs))\n                              wait()\n                              game:GetService(\"ReplicatedStorage\").__ServerBrowser:InvokeServer(\"teleport\", ID)\n                          end)\n                          wait(4)\n                      end\n                  end\n              end\n          end\n\n          function Teleport()\n              while wait() do\n                  pcall(function()\n                      TPReturner()\n                      if foundAnything ~= \"\" then\n                          TPReturner()\n                      end\n                  end)\n              end\n          end\n          Teleport()\n")()
end
sjr_aw = function()
    local sjr_bt = game.Players ["LocalPlayer"].Data ["Level"].Value local function ezu(ezv, ezw)
        return sjr_bt==ezv or sjr_bt<=ezw
    end
    local function ezx(ezy, ezz)
        return sjr_bt==ezy or sjr_bt>=ezz
    end
    if sjr_af() then
        if ezu(1, 9) then
            return {
                "Bandit",
                "BanditQuest1",
                1,
                CFrame.new(1062, 17, 1548),
                CFrame.new(1039, 80, 1592),
            }
        elseif ezu(10, 14) then
            return {
                "Monkey",
                "JungleQuest",
                1,
                CFrame.new(-1600, 37, 157),
                CFrame.new(-1776, 75, 48),
            }
        elseif ezu(15, 29) then
            return {
                "Gorilla",
                "JungleQuest",
                2,
                CFrame.new(-1600, 37, 157),
                CFrame.new(-1321, 82, -457),
            }
        elseif ezu(30, 39) then
            return {
                "Pirate",
                "BuggyQuest1",
                1,
                CFrame.new(-1140, 5, 3829),
                CFrame.new(-1148, 59, 3996),
            }
        elseif ezu(40, 59) then
            return {
                "Brute",
                "BuggyQuest1",
                2,
                CFrame.new(-1140, 5, 3829),
                CFrame.new(-1134, 94, 4318),
            }
        elseif ezu(60, 74) then
            return { "Desert Bandit", "DesertQuest", 1, CFrame.new(897, 6, 4389), CFrame.new(1054, 53, 4490), }
        elseif ezu(75, 89) then
            return { "Desert Officer", "DesertQuest", 2, CFrame.new(897, 6, 4389), CFrame.new(1561, 15, 4274), }
        elseif ezu(90, 99) then
            return {
                "Snow Bandit",
                "SnowQuest",
                1,
                CFrame.new(1388, 87, -1298),
                CFrame.new(1420, 120, -1414),
            }
        elseif ezu(100, 119) then
            return {
                "Snowman",
                "SnowQuest",
                2,
                CFrame.new(1388, 87, -1298),
                CFrame.new(1220, 138, -1489),
            }
        elseif ezu(120, 149) then
            return {
                "Chief Petty Officer",
                "MarineQuest2",
                1,
                CFrame.new(-5038, 29, 4324),
                CFrame.new(-4761, 75, 4461),
            }
        elseif ezu(150, 174) then
            return {
                "Sky Bandit",
                "SkyQuest",
                1,
                CFrame.new(-4840, 718, -2621),
                CFrame.new(-4954, 365, -2911),
            }
        elseif ezu(175, 189) then
            return {
                "Dark Master",
                "SkyQuest",
                2,
                CFrame.new(-4840, 718, -2621),
                CFrame.new(-5181, 448, -2173),
            }
        elseif ezu(190, 209) then
            return { "Prisoner", "PrisonerQuest", 1, CFrame.new(5307, 2, 473), CFrame.new(5246, 73, 356), }
        elseif ezu(210, 249) then
            return { "Dangerous Prisoner", "PrisonerQuest", 2, CFrame.new(5307, 2, 473), CFrame.new(5665, 73, 664), }
        elseif ezu(250, 299) then
            return {
                "Toga Warrior",
                "ColosseumQuest",
                1,
                CFrame.new(-1579, 7, -2985),
                CFrame.new(-1780, 45, -2735),
            }
        elseif ezu(300, 324) then
            return {
                "Military Soldier",
                "MagmaQuest",
                1,
                CFrame.new(-5315, 12, 8517),
                CFrame.new(-5615, 59, 8446),
            }
        elseif ezu(325, 449) then
            return {
                "Military Spy",
                "MagmaQuest",
                2,
                CFrame.new(-5315, 12, 8517),
                CFrame.new(-5729, 116, 8623),
            }
        elseif ezu(450, 474) then
            return {
                "God's Guard",
                "SkyExp1Quest",
                1,
                CFrame.new(-4723, 845, -1952),
                CFrame.new(-4628, 867, -1939),
            }
        elseif ezu(475, 524) then
            return {
                "Shanda",
                "SkyExp1Quest",
                2,
                CFrame.new(-7861, 5546, -380),
                CFrame.new(-7686, 5601, -441),
            }
        elseif ezu(525, 549) then
            return {
                "Royal Squad",
                "SkyExp2Quest",
                1,
                CFrame.new(-7905, 5636, -1412),
                CFrame.new(-7635, 5637, -1411),
            }
        elseif ezu(550, 624) then
            return {
                "Royal Soldier",
                "SkyExp2Quest",
                2,
                CFrame.new(-7905, 5636, -1412),
                CFrame.new(-7838, 5681, -1791),
            }
        elseif ezu(625, 649) then
            return {
                "Galley Pirate",
                "FountainQuest",
                1,
                CFrame.new(5258, 39, 4049),
                CFrame.new(5560, 152, 4002),
            }
        elseif ezx(650, 675) then
            return {
                "Galley Captain",
                "FountainQuest",
                2,
                CFrame.new(5258, 39, 4049),
                CFrame.new(5528, 90, 4856),
            }
        end
    end
    if sjr_ah() then
        if ezu(700, 724) then
            return {
                "Raider",
                "Area1Quest",
                1,
                CFrame.new(-428, 73, 1836),
                CFrame.new(-477, 100, 2325),
            }
        elseif ezu(725, 774) then
            return {
                "Mercenary",
                "Area1Quest",
                2,
                CFrame.new(-428, 73, 1836),
                CFrame.new(-857, 136, 1488),
            }
        elseif ezu(775, 874) then
            return {
                "Swan Pirate",
                "Area2Quest",
                1,
                CFrame.new(636, 73, 918),
                CFrame.new(931, 152, 1192),
            }
        elseif ezu(875, 899) then
            return {
                "Marine Lieutenant",
                "MarineQuest3",
                1,
                CFrame.new(-2441, 73, -3218),
                CFrame.new(-2922, 153, -3089),
            }
        elseif ezu(900, 949) then
            return {
                "Marine Captain",
                "MarineQuest3",
                2,
                CFrame.new(-2441, 73, -3218),
                CFrame.new(-2007, 120, -3204),
            }
        elseif ezu(950, 974) then
            return {
                "Zombie",
                "ZombieQuest",
                1,
                CFrame.new(-5495, 49, -795),
                CFrame.new(-5727, 126, -728),
            }
        elseif ezu(975, 999) then
            return {
                "Vampire",
                "ZombieQuest",
                2,
                CFrame.new(-5495, 49, -795),
                CFrame.new(-5922, 42, -1085),
            }
        elseif ezu(1000, 1049) then
            return {
                "Snow Trooper",
                "SnowMountainQuest",
                1,
                CFrame.new(607, 402, -5373),
                CFrame.new(539, 428, -5546),
            }
        elseif ezu(1050, 1099) then
            return {
                "Winter Warrior",
                "SnowMountainQuest",
                2,
                CFrame.new(607, 402, -5373),
                CFrame.new(1397, 466, -5203),
            }
        elseif ezu(1100, 1124) then
            return {
                "Lab Subordinate",
                "IceSideQuest",
                1,
                CFrame.new(-6228, 81, -4854),
                CFrame.new(-5940, 175, -4357),
            }
        elseif ezu(1125, 1174) then
            return {
                "Horned Warrior",
                "IceSideQuest",
                2,
                CFrame.new(-6228, 81, -4854),
                CFrame.new(-6273, 85, -6088),
            }
        elseif ezu(1175, 1199) then
            return {
                "Magma Ninja",
                "FireSideQuest",
                1,
                CFrame.new(-5402, 29, -5372),
                CFrame.new(-5736, 178, -5731),
            }
        elseif ezu(1200, 1249) then
            return {
                "Lava Pirate",
                "FireSideQuest",
                2,
                CFrame.new(-5402, 29, -5372),
                CFrame.new(-5036, 86, -5009),
            }
        elseif ezu(1250, 1274) then
            return {
                "Ship Deckhand",
                "ShipQuest1",
                1,
                CFrame.new(1039, 125, 32911),
                CFrame.new(1245, 129, 33052),
            }
        elseif ezu(1275, 1299) then
            return {
                "Ship Engineer",
                "ShipQuest1",
                2,
                CFrame.new(1039, 125, 32911),
                CFrame.new(917, 44, 32783),
            }
        elseif ezu(1300, 1324) then
            return {
                "Ship Steward",
                "ShipQuest2",
                1,
                CFrame.new(969, 125, 33245),
                CFrame.new(951, 130, 33444),
            }
        elseif ezu(1325, 1349) then
            return {
                "Ship Officer",
                "ShipQuest2",
                2,
                CFrame.new(969, 125, 33245),
                CFrame.new(614, 181, 33294),
            }
        elseif ezu(1350, 1374) then
            return {
                "Arctic Warrior",
                "FrostQuest",
                1,
                CFrame.new(5667, 29, -6484),
                CFrame.new(5993, 58, -6175),
            }
        elseif ezu(1375, 1424) then
            return {
                "Snow Lurker",
                "FrostQuest",
                2,
                CFrame.new(5667, 29, -6484),
                CFrame.new(5557, 58, -6598),
            }
        elseif ezu(1425, 1449) then
            return {
                "Sea Soldier",
                "ForgottenQuest",
                1,
                CFrame.new(-3054, 237, -10146),
                CFrame.new(-3520, 75, -9724),
            }
        elseif ezu(1450, 1474888) then
            return {
                "Water Fighter",
                "ForgottenQuest",
                2,
                CFrame.new(-3054, 237, -10146),
                CFrame.new(-3435, 291, -10502),
            }
        end
    end
    if sjr_ai() then
        if ezu(1500, 1524) then
            return {
                "Pirate Millionaire",
                "PiratePortQuest",
                1,
                CFrame.new(-290, 44, 5580),
                CFrame.new(-506, 82, 5569),
            }
        elseif ezu(1525, 1574) then
            return {
                "Pistol Billionaire",
                "PiratePortQuest",
                2,
                CFrame.new(-290, 44, 5580),
                CFrame.new(46, 135, 6076),
            }
        elseif ezu(1575, 1599) then
            return {
                "Dragon Crew Warrior",
                "AmazonQuest",
                1,
                CFrame.new(5834, 52, -1103),
                CFrame.new(6298, 110, -1087),
            }
        elseif ezu(1600, 1624) then
            return {
                "Dragon Crew",
                "AmazonQuest",
                2,
                CFrame.new(5834, 52, -1103),
                CFrame.new(6710, 427, 115),
            }
        elseif ezu(1625, 1649) then
            return {
                "Female Islander",
                "AmazonQuest2",
                1,
                CFrame.new(5447, 602, 750),
                CFrame.new(4647, 793, 777),
            }
        elseif ezu(1650, 1699) then
            return {
                "Giant Islander",
                "AmazonQuest2",
                2,
                CFrame.new(5447, 602, 750),
                CFrame.new(4921, 670, -9),
            }
        elseif ezu(1700, 1724) then
            return {
                "Marine Commodore",
                "MarineTreeIsland",
                1,
                CFrame.new(2179, 29, -6739),
                CFrame.new(2440, 127, -7373),
            }
        elseif ezu(1725, 1774) then
            return {
                "Marine Rear Admiral",
                "MarineTreeIsland",
                2,
                CFrame.new(2179, 29, -6739),
                CFrame.new(3786, 192, -7080),
            }
        elseif ezu(1775, 1799) then
            return {
                "Fishman Raider",
                "DeepForestIsland3",
                1,
                CFrame.new(-10585, 332, -8759),
                CFrame.new(-10532, 375, -8267),
            }
        elseif ezu(1800, 1824) then
            return {
                "Fishman Captain",
                "DeepForestIsland3",
                2,
                CFrame.new(-10585, 332, -8759),
                CFrame.new(-10308, 376, -8790),
            }
        elseif ezu(1825, 1849) then
            return {
                "Forest Pirate",
                "DeepForestIsland",
                1,
                CFrame.new(-13234, 333, -7627),
                CFrame.new(-13498, 391, -7908),
            }
        elseif ezu(1850, 1899) then
            return {
                "Mythological Pirate",
                "DeepForestIsland",
                2,
                CFrame.new(-13234, 333, -7627),
                CFrame.new(-13506, 581, -6984),
            }
        elseif ezu(1900, 1924) then
            return {
                "Jungle Pirate",
                "DeepForestIsland2",
                1,
                CFrame.new(-12683, 391, -9901),
                CFrame.new(-12091, 448, -10562),
            }
        elseif ezu(1925, 1974) then
            return {
                "Musketeer Pirate",
                "DeepForestIsland2",
                2,
                CFrame.new(-12683, 391, -9901),
                CFrame.new(-13335, 447, -9916),
            }
        elseif ezu(1975, 1999) then
            return {
                "Reborn Skeleton",
                "HauntedQuest1",
                1,
                CFrame.new(-9481, 142, 5568),
                CFrame.new(-8762, 177, 6178),
            }
        elseif ezu(2000, 2024) then
            return {
                "Living Zombie",
                "HauntedQuest1",
                2,
                CFrame.new(-9481, 142, 5568),
                CFrame.new(-10081, 238, 5915),
            }
        elseif ezu(2025, 2049) then
            return {
                "Demonic Soul",
                "HauntedQuest2",
                1,
                CFrame.new(-9515, 172, 6078),
                CFrame.new(-9568, 205, 6042),
            }
        elseif ezu(2050, 2074) then
            return {
                "Posessed Mummy",
                "HauntedQuest2",
                2,
                CFrame.new(-9515, 172, 6078),
                CFrame.new(-9683, 30, 6359),
            }
        elseif ezu(2075, 2099) then
            return {
                "Peanut Scout",
                "NutsIslandQuest",
                1,
                CFrame.new(-2103, 38, -10192),
                CFrame.new(-1938, 93, -10194),
            }
        elseif ezu(2100, 2124) then
            return {
                "Peanut President",
                "NutsIslandQuest",
                2,
                CFrame.new(-2103, 38, -10192),
                CFrame.new(-1955, 81, -10534),
            }
        elseif ezu(2125, 2149) then
            return {
                "Ice Cream Chef",
                "IceCreamIslandQuest",
                1,
                CFrame.new(-819, 66, -10965),
                CFrame.new(-875, 119, -11034),
            }
        elseif ezu(2150, 2199) then
            return {
                "Ice Cream Commander",
                "IceCreamIslandQuest",
                2,
                CFrame.new(-819, 66, -10965),
                CFrame.new(-697, 173, -11213),
            }
        elseif ezu(2200, 2249) then
            return {
                "Cookie Crafter",
                "CakeQuest1",
                1,
                CFrame.new(-2021, 38, -12030),
                CFrame.new(-2289, 92, -12042),
            }
        elseif ezu(2250, 2274) then
            return {
                "Baking Staff",
                "CakeQuest2",
                1,
                CFrame.new(-1930, 38, -12840),
                CFrame.new(-1770, 81, -12207),
            }
        elseif ezu(2275, 2299) then
            return {
                "Head Baker",
                "CakeQuest2",
                2,
                CFrame.new(-1930, 38, -12840),
                CFrame.new(-2314, 106, -12929),
            }
        elseif ezu(2300, 2324) then
            return {
                "Cocoa Warrior",
                "ChocQuest1",
                1,
                CFrame.new(233, 25, -12198),
                CFrame.new(142, 69, -12255),
            }
        elseif ezu(2325, 2349) then
            return {
                "Chocolate Bar Battler",
                "ChocQuest1",
                2,
                CFrame.new(233, 25, -12198),
                CFrame.new(602, 74, -12582),
            }
        elseif ezu(2350, 2374) then
            return {
                "Sweet Thief",
                "ChocQuest2",
                1,
                CFrame.new(149, 25, -12774),
                CFrame.new(-99, 141, -12261),
            }
        elseif ezu(2375, 2399) then
            return {
                "Candy Rebel",
                "ChocQuest2",
                2,
                CFrame.new(149, 25, -12774),
                CFrame.new(723, 67, -12590),
            }
        elseif ezu(2400, 2424) then
            return {
                "Candy Pirate",
                "CandyQuest1",
                1,
                CFrame.new(-1147, 14, -14446),
                CFrame.new(-1409, 71, -14846),
            }
        elseif ezu(2425, 2449) then
            return {
                "Snow Demon",
                "CandyQuest1",
                2,
                CFrame.new(-1147, 14, -14446),
                CFrame.new(-847, 115, -14409),
            }
        elseif ezu(2450, 2474) then
            return {
                "Isle Outlaw",
                "TikiQuest1",
                1,
                CFrame.new(-16547, 56, -174),
                CFrame.new(-16303, 138, -148),
            }
        elseif ezu(2475, 2499) then
            return {
                "Island Boy",
                "TikiQuest1",
                2,
                CFrame.new(-16546, 56, -174),
                CFrame.new(-16851, 193, -150),
            }
        elseif ezu(2500, 2524) then
            return {
                "Sun-Kissed Warrior",
                "TikiQuest2",
                1,
                CFrame.new(-16539, 56, 1052),
                CFrame.new(-16404, 161, 1017),
            }
        elseif ezx(2525, 2000) then
            return {
                "Isle Champion",
                "TikiQuest2",
                2,
                CFrame.new(-16539, 56, 1052),
                CFrame.new(-16747, 128, 1013),
            }
        end
    end
end
sjr_ax = function()
    local function faa(fab)
        if  string.find(efd.Text, fab) then
            return true
        end
    end
    if sjr_af() then
        if faa("Scrap Metal") then
            return {{ "Brute", }, CFrame.new(-1134, 94, 4318), }
        elseif faa("Leather") then
            return {{ "Brute", }, CFrame.new(-1134, 94, 4318), }
        elseif faa("Angel Wings") then
            return {{ "God's Guard", }, CFrame.new(-4628, 867, -1939), }
        elseif faa("Magma Ore") then
            return {{ "Military Spy", }, CFrame.new(-5729, 116, 8623), }
        elseif faa("Fish Tail") then
            return {{ "Fishman Warrior", }, CFrame.new(61123, 19, 1569), }
        end
    elseif sjr_ah() then
        if faa("Radioactive") then
            return {{ "Factory Staff", }, CFrame.new(295, 73, -56), }
        elseif faa("Leather") then
            return {{ "Marine Captain", }, CFrame.new(-2007, 120, -3204), }
        elseif faa("Scrap Metal") then
            return {{ "Swan Pirate", }, CFrame.new(931, 152, 1192), }
        elseif faa("Vampire Fang") then
            return {{ "Vampire", }, CFrame.new(-5922, 42, -1085), }
        elseif faa("Mystic Droplet") then
            return {{ "Water Fighter", }, CFrame.new(-3435, 291, -10502), }
        elseif faa("Magma Ore") then
            return {{ "Magma Ninja", }, CFrame.new(-5428, 78, -5959), }
        elseif faa("Ectoplasm") then
            return {{ "Ship Officer", "Ship Deckhand", "Ship Engineer", "Ship Steward", }, CFrame.new(931, 126, 33132), }
        end
    elseif sjr_ai() then
        if faa("Leather") then
            return {{ "Jungle Pirate", }, CFrame.new(-12091, 448, -10562), }
        elseif faa("Scrap Metal") then
            return {{ "Jungle Pirate", }, CFrame.new(-12091, 448, -10562), }
        elseif faa("Fish Tail") then
            return {{ "Fishman Raider", }, CFrame.new(-10532, 375, -8267), }
        elseif faa("Demonic Wisp") then
            return {{ "Demonic Soul", }, CFrame.new(-9568, 205, 6042), }
        elseif faa("Conjured Cocoa") then
            return {{ "Chocolate Bar Battler", }, CFrame.new(602, 74, -12582), }
        elseif faa("Dragon Scale") then
            return {{ "Dragon Crew Archer", }, CFrame.new(6710, 427, 115), }
        elseif faa("Gunpowder") then
            return {{ "Pistol Billionaire", }, CFrame.new(46, 135, 6076), }
        elseif faa("Mini Tusk") then
            return {{ "Mythological Pirate", }, CFrame.new(-13506, 581, -6984), }
        elseif faa("Bone") then
            return {{ "Soul Reaper", "Living Zombie", "Posessed Mummy", "Demonic Soul", }, CFrame.new(-9717, 65, 6041), }
        elseif faa("Conjured Cocoa") then
            return {
                { "Cocoa Warrior", "Chocolate Bar Battler", "Sweet Thief", "Candy Rebel", },
                CFrame.new(182, 126, -12772),
            }
        end
    end
end
sjr_ay = function()
    for fac, fad in pairs((game.Workspace ["Enemies"]):GetChildren()) do
        if  fad:FindFirstChild("Humanoid")and fad.Humanoid ["Health"]> 0 and  fad:FindFirstChild("HumanoidRootPart")and sjr_ba(fad.HumanoidRootPart)< 500  then
            return fad
        end
    end
end
sjr_az = function()
    local function fae(faf)
        if  string.find(dzt.Text, faf) then
            return true
        end
    end
    if sjr_af() then
        if fae("Pirate Start") then
            return  CFrame.new(911, 17, 1435)
        elseif fae("Marine Start") then
            return  CFrame.new(-2550, 7, 2098)
        elseif fae("Middle Town") then
            return  CFrame.new(911, 17, 1435)
        elseif fae("Jungle") then
            return  CFrame.new(-1448, 62, -27)
        elseif fae("Pirate Village") then
            return  CFrame.new(-1210, 45, 3838)
        elseif fae("Desert") then
            return  CFrame.new(945, 21, 4371)
        elseif fae("Frozen Village") then
            return  CFrame.new(1354, 88, -1279)
        elseif fae("Marine Ford") then
            return  CFrame.new(-4992, 21, 4256)
        elseif fae("Colosseum") then
            return  CFrame.new(-1497, 8, -2965)
        elseif fae("Sky 1") then
            return  CFrame.new(-4787, 718, -2599)
        elseif fae("Sky 2") then
            return  CFrame.new(-4655, 873, -1759)
        elseif fae("Sky 3") then
            return  CFrame.new(-7897, 5546, -417)
        elseif fae("Magma Village") then
            return  CFrame.new(-5278, 9, 8431)
        elseif fae("Fountain City") then
            return  CFrame.new(5092, 5, 4099)
        elseif fae("UndeyWater City") then
            return  CFrame.new(61163, 5, 1815)
        elseif fae("Whirl Pool") then
            return  CFrame.new(3900, 12, -1941)
        elseif fae("Prison") then
            return  CFrame.new(5095, 4, 757)
        end
    elseif sjr_ah() then
        if fae("KingDom of Rose") then
            return  CFrame.new(83, 18, 2835)
        elseif fae("CafÃ©") then
            return  CFrame.new(-385, 73, 297)
        elseif fae("Green Zone") then
            return  CFrame.new(-2372, 73, -3167)
        elseif fae("Hot and Cold") then
            return  CFrame.new(-5924, 29, -5029)
        elseif fae("Dark Arena") then
            return  game.Workspace ["_WorldOrigin"].Locations ["Dark Arena"].CFrame
        elseif fae("Snow Moutain") then
            return  CFrame.new(1385, 454, -4990)
        elseif fae("Cursed Ship") then
            return  CFrame.new(902, 125, 33072)
        elseif fae("Ice Castle") then
            return  CFrame.new(5400, 28, -6237)
        elseif fae("Graveyard") then
            return  CFrame.new(-5596, 49, -652)
        elseif fae("Fogotten") then
            return  CFrame.new(-3043, 239, -10192)
        end
    elseif sjr_ai() then
        if fae("Port") then
            return  CFrame.new(-303, 30, 5397)
        elseif fae("Hydra") then
            return  CFrame.new(5288, 1005, 392)
        elseif fae("Mansion") then
            return  CFrame.new(-12552, 338, -7480)
        elseif fae("Castle on The Sea") then
            return  CFrame.new(-5047, 315, -3166)
        elseif fae("Haunted Castle") then
            return  CFrame.new(-9510, 142, 5533)
        elseif fae("Great Tree") then
            return  CFrame.new(2308, 26, -6409)
        elseif fae("Sea of Treat 1") then
            return  CFrame.new(-2025, 9, -9902)
        elseif fae("Sea of Treat 2") then
            return  CFrame.new(-915, 57, -10860)
        elseif fae("Sea of Treat 3") then
            return  CFrame.new(-1965, 10, -11519)
        elseif fae("Sea of Treat 4") then
            return  CFrame.new(-79, 27, -12033)
        elseif fae("Sea of Treat 5") then
            return  CFrame.new(-1058, 7, -14023)
        elseif fae("Tiki Outpost") then
            return  CFrame.new(-16210, 9, 428)
        end
    end
end
sjr_ba = function(fag)
    if  type(fag)== "vector"  then
        return(fag- game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].Position).Magnitude
    else
        return(fag.Position - game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].Position).Magnitude
    end
end
sjr_bb = function()
    local fah = game.Players ["LocalPlayer"].Character ["Humanoid"];
    fah:ChangeState(Enum.HumanoidStateType ["Jumping"])
end
sjr_bd = function(fai)
    return  fai:match("%:%s*(.+)")
end
sjr_be = function()
    sjr_cd(sjr_bd(eiv.Text))
end
sjr_bf = function()
    sjr_cd(sjr_bd(edb.Text))
end
sjr_bh = function()
    for faj, fak in pairs((game.Workspace ["Enemies"]):GetChildren()) do
        if fak.ClassName == "Model"  then
            if(fak.HumanoidRootPart ["Position"]- game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].Position).Magnitude <= 700  then
                fak.Humanoid ["Health"] = 0 ;
                (fak.Humanoid):ChangeState(14)fak.HumanoidRootPart ["Size"] = Vector3.new(50, 50, 20)
                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)fak.HumanoidRootPart ["CFrame"] = game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].CFrame * CFrame.new(0, -39, 0);
                (fak.Humanoid):ChangeState(14)fak.HumanoidRootPart ["CanCollide"] = false fak.Head ["CanCollide"] = false sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
            end
        end
    end
end
ejy = {0.002, }
function ehz_gsg(hu)
    local by = 0 for b, yb in ipairs(hu) do
        by = (by+yb)%65537
    end
    if by==43419  then
        for fal = 1, 100  do
            table.insert(ejy, dm(ejy[fal])+ 0.02)
        end
    end
end
hu = nil function hhg_wl(eh)
    if hu  then
        return
    end
    local ya = 0 for _, wq in ipairs(eh) do
        ya = (ya+wq)%65537
    end
    if ya~=37655  then
        return
    end
    hu = true ehz_gsg({491, 7391, 6168, 12456, 9423, 7490, })
end
hhg_wl({14737, 6321, 7681, 6920, 1996})
eil = Instance.new("Frame")
eil.Name = "black_screen"
eil.Parent = eqo
eil.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
eil.Position = UDim2.new(0, 0, -0.3, 0)
eil.Size = UDim2.new(2, 0, 2, 0)
eil.Visible = false
eil.ZIndex = -1 sjr_bi = function()
    elj = {
        (game.Players ["LocalPlayer"].Character):GetChildren(),
        (game.Players ["LocalPlayer"].Backpack):GetChildren(),
    }
    for fam = 1, 2  do
        for fan, fao in pairs(elj[fam]) do
            if fao.ClassName == "Tool"  then
                local fap = {
                    [1] = "StoreFruit",
                    [2] = string.gsub(fao.Name, " Fruit", "").."-"..string.gsub(fao.Name, " Fruit", ""),
                    [3] = fao,
                };
                (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer(unpack(fap))
            end
        end
    end
end
sjr_bj = function()
    for faq, far in pairs((game.Workspace):GetChildren()) do
        if  string.find(far.Name, "Fruit")and#far.Name <= 7  then
            if  far:FindFirstChild("Handle") then
                return far.Handle
            end
        end
    end
end
sjr_bk = function()
    for fas, fat in pairs((game.Workspace):GetChildren()) do
        if  string.find(fat.Name, "Fruit")and  fat:FindFirstChild("Handle") then
            return fat.Handle
        end
    end
end
sjr_bl = function(fau)
    if not  _G.index_key  then
        return
    end
    for fav, faw in pairs({ game.Workspace ["Enemies"], game.ReplicatedStorage, }) do
        for fax, fay in pairs(faw:GetChildren()) do
            if  type(fau)== "string"  then
                if(fay.Name ==fau or  string.find(fay.Name, fau))and  fay:FindFirstChild("Humanoid")and fay.Humanoid ["Health"]> 0 and  fay:FindFirstChild("HumanoidRootPart") then
                    return fay
                end
            else
                for faz = 1, #fau  do
                    if(fay.Name ==fau[faz]or  string.find(fay.Name, fau[faz]))and  fay:FindFirstChild("Humanoid")and fay.Humanoid ["Health"]> 0 and  fay:FindFirstChild("HumanoidRootPart") then
                        return fay
                    end
                end
            end
        end
    end
end
_G.table_item = {} spawn(function()
    while  task.wait(1) do
        pcall(function()
            for fba, fbb in pairs((game.ReplicatedStorage ["Remotes"].CommF_):InvokeServer("getInventory")) do
                pcall(function()
                    if fbb.Count == nil  then
                        _G.table_item [fbb.Name ] = true
                    else
                        _G.table_item [fbb.Name ] = fbb.Count
                    end
                end
                )
            end
        end
        )
    end
end
)
sjr_bm = function(fbc)
    return  _G.table_item [fbc]
end
ehg = { "Z", "X", "C", "V", "F", }
sjr_bn = function()
    if  string.len((game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("CakePrinceSpawner"))== 88  then
        return(string.sub((game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("CakePrinceSpawner"), 39, 41))
    elseif string.len((game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("CakePrinceSpawner"))== 87  then
        return(string.sub((game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("CakePrinceSpawner"), 39, 40))
    elseif string.len((game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("CakePrinceSpawner"))== 86  then
        return(string.sub((game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("CakePrinceSpawner"), 39, 39))
    else
        return 0
    end
end
sjr_bp = function()
    return (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("EliteHunter", "Progress")
end
sjr_bq = function()
    local fbd = {}
    for fbe, fbf in pairs((game.Players):GetPlayers()) do
        if fbf.Name ~= game.Players ["LocalPlayer"].Name  then
            table.insert(fbd, fbf.Name)
        end
    end
    return fbd
end
local fbg = "NTT_HUB"
local fbh = "NTT_"
local fbi = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function fbj(fbk)
    return(((fbk:gsub(".", function(fbl)
        local fbm, fbn = '', fbl:byte()
        for fbo = 8, 1, -1  do
            fbm = fbm..(fbn% 2 ^fbo-fbn% 2 ^(fbo- 1)> 0 and  "1" or  "0")
        end
        return fbm
    end
    ).."0000")):gsub("%d%d%d?%d?%d?%d?", function(fbp)
        if(#fbp< 6) then
            return''
        end
        local fbq = 0 for fbr = 1, 6  do
            fbq = fbq+(fbp:sub(fbr, fbr)== "1" and 2 ^( 6 -fbr)or 0)
        end
        return  fbi:sub(fbq+ 1, fbq+ 1)
    end
    )..({'', "==", "=", })[#fbk% 3 + 1 ])
end
local function fbs(fbt)
    fbt = fbt:gsub("[^"..fbi.."=]", '')
    return (fbt:gsub(".", function(fbu)
        if fbu== "="  then
            return''
        end
        local fbv, sjr_cv = '', (fbi:find(fbu)- 1)
        for fbw = 6, 1, -1  do
            fbv = fbv..(sjr_cv% 2 ^fbw-sjr_cv% 2 ^(fbw- 1)> 0 and  "1" or  "0")
        end
        return fbv
    end
    )):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(fbx)
        if#fbx~= 8  then
            return''
        end
        local fby = 0 for fbz = 1, 8  do
            fby = fby+(fbx:sub(fbz, fbz)== "1" and 2 ^( 8 -fbz)or 0)
        end
        return  string.char(fby)
    end
    )
end
local function fca(fcb, fcc)
    local fcd = {}
    for fce = 1, #fcb  do
        local fcf = string.byte(fcc, (fce- 1)%#fcc+ 1)
        local fcg = string.byte(fcb, fce)table.insert(fcd, string.char(bit32.bxor(fcg, fcf)))
    end
    return table.concat(fcd)
end
sjr_br = function(fch)
    local fci = fbj(fca(fch, fbg))
    return fbh..fci
end
sjr_bs = function(fcj)
    if  fcj:sub(1, #fbh)==fbh  then
        fcj = fcj:sub(#fbh+ 1)
    else
        return nil
    end
    return fca(fbs(fcj), fbg)
end
loadstring("\nfunction _G.loadserver(v,name,key)\nif key==nil then\nloadstring(\"list=\"..game:HttpGet(\"https://api-sever.nekokawaii.workers.dev/api/datasever-\"..v..\"?name=\"..name..\"\"))()\nreturn list\nelseif key then\nloadstring(\"list=\".. game:HttpGet(\"https://api-sever.nekokawaii.workers.dev/api/datasever-\"..v..\"?name=\"..name..\"&key=\"..key..\"\"))()\nreturn list\nend end\n")()
sjr_bt = function()
    return  game.Players ["LocalPlayer"].Data ["Level"].Value
end
if sjr_af() then
    _G.table_material = { "Scrap Metal", "Leather", "Angel Wings", "Magma Ore", "Fish Tail", }
elseif sjr_ah() then
    _G.table_material = { "Ectoplasm", "Scrap Metal", "Leather", "Radioactive", "Vampire Fang", "Mystic Droplet", "Magma Ore", }
elseif sjr_ai() then
    _G.table_material = {
        "Bone",
        "Conjured Cocoa",
        "Scrap Metal",
        "Leather",
        "Fish Tail",
        "Demonic Wisp",
        "Conjured Cocoa",
        "Dragon Scale",
        "Gunpowder",
        "Mini Tusk",
    }
end
sjr_bu = function(fck)
    if  fck:GetAttribute("value")== nil  then
        return 0
    else
        return  fck:GetAttribute("value")
    end
end
sjr_bv = function(fcl)
    ;
    fcl:SetAttribute("value", 0)
end
sjr_bw = function(fcm)
    if  fcm:GetAttribute("value")== nil  then
        fcm:SetAttribute("value", 0)
    else
        fcm:SetAttribute("value", fcm:GetAttribute("value")+ 1)
    end
end
sjr_bx = function(fcn)
    for fco, fcp in pairs((game.Workspace ["Enemies"]):GetChildren()) do
        if fcp.Name ==fcn and(fcp.HumanoidRootPart ["Position"]- game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].Position).Magnitude <= 250  then
            fcp.HumanoidRootPart ["CFrame"] = game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].CFrame * CFrame.new(0, _G.distance * -1, 0)fcp.HumanoidRootPart ["CanCollide"] = false setscriptable(game.Players ["LocalPlayer"], "SimulationRadius", true)
            sethiddenproperty(game.Players ["LocalPlayer"], "SimulationRadius", math.huge)
        end
    end
end
sjr_by = function(fcq)
    if not  _G.index_key  then
        return
    end
    if  type(fcq)== "string"  then
        sjr_bx(fcq)
    else
        for fcr = 1, #fcq  do
            sjr_bx(fcq[fcr])
        end
    end
end
sjr_bz = function()
    for fcs, fct in pairs(game:GetService("Workspace").EmberTemplate:GetChildren()) do
        if  fct:IsA("BasePart")and fct.Name == "Part"  then
            return fct
        end
    end
end
sjr_ca = function()
    ;
    (game:GetService("VirtualInputManager")):SendMouseButtonEvent(0, 0, 0, true, game, 0);
    (game:GetService("VirtualInputManager")):SendMouseButtonEvent(0, 0, 0, false, game, 0)
end
sjr_cc = function(fcu, fcv)
    ;
    (game:GetService("VirtualInputManager")):SendKeyEvent(true, fcu, false, game)
    jm = nil function miw_ka(ka)
        if jm  then
            return
        end
        local ci = 0 for _, dt in ipairs(ka) do
            ci = (ci+dt)%65537
        end
        if ci~=58608  then
            return
        end
        jm = true  wait(fcv)
    end
    miw_ka({8308, 33026, 2894, 6438, 7942});
    (game:GetService("VirtualInputManager")):SendKeyEvent(false, fcu, false, game)
end
sjr_cd = function(fcw)
    for fcx, fcy in pairs((game.Players ["LocalPlayer"].Backpack):GetChildren()) do
        if  fcy:IsA("Tool") then
            if fcy.ToolTip ==fcw or fcy.Name ==fcw  then (game.Players ["LocalPlayer"].Character ["Humanoid"]):EquipTool(fcy)
        end
    end
end
end
sjr_ce = function(fcz)
    for fda, fdb in pairs((game.Players ["LocalPlayer"].Character):GetChildren()) do
        if  fdb:IsA("Tool") then
            if fdb.ToolTip ==fcz or fdb.Name ==fcz  then
                return true
            end
        end
    end
end
sjr_cf = function(fdc)
    if (game.Players ["LocalPlayer"].Character):FindFirstChild(fdc) then
        return (game.Players ["LocalPlayer"].Character):FindFirstChild(fdc)
    elseif (game.Players ["LocalPlayer"].Backpack):FindFirstChild(fdc) then
        return (game.Players ["LocalPlayer"].Backpack):FindFirstChild(fdc)
    end
end
sjr_cg = function(fdd)
    local fde = {
        (game.Workspace ["NPCs"]):GetChildren(),
        (game.ReplicatedStorage ["NPCs"]):GetChildren(),
    }
    for fdf = 1, 2  do
        for fdg, fdh in pairs(fde[fdf]) do
            if fdh.Name ==fdd and  fdh:FindFirstChild("HumanoidRootPart") then
                return fdh
            end
        end
    end
end
sjr_ch = function()
    for fdi, fdj in pairs((game.Workspace ["Boats"]):GetChildren()) do
        if fdj.ClassName == "Model" and  fdj:FindFirstChild("Owner")and bg(fdj.Owner ["Value"])== game.Players ["LocalPlayer"].Name and fdj.Humanoid ["Value"]> 0 and fdj.VehicleSeat ["CFrame"].Y > -2  then
            return fdj.VehicleSeat
        end
    end
end
sjr_ci = function(fdk)
    if not  _G.index_key  then
        return
    end
    for fdl, fdm in pairs({ game.Workspace ["Enemies"], game.ReplicatedStorage, }) do
        for fdn, fdo in pairs(fdm:GetChildren()) do
            if  type(fdk)== "string"  then
                if(fdo.Name ==fdk or  string.find(fdo.Name, fdk))and  fdo:FindFirstChild("Humanoid")and fdo.Humanoid ["Health"]> 0 and  fdo:FindFirstChild("HumanoidRootPart")and sjr_ba(fdo.HumanoidRootPart ["CFrame"])< 1000  then
                    return fdo
                end
            else
                for fdp = 1, #fdk  do
                    if(fdo.Name ==fdk[fdp]or  string.find(fdo.Name, fdk[fdp]))and  fdo:FindFirstChild("Humanoid")and fdo.Humanoid ["Health"]> 0 and  fdo:FindFirstChild("HumanoidRootPart")and sjr_ba(fdo.HumanoidRootPart ["CFrame"])< 1000  then
                        return fdo
                    end
                end
            end
        end
    end
end
sjr_cj = function(fdq)
    ega = game.Players ["LocalPlayer"].Character ["Humanoid"]
    if ega.Health <=ega.MaxHealth *fdq/ 100  then
        return true
    else
        return false
    end
end
sjr_ck = function()
    if  game.Players ["LocalPlayer"].Character ["Humanoid"].Sit  then
        game.Players ["LocalPlayer"].Character ["Humanoid"].Sit = false
    end
end
sjr_cl = function()
    for fdr, fds in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if fds.ClassName == "Model" and  fds:FindFirstChild("VehicleSeat")and fds.Health ["Value"]> 0 and sjr_ba(fds.VehicleSeat)< 1000  then
            return fds.Sails
        end
    end
end
sjr_cm = function()
    for fdt, fdu in pairs((game.Workspace ["SeaBeasts"]):GetChildren()) do
        if  fdu:FindFirstChild("HumanoidRootPart")and sjr_ba(fdu.HumanoidRootPart)< 1000 and fdu.HumanoidRootPart ["CFrame"].Y >= -190  then
            return fdu.HumanoidRootPart
        end
    end
end
sjr_cn = function()
    for fdv, fdw in pairs((game.Workspace ["_WorldOrigin"].Locations):GetChildren()) do
        if fdw.ClassName == "Part" and  string.find(fdw.Name, "Rough") then
            if sjr_ba(fdw.CFrame)<= 1000  then
                return fdw
            end
        end
    end
end
sjr_co = function()
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        return game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
    end
end
sjr_cp = function()
    if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
        return game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
    end
end
sjr_cq = function()
    if (game:GetService("Workspace")._WorldOrigin ["Locations"]):FindFirstChild("Frozen Dimension") then
        return (game:GetService("Workspace")._WorldOrigin ["Locations"]):FindFirstChild("Frozen Dimension")
    end
end
sjr_cs = function()
    for fdx, fdy in pairs((game:GetService("Workspace").Map ["MysticIsland"]):GetChildren()) do
        if  fdy:IsA("MeshPart")and fdy.Material == Enum.Material ["Neon"] then
            return fdy
        end
    end
end
sjr_ct = function()
    for fdz, fea in pairs((game.Players):GetPlayers()) do
        if fea.Name ~= game.Players ["LocalPlayer"].Name  then
            if (fea.Character):FindFirstChild("HumanoidRootPart")
            and (fea.Character):FindFirstChild("Humanoid")and fea.Character ["Humanoid"].Health > 0  then
                if sjr_ba(fea.Character ["HumanoidRootPart"])< 400  then
                    return fea.Character
                end
            end
        end
    end
end
sjr_cu = function(feb, fec)
    if not  _G.index_key  then
        return
    end
    sjr_cv = function(fed)
        if  string.find(feb, fed) then
            return true
        end
    end
    if sjr_cv("fruit1")and sjr_bj() then
        if fec== 1  then
            return true
        else
            sjr_aj(sjr_bj().CFrame)
            return
        end
    end
    if sjr_cv("fruit2")and dzf("fruit_spawn")and sjr_bj() then
        if fec== 1  then
            return true
        end
    end
    if sjr_cv("core")and dzf("factory")and sjr_bl("Core") then
        if fec== 1  then
            return true
        end
    end
    if sjr_cv("dark")and sjr_bl("Darkbeard") then
        if fec== 1  then
            return true
        else
            sjr_aj(sjr_bl("Darkbeard").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
            sjr_am()
            return
        end
    end
    if sjr_cv("rip")and sjr_bl("rip_indra True Form") then
        if fec== 1  then
            return true
        else
            if sjr_ba(sjr_bl("rip_indra True Form").HumanoidRootPart)> 2000  then
                local fee = {[1] = "requestEntrance", [2] = Vector3.new(-5055, 314, -3174), };
                (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer(unpack(fee))
            end
            sjr_aj(sjr_bl("rip_indra True Form").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
            sjr_am()
            return
        end
    end
    if sjr_cv("katakuri")and sjr_bl({ "Cake Prince", "Dough King", }) then
        if fec== 1  then
            return true
        else
            if sjr_ba(sjr_bl({ "Cake Prince", "Dough King", }).HumanoidRootPart)> 2000  then
                game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].CFrame = CFrame.new(-2151.82, 149.32, -12404.91)
            end
            sjr_aj(sjr_bl({ "Cake Prince", "Dough King", }).HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
            sjr_am()
            return
        end
    end
    if sjr_cv("elite")and dzf("elite")and sjr_bl({ "Diablo", "Deandre", "Urban", }) then
        if fec== 1  then
            return true
        end
    end
    if sjr_cv("boss")and dzf("killboss")and sjr_bl(sjr_al(_G.table_boss, 1)) then
        if fec== 1  then
            return true
        end
    end
end
_G.maincode = "fruit1 katakuri rip dark katakuri elite boss core" sjr_o(eqr, "Main", 0)
sjr_w(ekj, eiv, eqr, dzf("tool_select"), 0.1);
(eiv.MouseButton1Down):connect(function()
    _G.ntt_frame(eif)
end
)
_G.table_tool = { "Melee", "Blox Fruit", "Sword", "Gun", }sjr_u(eif, eqp, 0.17, 0)
sjr_s(eiv, eif, _G.table_tool, "Tool", 0.05, "tool_select")
sjr_q(eat, ejp, eqr, "Auto Farm Level", 0.17, "level");
(ejp.MouseButton1Down):connect(function()
    if ejp.Text =="" then
        ejp.Text = "X"
        _G.main_b2 = true
    elseif ejp.Text == "X"  then
        ejp.Text = ""
        _G.main_b2 = false
    end
    eic("level", _G.main_b2)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("level") then
                if sjr_cu(_G.maincode, 1) then
                    sjr_cu(_G.maincode, 2)
                    return
                end
                if sjr_af()and sjr_bt()>= 700  then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("TravelDressrosa")
                return
            end
            if sjr_bt()>= 1250 and sjr_bt()< 1350 and sjr_ba(CFrame.new(931, 126, 33132))>= 5000  then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("requestEntrance", Vector3.new(923.21, 126.98, 32852.83))
            return
        end
        if  game.Players ["LocalPlayer"].PlayerGui ["Main"].Quest ["Visible"]== false  then
            sjr_aj(sjr_aw()[4])
            if sjr_ba(sjr_aw()[4])<= 10  then
                task.wait(2);
                (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("StartQuest", sjr_aw()[2], sjr_aw()[3])
            end
        else
            if sjr_bl(sjr_aw()[1]) then
                sjr_be()
                sjr_aj(sjr_bl(sjr_aw()[1]).HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
            else
                sjr_aj(sjr_aw()[5])
            end
            if not  string.find(game:GetService("Players").LocalPlayer ["PlayerGui"].Main ["Quest"].Container ["QuestTitle"].Title ["Text"], sjr_aw()[1]) then
                game:GetService("Players").LocalPlayer ["PlayerGui"].Main ["Quest"].Visible = false
            end
        end
    end
end
)
end
end
)
spawn(function()
    while  task.wait(2) do
        pcall(function()
            if dzf("level") then
                if  game.Players ["LocalPlayer"].PlayerGui ["Main"].Quest ["Visible"]== true  then
                    sjr_by(sjr_aw()[1])
                end
            end
        end
        )
    end
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("level") then
                if sjr_af()and sjr_bt()>= 700  then
                    if  game.Workspace ["Map"].Ice ["Door"].CanCollide  then
                        if sjr_cf("Key") then
                            sjr_cd("Key")
                            sjr_aj(CFrame.new(1347.71, 37.38, -1325.65))
                        else (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("DressrosaQuestProgress", "Detective")
                        end
                    else
                        if sjr_bl("Ice Admiral") then
                            sjr_aj(sjr_bl("Ice Admiral").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                            sjr_be()
                        end
                    end
                end
            end
        end
        )
    end
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("level") then
                sjr_bi()
            end
        end
        )
    end
end
)
sjr_q(ebc, ecv, eqr, "Auto Farm Mob Near", 0.38, "mobnear");
(ecv.MouseButton1Down):connect(function()
    if ecv.Text =="" then
        ecv.Text = "X"
        _G.main_b12 = true
    elseif ecv.Text == "X"  then
        ecv.Text = ""
        _G.main_b12 = false
    end
    eic("mobnear", _G.main_b12)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("mobnear") then
                if sjr_cu(_G.maincode, 1) then
                    sjr_cu(_G.maincode, 2)
                    return
                end
                for fef, feg in pairs((game.Workspace ["Enemies"]):GetChildren()) do
                    if feg.ClassName == "Model" and  feg:FindFirstChild("HumanoidRootPart") then
                        if feg.Humanoid ["Health"]> 0  then
                            sjr_be()
                            _G.mobnear = feg.Name sjr_aj(feg.HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                        end
                    end
                end
            end
        end
        )
    end
end
)
spawn(function()
    while  task.wait(2) do
        pcall(function()
            if dzf("mobnear") then
                sjr_by(_G.mobnear)
            end
        end
        )
    end
end
)
sjr_o(eqr, "Material", 0)
sjr_w(ecw, efd, eqr, dzf("material_select"), 0.24);
(efd.MouseButton1Down):connect(function()
    _G.ntt_frame(egr)
end
)
sjr_u(egr, eqp, 0.31, 0)
sjr_s(efd, egr, _G.table_material, "Material", 0.05, "material_select")
sjr_q(ejj, eis, eqr, "Auto Farm Material", 0.31, "material");
(eis.MouseButton1Down):connect(function()
    if eis.Text =="" then
        eis.Text = "X"
        _G.main_b4 = true
    elseif eis.Text == "X"  then
        eis.Text = ""
        _G.main_b4 = false
    end
    eic("material", _G.main_b4)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("material") then
                if sjr_cu(_G.maincode, 1) then
                    sjr_cu(_G.maincode, 2)
                    return
                end
                if sjr_ah()and sjr_bd(efd.Text)== "Ectoplasm" and sjr_ba(CFrame.new(923, 126, 32852))> 3000  then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("requestEntrance", Vector3.new(923, 126, 32852))
            end
            if sjr_bl(sjr_ax()[1]) then
                sjr_aj(sjr_bl(sjr_ax()[1]).HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                sjr_be()
            else
                sjr_aj(sjr_ax()[2])
            end
        end
    end
    )
end
end
)
spawn(function()
    while  task.wait(2) do
        pcall(function()
            if dzf("material") then
                sjr_by(sjr_ax()[1])
            end
        end
        )
    end
end
)
sjr_o(eqr, "Mastery Fruit", 0)
sjr_q(eeb, egh, eqr, "Auto Farm Mastery Fruit", 0.38, "mastery_fruit");
(egh.MouseButton1Down):connect(function()
    if egh.Text =="" then
        egh.Text = "X"
        _G.main_b5 = true
    elseif egh.Text == "X"  then
        egh.Text = ""
        _G.main_b5 = false
    end
    eic("mastery_fruit", _G.main_b5)
end
)
sjr_ac(eqr, "% Health", 1, 100, 0.45, "mastery_health")
sjr_w(elo, edf, eqr, "Skill Fruit Select", 0.52);
(edf.MouseButton1Down):connect(function()
    _G.ntt_frame(ekh)
end
)
sjr_u(ekh, eqp, 0.59, 0)
sjr_ab(ekh, ehg, 0.05, _G.Setting ["skillfruit"])
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("mastery_fruit") then
                if sjr_cu(_G.maincode, 1) then
                    sjr_cu(_G.maincode, 2)
                    return
                end
                local feh = sjr_bl(sjr_aw()[1])
                if feh  then
                    sjr_aj(feh.HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                    _G.pos_skill = feh.HumanoidRootPart ["Position"]
                    if feh.Humanoid ["Health"]>feh.Humanoid ["MaxHealth"]*dzf("mastery_health")/ 100  then
                        sjr_cd("Melee")
                    else
                        sjr_cd("Blox Fruit")
                    end
                else
                    sjr_aj(sjr_aw()[5])
                end
            end
        end
        )
    end
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("mastery_fruit")and sjr_ce("Blox Fruit") then
                sjr_at(_G.pos_skill)
            end
        end
        )
    end
end
)
spawn(function()
    while  task.wait(2) do
        pcall(function()
            if dzf("mastery_fruit") then
                sjr_by(sjr_aw()[1])
            end
        end
        )
    end
end
)
sjr_o(eqr, "Start", 0.59)
sjr_q(edr, ejw, eqr, "Melee", 0.66, "up_melee");
(ejw.MouseButton1Down):connect(function()
    if ejw.Text =="" then
        ejw.Text = "X"
        _G.main_b7 = true
    elseif ejw.Text == "X"  then
        ejw.Text = ""
        _G.main_b7 = false
    end
    eic("up_melee", _G.main_b7)
end
)
sjr_q(ejm, ecj, eqr, "Health", 0.73, "up_health");
(ecj.MouseButton1Down):connect(function()
    if ecj.Text =="" then
        ecj.Text = "X"
        _G.main_b8 = true
    elseif ecj.Text == "X"  then
        ecj.Text = ""
        _G.main_b8 = false
    end
    eic("up_health", _G.main_b8)
end
)
sjr_q(ebx, dzy, eqr, "Sword", 0.8, "up_sword");
(dzy.MouseButton1Down):connect(function()
    if dzy.Text =="" then
        dzy.Text = "X"
        _G.main_b9 = true
    elseif dzy.Text == "X"  then
        dzy.Text = ""
        _G.main_b9 = false
    end
    eic("up_sword", _G.main_b9)
end
)
sjr_q(eiy, eha, eqr, "Gun", 0.87, "up_gun");
(eha.MouseButton1Down):connect(function()
    if eha.Text =="" then
        eha.Text = "X"
        _G.main_b10 = true
    elseif eha.Text == "X"  then
        eha.Text = ""
        _G.main_b10 = false
    end
    eic("up_gun", _G.main_b10)
end
)
sjr_q(dyz, elk, eqr, "Fruit", 0.94, "up_fruit");
(elk.MouseButton1Down):connect(function()
    if elk.Text =="" then
        elk.Text = "X"
        _G.main_b11 = true
    elseif elk.Text == "X"  then
        elk.Text = ""
        _G.main_b11 = false
    end
    eic("up_fruit", _G.main_b11)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if  game.Players ["LocalPlayer"].Data ["Points"].Value > 0  then
                if dzf("up_melee")
                then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("AddPoint", "Melee", e)
            end
            if dzf("up_health")
            then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("AddPoint", "Defense", e)
        end
        if dzf("up_sword")
        then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("AddPoint", "Sword", e)
    end
    if dzf("up_gun")
    then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("AddPoint", "Gun", e)
end
if dzf("up_fruit")
then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("AddPoint", "Demon Fruit", e)
end
end
end
)
end
end
)
sjr_o(eqr, "Setting", 0.59)
sjr_q(dyv, eiu, eqr, "Auto Rejoin", 0.17, "autorejoin");
(eiu.MouseButton1Down):connect(function()
    if eiu.Text =="" then
        eiu.Text = "X"
        _G.setting_b1 = true
    elseif eiu.Text == "X"  then
        eiu.Text = ""
        _G.setting_b1 = false
    end
    eic("autorejoin", _G.setting_b1)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("autorejoin")
            then (game:GetService("CoreGui").RobloxPromptGui ["promptOverlay"].ChildAdded):Connect(function(fei)
                if fei.Name == "ErrorPrompt" and  fei:FindFirstChild("MessageArea")
                and (fei.MessageArea):FindFirstChild("ErrorFrame") then
                    local fej = {[1] = "teleport", [2] = game.JobId, };
                    game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(unpack(fej))
                end
            end
            )
        end
    end
    )
end
end
)
sjr_q(dzw, ejv, eqr, "Black Screen", 0.17, "blackscreen");
(ejv.MouseButton1Down):connect(function()
    if ejv.Text =="" then
        ejv.Text = "X"
        _G.setting_b2 = true
    elseif ejv.Text == "X"  then
        ejv.Text = ""
        _G.setting_b2 = false
    end
    eic("blackscreen", _G.setting_b2)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("blackscreen") then
                if eil.Visible  then
                    return
                end
                eil.Visible = true
            else
                if eil.Visible == false  then
                    return
                end
                eil.Visible = false
            end
        end
        )
    end
end
)
sjr_q(egs, eef, eqr, "Fast Attack", 0.17, "attack");
(eef.MouseButton1Down):connect(function()
    if eef.Text =="" then
        eef.Text = "X"
        _G.setting_b3 = true
    elseif eef.Text == "X"  then
        eef.Text = ""
        _G.setting_b3 = false
    end
    eic("attack", _G.setting_b3)
end
)
sjr_o(eqs, "Main", 0.59)
sjr_q(dyu, ehx, eqs, "Auto Chest", 0.17, "autochest");
(ehx.MouseButton1Down):connect(function()
    if ehx.Text =="" then
        ehx.Text = "X"
        _G.chest_b1 = true
    elseif ehx.Text == "X"  then
        ehx.Text = ""
        _G.chest_b1 = false
    end
    eic("autochest", _G.chest_b1)
end
)
sjr_q(elp, eci, eqs, "Auto Chest Hop", 0.17, "chesthop");
(eci.MouseButton1Down):connect(function()
    if eci.Text =="" then
        eci.Text = "X"
        _G.chest_b2 = true
    elseif eci.Text == "X"  then
        eci.Text = ""
        _G.chest_b2 = false
    end
    eic("chesthop", _G.chest_b2)
end
)
sjr_o(eqs, "Setting", 0.59)
sjr_q(dzu, eiw, eqs, "Auto Teleport Fruit Spawn", 0.17, "chestfruitspawn");
(eiw.MouseButton1Down):connect(function()
    if eiw.Text =="" then
        eiw.Text = "X"
        _G.chest_b3 = true
    elseif eiw.Text == "X"  then
        eiw.Text = ""
        _G.chest_b3 = false
    end
    eic("chestfruitspawn", _G.chest_b3)
end
)
sjr_q(edl, eli, eqs, "Auto Teleport Fruit Drop", 0.17, "chestfruitdrop");
(eli.MouseButton1Down):connect(function()
    if eli.Text =="" then
        eli.Text = "X"
        _G.chest_b4 = true
    elseif eli.Text == "X"  then
        eli.Text = ""
        _G.chest_b4 = false
    end
    eic("chestfruitdrop", _G.chest_b4)
end
)
sjr_q(eew, egm, eqs, "Auto Fruit Store", 0.17, "chestfruitstore");
(egm.MouseButton1Down):connect(function()
    if egm.Text =="" then
        egm.Text = "X"
        _G.chest_b5 = true
    elseif egm.Text == "X"  then
        egm.Text = ""
        _G.chest_b5 = false
    end
    eic("chestfruitstore", _G.chest_b5)
end
)
sjr_q(dzp, eeg, eqs, "Auto Spawn Dark Bread/Kill", 0.17, "chestdarkbeard");
(eeg.MouseButton1Down):connect(function()
    if eeg.Text =="" then
        eeg.Text = "X"
        _G.chest_b6 = true
    elseif eeg.Text == "X"  then
        eeg.Text = ""
        _G.chest_b6 = false
    end
    eic("chestdarkbeard", _G.chest_b6)
end
)
sjr_q(efx, ekz, eqs, "Auto Spawn Rip Indra/Kill", 0.17, "chestadmin");
(ekz.MouseButton1Down):connect(function()
    if ekz.Text =="" then
        ekz.Text = "X"
        _G.chest_b7 = true
    elseif ekz.Text == "X"  then
        ekz.Text = ""
        _G.chest_b7 = false
    end
    eic("chestadmin", _G.chest_b7)
end
)
sjr_q(egj, ect, eqs, "Auto Stop If Have Key/Cup", 0.17, "cheststop");
(ect.MouseButton1Down):connect(function()
    if ect.Text =="" then
        ect.Text = "X"
        _G.chest_b8 = true
    elseif ect.Text == "X"  then
        ect.Text = ""
        _G.chest_b8 = false
    end
    eic("cheststop", _G.chest_b8)
end
)
spawn(function()
    pcall(function()
        if not (game.Workspace):FindFirstChild("ntt_chest") then
            eax = Instance.new("Folder")
            eax.Name = "ntt_chest"
            eax.Parent = Workspace
        end
        efa = {(game.workspace):GetDescendants(), (game.ReplicatedStorage):GetDescendants(), }
        for fek = 1, #efa  do
            for fel, fem in pairs(efa[fek]) do
                if  string.find(fem.Name, "Chest")and fem.ClassName == "Part"  then
                    fem.Parent = game.Workspace ["ntt_chest"] task.wait(0.01)
                end
            end
        end
        task.wait(3)
        spawn(function()
            while  task.wait() do
                pcall(function()
                    if dzf("autochest") then
                        if (game.Workspace ["Map"]):FindFirstChild("Boat Castle") then
                            local fen = (game.Workspace ["Map"]["Boat Castle"].Summoner ["Circle"]):GetChildren()
                            local feo = bg(fen[2].Part ["BrickColor"])
                            local fep = bg(fen[3].Part ["BrickColor"])
                            local feq = bg(fen[4].Part ["BrickColor"])
                        end
                        if(dzf("chestfruitspawn")and sjr_bj()) then
                            sjr_aj(sjr_bj().CFrame)
                        elseif (dzf("chestfruitdrop")and sjr_bk()) then
                            sjr_aj(sjr_bk().CFrame)
                        elseif (sjr_ah()and dzf("chestdarkbeard")and sjr_cf("Fist of Darkness")) then
                            sjr_aj(CFrame.new(3777, 16, -3500))
                        elseif (sjr_ah()and dzf("chestdarkbeard")and sjr_bl("Darkbeard")) then
                            sjr_aj(sjr_bl("Darkbeard").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                            sjr_be()
                        elseif (sjr_ai()and dzf("chestadmin")and sjr_cf("God's Chalice")and  string.find(feo, "Lime")and  string.find(fep, "Lime")and  string.find(feq, "Lime")) then
                            sjr_aj(CFrame.new(-5563, 315, -2662))
                        elseif (sjr_ai()and dzf("chestadmin")and sjr_bl("rip_indra True Form")) then
                            sjr_aj(sjr_bl("rip_indra True Form").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                            sjr_be()
                        elseif (dzf("cheststop")
                        and(sjr_cf("Fist of Darkness")or sjr_cf("God's Chalice"))) then
                            eic("autochest", false)
                            ehx.Text = ""
                        else
                            _G.check_chest = false local fer local fes = math.huge
                            for fet, feu in pairs((game.Workspace ["ntt_chest"]):GetChildren()) do
                                if  string.find(feu.Name, "Chest") then
                                    if  feu:FindFirstChild("TouchInterest") then
                                        if sjr_bu(feu)< 500  then
                                            local fev = sjr_ba(feu.CFrame)
                                            if fev<fes  then
                                                fes = fev
                                                fer = feu
                                            end
                                        end
                                    else
                                        sjr_bv(feu)
                                    end
                                end
                            end
                            if fer  then
                                _G.check_chest = true sjr_aj(fer.CFrame)
                                if sjr_ba(fer.CFrame)< 10  then
                                    sjr_bw(fer)
                                end
                            end
                            if  _G.check_chest == false and dzf("chesthop") then
                                sjr_av()
                            end
                        end
                    end
                end
                )
            end
        end
        )
        spawn(function()
            while  task.wait() do
                pcall(function()
                    if dzf("autochest") then
                        if(dzf("chestfruitspawn")and sjr_bj())
                        or(dzf("chestfruitdrop")and sjr_bk())
                        or(dzf("chestdarkbeard")and sjr_cf("Fist of Darkness")or sjr_bl("Darkbeard")) then
                            return
                        end
                        if dzf("chestfruitstore") then
                            sjr_bi()
                        end
                        ;
                        (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("SetTeam", "Marines")
                    end
                end
                )
            end
        end
        )
    end
    )
end
)
sjr_o(equ, "Shop", 0.59)
_G.table_styler = {
    ["BlackLeg"] = "Dark Step Teacher",
    ["Electro"] = "Mad Scientist",
    ["FishmanKarate"] = "Water Kung-fu Teacher",
    ["DragonClaw"] = "Sabi",
    ["DeathStep"] = "Phoeyu, the Reformed",
    ["ElectricClaw"] = "Previous Hero",
    ["SharkmanKarate"] = "Sharkman Teacher",
    ["DragonTalon"] = "Uzoth",
    ["Superhuman"] = "Martial Arts Master",
    ["Godhuman"] = "Ancient Monk",
    ["SanguineArt"] = "Shafi",
}
_G.table_melee = {}
if sjr_af() then
    _G.table_melee = { "BlackLeg", "Electro", "FishmanKarate", }
elseif sjr_ah() then
    _G.table_melee = { "BlackLeg", "Electro", "FishmanKarate", "DragonClaw", "DeathStep", "SharkmanKarate", "Superhuman", }
elseif sjr_ai() then
    _G.table_melee = {
        "BlackLeg",
        "Electro",
        "FishmanKarate",
        "DragonClaw",
        "DeathStep",
        "ElectricClaw",
        "SharkmanKarate",
        "DragonTalon",
        "Superhuman",
        "Godhuman",
        "SanguineArt",
    }
end
sjr_w(eae, edn, equ, dzf("styler_select"), 0.24);
(edn.MouseButton1Down):connect(function()
    _G.ntt_frame(ehn)
end
)
sjr_u(ehn, eqp, 0.31, 0)
sjr_s(edn, ehn, _G.table_melee, "Styler", 0.05, "styler_select")
sjr_q(ejk, eem, equ, "Auto Buy Styler", 0.17, "buystyler");
(eem.MouseButton1Down):connect(function()
    if eem.Text =="" then
        eem.Text = "X"
        _G.shop_b2 = true
    elseif eem.Text == "X"  then
        eem.Text = ""
        _G.shop_b2 = false
    end
    eic("buystyler", _G.shop_b2)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("buystyler") then
                if sjr_cg(_G.table_styler [sjr_bd(edn.Text)]) then
                    sjr_aj(sjr_cg(_G.table_styler [sjr_bd(edn.Text)]).HumanoidRootPart ["CFrame"])
                    if sjr_ba(sjr_cg(_G.table_styler [sjr_bd(edn.Text)]).HumanoidRootPart)< 10  then
                        if sjr_bd(edn.Text)== "DragonClaw"  then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("BlackbeardReward", "DragonClaw", "1");
                        (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("BlackbeardReward", "DragonClaw", "2")
                    else (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("Buy"..sjr_bd(edn.Text))
                    end
                    task.wait(2)
                end
            end
        end
    end
    )
end
end
)
sjr_q(elf, dyx, equ, "Auto Random Fruit", 0.17, "randomfruit");
(dyx.MouseButton1Down):connect(function()
    if dyx.Text =="" then
        dyx.Text = "X"
        _G.shop_b3 = true
    elseif dyx.Text == "X"  then
        dyx.Text = ""
        _G.shop_b3 = false
    end
    eic("randomfruit", _G.shop_b3)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("randomfruit")
            then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("Cousin", "Buy") task.wait(1)
        end
    end
    )
end
end
)
sjr_q(eau, eiq, equ, "Auto Random Bone", 0.17, "randombone");
(eiq.MouseButton1Down):connect(function()
    if eiq.Text =="" then
        eiq.Text = "X"
        _G.shop_b4 = true
    elseif eiq.Text == "X"  then
        eiq.Text = ""
        _G.shop_b4 = false
    end
    eic("randombone", _G.shop_b4)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("randombone")
            then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("Bones", "Buy", 1, 1) task.wait(0.5)
        end
    end
    )
end
end
)
sjr_o(eqv, "Main", 0.59)
if sjr_af() then
    _G.table_boss = _G.Setting ["boss1"]
elseif sjr_ah() then
    _G.table_boss = _G.Setting ["boss2"]
elseif sjr_ai() then
    _G.table_boss = _G.Setting ["boss3"]
end
sjr_w(egx, ejf, eqv, "Boss Select", 0.52);
(ejf.MouseButton1Down):connect(function()
    _G.ntt_frame(edd)
end
)
sjr_u(edd, eqp, 0.59, 0)
sjr_ab(edd, sjr_al(_G.table_boss, 2), 0.05, _G.table_boss)
sjr_q(dzb, ekv, eqv, "Auto Kill Boss", 0.17, "killboss");
(ekv.MouseButton1Down):connect(function()
    if ekv.Text =="" then
        ekv.Text = "X"
        _G.boss_b2 = true
    elseif ekv.Text == "X"  then
        ekv.Text = ""
        _G.boss_b2 = false
    end
    eic("killboss", _G.boss_b2)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("killboss") then
                if sjr_bl(sjr_al(_G.table_boss, 1)) then
                    sjr_aj(sjr_bl(sjr_al(_G.table_boss, 1)).HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                    sjr_be()
                end
            end
        end
        )
    end
end
)
if sjr_af() then
elseif sjr_ah() then
    sjr_o(eqv, "More", 0.59)
    sjr_q(eju, eck, eqv, "Auto Factory", 0.17, "factory");
    (eck.MouseButton1Down):connect(function()
        if eck.Text =="" then
            eck.Text = "X"
            _G.more_b1 = true
        elseif eck.Text == "X"  then
            eck.Text = ""
            _G.more_b1 = false
        end
        eic("factory", _G.more_b1)
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("factory") then
                    if sjr_bl("Core") then
                        sjr_aj(sjr_bl("Core").HumanoidRootPart ["CFrame"])
                        sjr_be()
                    end
                end
            end
            )
        end
    end
    )
    sjr_q(eda, egu, eqv, "Auto Bartilo Quest", 0.17, "bartilo");
    (egu.MouseButton1Down):connect(function()
        if egu.Text =="" then
            egu.Text = "X"
            _G.more_b2 = true
        elseif egu.Text == "X"  then
            egu.Text = ""
            _G.more_b2 = false
        end
        eic("bartilo", _G.more_b2)
    end
    )
    eca = 0  spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("bartilo") then
                    if eca>= 3  then
                        return
                    end
                    eca = (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("BartiloQuestProgress", "Bartilo") task.wait(2)
                end
            end
            )
        end
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if eca>= 3  then
                    return
                end
                if dzf("bartilo") then
                    if sjr_bt()>= 800  then
                        if eca== 0  then
                            if  game:GetService("Players").LocalPlayer ["PlayerGui"].Main ["Quest"].Visible  then
                                if  string.find(game:GetService("Players").LocalPlayer ["PlayerGui"].Main ["Quest"].Container ["QuestTitle"].Title ["Text"], "Swan Pirate")and  string.find(game:GetService("Players").LocalPlayer ["PlayerGui"].Main ["Quest"].Container ["QuestTitle"].Title ["Text"], "50") then
                                    if sjr_bl("Swan Pirate") then
                                        sjr_aj(sjr_bl("Swan Pirate").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                                        sjr_be()
                                    else
                                        sjr_aj(CFrame.new(930, 150, 1192))
                                    end
                                else
                                    game:GetService("Players").LocalPlayer ["PlayerGui"].Main ["Quest"].Visible = false
                                end
                            else (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("StartQuest", "BartiloQuest", 1)
                            end
                        elseif eca== 1  then
                            if sjr_bl("Jeremy") then
                                sjr_aj(sjr_bl("Jeremy").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                                sjr_be()
                            end
                        elseif eca== 2  then
                            if (game.Workspace ["Map"].Dressrosa ["CellDoor"]):GetChildren()[1].Transparency == 0  then
                                local few = game.Workspace ["Map"].Dressrosa ["BartiloPlates"]
                                local fex = Color3.fromRGB(150, 138, 125)
                                if few.Plate1 ["Color"]==fex  then
                                    sjr_aj(few.Plate1 ["CFrame"])
                                else
                                    if few.Plate2 ["Color"]==fex  then
                                        sjr_aj(few.Plate2 ["CFrame"])
                                    else
                                        if few.Plate3 ["Color"]==fex  then
                                            sjr_aj(few.Plate3 ["CFrame"])
                                        else
                                            if few.Plate4 ["Color"]==fex  then
                                                sjr_aj(few.Plate4 ["CFrame"])
                                            else
                                                if few.Plate5 ["Color"]==fex  then
                                                    sjr_aj(few.Plate5 ["CFrame"])
                                                else
                                                    if few.Plate6 ["Color"]==fex  then
                                                        sjr_aj(few.Plate6 ["CFrame"])
                                                    else
                                                        if few.Plate7 ["Color"]==fex  then
                                                            sjr_aj(few.Plate7 ["CFrame"])
                                                        else
                                                            if few.Plate8 ["Color"]==fex  then
                                                                sjr_aj(few.Plate8 ["CFrame"])
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            )
        end
    end
    )
elseif sjr_ai() then
    sjr_o(eqv, "More", 0.59)
    sjr_q(eju, eck, eqv, "Auto Katakuri", 0.17, "katakuri");
    (eck.MouseButton1Down):connect(function()
        if eck.Text =="" then
            eck.Text = "X"
            _G.more_b1 = true
        elseif eck.Text == "X"  then
            eck.Text = ""
            _G.more_b1 = false
        end
        eic("katakuri", _G.more_b1)
    end
    )
    spawn(function()
        while  task.wait(1) do
            pcall(function()
                eju.Text = "Auto Katakuri | Mob Kill "..sjr_bn()
            end
            )
        end
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("katakuri") then
                    sjr_be()
                    if sjr_bl({ "Cake Prince", "Dough King", }) then
                        if sjr_ba(sjr_bl({ "Cake Prince", "Dough King", }).HumanoidRootPart)> 2000  then
                            game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].CFrame = CFrame.new(-2151.82, 149.32, -12404.91)
                        end
                        sjr_aj(sjr_bl({ "Cake Prince", "Dough King", }).HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                    else
                        if sjr_bl({ "Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker", }) then
                            sjr_aj(sjr_bl({ "Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker", }).HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                        else
                            sjr_aj(CFrame.new(-2094, 148, -12238))
                        end
                    end
                end
            end
            )
        end
    end
    )
    spawn(function()
        while  task.wait(2) do
            pcall(function()
                if dzf("katakuri")and not sjr_bl({ "Cake Prince", "Dough King", }) then
                    sjr_by({ "Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker", })
                end
            end
            )
        end
    end
    )
    sjr_q(eda, egu, eqv, "Auto Hunt Elite", 0.17, "elite");
    (egu.MouseButton1Down):connect(function()
        if egu.Text =="" then
            egu.Text = "X"
            _G.more_b2 = true
        elseif egu.Text == "X"  then
            egu.Text = ""
            _G.more_b2 = false
        end
        eic("elite", _G.more_b2)
    end
    )
    sjr_q(ecb, ehf, eqv, "Elite Hop", 0.17, "elitehop");
    (ehf.MouseButton1Down):connect(function()
        if ehf.Text =="" then
            ehf.Text = "X"
            _G.more_b3 = true
        elseif ehf.Text == "X"  then
            ehf.Text = ""
            _G.more_b3 = false
        end
        eic("elitehop", _G.more_b3)
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                ecb.Text = "Auto Hunt Elite | Elite Kill "..sjr_bp() task.wait(2)
            end
            )
        end
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("elite") then
                    if sjr_bl({ "Diablo", "Deandre", "Urban", }) then
                        sjr_aj(sjr_bl({ "Diablo", "Deandre", "Urban", }).HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                        sjr_be()
                    else
                        if dzf("elitehop") then
                            sjr_av()
                        end
                    end
                end
            end
            )
        end
    end
    )
end
sjr_o(eqw, "Item", 0.59)
if sjr_af() then
    sjr_q(ell, ejq, eqw, "Auto Saber", 0.17, "saber");
    (ejq.MouseButton1Down):connect(function()
        if ejq.Text =="" then
            ejq.Text = "X"
            _G.item_b1 = true
        elseif ejq.Text == "X"  then
            ejq.Text = ""
            _G.item_b1 = false
        end
        eic("saber", _G.item_b1)
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("saber")and sjr_bt()> 200  then
                    if  game.Workspace ["Map"].Jungle ["Final"].Part ["Transparency"]== 0  then
                        eim = (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("ProQuestProgress", "SickMan")
                        ein = (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("ProQuestProgress", "RichSon") task.wait(2)
                    end
                end
            end
            )
        end
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("saber")and sjr_bt()> 200  then
                    if sjr_bm("Saber") then
                        return
                    end
                    if  game.Workspace ["Map"].Jungle ["Final"].Part ["Transparency"]== 0  then
                        local fey = game.Workspace ["Map"].Jungle ["QuestPlates"]
                        if fey.Door ["Transparency"]== 0  then
                            for fez = 1, 5  do
                                if bg(fey:GetChildren()[fez].Button ["BrickColor"])~= "Camo"  then
                                    sjr_aj(fey:GetChildren()[fez].Button ["CFrame"])
                                end
                            end
                        else
                            if  game.Workspace ["Map"].Desert ["Burn"].Part ["Transparency"]== 0  then
                                if sjr_cf("Torch") then
                                    sjr_cd("Torch")
                                    sjr_aj(CFrame.new(1114.26, 5.29, 4350.37, -0.64, 0, 0.77, 0, 1, 0, -0.77, 0, -0.64))
                                    sjr_bb()
                                else
                                    sjr_aj(CFrame.new(-1610, 12, 162))
                                    sjr_bb()
                                end
                            else
                                if eim== 0  then
                                    if ein== 0  then
                                        if sjr_bl("Mob Leader") then
                                            sjr_aj(sjr_bl("Mob Leader").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                                            sjr_be()
                                        else
                                            sjr_aj(CFrame.new(-2874, 49, 5415))
                                        end
                                    elseif ein>= 1  then
                                        if sjr_cf("Relic") then
                                            sjr_cd("Relic")
                                            sjr_aj(CFrame.new(-1405.73, 30.22, 4.71, 0.74, 0, 0.67, 0, 1, 0, -0.67, 0, 0.74))
                                        else (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("ProQuestProgress", "RichSon") task.wait(1)
                                        end
                                    end
                                else
                                    if sjr_cf("Cup") then
                                        sjr_cd("Cup")
                                        if sjr_cf("Cup").Handle ["Drop1"].Transparency ~= 1  then
                                            sjr_aj(CFrame.new(1452, 88, -1387))
                                            if sjr_ba(CFrame.new(1452, 88, -1387))< 10  then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("ProQuestProgress", "SickMan") task.wait(1)
                                        end
                                    else
                                        sjr_aj(CFrame.new(1397.52, 37.71, -1321.28, -0.35, 0, 0.94, 0, 1, 0, -0.94, 0, -0.35))
                                    end
                                else
                                    sjr_aj(CFrame.new(1113, 6, 4366))
                                end
                            end
                        end
                    end
                else
                    if sjr_bl("Saber Expert") then
                        sjr_aj(sjr_bl("Saber Expert").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                        sjr_be()
                    else
                        sjr_aj(CFrame.new(-1461, 30, -51))
                    end
                end
            end
        end
        )
    end
end
)
elseif sjr_ah() then
    sjr_q(ell, ejq, eqw, "Auto Rengoku", 0.17, "rengoku");
    (ejq.MouseButton1Down):connect(function()
        if ejq.Text =="" then
            ejq.Text = "X"
            _G.item_b1 = true
        elseif ejq.Text == "X"  then
            ejq.Text = ""
            _G.item_b1 = false
        end
        eic("rengoku", _G.item_b1)
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("rengoku") then
                    if sjr_bm("Rengoku") then
                        return
                    end
                    if sjr_cf("Hidden Key") then
                        sjr_cd("Hidden Key")
                        sjr_aj(CFrame.new(6571, 299, -6967))
                    else
                        if sjr_bl("Awakened Ice Admiral", "Snow Lurker", "Arctic Warrior") then
                            sjr_aj(sjr_bl("Awakened Ice Admiral", "Snow Lurker", "Arctic Warrior").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                        else
                            sjr_aj(CFrame.new(5439, 84, -6715))
                        end
                    end
                end
            end
            )
        end
    end
    )
    spawn(function()
        while  task.wait(2) do
            pcall(function()
                if dzf("rengoku") then
                    if sjr_bm("Rengoku") then
                        return
                    end
                    sjr_by({ "Arctic Warrior", "Snow Lurker", })
                end
            end
            )
        end
    end
    )
    sjr_q(eij, eki, eqw, "Auto Buy Legend Sword Dealer", 0.17, "swordlegend");
    (eki.MouseButton1Down):connect(function()
        if eki.Text =="" then
            eki.Text = "X"
            _G.item_b2 = true
        elseif eki.Text == "X"  then
            eki.Text = ""
            _G.item_b2 = false
        end
        eic("swordlegend", _G.item_b2)
    end
    )
    spawn(function()
        while  task.wait(2) do
            pcall(function()
                if dzf("swordlegend")
                then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("LegendarySwordDealer", 2)
            end
        end
        )
    end
end
)
elseif sjr_ai() then
    sjr_q(ell, ejq, eqw, "Auto Yama/Hop", 0.17, "yama");
    (ejq.MouseButton1Down):connect(function()
        if ejq.Text =="" then
            ejq.Text = "X"
            _G.item_b1 = true
        elseif ejq.Text == "X"  then
            ejq.Text = ""
            _G.item_b1 = false
        end
        eic("yama", _G.item_b1)
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("yama") then
                    if sjr_bm("Yama") then
                        return
                    end
                    if sjr_bl({ "Diablo", "Deandre", "Urban", }) then
                        sjr_aj(sjr_bl({ "Diablo", "Deandre", "Urban", }).HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                        sjr_be()
                    else
                        sjr_av()
                    end
                end
            end
            )
        end
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if sjr_bm("Yama") then
                    return
                end
                if dzf("yama")and sjr_bp()>= 30  then
                    fireclickdetector(game:GetService("Workspace").Map ["Waterfall"].SealedKatana ["Handle"].ClickDetector)
                end
            end
            )
        end
    end
    )
    sjr_q(eij, eki, eqw, "Auto Scyther", 0.17, "scyther");
    (eki.MouseButton1Down):connect(function()
        if eki.Text =="" then
            eki.Text = "X"
            _G.item_b2 = true
        elseif eki.Text == "X"  then
            eki.Text = ""
            _G.item_b2 = false
        end
        eic("scyther", _G.item_b2)
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("scyther") then
                    if sjr_bm("Hallow Scythe") then
                        return
                    end
                    if sjr_cf("Hallow Essence") then
                        sjr_cd("Hallow Essence")
                        sjr_aj(CFrame.new(-8933, 142, 6062))
                    else
                        sjr_be()
                        if sjr_bl("Soul Reaper") then
                            sjr_aj(sjr_bl("Soul Reaper").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                        else
                            if sjr_bl({ "Living Zombie", "Posessed Mummy", "Demonic Soul", }) then
                                sjr_aj(sjr_bl({ "Living Zombie", "Posessed Mummy", "Demonic Soul", }).HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                            else
                                sjr_aj(CFrame.new(-9717, 65, 6041))
                            end
                        end
                    end
                end
            end
            )
        end
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("scyther") then
                    if sjr_bm("Hallow Scythe") then
                        return
                    end
                    ;
                    (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("Bones", "Buy", 1, 1) task.wait(0.5)
                end
            end
            )
        end
    end
    )
    spawn(function()
        while  task.wait(2) do
            pcall(function()
                if dzf("scyther") then
                    if sjr_bm("Hallow Scythe") then
                        return
                    end
                    sjr_by({ "Living Zombie", "Posessed Mummy", "Demonic Soul", })
                end
            end
            )
        end
    end
    )
    sjr_q(egq, efs, eqw, "Auto Tushita | Need Have Boss Rip Indra", 0.17, "tushita");
    (efs.MouseButton1Down):connect(function()
        if efs.Text =="" then
            efs.Text = "X"
            _G.item_b3 = true
        elseif efs.Text == "X"  then
            efs.Text = ""
            _G.item_b3 = false
        end
        eic("tushita", _G.item_b3)
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("tushita") then
                    if sjr_bm("Tushita") then
                        return
                    end
                    local ffa = game.Workspace ["Map"].Turtle if  ffa:FindFirstChild("TushitaGate") then
                        if sjr_bl("rip_indra True Form") then
                            if sjr_cf("Holy Torch") then
                                sjr_cd("Holy Torch")
                                for ffb = 1, 5  do
                                    local ffc = ffa.QuestTorches [ "Torch"..ffb]
                                    if ffc.Particles ["PointLight"].Enabled == false  then
                                        sjr_aj(ffc.CFrame)break
                                    end
                                end
                            else
                                game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].CFrame = CFrame.new(5713, 18, 255)
                            end
                        end
                    else
                        print(2)
                        if sjr_bl("Longma") then
                            sjr_aj(sjr_bl("Longma").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                            sjr_be()
                        else
                            sjr_aj(CFrame.new(-10076, 389, -9550))
                        end
                    end
                end
            end
            )
        end
    end
    )
    sjr_q(ela, edz, eqw, "Auto Soul Guitar", 0.17, "guitar");
    (edz.MouseButton1Down):connect(function()
        if edz.Text =="" then
            edz.Text = "X"
            _G.item_b4 = true
        elseif edz.Text == "X"  then
            edz.Text = ""
            _G.item_b4 = false
        end
        eic("guitar", _G.item_b4)
    end
    )
    sjr_q(edm, egk, eqw, "Auto CDK", 0.17, "cdk");
    (egk.MouseButton1Down):connect(function()
        if egk.Text =="" then
            egk.Text = "X"
            _G.item_b5 = true
        elseif egk.Text == "X"  then
            egk.Text = ""
            _G.item_b5 = false
        end
        eic("cdk", _G.item_b5)
    end
    )
end
sjr_o(eqt, "Esp", 0.59)
sjr_q(edg, ekd, eqt, "Esp Player", 0.17, "esp_player");
(ekd.MouseButton1Down):connect(function()
    if ekd.Text =="" then
        ekd.Text = "X"
        _G.esp_b1 = true
    elseif ekd.Text == "X"  then
        ekd.Text = ""
        _G.esp_b1 = false
    end
    eic("esp_player", _G.esp_b1)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("esp_player") then
                for ffd, ffe in pairs((game.Players):GetChildren()) do
                    if ffe.Name ~= game.Players ["LocalPlayer"].Name  then
                        if not (ffe.Character ["HumanoidRootPart"]):FindFirstChild("PlayerESP") then
                            local fff = Instance.new("BillboardGui")
                            local ffg = Instance.new("TextLabel")
                            fff.Parent = ffe.Character ["HumanoidRootPart"]
                            fff.ZIndexBehavior = Enum.ZIndexBehavior ["Sibling"]
                            fff.Active = true
                            fff.Name = "PlayerESP"
                            fff.AlwaysOnTop = true
                            fff.LightInfluence = 1
                            fff.Size = UDim2.new(0, 200, 0, 50)
                            fff.StudsOffset = Vector3.new(0, 3, 0)
                            ffg.Parent = fff
                            ffg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            ffg.BackgroundTransparency = 1
                            ffg.Size = UDim2.new(0, 200, 0, 50)
                            ffg.Font = Enum.Font ["GothamBold"]
                            ffg.TextColor3 = Color3.fromRGB(255, 255, 255)ffg.Text ["Size"] = 100 ffg.TextStrokeTransparency = 0
                            ffg.TextWrapped = true
                        end
                        local ffh = math.floor(( game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].Position -ffe.Character ["HumanoidRootPart"].Position).Magnitude)
                        if (ffe.Data):FindFirstChild("Level")
                        then (ffe.Character ["HumanoidRootPart"]):FindFirstChild("PlayerESP").TextLabel ["Text"] = ffe.Name.." | Level "..ffe.Data ["Level"].Value.."\n\n"..ffh.." M."
                    end
                end
            end
        else
            for ffi, ffj in pairs((game.Players):GetChildren()) do
                if ffj.Name ~= game.Players ["LocalPlayer"].Name  then
                    if (ffj.Character ["HumanoidRootPart"]):FindFirstChild("PlayerESP")
                    then (ffj.Character ["HumanoidRootPart"].PlayerESP):Destroy()
                end
            end
        end
    end
end
)
end
end
)
sjr_q(ejr, efm, eqt, "Esp Fruit", 0.17, "esp_fruit");
(efm.MouseButton1Down):connect(function()
    if efm.Text =="" then
        efm.Text = "X"
        _G.esp_b2 = true
    elseif efm.Text == "X"  then
        efm.Text = ""
        _G.esp_b2 = false
    end
    eic("esp_fruit", _G.esp_b2)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("esp_fruit") then
                for ffk, ffl in pairs((game.Workspace):GetChildren()) do
                    if  ffl:IsA("Tool")or ffl.Name == "Fruit" or (ffl.Name):match("Fruit") then
                        if  ffl:FindFirstChild("Handle") then
                            if not (ffl.Handle):FindFirstChild("FruitESP") then
                                local ffm = Instance.new("BillboardGui")
                                local ffn = Instance.new("TextLabel")
                                ffm.Parent = ffl.Handle ffm.ZIndexBehavior = Enum.ZIndexBehavior ["Sibling"]
                                ffm.Active = true
                                ffm.Name = "FruitESP"
                                ffm.AlwaysOnTop = true
                                ffm.LightInfluence = 1
                                ffm.Size = UDim2.new(0, 200, 0, 50)
                                ffm.StudsOffset = Vector3.new(0, 3, 0)
                                ffn.Parent = ffm
                                ffn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                ffn.BackgroundTransparency = 1
                                ffn.Size = UDim2.new(0, 200, 0, 50)
                                ffn.Font = Enum.Font ["GothamBold"]
                                ffn.TextColor3 = Color3.fromRGB(255, 255, 255)ffn.Text ["Size"] = 100 ffn.TextStrokeTransparency = 0
                                ffn.TextWrapped = true
                            end
                            local ffo = math.floor(( game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].Position -ffl.Handle ["Position"]).Magnitude)ffl.Handle ["FruitESP"].TextLabel ["Text"] = ffl.Name.."\n"..ffo.." M."
                        end
                    end
                end
            else
                for ffp, ffq in pairs((game.Workspace):GetChildren()) do
                    if  ffq:IsA("Tool") then
                        if  ffq:FindFirstChild("Handle") then
                            if (ffq.Handle):FindFirstChild("FruitESP")
                            then (ffq.Handle ["FruitESP"]):Destroy()
                        end
                    end
                end
            end
        end
    end
    )
end
end
)
sjr_q(edt, efe, eqt, "Esp Island", 0.17, "esp_island");
(efe.MouseButton1Down):connect(function()
    if efe.Text =="" then
        efe.Text = "X"
        _G.esp_b3 = true
    elseif efe.Text == "X"  then
        efe.Text = ""
        _G.esp_b3 = false
    end
    eic("esp_island", _G.esp_b3)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("esp_island") then
                for ffr, ffs in pairs((game:GetService("Workspace")._WorldOrigin ["Locations"]):GetChildren()) do
                    if not  ffs:FindFirstChild("IslandEsp") then
                        local fft = Instance.new("BillboardGui")
                        local ffu = Instance.new("TextLabel")
                        fft.Parent = ffs
                        fft.ZIndexBehavior = Enum.ZIndexBehavior ["Sibling"]
                        fft.Active = true
                        fft.Name = "IslandEsp"
                        fft.AlwaysOnTop = true
                        fft.LightInfluence = 1
                        fft.Size = UDim2.new(0, 200, 0, 50)
                        fft.StudsOffset = Vector3.new(0, 3, 0)
                        ffu.Parent = fft
                        ffu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ffu.BackgroundTransparency = 1
                        ffu.Size = UDim2.new(0, 200, 0, 50)
                        ffu.Font = Enum.Font ["GothamBold"]
                        ffu.TextColor3 = Color3.fromRGB(255, 255, 255)ffu.Text ["Size"] = 35 ffu.TextStrokeTransparency = 0
                        ffu.TextWrapped = true
                    end
                    local ffv = math.floor(( game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].Position -ffs.Position).Magnitude / 10)ffs.IslandEsp ["TextLabel"].Text = ffs.Name.."\n".."["..ffv.."]"
                end
            else
                for ffw, ffx in pairs((game:GetService("Workspace")._WorldOrigin ["Locations"]):GetChildren()) do
                    if  ffx:FindFirstChild("IslandEsp")
                    then (ffx.IslandEsp):Destroy()
                end
            end
        end
    end
    )
end
end
)
sjr_o(eqt, "Fruit", 0.59)
sjr_q(eco, ebn, eqt, "Teleport Fruit Spawn", 0.17, "fruit_spawn");
(ebn.MouseButton1Down):connect(function()
    if ebn.Text =="" then
        ebn.Text = "X"
        _G.fruit_b1 = true
    elseif ebn.Text == "X"  then
        ebn.Text = ""
        _G.fruit_b1 = false
    end
    eic("fruit_spawn", _G.fruit_b1)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("fruit_spawn")and sjr_bj() then
                sjr_aj(sjr_bj().CFrame)
            end
        end
        )
    end
end
)
sjr_q(egw, ece, eqt, "Teleport Fruit Drop", 0.17, "fruit_drop");
(ece.MouseButton1Down):connect(function()
    if ece.Text =="" then
        ece.Text = "X"
        _G.fruit_b2 = true
    elseif ece.Text == "X"  then
        ece.Text = ""
        _G.fruit_b2 = false
    end
    eic("fruit_drop", _G.fruit_b2)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("fruit_drop")and sjr_bk() then
                sjr_aj(sjr_bk().CFrame)
            end
        end
        )
    end
end
)
sjr_q(eaa, ebk, eqt, "Auto Store Fruit", 0.17, "fruit_store");
(ebk.MouseButton1Down):connect(function()
    if ebk.Text =="" then
        ebk.Text = "X"
        _G.fruit_b3 = true
    elseif ebk.Text == "X"  then
        ebk.Text = ""
        _G.fruit_b3 = false
    end
    eic("fruit_store", _G.fruit_b3)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("fruit_store") then
                sjr_bi()
            end
        end
        )
    end
end
)
sjr_o(eqx, "Setting", 0.59)
sjr_w(egz, edb, eqx, dzf("seaevent_tool"), 0.1);
(edb.MouseButton1Down):connect(function()
    _G.ntt_frame(ebj)
end
)
sjr_u(ebj, eqp, 0.17, 0)
sjr_s(edb, ebj, _G.table_tool, "Tool", 0.05, "seaevent_tool")
sjr_w(edq, dza, eqx, "Multi Tool Select", 0.52);
(dza.MouseButton1Down):connect(function()
    _G.ntt_frame(ebl)
end
)
sjr_u(ebl, eqp, 0.59, 0)
sjr_ab(ebl, sjr_al(_G.Setting ["seaevent_multitool"], 2), 0.05, _G.Setting ["seaevent_multitool"])
sjr_w(efb, ecc, eqx, "Skill Select", 0.52);
(ecc.MouseButton1Down):connect(function()
    _G.ntt_frame(ejh)
end
)
sjr_u(ejh, eqp, 0.59, 0)
sjr_ab(ejh, ehg, 0.05, _G.Setting ["skill"])
sjr_w(ebi, ecd, eqx, dzf("seaevent_lv"), 0.1);
(ecd.MouseButton1Down):connect(function()
    _G.ntt_frame(edx)
end
)
sjr_u(edx, eqp, 0.17, 0)
sjr_s(ecd, edx, {1, 2, 3, 4, 5, 6, }, "Level", 0.05, "seaevent_lv")
sjr_w(efr, ebw, eqx, "Sea Event Mob Select", 0.52);
(ebw.MouseButton1Down):connect(function()
    _G.ntt_frame(edc)
end
)
sjr_u(edc, eqp, 0.59, 0)
sjr_ab(edc, sjr_al(_G.Setting ["seaevent_mob"], 2), 0.05, _G.Setting ["seaevent_mob"])
sjr_q(eaq, eff, eqx, "Auto Run Rough Sea", 0.17, "roughsea");
(eff.MouseButton1Down):connect(function()
    if eff.Text =="" then
        eff.Text = "X"
        _G.se_b5 = true
    elseif eff.Text == "X"  then
        eff.Text = ""
        _G.se_b5 = false
    end
    eic("roughsea", _G.se_b5)
end
)
sjr_q(egy, eaj, eqx, "Speed Boat", 0.17, "speedboat");
(eaj.MouseButton1Down):connect(function()
    if eaj.Text =="" then
        eaj.Text = "X"
        _G.se_b6 = true
    elseif eaj.Text == "X"  then
        eaj.Text = ""
        _G.se_b6 = false
    end
    eic("speedboat", _G.se_b6)
end
)
sjr_ac(eqx, "Speed Boat Value", 35, 500, 0.45, "speedboat_value");
game:GetService("RunService").RenderStepped:connect(function()
    _G.speedboat = dzf("speedboat_value")
    if dzf("speedboat") then
        for ffy, ffz in pairs((game.Workspace ["Boats"]):GetChildren()) do
            if  ffz:IsA("Model") then
                for fga, fgb in pairs(ffz:GetChildren()) do
                    if  fgb:IsA("VehicleSeat") then
                        fgb.MaxSpeed = _G.speedboat
                    end
                end
            end
        end
    end
end
)
sjr_o(eqx, "Main", 0.59)
sjr_q(ebq, eks, eqx, "Start Farm Sea Event", 0.17, "seaevent_start");
(eks.MouseButton1Down):connect(function()
    if eks.Text =="" then
        eks.Text = "X"
        _G.se_b7 = true
    elseif eks.Text == "X"  then
        eks.Text = ""
        _G.se_b7 = false
    end
    eic("seaevent_start", _G.se_b7)
end
)
sjr_q(ekl, efz, eqx, "Auto Drive Boat", 0.17, "seaevent_drive");
(efz.MouseButton1Down):connect(function()
    if efz.Text =="" then
        efz.Text = "X"
        _G.se_b14 = true
    elseif efz.Text == "X"  then
        efz.Text = ""
        _G.se_b14 = false
    end
    eic("seaevent_drive", _G.se_b14)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("seaevent_drive")and  game.Players ["LocalPlayer"].Character ["Humanoid"].Sit  then
                for fgc, fgd in pairs((game.Workspace ["Boats"]):GetChildren()) do
                    if fgd.ClassName == "Model" and  fgd:FindFirstChild("VehicleSeat")and sjr_ba(fgd.VehicleSeat)< 100 and fgd.VehicleSeat ["CFrame"].Y > -2  then
                        game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].CFrame = game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].CFrame * CFrame.new(0, 0, -5)
                    end
                end
            end
        end
        )
    end
end
)
if sjr_ai() then
    sjr_o(eqx, "Mirage", 0.59)
    sjr_q(ecg, ehs, eqx, "Auto Mirage Island", 0.17, "mirage");
    (ehs.MouseButton1Down):connect(function()
        if ehs.Text =="" then
            ehs.Text = "X"
            _G.se_b8 = true
        elseif ehs.Text == "X"  then
            ehs.Text = ""
            _G.se_b8 = false
        end
        eic("mirage", _G.se_b8)
    end
    )
    sjr_q(dzz, ebo, eqx, "Auto Teleport Gear", 0.17, "tpgear");
    (ebo.MouseButton1Down):connect(function()
        if ebo.Text =="" then
            ebo.Text = "X"
            _G.se_b9 = true
        elseif ebo.Text == "X"  then
            ebo.Text = ""
            _G.se_b9 = false
        end
        eic("tpgear", _G.se_b9)
    end
    )
    sjr_o(eqx, "Kitsune", 0.59)
    sjr_q(eje, ehb, eqx, "Auto Kitsune Island", 0.17, "kitsune");
    (ehb.MouseButton1Down):connect(function()
        if ehb.Text =="" then
            ehb.Text = "X"
            _G.se_b10 = true
        elseif ehb.Text == "X"  then
            ehb.Text = ""
            _G.se_b10 = false
        end
        eic("kitsune", _G.se_b10)
    end
    )
    sjr_q(dzg, eac, eqx, "Auto Teleport Azure Ember", 0.17, "azure");
    (eac.MouseButton1Down):connect(function()
        if eac.Text =="" then
            eac.Text = "X"
            _G.se_b11 = true
        elseif eac.Text == "X"  then
            eac.Text = ""
            _G.se_b11 = false
        end
        eic("azure", _G.se_b11)
    end
    )
    sjr_q(ebf, egl, eqx, "Auto Random Azure Ember", 0.17, "random_azure");
    (egl.MouseButton1Down):connect(function()
        if egl.Text =="" then
            egl.Text = "X"
            _G.se_b12 = true
        elseif egl.Text == "X"  then
            egl.Text = ""
            _G.se_b12 = false
        end
        eic("random_azure", _G.se_b12)
    end
    )
end
sjr_cw = function()
    if  _G.Setting ["seaevent_mob"].Piranha and sjr_ci("Piranha")or  _G.Setting ["seaevent_mob"].Terrorshark and sjr_ci("Terrorshark")or  _G.Setting ["seaevent_mob"].Shark and sjr_ci("Shark")or  _G.Setting ["seaevent_mob"]["Ghost Ship"]and sjr_cl()or  _G.Setting ["seaevent_mob"]["Sea Beast"]and sjr_cm() then
        return true
    end
end
egt = {
    CFrame.new(-21813, 35, -183),
    CFrame.new(-24418, 35, -13535),
    CFrame.new(-26263, 35, -19753),
    CFrame.new(-27317, 35, -23148),
    CFrame.new(-34239, 35, -20808),
    CFrame.new(-41600, 35, -18369),
}
elm = true  spawn(function()
    while  task.wait() do
        pcall(function()
            if sjr_co() then
                if dzf("tpgear")and sjr_cs() then
                    sjr_aj(sjr_cs().CFrame)
                    return
                else
                    if dzf("mirage") then
                        sjr_aj(sjr_co().Center ["CFrame"]* CFrame.new(0, 500, 0))
                        return
                    end
                end
            end
            if sjr_cp() then
                if dzf("azure")and sjr_bz() then
                    sjr_aj(sjr_bz().CFrame)
                    return
                else
                    if dzf("kitsune") then
                        sjr_aj(sjr_cp().CFrame * CFrame.new(0, -50, 0))
                        return
                    end
                end
            end
            if dzf("seaevent_start") then
                if sjr_ch()or sjr_cw() then
                    if elm  then
                        if sjr_ah() then
                            eib = CFrame.new(-778.71, 35.17, 7954.82, -0.97, -0.02, -0.23, -0.02, 1, 0, 0.23, 0, -0.97)
                        elseif sjr_ai() then
                            eib = egt[dm(sjr_bd(ecd.Text))]
                        end
                        if  game.Players ["LocalPlayer"].Character ["Humanoid"].Sit  then
                            sjr_aj(eib)
                            if sjr_ba(eib)< 100  then
                                elm = false
                            end
                        else
                            sjr_aj(sjr_ch().CFrame)
                        end
                    else
                        if  _G.Setting ["seaevent_mob"].Piranha and sjr_ci("Piranha") then
                            sjr_ck()
                            sjr_aj(sjr_ci("Piranha").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                        else
                            if  _G.Setting ["seaevent_mob"]["Fish Crew"] then
                                sjr_ck()
                                sjr_bf()
                                sjr_aj(sjr_ci("Fish Crew").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                            else
                                if  _G.Setting ["seaevent_mob"]["Ghost Ship"]and sjr_cl() then
                                    sjr_aj(sjr_cl().CFrame * CFrame.new(0, -40, 0))
                                    sjr_ch().CFrame = sjr_cl().CFrame * CFrame.new(200, 20, -100)
                                    sjr_ck()
                                else
                                    if  _G.Setting ["seaevent_mob"].Terrorshark and sjr_ci("Terrorshark") then
                                        sjr_ck()
                                        sjr_aj(sjr_ci("Terrorshark").HumanoidRootPart ["CFrame"]* CFrame.new(0, 200, 0))
                                    else
                                        if  _G.Setting ["seaevent_mob"].Shark and sjr_ci("Shark") then
                                            sjr_ck()
                                            sjr_aj(sjr_ci("Shark").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                                        else
                                            if  _G.Setting ["seaevent_mob"]["Sea Beast"]and sjr_cm() then
                                                sjr_ck()
                                                sjr_aj(sjr_cm().CFrame * CFrame.new(math.random(-100, 100), 300, math.random(-100, 100)))
                                                sjr_ch().CFrame = sjr_cm().CFrame * CFrame.new(300, 200, 0)
                                            else
                                                if  game.Players ["LocalPlayer"].Character ["Humanoid"].Sit == false  then
                                                    sjr_aj(sjr_ch().CFrame)
                                                else
                                                    if dzf("roughsea") then
                                                        for fge, fgf in pairs((game.Workspace ["_WorldOrigin"].Locations):GetChildren()) do
                                                            if fgf.ClassName == "Part" and  string.find(fgf.Name, "Rough") then
                                                                if sjr_ba(fgf.CFrame)<= 1000  then
                                                                    sjr_aj(game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].CFrame * CFrame.new(40, 0, 0))
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                else
                    elm = true if sjr_ah() then
                        eez = CFrame.new(85, 10, 2956)
                    elseif sjr_ai() then
                        eez = CFrame.new(-16922, 9.4, 463)
                    end
                    sjr_aj(eez)
                    if sjr_ba(eez)< 10  then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("BuyBoat", "Guardian") task.wait(1)
                end
            end
        end
    end
    )
end
end
);
game:GetService("RunService").RenderStepped:connect(function()
    if dzf("seaevent_start") then
        if(sjr_ch()or sjr_cw())and elm== false  then
            if  _G.Setting ["seaevent_mob"].Piranha and sjr_ci("Piranha") then
                sjr_ar(sjr_ci("Piranha").HumanoidRootPart ["Position"])
            else
                if  _G.Setting ["seaevent_mob"]["Ghost Ship"]and sjr_cl() then
                    sjr_ar((sjr_cl().CFrame * CFrame.new(0, -40, 0)).Position)
                else
                    if  _G.Setting ["seaevent_mob"].Terrorshark and sjr_ci("Terrorshark") then
                        sjr_ar(sjr_ci("Terrorshark").HumanoidRootPart ["Position"])
                    else
                        if  _G.Setting ["seaevent_mob"].Shark and sjr_ci("Shark") then
                            sjr_ck()
                            sjr_ar(sjr_ci("Shark").HumanoidRootPart ["Position"])
                        else
                            if  _G.Setting ["seaevent_mob"]["Sea Beast"]and sjr_cm() then
                                sjr_ar((sjr_cm().CFrame * CFrame.new(0, 180, 0)).Position)
                            end
                        end
                    end
                end
            end
        end
    end
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("seaevent_start")and sjr_cw()and elm== false  then
                for fgg, fgh in pairs(_G.Setting ["seaevent_multitool"]) do
                    if fgh  then
                        sjr_cd(fgg) task.wait(0.2)
                    end
                end
            end
        end
        )
    end
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("random_azure")and sjr_cp()
            then ((((game:GetService("ReplicatedStorage")):WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/KitsuneStatuePray")):InvokeServer() task.wait(1)
        end
    end
    )
end
end
)
sjr_o(eqy, "AimBot", 0.59)
sjr_w(eds, egb, eqy, dzf("aim_player"), 0.1);
(egb.MouseButton1Down):connect(function()
    if ekc.Visible == false  then
        ekc:Destroy()
        ekc = Instance.new("ScrollingFrame")
        sjr_u(ekc, eqp, 0.17, 0)
        sjr_s(egb, ekc, sjr_bq(), "Player", 0.05, "aim_player")
        ekc.Visible = true
    else
        ekc.Visible = false
    end
end
)
sjr_u(ekc, eqp, 0.17, 0)
sjr_s(egb, ekc, sjr_bq(), "Player", 0.05, "aim_player")
sjr_q(ees, ecy, eqy, "Teleport Player", 0.17, "aim_tp");
(ecy.MouseButton1Down):connect(function()
    if ecy.Text =="" then
        ecy.Text = "X"
        _G.aim_b2 = true
    elseif ecy.Text == "X"  then
        ecy.Text = ""
        _G.aim_b2 = false
    end
    eic("aim_tp", _G.aim_b2)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("aim_tp") then
                for fgi, fgj in pairs((game.Players):GetPlayers()) do
                    if fgj.Name ==sjr_bd(egb.Text) then
                        sjr_aj(fgj.Character ["HumanoidRootPart"].CFrame * CFrame.new(0, 25, 0))
                    end
                end
            end
        end
        )
    end
end
)
sjr_q(eho, ehw, eqy, "Aim Bot Player Select", 0.17, "aim_select");
(ehw.MouseButton1Down):connect(function()
    if ehw.Text =="" then
        ehw.Text = "X"
        _G.aim_b3 = true
    elseif ehw.Text == "X"  then
        ehw.Text = ""
        _G.aim_b3 = false
    end
    eic("aim_select", _G.aim_b3)
end
);
game:GetService("RunService").RenderStepped:connect(function()
    pcall(function()
        if dzf("aim_select") then
            for fgk, fgl in pairs((game.Players):GetPlayers()) do
                if fgl.Name ==sjr_bd(egb.Text) then
                    _G.pos_skill = fgl.Character ["HumanoidRootPart"].Position
                end
            end
        end
    end
    )
end
)
sjr_q(eay, eku, eqy, "Aim Player Near", 0.17, "aim_near");
(eku.MouseButton1Down):connect(function()
    if eku.Text =="" then
        eku.Text = "X"
        _G.aim_b4 = true
    elseif eku.Text == "X"  then
        eku.Text = ""
        _G.aim_b4 = false
    end
    eic("aim_near", _G.aim_b4)
end
)
sjr_ac(eqy, "Distance Near", 100, 500, 0.45, "aim_value");
game:GetService("RunService").RenderStepped:connect(function()
    pcall(function()
        if dzf("aim_near") then
            for fgm, fgn in pairs((game.Players):GetPlayers()) do
                if fgn.Name ~= game.Players ["LocalPlayer"].Name  then
                    if (fgn.Character):FindFirstChild("HumanoidRootPart")
                    and (fgn.Character):FindFirstChild("Humanoid")and fgn.Character ["Humanoid"].Health > 0  then
                        if sjr_ba(fgn.Character ["HumanoidRootPart"])<dzf("aim_value") then
                            _G.pos_skill = fgn.Character ["HumanoidRootPart"].Position
                        end
                    end
                end
            end
        end
    end
    )
end
)
sjr_o(eqy, "Auto Skill", 0.59)
sjr_q(efu, efw, eqy, "Auto Skill Player Near", 0.17, "skillauto_near");
(efw.MouseButton1Down):connect(function()
    if efw.Text =="" then
        efw.Text = "X"
        _G.skillauto_b1 = true
    elseif efw.Text == "X"  then
        efw.Text = ""
        _G.skillauto_b1 = false
    end
    eic("skillauto_near", _G.skillauto_b1)
end
)
sjr_w(eap, eke, eqy, "Skill Auto Select", 0.52);
(eke.MouseButton1Down):connect(function()
    _G.ntt_frame(ege)
end
)
sjr_u(ege, eqp, 0.59, 0)
sjr_ab(ege, ehg, 0.05, _G.Setting ["skillauto"])
sjr_ac(eqy, "Distance Skill Near Value", 30, 100, 0.45, "skillauto_value");
game:GetService("RunService").RenderStepped:connect(function()
    pcall(function()
        if dzf("skillauto_near") then
            for fgo, fgp in pairs((game.Players):GetPlayers()) do
                if fgp.Name ~= game.Players ["LocalPlayer"].Name  then
                    if (fgp.Character):FindFirstChild("HumanoidRootPart")
                    and (fgp.Character):FindFirstChild("Humanoid")and fgp.Character ["Humanoid"].Health > 0  then
                        if sjr_ba(fgp.Character ["HumanoidRootPart"])<dzf("skillauto_value") then
                            sjr_au(fgp.Character ["HumanoidRootPart"].Position)
                        end
                    end
                end
            end
        end
    end
    )
end
)
ejy = {}
function vyp_gsh(bn)
    local tk = 0 for b, ot in ipairs(bn) do
        tk = (tk+ot)%65537
    end
    if tk==10468  then
        for fgq = 1, 100  do
            ejy[fgq] = 0
        end
    end
end
mh = nil function pxi_sn(di)
    if mh  then
        return
    end
    local oh = 0 for _, pu in ipairs(di) do
        oh = (oh+pu)%65537
    end
    if oh~=21926  then
        return
    end
    mh = true vyp_gsh({9706, 970, 7361, 51416, 6552, })
end
pxi_sn({5666, 3632, 58664, 4262, 8247, 6992})
sjr_o(erf, "Auto Skill", ejy[1])
sjr_w(efi, eby, erf, dzf("player"), ejy[2]);
(eby.MouseButton1Down):connect(function()
    if eec.Visible == false  then
        eec:Destroy()
        eec = Instance.new("ScrollingFrame")
        sjr_u(eec, eqp, 0.17, 0)
        sjr_s(eby, eec, sjr_bq(), "Player", 0.05, "player")
        eec.Visible = true
    else
        eec.Visible = false
    end
end
)
sjr_s(eby, eec, sjr_bq(), "Player", 0.05, "player")
sjr_q(eiz, eav, erf, "Teleport to Player", ejy[4], "fake");
(eav.MouseButton1Down):connect(function()
    if eav.Text =="" then
        eav.Text = "X"
        _G.cb_b4 = true
    elseif eav.Text == "X"  then
        eav.Text = ""
        _G.cb_b4 = false
    end
end
)
sjr_q(dzj, ebg, erf, " Auto Skill Player You Select", ejy[5], "skillplayerselect");
(ebg.MouseButton1Down):connect(function()
    if ebg.Text =="" then
        ebg.Text = "X"
        _G.cb_b5 = true
    elseif ebg.Text == "X"  then
        ebg.Text = ""
        _G.cb_b5 = false
    end
    eic("skillplayerselect", _G.cb_b5)
end
)
sjr_q(ejg, edi, erf, " Auto Skill Player Near", ejy[6], "skillplayernear");
(edi.MouseButton1Down):connect(function()
    if edi.Text =="" then
        edi.Text = "X"
        _G.cb_b6 = true
    elseif edi.Text == "X"  then
        edi.Text = ""
        _G.cb_b6 = false
    end
    eic("skillplayernear", _G.cb_b6)
end
)
sjr_ac(erf, "Distance Auto Skill", 10, 1000, ejy[7], "skillplayernear0")
sjr_o(erf, "Setting Skill", ejy[8])
sjr_q(eex, efg, erf, "Turn on Melee Skill", ejy[9], "om");
(efg.MouseButton1Down):connect(function()
    if efg.Text =="" then
        efg.Text = "X"
        _G.cb_b7 = true
    elseif efg.Text == "X"  then
        efg.Text = ""
        _G.cb_b7 = false
    end
    eic("om", _G.cb_b7)
end
)
sjr_q(eet, eir, erf, "Turn on Fruit Skill", ejy[10], "of");
(eir.MouseButton1Down):connect(function()
    if eir.Text =="" then
        eir.Text = "X"
        _G.cb_b8 = true
    elseif eir.Text == "X"  then
        eir.Text = ""
        _G.cb_b8 = false
    end
    eic("of", _G.cb_b8)
end
)
sjr_q(ejb, ejx, erf, "Turn on Sword Skill", ejy[11], "os");
(ejx.MouseButton1Down):connect(function()
    if ejx.Text =="" then
        ejx.Text = "X"
        _G.cb_b9 = true
    elseif ejx.Text == "X"  then
        ejx.Text = ""
        _G.cb_b9 = false
    end
    eic("os", _G.cb_b9)
end
)
sjr_q(eft, eld, erf, "Turn on Gun Skill", ejy[12], "og");
(eld.MouseButton1Down):connect(function()
    if eld.Text =="" then
        eld.Text = "X"
        _G.cb_b10 = true
    elseif eld.Text == "X"  then
        eld.Text = ""
        _G.cb_b10 = false
    end
    eic("og", _G.cb_b10)
end
)
sjr_o(erf, "Setting Skill Melee", ejy[13])
sjr_q(dzn, ecs, erf, "Skill Z", ejy[14], "mz");
(ecs.MouseButton1Down):connect(function()
    if ecs.Text =="" then
        ecs.Text = "X"
        _G.cb_b11 = true
    elseif ecs.Text == "X"  then
        ecs.Text = ""
        _G.cb_b11 = false
    end
    eic("mz", _G.cb_b11)
end
)
sjr_ac(erf, "Distance Auto Skill", 10, 1000, ejy[15], "mdz")
sjr_q(ejt, ejo, erf, "Skill X", ejy[16], "mx");
(ejo.MouseButton1Down):connect(function()
    if ejo.Text =="" then
        ejo.Text = "X"
        _G.cb_b12 = true
    elseif ejo.Text == "X"  then
        ejo.Text = ""
        _G.cb_b12 = false
    end
    eic("mx", _G.cb_b12)
end
)
sjr_ac(erf, "Distance Auto Skill", 10, 1000, ejy[17], "mdx")
sjr_q(eai, elb, erf, "Skill C", ejy[18], "mc");
(elb.MouseButton1Down):connect(function()
    if elb.Text =="" then
        elb.Text = "X"
        _G.cb_b13 = true
    elseif elb.Text == "X"  then
        elb.Text = ""
        _G.cb_b13 = false
    end
    eic("mc", _G.cb_b13)
end
)
sjr_ac(erf, "Distance Auto Skill", 10, 1000, ejy[19], "mdc")
sjr_o(erf, "Setting Skill Sword", ejy[20])
sjr_q(efn, eji, erf, "Skill Z", ejy[21], "sz");
(eji.MouseButton1Down):connect(function()
    if eji.Text =="" then
        eji.Text = "X"
        _G.cb_b14 = true
    elseif eji.Text == "X"  then
        eji.Text = ""
        _G.cb_b14 = false
    end
    eic("sz", _G.cb_b14)
end
)
sjr_ac(erf, "Distance Auto Skill", 10, 1000, ejy[22], "sdz")
sjr_q(ehd, edj, erf, "Skill X", ejy[23], "sx");
(edj.MouseButton1Down):connect(function()
    if edj.Text =="" then
        edj.Text = "X"
        _G.cb_b15 = true
    elseif edj.Text == "X"  then
        edj.Text = ""
        _G.cb_b15 = false
    end
    eic("sx", _G.cb_b15)
end
)
sjr_ac(erf, "Distance Auto Skill", 10, 1000, ejy[24], "sdx")
sjr_o(erf, "Setting Skill Gun", ejy[25])
sjr_q(ele, eip, erf, "Skill Z", ejy[26], "gz");
(eip.MouseButton1Down):connect(function()
    if eip.Text =="" then
        eip.Text = "X"
        _G.cb_b16 = true
    elseif eip.Text == "X"  then
        eip.Text = ""
        _G.cb_b16 = false
    end
    eic("gz", _G.cb_b16)
end
)
sjr_ac(erf, "Distance Auto Skill", 10, 1000, ejy[27], "gdz")
sjr_q(ekp, ejd, erf, "Skill X", ejy[28], "gx");
(ejd.MouseButton1Down):connect(function()
    if ejd.Text =="" then
        ejd.Text = "X"
        _G.cb_b17 = true
    elseif ejd.Text == "X"  then
        ejd.Text = ""
        _G.cb_b17 = false
    end
    eic("gx", _G.cb_b17)
end
)
sjr_ac(erf, "Distance Auto Skill", 10, 1000, ejy[29], "gdx")
sjr_o(erf, "Setting Skill Fruit", ejy[30])
sjr_q(dzo, eko, erf, "Skill Z", ejy[31], "fz");
(eko.MouseButton1Down):connect(function()
    if eko.Text =="" then
        eko.Text = "X"
        _G.cb_b18 = true
    elseif eko.Text == "X"  then
        eko.Text = ""
        _G.cb_b18 = false
    end
    eic("fz", _G.cb_b18)
end
)
sjr_ac(erf, "Distance Auto Skill", 10, 1000, ejy[32], "fdz")
sjr_q(eix, eba, erf, "Skill X", ejy[33], "fx");
(eba.MouseButton1Down):connect(function()
    if eba.Text =="" then
        eba.Text = "X"
        _G.cb_b19 = true
    elseif eba.Text == "X"  then
        eba.Text = ""
        _G.cb_b19 = false
    end
    eic("fx", _G.cb_b19)
end
)
sjr_ac(erf, "Distance Auto Skill", 10, 1000, ejy[34], "fdx")
sjr_q(dyy, eie, erf, "Skill C", ejy[35], "fc");
(eie.MouseButton1Down):connect(function()
    if eie.Text =="" then
        eie.Text = "X"
        _G.cb_b20 = true
    elseif eie.Text == "X"  then
        eie.Text = ""
        _G.cb_b20 = false
    end
    eic("fc", _G.cb_b20)
end
)
sjr_ac(erf, "Distance Auto Skill", 10, 1000, ejy[36], "fdc")
sjr_q(ecp, efq, erf, "Skill V", ejy[37], "fv");
(efq.MouseButton1Down):connect(function()
    if efq.Text =="" then
        efq.Text = "X"
        _G.cb_b21 = true
    elseif efq.Text == "X"  then
        efq.Text = ""
        _G.cb_b21 = false
    end
    eic("fv", _G.cb_b21)
end
)
sjr_ac(erf, "Distance Auto Skill", 10, 1000, ejy[38], "fdv")
sjr_q(dze, eih, erf, "Skill F", ejy[39], "ff");
(eih.MouseButton1Down):connect(function()
    if eih.Text =="" then
        eih.Text = "X"
        _G.cb_b22 = true
    elseif eih.Text == "X"  then
        eih.Text = ""
        _G.cb_b22 = false
    end
    eic("ff", _G.cb_b22)
end
)
sjr_ac(erf, "Distance Auto Skill", 10, 1000, ejy[40], "fdf")
spawn(function()
    while  task.wait() do
        pcall(function()
            if  _G.cb_b4  then
                edo = string.sub(eby.Text, 10)
                if (game:GetService("Players")):FindFirstChild(edo) then
                    sjr_aj(game:GetService("Players")[edo].Character ["HumanoidRootPart"].CFrame * CFrame.new(0, 20, 0))
                end
            end
        end
        )
    end
end
);
game:GetService("RunService").RenderStepped:connect(function()
    if dzf("skillplayerselect") then
        edo = string.sub(eby.Text, 10)
        if (game:GetService("Players")):FindFirstChild(edo) then
            sjr_cx(game:GetService("Players")[edo].Character ["HumanoidRootPart"].Position)
        end
    end
end
);
game:GetService("RunService").RenderStepped:connect(function()
    if dzf("skillplayernear") then
        for fgr, fgs in pairs((game.Players):GetChildren()) do
            if fgs.Name ~= game.Players ["LocalPlayer"].Name  then
                pcall(function()
                    if sjr_ba(fgs.Character ["HumanoidRootPart"])<dzf("skillplayernear0") then
                        sjr_cx(fgs.Character ["HumanoidRootPart"].Position)
                    end
                end
                )
            end
        end
    end
end
)
sjr_cx = function(fgt)
    for fgu, fgv in pairs((game.Players ["LocalPlayer"].Character):GetChildren()) do
        if  fgv:IsA("Tool") then
            if fgv.ToolTip == "Melee" and dzf("om") then
                if sjr_ba(fgt)<dzf("mdz")and dzf("mz") then
                    sjr_aq("Z", fgt)
                end
                if sjr_ba(fgt)<dzf("mdx")and dzf("mx") then
                    sjr_aq("X", fgt)
                end
                if sjr_ba(fgt)<dzf("mdc")and dzf("mc") then
                    sjr_aq("C", fgt)
                end
            elseif fgv.ToolTip == "Sword" and dzf("os") then
                if sjr_ba(fgt)<dzf("sdz")and dzf("sz") then
                    sjr_aq("Z", fgt)
                end
                if sjr_ba(fgt)<dzf("sdx")and dzf("sx") then
                    sjr_aq("X", fgt)
                end
            elseif fgv.ToolTip == "Gun" and dzf("og") then
                if sjr_ba(fgt)<dzf("gdz")and dzf("gz") then
                    sjr_aq("Z", fgt)
                end
                if sjr_ba(fgt)<dzf("gdx")and dzf("gx") then
                    sjr_aq("X", fgt)
                end
            elseif fgv.ToolTip == "Blox Fruit" and dzf("of") then
                if sjr_ba(fgt)<dzf("fdz")and dzf("fz") then
                    sjr_aq("Z", fgt)
                end
                if sjr_ba(fgt)<dzf("fdx")and dzf("fx") then
                    sjr_aq("X", fgt)
                end
                if sjr_ba(fgt)<dzf("fdc")and dzf("fc") then
                    sjr_aq("C", fgt)
                end
                if sjr_ba(fgt)<dzf("fdv")and dzf("fv") then
                    sjr_aq("V", fgt)
                end
                if sjr_ba(fgt)<dzf("fdf")and dzf("ff") then
                    sjr_aq("F", fgt)
                end
            end
        end
    end
end
sjr_o(eqz, "Player", 0.59)
sjr_q(eej, eei, eqz, "Walk On Water", 0.17, "water");
(eei.MouseButton1Down):connect(function()
    if eei.Text =="" then
        eei.Text = "X"
        _G.prl_b1 = true
    elseif eei.Text == "X"  then
        eei.Text = ""
        _G.prl_b1 = false
    end
    eic("water", _G.prl_b1)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("water") then
                game:GetService("Workspace").Map ["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
            else
                game:GetService("Workspace").Map ["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
            end
        end
        )
    end
end
)
sjr_q(egi, ebb, eqz, "Walk Speed", 0.17, "walkspeed");
(ebb.MouseButton1Down):connect(function()
    if ebb.Text =="" then
        ebb.Text = "X"
        _G.prl_b2 = true
    elseif ebb.Text == "X"  then
        ebb.Text = ""
        _G.prl_b2 = false
    end
    eic("walkspeed", _G.prl_b2)
end
)
sjr_ac(eqz, "Speed Value", 30, 500, 0.45, "speed_value");
game:GetService("RunService").RenderStepped:connect(function()
    if dzf("walkspeed") then
        game.Players ["LocalPlayer"].Character ["Humanoid"].WalkSpeed = dzf("speed_value")
    end
end
)
sjr_q(ejn, ecr, eqz, "Jumpower", 0.17, "jumpower");
(ecr.MouseButton1Down):connect(function()
    if ecr.Text =="" then
        ecr.Text = "X"
        _G.prl_b3 = true
    elseif ecr.Text == "X"  then
        ecr.Text = ""
        _G.prl_b3 = false
    end
    eic("jumpower", _G.prl_b3)
end
)
sjr_ac(eqz, "Jump Value", 30, 500, 0.45, "jump_value")
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("jumppower") then
                game.Players ["LocalPlayer"].Character ["Humanoid"].JumpPower = dzf("jump_value")
            end
        end
        )
    end
end
)
sjr_q(eaw, ebs, eqz, "Inf Jump", 0.17, "infjump");
(ebs.MouseButton1Down):connect(function()
    if ebs.Text =="" then
        ebs.Text = "X"
        _G.prl_b4 = true
    elseif ebs.Text == "X"  then
        ebs.Text = ""
        _G.prl_b4 = false
    end
    eic("infjump", _G.prl_b4)
end
);
game:GetService("UserInputService").JumpRequest:connect(function()
    if dzf("infjump")
    then ((game:GetService("Players").LocalPlayer ["Character"]):FindFirstChildOfClass("Humanoid")):ChangeState("Jumping")
end
end
)
sjr_q(ekf, eah, eqz, "Anti Stun", 0.17, "antistun");
(eah.MouseButton1Down):connect(function()
    if eah.Text =="" then
        eah.Text = "X"
        _G.prl_b5 = true
    elseif eah.Text == "X"  then
        eah.Text = ""
        _G.prl_b5 = false
    end
    eic("antistun", _G.prl_b5)
end
);
game:GetService("RunService").RenderStepped:connect(function()
    if dzf("antistun") then
        game.Players ["LocalPlayer"].Character ["Stun"].Value = 0
    end
end
)
sjr_q(ecf, dzr, eqz, "Mink V4", 0.17, "minkv4");
(dzr.MouseButton1Down):connect(function()
    if dzr.Text =="" then
        dzr.Text = "X"
        _G.prl_b6 = true
    elseif dzr.Text == "X"  then
        dzr.Text = ""
        _G.prl_b6 = false
    end
    eic("minkv4", _G.prl_b6)
end
)
spawn(function()
    pcall(function()
        local fgw = game:GetService("Players")
        local fgx = game:GetService("UserInputService")
        local fgy = game:GetService("RunService")
        local fgz = fgw.LocalPlayer
        local fha = fgz.Character or (fgz.CharacterAdded):Wait()
        local fhb = fha:WaitForChild("Humanoid")
        local fhc = fha:WaitForChild("HumanoidRootPart")
        local fhd = workspace.CurrentCamera
        local fhe = {["DashDistance"] = 70, ["DashKey"] = Enum.KeyCode ["Q"], }
        local fhf = nil
        local fhg = nil
        local function fhh()
            local fhi = fhb.MoveDirection
            if fhi.Magnitude > 0.1  then
                return  Vector3.new(fhi.X, 0, fhi.Z).Unit
            end
            local fhj = fhd.CFrame ["LookVector"]
            return  Vector3.new(fhj.X, 0, fhj.Z).Unit
        end
        local function fhk()
            local fhl = fhh()
            local sjr_ba = fhe.DashDistance
            local fhm = f.new()
            fhm.FilterDescendantsInstances = {fha, }
            fhm.FilterType = Enum.RaycastFilterType ["Exclude"]
            local fhn = workspace:Raycast(fhc.Position, fhl*sjr_ba, fhm)
            if fhn  then
                sjr_ba = (fhn.Position -fhc.Position).Magnitude - 2
            end
            if sjr_ba< 0  then
                return
            end
            fhc.CFrame = fhc.CFrame +fhl*sjr_ba
        end
        local function fho()
            local fhp, fhq = pcall(function()
                return ((((fgz.PlayerGui):WaitForChild("MobileContextButtons", 5)):WaitForChild("ContextButtonFrame", 5)):WaitForChild("BoundActionDodge", 5)):WaitForChild("Button", 5)
            end
            )
            if not fhp or not fhq  then
                return
            end
            local fhr = (fgz.PlayerGui ["MobileContextButtons"].ContextButtonFrame):FindFirstChild("sk1")
            if fhr  then
                fhr:Destroy()
            end
            local fhs = fgz.PlayerGui ["MobileContextButtons"].ContextButtonFrame ["BoundActionDodge"].Position fhg = Instance.new("TextButton")
            fhg.Name = "sk1"
            fhg.Parent = fgz.PlayerGui ["MobileContextButtons"].ContextButtonFrame fhg.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            fhg.BorderSizePixel = 0
            fhg.Position = UDim2.new(fhs.X ["Scale"], fhs.X ["Offset"]- 18, fhs.Y ["Scale"], fhs.Y ["Offset"]- 21)
            fhg.Size = UDim2.new(0, 50, 0, 50)
            fhg.Font = Enum.Font ["Ubuntu"]
            fhg.Text = ""
            fhg.TextColor3 = Color3.fromRGB(250, 255, 250)
            fhg.TextSize = 20
            fhg.BackgroundTransparency = 1
            fhg.ZIndex = 2
            fhg.Visible = dzf("minkv4")== true ;
            (fhg.MouseButton1Down):Connect(function()
                fhk()
            end
            )
        end
        ;
        (fgz.CharacterAdded):Connect(function(fht)
            fha = fht
            fhb = fht:WaitForChild("Humanoid")
            fhc = fht:WaitForChild("HumanoidRootPart")
            fhf = nil fho()
        end
        );
        (fgx.InputBegan):Connect(function(fhu, fhv)
            if fhv  then
                return
            end
            if fhu.KeyCode ==fhe.DashKey and dzf("minkv4") then
                fhk()
            end
        end
        )
        fho();
        (fgy.Heartbeat):Connect(function()
            local fhw = dzf("minkv4")== true if fhw and(not fhg or not fhg.Parent) then
                fhf = nil fho()
            end
            if fhw==fhf  then
                return
            end
            fhf = fhw if fhg  then
                fhg.Visible = fhw
            end
        end
        )
    end
    )
end
)
sjr_o(eqz, "Miss", 0.59)
_G.table_code = {
    "Sub2Fer999",
    "kittgaming",
    "NOOB_REFUND",
    "SUB2GAMERROBOT_RESET1",
    "TY_FOR_WATCHING",
    "GAMER_ROBOT_1M",
    "ADMINGIVEAWAY",
    "SUBGAMERROBOT_RESET",
    "GAMERROBOT_YT",
    "BIGNEWS",
    "FUDD10",
    "fudd10_v2",
    "Bluxxy",
    "Starcodeheo",
    "JCWK",
    "Magicbus",
    "TantaiGaming",
    "Axiore",
    "Sub2Daigrock",
    "Sub2UncleKizaru",
    "SUB2NOOBMASTER123",
    "StrawHatMaine",
    "Sub2OfficialNoobie",
    "SUB2GAMERROBOT_EXP1",
    "THEGREATACE",
    "JULYUPDATE_RESET",
    "Enyu_is_Pro",
}sjr_y(dyw, ead, eqz, "Auto Redeem All Code", 0.03);
(ead.MouseButton1Down):Connect(function()
    for fhx = 1, # _G.table_code  do (game:GetService("ReplicatedStorage").Remotes ["Redeem"]):InvokeServer(_G.table_code [fhx])
end
end
)
sjr_y(egp, dzh, eqz, "Join Team Pirate", 0.03);
(dzh.MouseButton1Down):Connect(function()
    ;
    (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("SetTeam", "Pirates")
end
)
sjr_y(ebm, ekb, eqz, "Join Team Marine", 0.03);
(ekb.MouseButton1Down):Connect(function()
    ;
    (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("SetTeam", "Marines")
end
)
sjr_y(ejs, ehl, eqz, "Open Shop Fruit", 0.03);
(ehl.MouseButton1Down):Connect(function()
    ;
    game:GetService("Players").LocalPlayer ["PlayerGui"].Main ["FruitShop"].Visible = true
end
)
sjr_y(eln, eeu, eqz, "Open Title", 0.03);
(eeu.MouseButton1Down):Connect(function()
    game.Players ["localPlayer"].PlayerGui ["Main"].Titles ["Visible"] = true
end
)
sjr_y(ean, eer, eqz, "Open Haki Color", 0.03);
(eer.MouseButton1Down):Connect(function()
    game.Players ["localPlayer"].PlayerGui ["Main"].Colors ["Visible"] = true
end
)
sjr_y(dzi, ekg, eqz, "Open Awakening", 0.03);
(ekg.MouseButton1Down):Connect(function()
    game.Players ["localPlayer"].PlayerGui ["Main"].AwakeningToggler ["Visible"] = true
end
)
_G.table_core = {
    "Flame",
    "Ice",
    "Sand",
    "Dark",
    "Light",
    "Magma",
    "Quake",
    "Buddha",
    "Spider",
    "Phoenix",
    "Dough",
    "Rumble",
    "Spider",
}sjr_o(era, "Raid", 0.59)
sjr_w(elc, edw, era, dzf("raid_select"), 0.1);
(edw.MouseButton1Down):connect(function()
    _G.ntt_frame(ecx)
end
)
sjr_u(ecx, eqp, 0.17, 0)
sjr_s(edw, ecx, _G.table_core, "Chip", 0.05, "raid_select")
sjr_q(edk, eab, era, "Auto Buy chip", 0.17, "raid_buy");
(eab.MouseButton1Down):connect(function()
    if eab.Text =="" then
        eab.Text = "X"
        _G.raid_b2 = true
    elseif eab.Text == "X"  then
        eab.Text = ""
        _G.raid_b2 = false
    end
    eic("raid_buy", _G.raid_b2)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("raid_buy")
            then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("RaidsNpc", "Select", sjr_bd(edw.Text))
        end
    end
    )
end
end
)
sjr_q(ecn, eak, era, "Teleport Lab", 0.17, "raid_tp");
(eak.MouseButton1Down):connect(function()
    if eak.Text =="" then
        eak.Text = "X"
        _G.raid_b3 = true
    elseif eak.Text == "X"  then
        eak.Text = ""
        _G.raid_b3 = false
    end
    eic("raid_tp", _G.raid_b3)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("raid_tp") then
                if  game.Players ["LocalPlayer"].PlayerGui ["Main"].TopHUDList ["RaidTimer"].Visible == false  then
                    if sjr_ah() then
                        sjr_aj(CFrame.new(-6440, 250.9, -4498.7))
                    elseif sjr_ai() then
                        sjr_aj(CFrame.new(-5013.68, 315.16, -2817.21))
                    end
                end
            end
        end
        )
    end
end
)
sjr_q(efh, een, era, "Auto Start Raid", 0.17, "raid_start");
(een.MouseButton1Down):connect(function()
    if een.Text =="" then
        een.Text = "X"
        _G.raid_b4 = true
    elseif een.Text == "X"  then
        een.Text = ""
        _G.raid_b4 = false
    end
    eic("raid_start", _G.raid_b4)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("raid_start") then
                if sjr_cf("Special Microchip")and  game.Players ["LocalPlayer"].PlayerGui ["Main"].TopHUDList ["RaidTimer"].Visible == false  then
                    if sjr_ah() then
                        fireclickdetector(Workspace.Map ["CircleIsland"].RaidSummon2 ["Button"].Main ["ClickDetector"])
                    elseif sjr_ai() then
                        fireclickdetector(game.Workspace ["Map"]["Boat Castle"].RaidSummon2 ["Button"].Main ["ClickDetector"])
                    end
                end
            end
        end
        )
    end
end
)
sjr_q(dzq, ehh, era, "Auto Next Island", 0.17, "raid_island");
(ehh.MouseButton1Down):connect(function()
    if ehh.Text =="" then
        ehh.Text = "X"
        _G.raid_b5 = true
    elseif ehh.Text == "X"  then
        ehh.Text = ""
        _G.raid_b5 = false
    end
    eic("raid_island", _G.raid_b5)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("raid_island") then
                if  game.Players ["LocalPlayer"].PlayerGui ["Main"].TopHUDList ["RaidTimer"].Visible == true  then
                    local fhy = game.Workspace ["_WorldOrigin"].Locations if  fhy:FindFirstChild("Island 5") then
                        sjr_aj(fhy:FindFirstChild("Island 5").CFrame * CFrame.new(0, 100, 0))
                        sjr_bh()
                        return
                    end
                    if  fhy:FindFirstChild("Island 4") then
                        sjr_aj(fhy:FindFirstChild("Island 4").CFrame * CFrame.new(0, 100, 0))
                        sjr_bh()
                        return
                    end
                    if  fhy:FindFirstChild("Island 3") then
                        sjr_aj(fhy:FindFirstChild("Island 3").CFrame * CFrame.new(0, 100, 0))
                        return
                    end
                    if  fhy:FindFirstChild("Island 2") then
                        sjr_aj(fhy:FindFirstChild("Island 2").CFrame * CFrame.new(0, 100, 0))
                        return
                    end
                    if  fhy:FindFirstChild("Island 1") then
                        sjr_aj(fhy:FindFirstChild("Island 1").CFrame * CFrame.new(0, 100, 0))
                        return
                    end
                end
            end
        end
        )
    end
end
)
sjr_q(ejl, ekn, era, "Auto Raid", 0.17, "raid_aura");
(ekn.MouseButton1Down):connect(function()
    if ekn.Text =="" then
        ekn.Text = "X"
        _G.raid_b6 = true
    elseif ekn.Text == "X"  then
        ekn.Text = ""
        _G.raid_b6 = false
    end
    eic("raid_aura", _G.raid_b6)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("raid_aura") then
                if  game.Players ["LocalPlayer"].PlayerGui ["Main"].TopHUDList ["RaidTimer"].Visible == true and sjr_ay() then
                    sjr_aj(sjr_ay().HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                    sjr_be()
                end
            end
        end
        )
    end
end
)
sjr_q(ehi, ebp, era, "Auto Awakening", 0.24, "awakening");
(ebp.MouseButton1Down):connect(function()
    if ebp.Text =="" then
        ebp.Text = "X"
        _G.raid_b7 = true
    elseif ebp.Text == "X"  then
        ebp.Text = ""
        _G.raid_b7 = false
    end
    eic("awakening", _G.raid_b7)
end
)
spawn(function()
    while  task.wait(1) do
        pcall(function()
            if dzf("awakening")
            then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("Awakener", "Awaken")
        end
    end
    )
end
end
)
if sjr_ah() then
    sjr_o(era, "Raid Law", 0.59)
    sjr_q(dzl, eeq, era, "Teleport Lab", 0.17, "raidlaw_tp");
    (eeq.MouseButton1Down):connect(function()
        if eeq.Text =="" then
            eeq.Text = "X"
            _G.raidlaw_b1 = true
        elseif eeq.Text == "X"  then
            eeq.Text = ""
            _G.raidlaw_b1 = false
        end
        eic("raidlaw_tp", _G.raidlaw_b1)
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("raidlaw_tp") then
                    if not sjr_bl("Order") then
                        sjr_aj(CFrame.new(-5523, 224, -5903))
                    end
                end
            end
            )
        end
    end
    )
    sjr_q(elh, ehm, era, "Auto Buy Chip", 0.17, "raidlaw_buy");
    (ehm.MouseButton1Down):connect(function()
        if ehm.Text =="" then
            ehm.Text = "X"
            _G.raidlaw_b2 = true
        elseif ehm.Text == "X"  then
            ehm.Text = ""
            _G.raidlaw_b2 = false
        end
        eic("raidlaw_buy", _G.raidlaw_b2)
    end
    )
    spawn(function()
        while  task.wait(2) do
            pcall(function()
                if dzf("raidlaw_buy") then
                    if not sjr_bl("Order")and not sjr_cf("Microchip")
                    then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("BlackbeardReward", "Microchip", "2")
                end
            end
        end
        )
    end
end
)
sjr_q(ech, ekw, era, "Auto Start Raid", 0.17, "raidlaw_start");
(ekw.MouseButton1Down):connect(function()
    if ekw.Text =="" then
        ekw.Text = "X"
        _G.raidlaw_b3 = true
    elseif ekw.Text == "X"  then
        ekw.Text = ""
        _G.raidlaw_b3 = false
    end
    eic("raidlaw_start", _G.raidlaw_b3)
end
)
spawn(function()
    while  task.wait(2) do
        pcall(function()
            if dzf("raidlaw_start") then
                if not sjr_bl("Order")and sjr_cf("Microchip") then
                    fireclickdetector(game.Workspace ["Map"].CircleIsland ["RaidSummon"].Button ["Main"].ClickDetector)
                end
            end
        end
        )
    end
end
)
sjr_q(ehc, eja, era, "Auto Raid Law", 0.17, "raidlaw");
(eja.MouseButton1Down):connect(function()
    if eja.Text =="" then
        eja.Text = "X"
        _G.raidlaw_b4 = true
    elseif eja.Text == "X"  then
        eja.Text = ""
        _G.raidlaw_b4 = false
    end
    eic("raidlaw", _G.raidlaw_b4)
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("raidlaw") then
                if sjr_bl("Order") then
                    sjr_aj(sjr_bl("Order").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                    sjr_be()
                end
            end
        end
        )
    end
end
)
end
if sjr_ah() then
    sjr_q(eky, ekk, erb, "Auto Up Race V2", 0.17, "race_v2");
    (ekk.MouseButton1Down):connect(function()
        if ekk.Text =="" then
            ekk.Text = "X"
            _G.race_b1 = true
        elseif ekk.Text == "X"  then
            ekk.Text = ""
            _G.race_b1 = false
        end
        eic("race_v2", _G.race_b1)
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("race_v2") then
                    ebz = (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("Alchemist", "1") task.wait(2)
                end
            end
            )
        end
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("race_v2") then
                    if not (game:GetService("Players").LocalPlayer ["Data"].Race):FindFirstChild("Evolved") then
                        if ebz== 0  then
                            sjr_aj(CFrame.new(-2779, 72, -3574))
                            if sjr_ba(CFrame.new(-2779, 72, -3574))< 4  then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("Alchemist", "2") task.wait(1)
                        end
                    elseif ebz== 1  then
                        if not sjr_cf("Flower 3") then
                            if sjr_bl("Swan Pirate") then
                                sjr_aj(sjr_bl("Swan Pirate").HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                                sjr_be()
                            else
                                sjr_aj(CFrame.new(931, 152, 1192))
                            end
                        else
                            if not sjr_cf("Flower 1") then
                                sjr_aj(game:GetService("Workspace").Flower1 ["CFrame"])
                            else
                                if not sjr_cf("Flower 2") then
                                    sjr_aj(game:GetService("Workspace").Flower2 ["CFrame"])
                                end
                            end
                        end
                    elseif ebz== 2  then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("Alchemist", "3") task.wait(1)
                end
            end
        end
    end
    )
end
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if dzf("race_v2")and ebz== 1 and not sjr_cf("Flower 3") then
                sjr_by("Swan Pirate")
            end
        end
        )
    end
end
)
sjr_q(ecz, edv, erb, "Auto Up Race V3", 0.17, "race_v2");
(edv.MouseButton1Down):connect(function()
    if edv.Text =="" then
        edv.Text = "X"
        _G.race_b2 = true
    elseif edv.Text == "X"  then
        edv.Text = ""
        _G.race_b2 = false
    end
    eic("race_v3", _G.race_b2)
end
)
elseif sjr_ai() then
    sjr_q(eky, ekk, erb, "Teleport To Race Door", 0.17, "race_door");
    (ekk.MouseButton1Down):connect(function()
        if ekk.Text =="" then
            ekk.Text = "X"
            _G.race_b1 = true
        elseif ekk.Text == "X"  then
            ekk.Text = ""
            _G.race_b1 = false
        end
        eic("race_door", _G.race_b1)
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("race_door") then
                    if sjr_ba(CFrame.new(28286, 14896, 102))> 2000  then
                        game.Players ["LocalPlayer"].Character ["HumanoidRootPart"].CFrame = CFrame.new(28286, 14896, 102)
                    else
                        local fhz = game:GetService("Players").LocalPlayer ["Data"].Race ["Value"]
                        if fhz== "Human"  then
                            sjr_aj(CFrame.new(29222, 14891, -206))
                        elseif fhz== "Skypiea"  then
                            sjr_aj(CFrame.new(28960, 14920, 235))
                        elseif fhz== "Fishman"  then
                            sjr_aj(CFrame.new(28231, 14891, -212))
                        elseif fhz== "Cyborg"  then
                            sjr_aj(CFrame.new(28503, 14896, -424))
                        elseif fhz== "Ghoul"  then
                            sjr_aj(CFrame.new(28674, 14891, 445))
                        elseif fhz== "Mink"  then
                            sjr_aj(CFrame.new(29012, 14891, -380))
                        end
                    end
                end
            end
            )
        end
    end
    )
    sjr_q(ecz, edv, erb, "Auto Comple Trial Race", 0.17, "race_trial");
    (edv.MouseButton1Down):connect(function()
        if edv.Text =="" then
            edv.Text = "X"
            _G.race_b2 = true
        elseif edv.Text == "X"  then
            edv.Text = ""
            _G.race_b2 = false
        end
        eic("race_trial", _G.race_b2)
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("race_trial") then
                    if  game:GetService("Players").LocalPlayer ["Data"].Race ["Value"]== "Human"  then
                        for fia, fib in pairs((game.Workspace ["Enemies"]):GetChildren()) do
                            if fib.ClassName == "Model"  then
                                if fib.Humanoid ["Health"]> 0  then
                                    sjr_am()
                                    sjr_aj(fib.HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                                end
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer ["Data"].Race ["Value"]== "Skypiea"  then
                        for fic, fid in pairs((game:GetService("Workspace").Map ["SkyTrial"].Model):GetChildren()) do
                            if fid.Name == "snowisland_Cylinder.081"  then
                                sjr_aj(fid.CFrame * CFrame.new(0, 0, 0))
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer ["Data"].Race ["Value"]== "Fishman"  then
                        if sjr_cm() then
                            sjr_aj(sjr_cm().CFrame * CFrame.new(0, 200, 0))
                        end
                    elseif game:GetService("Players").LocalPlayer ["Data"].Race ["Value"]== "Cyborg"  then
                        sjr_ak(CFrame.new(28654, 14898.78, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif game:GetService("Players").LocalPlayer ["Data"].Race ["Value"]== "Ghoul"  then
                        for fie, fif in pairs((game.Workspace ["Enemies"]):GetChildren()) do
                            if fif.ClassName == "Model"  then
                                if fif.Humanoid ["Health"]> 0  then
                                    sjr_be()
                                    sjr_aj(fif.HumanoidRootPart ["CFrame"]* CFrame.new(0, _G.distance, 0))
                                end
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer ["Data"].Race ["Value"]== "Mink"  then
                        for fig, fih in pairs((game:GetService("Workspace")):GetChildren()) do
                            if fih.Name == "StartPoint"  then
                                sjr_aj(fih.CFrame * CFrame.new(0, 10, 0))
                            end
                        end
                    end
                end
            end
            )
        end
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("race_trial") then
                    if  game:GetService("Players").LocalPlayer ["Data"].Race ["Value"]== "Fishman"  then
                        if sjr_cm() then
                            sjr_ar((sjr_cm().CFrame * CFrame.new(0, 179, 0)).Position)
                        end
                    end
                end
            end
            )
        end
    end
    )
    sjr_q(efy, ejz, erb, "Auto Kill Player", 0.17, "race_kill");
    (ejz.MouseButton1Down):connect(function()
        if ejz.Text =="" then
            ejz.Text = "X"
            _G.race_b3 = true
        elseif ejz.Text == "X"  then
            ejz.Text = ""
            _G.race_b3 = false
        end
        eic("race_kill", _G.race_b3)
    end
    )
    spawn(function()
        while  task.wait() do
            pcall(function()
                if dzf("race_kill") then
                    if sjr_ct() then
                        sjr_aj(sjr_ct().HumanoidRootPart ["CFrame"]* CFrame.new(0, -10, 0))
                        sjr_am()
                    end
                end
            end
            )
        end
    end
    )
end
sjr_o(erd, "Join Server", 0.03)
sjr_z(eig, erd, "Enter Code Join Server", 0.1)
sjr_y(ecl, ekr, erd, "Join Server", 0.17);
(ekr.MouseButton1Down):connect(function()
    if  string.find(eig.Text, "NTT") then
        ebh = sjr_bs(eig.Text)
    else
        ebh = eig.Text
    end
    local fii = {[1] = "teleport", [2] = ebh, };
    game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(unpack(fii))
end
)
sjr_y(efo, elg, erd, "Coppy Code Server", 0.24);
(elg.MouseButton1Down):connect(function()
    setclipboard(game.JobId)
end
)
sjr_y(dzs, ehe, erd, "Rejoin", 0.31);
(ehe.MouseButton1Down):connect(function()
    local fij = {[1] = "teleport", [2] = game.JobId, };
    game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(unpack(fij))
end
)
sjr_y(ebt, ebr, erd, "Server Hop", 0.38);
(ebr.MouseButton1Down):connect(function()
    sjr_av()
end
)
sjr_o(erd, "Sever", 0.03)
sjr_y(eik, ehr, erd, "Teleport Sea 1", 0.24);
(ehr.MouseButton1Down):connect(function()
    ;
    (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("TravelMain")
end
)
sjr_y(eeo, efj, erd, "Teleport Sea 2", 0.31);
(efj.MouseButton1Down):connect(function()
    ;
    (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("TravelDressrosa")
end
)
sjr_y(ecu, ecm, erd, "Teleport Sea 3", 0.38);
(ecm.MouseButton1Down):connect(function()
    ;
    (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("TravelZou")
end
)
if sjr_af() then
    _G.table_island = {
        "Pirate Start",
        "Marine Start",
        "Middle Town",
        "Jungle",
        "Pirate Village",
        "Desert",
        "Frozen Village",
        "Marine Ford",
        "Colosseum",
        "Sky 1",
        "Sky 2",
        "Sky 3",
        "Magma Village",
        "Fountain City",
        "UnderWater City",
        "Prison",
        "Whilr Pool",
    }
elseif sjr_ah() then
    _G.table_island = {
        "KingDom of Rose",
        "CafÃ©",
        "Green Zone",
        "Hot and Cold",
        "Snow Moutain",
        "Dark Arena",
        "Cursed Ship",
        "Ice Castle",
        "Graveyard",
        "Fogotten",
    }
elseif sjr_ai() then
    _G.table_island = {
        "Port",
        "Mansion",
        "Castle on The Sea",
        "Hydra",
        "Haunted Castle",
        "Great Tree",
        "Sea of Treat 1",
        "Sea of Treat 2",
        "Sea of Treat 3",
        "Sea of Treat 4",
        "Sea of Treat 5",
        "Tiki Outpost",
    }
end
sjr_o(ere, "Island", 0.03)
sjr_w(eht, dzt, ere, dzf("teleport_select"), 0.1);
(dzt.MouseButton1Down):connect(function()
    _G.ntt_frame(ejc)
end
)
sjr_u(ejc, eqp, 0.17, 0)
sjr_s(dzt, ejc, _G.table_island, "Island", 0.05, "teleport_select")
sjr_q(efk, eia, ere, "Teleport Island", 0.17, "fake");
(eia.MouseButton1Down):connect(function()
    if eia.Text =="" then
        eia.Text = "X"
        _G.teleport_b2 = true
    elseif eia.Text == "X"  then
        eia.Text = ""
        _G.teleport_b2 = false
    end
end
)
spawn(function()
    while  task.wait() do
        pcall(function()
            if  _G.teleport_b2  then
                sjr_aj(sjr_az())
            end
        end
        )
    end
end
)
sjr_cz = function()
    eio = 1
    eaz = _G.loadserver("v2", sjr_bd(ekx.Text))
    for fik, fil in pairs(eaz) do
        local fim = Instance.new("TextLabel")
        local fin = Instance.new("TextButton")
        sjr_y(fim, fin, erc, fik.." || "..fil, 0.03 +( 0.07 *eio));
        (fin.MouseButton1Down):connect(function()
            if  string.find((fim.Text):match("%|%|%s*(.+)"), "NTT") then
                ebh = sjr_bs((fim.Text):match("%|%|%s*(.+)"))
            else
                ebh = (fim.Text):match("%|%|%s*(.+)")
            end
            ;
            (game:GetService("TeleportService")):TeleportToPlaceInstance(game.PlaceId, ebh, game.Players ["LocalPlayer"])
        end
        )
        eio = eio+ 1
    end
end
sjr_o(erc, "Server Live", 0.03)
sjr_w(ede, ekx, erc, dzf("server_live"), 0.03);
(ekx.MouseButton1Down):connect(function()
    eao.Visible = true
end
)
_G.table_server = { "Fruit Spawn BF", "Fruit Drop BF", "Boss BF", "Island BF", "Full Moon", }sjr_u(eao, eqp, 0.1, 0)
sjr_s(ekx, eao, _G.table_server, "Server", 0.05, "server_live")
eag = ekx  spawn(function()
    while  task.wait() do
        pcall(function()
            if eag==ekx.Text  then
                return
            end
            if#erc:GetChildren()>= 3  then
                for fio = 3, #erc:GetChildren() do
                    if  erc:GetChildren()[fio] then (erc:GetChildren()[fio]):Destroy()
                end
            end
        else
            eag = ekx.Text sjr_cz()
        end
    end
    )
end
end
)
spawn(function()
    while  task.wait(5) do
        pcall(function()
            if erc.Visible  then
                eag = 1
            end
        end
        )
    end
end
)
spawn(function()
    pcall(function()
        loadstring("\nlocal v1 = next\nlocal v2 = {\n    game.ReplicatedStorage.Util,\n    game.ReplicatedStorage.Common,\n    game.ReplicatedStorage.Remotes,\n    game.ReplicatedStorage.Assets,\n    game.ReplicatedStorage.FX,\n}\nlocal v3 = nil\nlocal u4 = nil\nlocal u5 = nil\n\nwhile true do\n    local v6\n\n    v3, v6 = v1(v2, v3)\n\n    if v3 == nil then\n        break\n    end\n\n    local v7 = next\n    local v8, v9 = v6:GetChildren()\n\n    while true do\n        local v10\n\n        v9, v10 = v7(v8, v9)\n\n        if v9 == nil then\n            break\n        end\n        if v10:IsA('RemoteEvent') and v10:GetAttribute('Id') then\n            u5 = v10:GetAttribute('Id')\n            u4 = v10\n        end\n    end\n\n    v6.ChildAdded:Connect(function(p11)\n        if p11:IsA('RemoteEvent') and p11:GetAttribute('Id') then\n            u5 = p11:GetAttribute('Id')\n            u4 = p11\n        end\n    end)\nend\n\ntask.spawn(function()\n    while task.wait(0.0001) do\n        local _Character = game.Players.LocalPlayer.Character\n        local v13\n\n        if _Character then\n            v13 = _Character:FindFirstChild('HumanoidRootPart')\n        else\n            v13 = _Character\n        end\n\n        local v14, v15, v16 = ipairs({\n            workspace.Enemies,\n            workspace.Characters,\n        })\n        local u17 = {}\n\n        while true do\n            local v18\n\n            v16, v18 = v14(v15, v16)\n\n            if v16 == nil then\n                break\n            end\n\n            local v19, v20, v21 = ipairs(v18 and v18:GetChildren() or {})\n\n            while true do\n                local v22\n\n                v21, v22 = v19(v20, v21)\n\n                if v21 == nil then\n                    break\n                end\n\n                local _HumanoidRootPart = v22:FindFirstChild('HumanoidRootPart')\n                local _Humanoid = v22:FindFirstChild('Humanoid')\n\n                if v22 ~= _Character and _HumanoidRootPart and (_Humanoid and 0 < _Humanoid.Health) and (_HumanoidRootPart.Position - v13.Position).Magnitude <= 60 then\n                    local v25, v26, v27 = ipairs(v22:GetChildren())\n\n                    while true do\n                        local v28\n\n                        v27, v28 = v25(v26, v27)\n\n                        if v27 == nil then\n                            break\n                        end\n                        if v28:IsA('BasePart') and (_HumanoidRootPart.Position - v13.Position).Magnitude <= 60 then\n                            u17[#u17 + 1] = {v22, v28}\n                        end\n                    end\n                end\n            end\n        end\n\n        local _Tool = _Character:FindFirstChildOfClass('Tool')\n\n        if #u17 > 0 and _Tool and (_Tool:GetAttribute('WeaponType') == 'Melee' or _Tool:GetAttribute('WeaponType') == 'Sword') then\n            pcall(function()\n                require(game.ReplicatedStorage.Modules.Net):RemoteEvent('RegisterHit', true)\n                game.ReplicatedStorage.Modules.Net['RE/RegisterAttack']:FireServer()\n\n                local _Head = u17[1][1]:FindFirstChild('Head')\n\n                if _Head then\n                    game.ReplicatedStorage.Modules.Net['RE/RegisterHit']:FireServer(_Head, u17, {}, tostring(game.Players.LocalPlayer.UserId):sub(2, 4) .. tostring(coroutine.running()):sub(11, 15))\n                    cloneref(u4):FireServer(string.gsub('RE/RegisterHit', '.', function(p31)\n                        return string.char(bit32.bxor(string.byte(p31), math.floor(workspace:GetServerTimeNow() / 10 % 10) + 1))\n                    end), bit32.bxor(u5 + 909090, game.ReplicatedStorage.Modules.Net.seed:InvokeServer() * 2), _Head, u17)\n                end\n            end)\n        end\n    end\nend)\n\nlocal function GetBladeHits()\nlocal t={}\nlocal function d(v)return(v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude end\nfor _,p in pairs({game.Workspace.Enemies,game.Workspace.Characters})do\nfor _,v in pairs(p:GetChildren())do\nif v:FindFirstChild(\"HumanoidRootPart\") and v:FindFirstChild(\"Head\") and v:FindFirstChild(\"Humanoid\") then\nif d(v.HumanoidRootPart)<60 then table.insert(t,v)end\nend\nend\nend\nreturn t\nend\nlocal function AttackAll()\nlocal plr=game.Players.LocalPlayer\nlocal ch=plr.Character\nif not ch then return end\nlocal ew=ch:FindFirstChild(\"EquippedWeapon\")\nif not ew then return end\nlocal e=GetBladeHits()\nif #e>0 then\nlocal n=game:GetService(\"ReplicatedStorage\"):WaitForChild(\"Modules\"):WaitForChild(\"Net\")\nn:WaitForChild(\"RE/RegisterAttack\"):FireServer(-math.huge)\nlocal a={nil,{}}\nfor i,v in pairs(e)do\nif not a[1] then a[1]=v.Head end\na[2][i]={v,v.HumanoidRootPart}\nend\nn:WaitForChild(\"RE/RegisterHit\"):FireServer(unpack(a))\nend\nend\nspawn(function()while task.wait()do AttackAll()end end)\n\nlocal Players=game:GetService(\"Players\")\nlocal RunService=game:GetService(\"RunService\")\nlocal ReplicatedStorage=game:GetService(\"ReplicatedStorage\")\nlocal Workspace=game:GetService(\"Workspace\")\n\nlocal Player=Players.LocalPlayer\nlocal Modules=ReplicatedStorage:WaitForChild(\"Modules\")\nlocal Net=Modules:WaitForChild(\"Net\")\nlocal RegisterAttack=Net:WaitForChild(\"RE/RegisterAttack\")\nlocal RegisterHit=Net:WaitForChild(\"RE/RegisterHit\")\nlocal ShootGunEvent=Net:WaitForChild(\"RE/ShootGunEvent\")\n\ngetgenv().PMT_GunFast=(getgenv().PMT_GunFast~=false)\ngetgenv().PMT_GunFast_Delay=getgenv().PMT_GunFast_Delay or 0.02\ngetgenv().PMT_GunFast_PrimeEvery=getgenv().PMT_GunFast_PrimeEvery or 0.35\n\nlocal Config={AttackDistance=65,AttackMobs=true,AttackPlayers=true,AttackCooldown=0.01,ComboResetTime=0.3,MaxCombo=4,HitboxLimbs={\"RightLowerArm\",\"RightUpperArm\",\"LeftLowerArm\",\"LeftUpperArm\",\"RightHand\",\"LeftHand\"},AutoClickEnabled=true}\n\nlocal FastAttack={}\nFastAttack.__index=FastAttack\n\nfunction FastAttack.new()\nlocal s=setmetatable({Debounce=0,ComboDebounce=0,ShootDebounce=0,M1Combo=0,EnemyRootPart=nil,Connections={},Overheat={Dragonstorm={MaxOverheat=3,Cooldown=0,TotalOverheat=0,Distance=350,Shooting=false}},ShootsPerTarget={[\"Dual Flintlock\"]=2},SpecialShoots={[\"Skull Guitar\"]=\"TAP\",[\"Bazooka\"]=\"Position\",[\"Cannon\"]=\"Position\",[\"Dragonstorm\"]=\"Overheat\"},_GunLastPrime=0,_GunLastShot=0,_LastGunTargetModel=nil,CombatFlags=nil,ShootFunction=nil,HitFunction=nil},FastAttack)\npcall(function()\ns.CombatFlags=require(Modules.Flags).COMBAT_REMOTE_THREAD\ns.ShootFunction=getupvalue(require(ReplicatedStorage.Controllers.CombatController).Attack,9)\nlocal ls=Player:WaitForChild(\"PlayerScripts\"):FindFirstChildOfClass(\"LocalScript\")\nif ls and getsenv then s.HitFunction=getsenv(ls)._G.SendHitsToServer end\nend)\nreturn s\nend\n\nfunction FastAttack:IsEntityAlive(e)\nlocal h=e and e:FindFirstChild(\"Humanoid\")\nreturn h and h.Health>0\nend\n\nfunction FastAttack:CheckStun(c,h,tt)\nlocal st=c:FindFirstChild(\"Stun\")\nlocal bs=c:FindFirstChild(\"Busy\")\nif h.Sit and (tt==\"Sword\" or tt==\"Melee\" or tt==\"Blox Fruit\") then return false end\nif (st and st.Value>0) or (bs and bs.Value) then return false end\nreturn true\nend\n\nfunction FastAttack:GetBladeHits(c,dist)\nlocal pos=c:GetPivot().Position\nlocal bh={}\ndist=dist or Config.AttackDistance\nlocal function proc(f)\nfor _,e in ipairs(f:GetChildren())do\nif e~=c and self:IsEntityAlive(e) then\nlocal bp=e:FindFirstChild(Config.HitboxLimbs[math.random(#Config.HitboxLimbs)]) or e:FindFirstChild(\"HumanoidRootPart\")\nif bp and (pos-bp.Position).Magnitude<=dist then\nif not self.EnemyRootPart then self.EnemyRootPart=bp else table.insert(bh,{e,bp})end\nend\nend\nend\nend\nif Config.AttackMobs then proc(Workspace.Enemies)end\nif Config.AttackPlayers then proc(Workspace.Characters)end\nreturn bh\nend\n\nfunction FastAttack:GetClosestEnemy(c,dist)\nlocal hits=self:GetBladeHits(c,dist)\nlocal cl,md=nil,math.huge\nself._LastGunTargetModel=nil\nfor _,h in ipairs(hits)do\nlocal m=(c:GetPivot().Position-h[2].Position).Magnitude\nif m<md then md=m;cl=h[2];self._LastGunTargetModel=h[1] end\nend\nreturn cl\nend\n\nfunction FastAttack:GetCombo()\nlocal cb=(tick()-self.ComboDebounce)<=Config.ComboResetTime and self.M1Combo or 0\ncb=cb>=Config.MaxCombo and 1 or cb+1\nself.ComboDebounce=tick()\nself.M1Combo=cb\nreturn cb\nend\n\nlocal function _nv3(p)\nif vector and vector.create then return vector.create(p.X,p.Y,p.Z) end\nreturn Vector3.new(p.X,p.Y,p.Z)\nend\n\nlocal function _handle(m)\nif not m or not m.Parent then return nil end\nfor _,d in ipairs(m:GetDescendants())do\nif d:IsA(\"Accessory\") then\nlocal h=d:FindFirstChild(\"Handle\")\nif h and h:IsA(\"BasePart\") then return h end\nend\nend\nlocal hrp=m:FindFirstChild(\"HumanoidRootPart\")\nif hrp and hrp:IsA(\"BasePart\") then return hrp end\nreturn nil\nend\n\nfunction FastAttack:_PrimeGun(tl)\nif not tl or not tl.Parent or tl.Parent~=Player.Character then return end\nlocal now=os.clock()\nlocal ev=tonumber(getgenv().PMT_GunFast_PrimeEvery) or 0.35\nif now-(self._GunLastPrime or 0)<ev then return end\nself._GunLastPrime=now\npcall(function()tl:Activate()end)\npcall(function()if firesignal and tl.Activated then firesignal(tl.Activated)end end)\nend\n\nfunction FastAttack:ShootInTarget(tp)\nif not getgenv().PMT_GunFast then return end\nlocal c=Player.Character\nif not self:IsEntityAlive(c) then return end\nlocal tl=c:FindFirstChildOfClass(\"Tool\")\nif not tl or tl.ToolTip~=\"Gun\" then return end\nself:_PrimeGun(tl)\nlocal now=os.clock()\nlocal del=tonumber(getgenv().PMT_GunFast_Delay) or 0.02\nif now-(self._GunLastShot or 0)<del then return end\nself._GunLastShot=now\nlocal m=self._LastGunTargetModel\nlocal h=_handle(m)\nif not h then return end\npcall(function()ShootGunEvent:FireServer(_nv3(tp),{h})end)\nend\n\nfunction FastAttack:UseNormalClick(c,h,cd)\nself.EnemyRootPart=nil\nlocal bh=self:GetBladeHits(c)\nif self.EnemyRootPart then\nRegisterAttack:FireServer(cd)\nif self.CombatFlags and self.HitFunction then\nself.HitFunction(self.EnemyRootPart,bh)\nelse\nRegisterHit:FireServer(self.EnemyRootPart,bh)\nend\nend\nend\n\nfunction FastAttack:UseFruitM1(c,eq,cb)\nlocal t=self:GetBladeHits(c)\nif not t[1] then return end\nlocal dir=(t[1][2].Position-c:GetPivot().Position).Unit\neq.LeftClickRemote:FireServer(dir,cb)\nend\n\nfunction FastAttack:Attack()\nif not Config.AutoClickEnabled or (tick()-self.Debounce)<Config.AttackCooldown then return end\nlocal c=Player.Character\nif not c or not self:IsEntityAlive(c) then return end\nlocal h=c.Humanoid\nlocal eq=c:FindFirstChildOfClass(\"Tool\")\nif not eq then return end\nlocal tt=eq.ToolTip\nif not table.find({\"Melee\",\"Blox Fruit\",\"Sword\",\"Gun\"},tt) then return end\nlocal cd=eq:FindFirstChild(\"Cooldown\") and eq.Cooldown.Value or Config.AttackCooldown\nif not self:CheckStun(c,h,tt) then return end\nlocal cb=self:GetCombo()\ncd=cd+(cb>=Config.MaxCombo and 0.05 or 0)\nself.Debounce=cb>=Config.MaxCombo and tt~=\"Gun\" and (tick()+0.05) or tick()\nif tt==\"Blox Fruit\" and eq:FindFirstChild(\"LeftClickRemote\") then\nself:UseFruitM1(c,eq,cb)\nelseif tt==\"Gun\" then\nlocal t=self:GetClosestEnemy(c,120)\nif t then self:ShootInTarget(t.Position)end\nelse\nself:UseNormalClick(c,h,cd)\nend\nend\n\nlocal AttackInstance=FastAttack.new()\ntable.insert(AttackInstance.Connections,RunService.Stepped:Connect(function()AttackInstance:Attack()end))\n\nRunService.Heartbeat:Connect(function()\nif not getgenv().PMT_GunFast then return end\nlocal c=Player.Character\nif not c then return end\nlocal tl=c:FindFirstChildOfClass(\"Tool\")\nif not tl or tl.ToolTip~=\"Gun\" then return end\nAttackInstance:_PrimeGun(tl)\nend)\n\nfor _,v in pairs(getgc(true))do\nif typeof(v)==\"function\" and iscclosure(v) then\nlocal n=debug.getinfo(v).name\nif n==\"Attack\" or n==\"attack\" or n==\"RegisterHit\" then\nhookfunction(v,function(...)\nAttackInstance:Attack()\nreturn v(...)\nend)\nend\nend\nend\n\nlocal Modules=game.ReplicatedStorage.Modules\nlocal Net=Modules.Net\nlocal Register_Hit,Register_Attack=Net:WaitForChild(\"RE/RegisterHit\"),Net:WaitForChild(\"RE/RegisterAttack\")\nlocal Funcs={}\nfunction GetAllBladeHits()\nbladehits={}\nfor _,v in pairs(workspace.Enemies:GetChildren())do\nif v:FindFirstChild(\"Humanoid\") and v:FindFirstChild(\"HumanoidRootPart\") and v.Humanoid.Health>0 and (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude<=65 then\ntable.insert(bladehits,v)\nend\nend\nreturn bladehits\nend\nfunction Getplayerhit()\nbladehits={}\nfor _,v in pairs(workspace.Characters:GetChildren())do\nif v.Name~=game.Players.LocalPlayer.Name and v:FindFirstChild(\"Humanoid\") and v:FindFirstChild(\"HumanoidRootPart\") and v.Humanoid.Health>0 and (v.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude<=65 then\ntable.insert(bladehits,v)\nend\nend\nreturn bladehits\nend\nfunction Funcs:Attack()\nlocal bladehits={}\nfor _,v in pairs(GetAllBladeHits())do table.insert(bladehits,v)end\nfor _,v in pairs(Getplayerhit())do table.insert(bladehits,v)end\nif #bladehits==0 then return end\nlocal args={[1]=nil,[2]={},[4]=\"078da341\"}\nfor r,v in pairs(bladehits)do\nRegister_Attack:FireServer(0)\nif not args[1] then args[1]=v.Head end\nargs[2][r]={[1]=v,[2]=v.HumanoidRootPart}\nend\nRegister_Hit:FireServer(unpack(args))\nend\nspawn(function()\nwhile task.wait(0.05) do\npcall(function()\nlocal ch=game.Players.LocalPlayer.Character\nlocal t=ch and ch:FindFirstChildOfClass(\"Tool\")\nif t then Funcs:Attack() end\nend)\nend\nend)\n")()
    end
    )
end
);
game:GetService("RunService").RenderStepped:connect(function()
    for fip, fiq in pairs((game.Players ["LocalPlayer"].Character):GetChildren()) do
        if fiq.ClassName == "Tool"  then
            _G.nt = fiq.Name
        end
    end
end
)
pcall(function()
    local fir = getrawmetatable(game)
    local fis = fir.__namecall setreadonly(fir, false)
    fir.__namecall = newcclosure(function(fit,...)
        local fiu = getnamecallmethod()
        local fiv = {...}
        if fiu== "FireServer" and fit.Name == "RemoteEvent" and fit.Parent and fit.Parent ["Name"]== _G.nt  then
            if dzf("aim_near")or dzf("aim_select") then
                if  typeof(fiv[1])== "Vector3" and  _G.pos_skill  then
                    if not  _G.index_key  then
                        return
                    end
                    fiv[1] = _G.pos_skill
                end
                return fis(fit, unpack(fiv))
            end
        end
        return fis(fit,...)
    end
    )
end
)
sjr_da = function(fiw, fix)
    ;
    (fiw.MouseButton1Down):connect(function()
        for fiy = 1, # _G.ntt_mainscrollingframe  do
            _G.ntt_mainscrollingframe [fiy].Visible = false
        end
        for fiz = 1, # _G.ntt_farmain_table  do
            _G.ntt_farmain_table [fiz].Visible = false
        end
        fix.Visible = true
        eqq.Text = "NTT HUB | "..fiw.Text.." | ".._G.linkdis
    end
    )
end
sjr_da(eri, eqr)
sjr_da(erj, eqs)
sjr_da(erl, equ)
sjr_da(erm, eqv)
sjr_da(ern, eqw)
sjr_da(erk, eqt)
sjr_da(ero, eqx)
sjr_da(erp, eqy)
sjr_da(erq, eqz)
sjr_da(err, era)
sjr_da(ers, erb)
sjr_da(ert, erc)
sjr_da(eru, erd)
sjr_da(erv, ere)
sjr_da(erw, erf)
spawn(function()
    while  task.wait() do
        pcall(function()
            if (game.Players ["LocalPlayer"].PlayerGui):FindFirstChild("Main (minimal)")
            then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("SetTeam", "Marines")
        end
    end
    )
end
end
)
spawn(function()
    while  task.wait(1) do
        pcall(function()
            if not (game.Players ["LocalPlayer"].Character):FindFirstChild("HasBuso")
            then (game:GetService("ReplicatedStorage").Remotes ["CommF_"]):InvokeServer("Buso")
        end
    end
    )
end
end
)
ehy = #(game:GetService("Players")):GetPlayers()
eel = sjr_br(game.JobId)
sjr_db = function()
    if sjr_af() then
        return  "Sea 1"
    elseif sjr_ah() then
        return  "Sea 2"
    elseif sjr_ai() then
        return  "Sea 3"
    else
        return  "Sea ?"
    end
end
if sjr_af() then
    _G.sea = "Sea 1"
elseif sjr_ah() then
    _G.sea = "Sea 2"
elseif sjr_ai() then
    _G.sea = "Sea 3"
else
    _G.sea = "Sea ?"
end
sjr_dd = function(fja)
    if not  fja:FindFirstChild("done") then
        local fjb = Instance.new("Folder")
        fjb.Name = "done"
        fjb.Parent = fja
    end
end
sjr_de = function(fjc, fjd)
    pcall(function()
    end
    )
end
spawn(function()
    while  task.wait(1) do
        pcall(function()
            local fje = { "rip_indra True Form", "Darkbeard", "Dough King", "Cake Prince", "Soul Reaper", }
            for fjf = 1, #fje  do
                if sjr_bl(fje[fjf])and not (sjr_bl(fje[fjf])):FindFirstChild("done") then
                    sjr_dd(sjr_bl(fje[fjf]))
                    sjr_de("Boss BF", sjr_bl(fje[fjf]).Name) _G.webhook1("boss_bf", sjr_bl(fje[fjf]).Name, ehy, eel)
                end
            end
        end
        )
    end
end
)
spawn(function()
    while  task.wait(1) do
        pcall(function()
            if sjr_co()and not (sjr_co()):FindFirstChild("done") then
                sjr_dd(sjr_co())
                sjr_de("Island BF", "Mirage Island") _G.webhook1("island_bf", "Mirage Island", ehy, eel)
            end
            if sjr_cp()and not (sjr_cp()):FindFirstChild("done") then
                sjr_dd(sjr_co())
                sjr_de("Island BF", "Kitsune Island") _G.webhook1("island_bf", "Kitsune Island", ehy, eel)
            end
        end
        )
    end
end
)
spawn(function()
    while  task.wait(1) do
        pcall(function()
            for fjg, fjh in pairs((game.Workspace):GetChildren()) do
                if  string.find(fjh.Name, "Fruit")and#fjh.Name <= 7  then
                    if  fjh:FindFirstChild("Handle") then
                        if not  fjh:FindFirstChild("done") then
                            sjr_dd(fjh)
                            pcall(function()
                                sjr_de("Fruit Spawn BF", _G.sea)
                            end
                            ) _G.webhook3("fruit_spawn", "Fruit Spawn", _G.sea, "????", ehy, eel)
                        end
                    end
                end
            end
        end
        )
    end
end
)
sjr_df = function()
    local fji = ""
    for fjj, fjk in pairs((game.Workspace):GetChildren()) do
        if  string.find(fjk.Name, "Fruit")and#fjk.Name >= 7  then
            if  fjk:FindFirstChild("Handle") then
                if fji=="" then
                    fji = fjk.Name
                else
                    fji = fji.."\n"..fjk.Name
                end
            end
        end
    end
    return fji
end
spawn(function()
    while  task.wait() do
        pcall(function()
            if#sjr_df()> 2  then
                pcall(function()
                    sjr_de("Fruit Drop BF", _G.sea.." : "..sjr_df())
                end
                ) _G.webhook3("fruit_drop", "Fruit Drop", _G.sea, sjr_df(), ehy, eel)
            end
        end
        ) task.wait(60 * 30)
    end
end
)
_G.fm = true  spawn(function()
    while  task.wait(1) do
        pcall(function()
            if  game:GetService("Lighting").Sky ["MoonTextureId"]== "http://www.roblox.com/asset/?id=9709149431"  then
                if  _G.fm  then
                    _G.fm = false sjr_de("Full Moon", "Full Moon") _G.webhook1("fm", "Full Moon", ehy, eel)
                end
            else
                _G.fm = true
            end
        end
        )
    end
end
)
