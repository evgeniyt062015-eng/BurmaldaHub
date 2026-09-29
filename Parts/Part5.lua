-- BURMALDA v13 | Part 5/8 — ESP
-- 22 монстра + 12 объектов, Smart ESP, Room ESP

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local P=_G.P

-- ═══ СПИСОК МОНСТРОВ ═══
local ENT={"RushMoving","AmbushMoving","Seek","Figure","Screech","Hide","Eyes","Glitch","Dupe","Jack","Snare","Timothy","Shadow","Halt","Grumble","Giggle","Gloombat","Monument","Sally","JeffTheKiller","Bash","Blitz","A60","A120","Noise","Creak","Scribbles","Lookman","DronesStampede","Groundskeeper","TellerRig","NoiseModel","FrozenAmbush","CustomEntity","StemsEntity"}

local EN={
    RushMoving="Rush", AmbushMoving="Ambush", Seek="Seek", Figure="Figure",
    Screech="Screech", Hide="Hide", Eyes="Eyes", Glitch="Glitch", Dupe="Dupe",
    Jack="Jack", Snare="Snare", Timothy="Timothy", Shadow="Shadow", Halt="Halt",
    Grumble="Grumble", Giggle="Giggle", Gloombat="Gloombat", Monument="Monument",
    Sally="Sally", JeffTheKiller="Jeff", Bash="Bash", Blitz="Blitz", A60="A-60",
    A120="A-120", Noise="Noise", Creak="Creak", Scribbles="Scribbles",
    Lookman="Lookman", DronesStampede="Drones", Groundskeeper="Groundskeeper",
    TellerRig="Teller", NoiseModel="Noise", FrozenAmbush="Frozen Ambush",
    CustomEntity="Custom", StemsEntity="Balls"
}

-- ═══ IS ENTITY ═══
local function isE(o)
    if not o:IsA("Model") and not o:IsA("BasePart") then return false,nil,nil end
    local n=o.Name:lower()
    for _,e in ipairs(ENT) do
        if n==e:lower() or n:find(e:lower(),1,true) then
            return true,e,EN[e] or e
        end
    end
    return false,nil,nil
end

_G.isE=isE

-- ═══ ESP TABLE ═══
local ESP={}

local function clearESP()
    for _,v in pairs(ESP) do
        pcall(function() v:Destroy() end)
    end
    ESP={}
end

_G.clearESP=clearESP

-- ═══ MAKE ESP ═══
local function makeESP(o,col,txt,yo)
    if ESP[o] and ESP[o].Parent then return end
    local bb=Instance.new("BillboardGui")
    bb.Size=UDim2.new(0,140,0,28)
    bb.StudsOffset=Vector3.new(0,yo or 4,0)
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

_G.makeESP=makeESP

-- ═══ HELPERS ═══
local function getP(o)
    if o:IsA("BasePart") then return o.Position end
    if o.PrimaryPart then return o.PrimaryPart.Position end
    local p=o:FindFirstChildWhichIsA("BasePart",true)
    return p and p.Position
end

local function myP()
    local ch=LP.Character
    if ch and ch:FindFirstChild("HumanoidRootPart") then
        return ch.HumanoidRootPart.Position
    end
end

local function cO(b)
    if C.RainbowMode then return Color3.fromHSV(tick()%5/5,1,1) end
    return b
end

local function getDoorNum(o)
    local n=tonumber(o.Parent and o.Parent.Name)
        or tonumber(o.Parent and o.Parent.Parent and o.Parent.Parent.Name)
    if n then return tostring(n+1) end
    return "?"
end

-- ═══ UPDATE ESP ═══
local function updESP()
    local pos=myP()
    if not pos then return end
    for _,o in ipairs(workspace:GetDescendants()) do
        if ESP[o] then continue end
        local op=getP(o)
        if not op or (op-pos).Magnitude>C.MaxDistance then continue end
        local n=o.Name:lower()
        local ok,key,ne=isE(o)
        -- Монстры
        if ok then
            local cK="ESP_"..key
            if C.ESP_All or C[cK] or (C.SmartESP and (op-pos).Magnitude<C.SmartRange) then
                local t=ne
                if C.ShowDistance then
                    t=t.." ["..math.floor((op-pos).Magnitude).."m]"
end
                makeESP(o,cO(C.ESPColor),t,5)
                continue
            end
        end
        -- Объекты
        if C.ESP_Doors and n:find("door") and not n:find("handler") and not n:find("fake") then
            makeESP(o,cO(C.DoorColor),"Door #"..getDoorNum(o),3)
            continue
        end
        if C.ESP_Closets and (n:find("closet") or n:find("hiding") or n:find("wardrobe") or n:find("locker")) then
            makeESP(o,cO(C.ClosetColor),"Hide",3)
            continue
        end
        if C.ESP_Money and (n:find("coin") or n:find("gold")) then
            makeESP(o,cO(Color3.fromRGB(255,215,0)),"Money",3)
            continue
        end
        if C.ESP_Keys and n:find("key") then
            makeESP(o,cO(Color3.fromRGB(255,255,100)),"Key",3)
            continue
        end
        if C.ESP_Items and (n:find("bandage") or n:find("flashlight") or n:find("lighter")
        or n:find("lockpick") or n:find("crucifix") or n:find("battery")
        or n:find("vitamin") or n:find("candle") or n:find("skeleton")
        or n:find("lantern") or n:find("shears") or n:find("scanner")) then
            makeESP(o,cO(Color3.fromRGB(255,220,50)),o.Name,3)
            continue
        end
        if C.ESP_Ladders and (n:find("ladder") or n:find("stair")) then
            makeESP(o,cO(Color3.fromRGB(0,200,255)),"Ladder",3)
            continue
        end
        if C.ESP_Minecart and (n:find("minecart") or n:find("cart")) then
            makeESP(o,cO(Color3.fromRGB(255,150,0)),"Cart",3)
            continue
        end
        if C.ESP_Lava and n:find("lava") then
            makeESP(o,cO(Color3.fromRGB(255,80,0)),"LAVA",3)
            continue
        end
        if C.ESP_Library and (n:find("library") or n:find("bookshelf")) then
            makeESP(o,cO(Color3.fromRGB(200,150,255)),"Library",3)
            continue
        end
        if C.ESP_Breaker and (n:find("breaker") or n:find("fuse")) then
            makeESP(o,cO(Color3.fromRGB(255,255,100)),"Breaker",3)
            continue
        end
        if C.ESP_Objectives and (n:find("anchor") or n:find("objective") or n:find("valve")) then
            makeESP(o,cO(Color3.fromRGB(0,255,0)),"Objective",3)
            continue
        end
        if C.ESP_Players and o:IsA("Model") then
            local pl=P:GetPlayerFromCharacter(o)
            if pl and pl~=LP then
                makeESP(o,cO(Color3.fromRGB(255,255,0)),pl.Name,5)
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

print("[Burmalda v13] Part 5/8 — ESP loaded")
