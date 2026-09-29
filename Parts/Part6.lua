-- BURMALDA v15 | Part 6/14 — ESP
-- 22 монстра + объекты через Highlight (правильно), Tracker, Smart ESP

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local P=_G.P

-- ═══ СПИСОК МОНСТРОВ (точные имена) ═══
local ENT={
    {flag="ESP_Rush",     names={"RushMoving","RushNew","Rush"},              alias="Rush"},
    {flag="ESP_Ambush",   names={"AmbushMoving","AmbushNew","Ambush"},        alias="Ambush"},
    {flag="ESP_Seek",     names={"Seek","SeekMoving"},                        alias="Seek"},
    {flag="ESP_Figure",   names={"FigureRig","Figure","FigureRagdoll"},      alias="Figure"},
    {flag="ESP_Screech",  names={"Screech"},                                  alias="Screech"},
    {flag="ESP_Eyes",     names={"Eyes","EyesEntity"},                        alias="Eyes"},
    {flag="ESP_Halt",     names={"Halt","HaltMoving"},                        alias="Halt"},
    {flag="ESP_Grumble",  names={"Grumble","GrumbleRig"},                     alias="Grumble"},
    {flag="ESP_Giggle",   names={"GiggleCeiling","Giggle"},                  alias="Giggle"},
    {flag="ESP_Blitz",    names={"BackdoorRush","Blitz"},                     alias="Blitz"},
    {flag="ESP_Lookman",  names={"Lookman","BackdoorLookman"},                alias="Lookman"},
    {flag="ESP_Doors",    names={"Door"},                                     alias="Door"},
    {flag="ESP_Closets",  names={"Closet","HidingSpot","Wardrobe","Locker"},  alias="Hide"},
    {flag="ESP_Money",    names={"Coin","GoldPile","Gold"},                   alias="Money"},
    {flag="ESP_Keys",     names={"Key","DoorKey","KeyIron"},                  alias="Key"},
    {flag="ESP_Items",    names={"Flashlight","Lockpick","Bandage","Vitamins","Crucifix","Lighter","Battery","Candle","SkeletonKey"}, alias="Item"},
    {flag="ESP_Chests",   names={"Chest"},                                    alias="Chest"},
    {flag="ESP_Objectives",names={"MinesAnchor","Valve","Anchor"},            alias="Objective"},
}

local function getPart(o)
    if o:IsA("BasePart") then return o end
    if o.PrimaryPart then return o.PrimaryPart end
    return o:FindFirstChildWhichIsA("BasePart",true)
end

-- ═══ ESP TABLE ═══
local ESPObjects={}

local function createESP(obj,color,text)
    if ESPObjects[obj] then return end
    if not obj:IsDescendantOf(workspace) then return end
    if not obj:IsA("Model") and not obj:IsA("BasePart") then return end
    
    -- Highlight
    local hl=Instance.new("Highlight")
    hl.Name="BurmaldaHL"
    hl.Adornee=obj
    hl.FillColor=color
    hl.OutlineColor=color
    hl.FillTransparency=C.FillTransparency
    hl.OutlineTransparency=0.3
    hl.DepthMode=C.XRay and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
    hl.Parent=obj
    
    -- Billboard (текст)
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
    lbl.TextSize=C.TextSize
    
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
    
    -- Чистим мёртвые
    for obj,_ in pairs(ESPObjects) do
        if not obj or not obj.Parent or not obj:IsDescendantOf(workspace) then
            removeESP(obj)
        end
    end
    
    for _,o in ipairs(workspace:GetDescendants()) do
        if ESPObjects[o] then continue end
        if not o:IsA("Model") and not o:IsA("BasePart") then continue end
        
        local p=getPart(o)
        if not p then continue end
        local d=(p.Position-pos).Magnitude
        if d>C.MaxDistance then continue end
        
        -- Монстры
        for _,entry in ipairs(ENT) do
            if C[entry.flag] then
                local matched=false
                for _,name in ipairs(entry.names) do
                    if o.Name==name then matched=true; break end
                end
                if matched then
                    local txt=entry.alias
                    if C.ShowDistance then txt=txt.." ["..math.floor(d).."m]" end
                    createESP(o,colorFor(C.ESPColor),txt)
                    break
                end
            end
        end
        
        -- Двери (особая логика)
        if C.ESP_Doors and o.Name=="Door" then
            local open=o:GetAttribute("Open")
            if open==false or open==nil then
                createESP(o,colorFor(C.DoorColor),"Door #"..getDoorNum(o))
            end
        end
        
        -- Игроки
        if C.ESP_Players and o:IsA("Model") then
            local pl=P:GetPlayerFromCharacter(o)
            if pl and pl~=LP then
                local txt=pl.Name
                if C.ShowDistance then txt=txt.." ["..math.floor(d).."m]" end
                createESP(o,colorFor(C.PlayerColor),txt)
            end
        end
    end
end

task.spawn(function()
    while task.wait(C.ESPUpdateRate or 1.0) do
        pcall(updESP)
    end
end)

-- ═══ NOTIFY ENTITIES (уведомление при спавне монстра) ═══
local lastNotified={}
task.spawn(function()
    while task.wait(1) do
        if C.NotifyEntities then
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Model") then
                    local n=o.Name:lower()
                    local isEnt=n:find("rush") or n:find("ambush") or n:find("seek")
                        or n:find("figure") or n:find("screech") or n:find("halt")
                    if isEnt and not lastNotified[o] then
                        lastNotified[o]=true
                        N("Entity spawned: "..o.Name)
                        -- Очистка если удалён
                        o.Destroying:Connect(function()
                            lastNotified[o]=nil
                        end)
                    end
                end
            end
        end
    end
end)

print("[Burmalda v15] Part 6/14 — ESP loaded")
