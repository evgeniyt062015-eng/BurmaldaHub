-- BURMALDA v15.1 | Part 6/14 — ESP
-- Фиксы: правильный Highlight, чёрный список книг, ESP All, разные цвета

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local P=_G.P

-- ═══ ХЕЛПЕРЫ ═══
local function getPart(o)
    if not o then return nil end
    local ok,res=pcall(function()
        if o:IsA("BasePart") then return o end
        if o.PrimaryPart then return o.PrimaryPart end
        return o:FindFirstChildWhichIsA("BasePart",true)
    end)
    if ok then return res end
    return nil
end

-- ═══ ЧЁРНЫЙ СПИСОК (не ESP'ить) ═══
local BLACKLIST={"bookshelf","books","shelf","library","plant","potted","decor","decoration","sign","painting","picture","rug","carpet","lamp","chair","table","bed","door_frame","wall","floor"}

local function isBlacklisted(name)
    if not name then return false end
    local n=string.lower(tostring(name))
    for _,k in ipairs(BLACKLIST) do
        if string.find(n,k,1,true) then return true end
    end
    return false
end

-- ═══ СПИСОК МОНСТРОВ (флаг + имена + алиас) ═══
local ENT={
    {flag="ESP_Rush",      names={"RushMoving","RushNew","Rush"},              alias="Rush"},
    {flag="ESP_Ambush",    names={"AmbushMoving","AmbushNew","Ambush"},        alias="Ambush"},
    {flag="ESP_Seek",      names={"Seek","SeekMoving"},                        alias="Seek"},
    {flag="ESP_Figure",    names={"FigureRig","Figure","FigureRagdoll"},      alias="Figure"},
    {flag="ESP_Screech",   names={"Screech"},                                  alias="Screech"},
    {flag="ESP_Eyes",      names={"Eyes","EyesEntity"},                        alias="Eyes"},
    {flag="ESP_Halt",      names={"Halt","HaltMoving"},                        alias="Halt"},
    {flag="ESP_Grumble",   names={"Grumble","GrumbleRig"},                     alias="Grumble"},
    {flag="ESP_Giggle",    names={"GiggleCeiling","Giggle"},                  alias="Giggle"},
    {flag="ESP_Blitz",     names={"BackdoorRush","Blitz"},                     alias="Blitz"},
    {flag="ESP_Lookman",   names={"Lookman","BackdoorLookman"},                alias="Lookman"},
}

-- ═══ ЦВЕТА ПО КАТЕГОРИЯМ ═══
local function getColor(type_)
    if C.RainbowMode then return Color3.fromHSV(tick()%5/5,1,1) end
    if type_=="entity" then return C.ESPColor or Color3.fromRGB(255,0,0) end
    if type_=="door" then return C.DoorColor or Color3.fromRGB(50,150,255) end
    if type_=="closet" then return C.ClosetColor or Color3.fromRGB(80,220,80) end
    if type_=="money" then return C.MoneyColor or Color3.fromRGB(255,215,0) end
    if type_=="key" then return C.KeyColor or Color3.fromRGB(255,255,100) end
    if type_=="item" then return C.ItemColor or Color3.fromRGB(180,100,255) end
    if type_=="player" then return C.PlayerColor or Color3.fromRGB(100,255,150) end
    if type_=="chest" then return C.ChestColor or Color3.fromRGB(255,150,50) end
    if type_=="objective" then return C.ObjectiveColor or Color3.fromRGB(0,200,255) end
    if type_=="breaker" then return C.BreakerColor or Color3.fromRGB(255,255,0) end
    return C.ESPColor
end

-- ═══ СПИСКИ ИМЁН ДЛЯ КАТЕГОРИЙ ═══
local CLOSET_NAMES={"closet","hiding","wardrobe","locker","cabinet","hide"}
local DOOR_NAMES={"door"}
local MONEY_NAMES={"coin","gold","goldpile","goldp"}
local KEY_NAMES={"door_key","doorkey","keyiron","key_iron","ironkey","key"}
local ITEM_NAMES={"flashlight","lockpick","bandage","vitamins","crucifix","lighter","battery","candle","skeleton","lantern","shears","scanner","compass","shakelight","straplight","bulklight"}
local CHEST_NAMES={"chest","box"}
local OBJECTIVE_NAMES={"minesanchor","anchor","valve","objective"}
local BREAKER_NAMES={"breaker","fuse","ebf"}

local function matchesAny(name, list)
    if not name then return false end
    local n=string.lower(tostring(name))
    for _,k in ipairs(list) do
        if string.find(n,k,1,true) then return true end
    end
    return false
end

local function matchesExact(name, list)
    if not name then return false end
    for _,k in ipairs(list) do
        if name==k then return true end
    end
    return false
end

-- ═══ ESP ХРАНИЛИЩЕ ═══
local ESPObjects={}

local function createESP(obj, color, text)
    if not obj then return end
    if ESPObjects[obj] then return end
    if not obj:IsDescendantOf(workspace) then return end
    if not obj:IsA("Model") and not obj:IsA("BasePart") then return end
    
    -- Highlight
    local hl=Instance.new("Highlight")
    hl.Name="BurmaldaHL"
    hl.Adornee=obj
    hl.FillColor=color
    hl.OutlineColor=color
    hl.FillTransparency=C.FillTransparency or 0.55
    hl.OutlineTransparency=0.3
    hl.DepthMode=C.XRay and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
    hl.Parent=obj
    
    -- Billboard
    local bb=Instance.new("BillboardGui")
    bb.Name="BurmaldaBB"
    bb.Size=UDim2.new(0,140,0,24)
    bb.StudsOffset=Vector3.new(0,4,0)
    bb.AlwaysOnTop=true
    bb.Adornee=obj
    bb.Parent=obj
    
    local lbl=Instance.new("TextLabel",bb)
    lbl.Name="BurmaldaLbl"
    lbl.Size=UDim2.new(1,0,1,0)
    lbl.BackgroundTransparency=1
    lbl.Text=text
    lbl.TextColor3=color
    lbl.TextStrokeTransparency=0
    lbl.TextStrokeColor3=Color3.fromRGB(0,0,0)
    lbl.Font=Enum.Font.GothamBold
    lbl.TextSize=C.TextSize or 12
    
    ESPObjects[obj]=hl
end

local function removeESP(obj)
    if not obj then return end
    local hl=obj:FindFirstChild("BurmaldaHL")
    if hl then hl:Destroy() end
    local bb=obj:FindFirstChild("BurmaldaBB")
    if bb then bb:Destroy() end
    ESPObjects[obj]=nil
end

_G.clearESP=function()
    for obj,_ in pairs(ESPObjects) do
        removeESP(obj)
    end
    ESPObjects={}
end

-- ═══ UPDATE ESP ═══
local function updESP()
    local ch=LP.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart") then return end
    local pos=ch.HumanoidRootPart.Position
    
    -- Чистим мёртвые
    for obj,_ in pairs(ESPObjects) do
        if not obj or not obj.Parent or not obj:IsDescendantOf(workspace) then
            removeESP(obj)
        end
    end
    
    for _,o in ipairs(workspace:GetDescendants()) do
        if ESPObjects[o] then continue end
        if not o:IsA("Model") and not o:IsA("BasePart") then continue end
        if isBlacklisted(o.Name) then continue end
        
        local p=getPart(o)
        if not p or not p.Position then continue end
        local d=(p.Position-pos).Magnitude
        if d>C.MaxDistance then continue end
        
        -- 1. МОНСТРЫ
        local matchedEntity=false
        for _,entry in ipairs(ENT) do
            if matchesExact(o.Name, entry.names) then
                if C.ESP_All or C[entry.flag] then
                    local txt=entry.alias
                    if C.ShowDistance then txt=txt.." ["..math.floor(d).."m]" end
                    createESP(o, getColor("entity"), txt)
                    matchedEntity=true
                    break
                end
            end
        end
        if matchedEntity then continue end
        
        -- 2. ИГРОКИ
        if C.ESP_Players or C.ESP_All then
            local pl=P:GetPlayerFromCharacter(o)
            if pl and pl~=LP then
                local txt=pl.Name
                if C.ShowDistance then txt=txt.." ["..math.floor(d).."m]" end
                createESP(o, getColor("player"), txt)
                continue
            end
        end
        
        -- 3. ДВЕРИ
        if (C.ESP_Doors or C.ESP_All) and matchesExact(o.Name, DOOR_NAMES) then
            local open=o:GetAttribute("Open")
            if open==false or open==nil then
                local num=tonumber(o.Parent and o.Parent.Name)
                local txt="Door"
                if num then txt="Door #"..(num+1) end
                if C.ShowDistance then txt=txt.." ["..math.floor(d).."m]" end
                createESP(o, getColor("door"), txt)
                continue
            end
        end
        
        -- 4. ШКАФЫ
        if (C.ESP_Closets or C.ESP_All) and matchesAny(o.Name, CLOSET_NAMES) then
            createESP(o, getColor("closet"), "Hide")
            continue
        end
        
        -- 5. ДЕНЬГИ
        if (C.ESP_Money or C.ESP_All) and matchesAny(o.Name, MONEY_NAMES) then
            createESP(o, getColor("money"), "Money")
            continue
        end
        
        -- 6. КЛЮЧИ
        if (C.ESP_Keys or C.ESP_All) and matchesAny(o.Name, KEY_NAMES) then
            createESP(o, getColor("key"), "Key")
            continue
        end
        
        -- 7. ПРЕДМЕТЫ (без книг!)
        if (C.ESP_Items or C.ESP_All) and matchesAny(o.Name, ITEM_NAMES) then
            createESP(o, getColor("item"), o.Name)
            continue
        end
        
        -- 8. СУНДУКИ
        if (C.ESP_Chests or C.ESP_All) and matchesAny(o.Name, CHEST_NAMES) then
            createESP(o, getColor("chest"), "Chest")
            continue
        end
        
        -- 9. ЯКОРЯ / ЗАДАЧИ
        if (C.ESP_Objectives or C.ESP_All) and matchesAny(o.Name, OBJECTIVE_NAMES) then
            createESP(o, getColor("objective"), "Objective")
            continue
        end
        
        -- 10. BREAKER
        if (C.ESP_Breaker or C.ESP_All) and matchesAny(o.Name, BREAKER_NAMES) then
            createESP(o, getColor("breaker"), "Breaker")
            continue
        end
    end
end

task.spawn(function()
    while task.wait(C.ESPUpdateRate or 1.0) do
        pcall(updESP)
    end
end)

-- ═══ NOTIFY ENTITIES (уведомления о спавне монстров) ═══
local notifiedEnts={}
task.spawn(function()
    while task.wait(1) do
        if C.NotifyEntities or C.NotifyEntitiesSwitch then
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Model") then
                    local matched=false
                    for _,entry in ipairs(ENT) do
                        if matchesExact(o.Name, entry.names) then
                            matched=true
                            if not notifiedEnts[o] then
                                notifiedEnts[o]=true
                                N("⚠️ "..entry.alias.." появился!","Осторожно!","warn")
                            end
                            break
                        end
                    end
                end
            end
            -- Очистка старых
            for obj,_ in pairs(notifiedEnts) do
                if not obj or not obj.Parent then
                    notifiedEnts[obj]=nil
                end
            end
        end
    end
end)

print("[Burmalda v15.1] Part 6/14 — ESP loaded")
