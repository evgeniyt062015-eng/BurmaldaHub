-- BURMALDA v14 | Part 5/8 — ESP
-- 22 монстра + объекты (двери, шкафы, предметы)

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local P=_G.P

-- ═══ СПИСКИ ═══
local ENT={
    {key="RushMoving",   alias="Rush",      find="rushmoving"},
    {key="AmbushMoving", alias="Ambush",    find="ambushmoving"},
    {key="Seek",         alias="Seek",      find="seek"},
    {key="Figure",       alias="Figure",    find="figure"},
    {key="Screech",      alias="Screech",   find="screech"},
    {key="Hide",         alias="Hide",      find="hide"},
    {key="Eyes",         alias="Eyes",      find="eyes"},
    {key="Halt",         alias="Halt",      find="halt"},
    {key="Grumble",      alias="Grumble",   find="grumble"},
    {key="Giggle",       alias="Giggle",    find="giggle"},
    {key="Glitch",       alias="Glitch",    find="glitch"},
    {key="Dupe",         alias="Dupe",      find="dupe"},
    {key="Jack",         alias="Jack",      find="jack"},
    {key="Snare",        alias="Snare",     find="snare"},
    {key="Timothy",      alias="Timothy",   find="timothy"},
    {key="Shadow",       alias="Shadow",    find="shadow"},
    {key="Blitz",        alias="Blitz",     find="blitz"},
    {key="Lookman",      alias="Lookman",   find="lookman"},
    {key="Noise",        alias="Noise",     find="noise"},
    {key="Creak",        alias="Creak",     find="creak"},
    {key="Scribbles",    alias="Scribbles", find="scribbles"},
    {key="Drones",       alias="Drones",    find="drones"},
    {key="Jeff",         alias="Jeff",      find="jeffthekiller"},
    {key="Bash",         alias="Bash",      find="bash"},
    {key="Monument",     alias="Monument",  find="monument"},
    {key="Sally",        alias="Sally",     find="sally"},
}

local ITEM_NAMES={
    "crucifix","lockpick","bandage","flashlight","lighter","battery","vitamin",
    "candle","skeleton","lantern","shears","scanner","compass"
}

-- ═══ HELPERS ═══
local function getPart(o)
    if o:IsA("BasePart") then return o end
    if o.PrimaryPart then return o.PrimaryPart end
    return o:FindFirstChildWhichIsA("BasePart",true)
end

local function isEntity(name)
    local n=name:lower()
    for _,e in ipairs(ENT) do
        if n:find(e.find,1,true) then return e end
    end
    return nil
end

local function isItem(name)
    local n=name:lower()
    for _,k in ipairs(ITEM_NAMES) do
        if n:find(k,1,true) then return true end
    end
    return false
end

-- ═══ ESP TABLE ═══
local ESP={}

local function makeESP(o,col,txt,yOffset)
    if ESP[o] and ESP[o].Parent then return end
    if not o:IsA("Model") and not o:IsA("BasePart") then return end
    
    local bb=Instance.new("BillboardGui")
    bb.Size=UDim2.new(0,140,0,28)
    bb.StudsOffset=Vector3.new(0,yOffset or 4,0)
    bb.AlwaysOnTop=true
    bb.Adornee=o
    bb.Parent=o
    
    local h=Instance.new("Highlight",o)
    h.FillColor=col
    h.FillTransparency=C.FillTransparency
    h.OutlineColor=col
    h.OutlineTransparency=0.3
    h.DepthMode=C.XRay and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
    h.Adornee=o
    
    local lb=Instance.new("TextLabel",bb)
    lb.Size=UDim2.new(1,0,1,0)
    lb.BackgroundTransparency=1
    lb.Text=txt
    lb.TextColor3=col
    lb.TextStrokeTransparency=0
    lb.TextStrokeColor3=Color3.fromRGB(0,0,0)
    lb.Font=Enum.Font.GothamBold
    lb.TextSize=C.TextSize
    
    ESP[o]=bb
end

_G.clearESP=function()
    for _,v in pairs(ESP) do
        pcall(function() v:Destroy() end)
    end
    ESP={}
end

local function colorFor(base)
    if C.RainbowMode then return Color3.fromHSV(tick()%5/5,1,1) end
    return base
end

local function getDoorNum(o)
    local n=tonumber(o.Parent and o.Parent.Name)
        or tonumber(o.Parent and o.Parent.Parent and o.Parent.Parent.Name)
    if n then return tostring(n+1) end
    return "?"
end

-- ═══ UPDATE ESP ═══
local function updESP()
    local ch=LP.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart") then return end
    local pos=ch.HumanoidRootPart.Position
    
    for _,o in ipairs(workspace:GetDescendants()) do
        if ESP[o] then continue end
        local p=getPart(o)
        if not p then continue end
        local d=(p.Position-pos).Magnitude
        if d>C.MaxDistance then continue end
        
        local n=o.Name:lower()
        
        -- Монстры
        local ent=isEntity(o.Name)
        if ent then
            local key="ESP_"..ent.key
            if C.ESP_All or C[key] or (C.SmartESP and d<C.SmartRange) then
                local txt=ent.alias
                if C.ShowDistance then txt=txt.." ["..math.floor(d).."m]" end
                makeESP(o,colorFor(C.ESPColor),txt,5)
                continue
            end
        end
        
        -- Двери
        if C.ESP_Doors and n=="door" then
            local open=o:GetAttribute("Open")
            if open==false or open==nil then
                makeESP(o,colorFor(C.DoorColor),"Door #"..getDoorNum(o),3)
                continue
            end
        end
        
        -- Шкафы
        if C.ESP_Closets and (n:find("closet") or n:find("hiding") or n:find("wardrobe") or n:find("locker")) then
            makeESP(o,colorFor(C.ClosetColor),"Hide",3)
            continue
        end
        
        -- Монеты
        if C.ESP_Money and (n:find("coin") or n:find("gold")) then
            makeESP(o,colorFor(Color3.fromRGB(255,215,0)),"Money",3)
            continue
        end
        
        -- Ключи
        if C.ESP_Keys and n:find("key") then
            makeESP(o,colorFor(Color3.fromRGB(255,255,100)),"Key",3)
            continue
        end
        
        -- Предметы
        if C.ESP_Items and isItem(o.Name) then
            makeESP(o,colorFor(Color3.fromRGB(255,220,50)),o.Name,3)
            continue
        end
        
        -- Лестницы
        if C.ESP_Ladders and (n:find("ladder") or n:find("stair")) then
            makeESP(o,colorFor(Color3.fromRGB(0,200,255)),"Ladder",3)
            continue
        end
        
        -- Breaker
        if C.ESP_Breaker and (n:find("breaker") or n:find("fuse")) then
            makeESP(o,colorFor(Color3.fromRGB(255,255,100)),"Breaker",3)
            continue
        end
        
        -- Objectives
        if C.ESP_Objectives and (n:find("anchor") or n:find("objective") or n:find("valve")) then
            makeESP(o,colorFor(Color3.fromRGB(0,255,0)),"Objective",3)
            continue
        end
        
        -- Игроки
        if C.ESP_Players and o:IsA("Model") then
            local pl=P:GetPlayerFromCharacter(o)
            if pl and pl~=LP then
                makeESP(o,colorFor(Color3.fromRGB(255,255,0)),pl.Name,5)
                continue
            end
        end
    end
end

-- ═══ ESP LOOP ═══
task.spawn(function()
    while task.wait(C.ESPUpdateRate) do
        pcall(updESP)
    end
end)

print("[Burmalda v14] Part 5/8 — ESP loaded")
