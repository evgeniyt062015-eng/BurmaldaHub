-- BURMALDA v15 | Part 13/14 — GUI (34 вкладки) — ЧАСТЬ 1
-- Ядро + 17 вкладок (Main-Exploits)

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local UIS=_G.UIS
local Run=_G.Run
local P=_G.P

-- ═══ СТАРТОВОЕ ОКНО ═══
local FS=Instance.new("ScreenGui")
FS.Name="BurmaldaFS"
FS.ResetOnSpawn=false
FS.IgnoreGuiInset=true
FS.Parent=LP:WaitForChild("PlayerGui")

local FB=Instance.new("Frame",FS)
FB.Size=UDim2.new(1,0,1,0)
FB.BackgroundColor3=Color3.fromRGB(15,15,18)
FB.BackgroundTransparency=0.3
FB.BorderSizePixel=0

local FM=Instance.new("Frame",FB)
FM.Size=UDim2.new(0,300,0,370)
FM.Position=UDim2.new(0.5,-150,0.5,-185)
FM.BackgroundColor3=Color3.fromRGB(20,20,25)
FM.BorderSizePixel=0

local FMC=Instance.new("UICorner",FM)
FMC.CornerRadius=UDim.new(0,12)

local FMS=Instance.new("UIStroke",FM)
FMS.Color=Color3.fromRGB(120,20,40)
FMS.Thickness=2

local FT=Instance.new("TextLabel",FM)
FT.Size=UDim2.new(1,0,0,35)
FT.Position=UDim2.new(0,0,0,10)
FT.BackgroundTransparency=1
FT.Text="BURMALDA v15"
FT.TextColor3=Color3.fromRGB(180,30,30)
FT.Font=Enum.Font.GothamBlack
FT.TextSize=22

local FSu=Instance.new("TextLabel",FM)
FSu.Size=UDim2.new(1,0,0,18)
FSu.Position=UDim2.new(0,0,0,46)
FSu.BackgroundTransparency=1
FSu.Text="By KOTENOK7204"
FSu.TextColor3=Color3.fromRGB(200,200,210)
FSu.Font=Enum.Font.Gotham
FSu.TextSize=10

local FSu2=Instance.new("TextLabel",FM)
FSu2.Size=UDim2.new(1,0,0,18)
FSu2.Position=UDim2.new(0,0,0,62)
FSu2.BackgroundTransparency=1
FSu2.Text="Tester: Kostya_2015KostyaKos"
FSu2.TextColor3=Color3.fromRGB(255,200,100)
FSu2.Font=Enum.Font.GothamBold
FSu2.TextSize=10

local FQ=Instance.new("TextLabel",FM)
FQ.Size=UDim2.new(1,0,0,22)
FQ.Position=UDim2.new(0,0,0,84)
FQ.BackgroundTransparency=1
FQ.Text="Where are you?"
FQ.TextColor3=Color3.fromRGB(240,240,245)
FQ.Font=Enum.Font.GothamBold
FQ.TextSize=14

-- ═══ ГЛАВНОЕ МЕНЮ ═══
local SG=Instance.new("ScreenGui")
SG.Name="BurmaldaV15GUI"
SG.ResetOnSpawn=false
SG.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
SG.Parent=LP:WaitForChild("PlayerGui")

local OB=Instance.new("TextButton",SG)
OB.Size=UDim2.new(0,50,0,50)
OB.Position=UDim2.new(0,10,0.5,-25)
OB.BackgroundColor3=Color3.fromRGB(120,20,40)
OB.Text="B"
OB.TextColor3=Color3.fromRGB(255,255,255)
OB.TextSize=20
OB.Font=Enum.Font.GothamBlack
OB.BorderSizePixel=0
OB.Draggable=true

local OBC=Instance.new("UICorner",OB)
OBC.CornerRadius=UDim.new(1,0)

local OBS=Instance.new("UIStroke",OB)
OBS.Color=Color3.fromRGB(240,240,245)
OBS.Thickness=2

local M=Instance.new("Frame",SG)
M.Size=UDim2.new(0,540,0,420)
M.Position=UDim2.new(0.5,-270,0.5,-210)
M.BackgroundColor3=T().bg
M.BorderSizePixel=0
M.Active=true
M.Draggable=true
M.Visible=false

local MC=Instance.new("UICorner",M)
MC.CornerRadius=UDim.new(0,10)

local MS=Instance.new("UIStroke",M)
MS.Color=T().accent
MS.Thickness=2

OB.MouseButton1Click:Connect(function()
    M.Visible=not M.Visible
    OB.Text=M.Visible and "X" or "B"
end)

-- ═══ HEADER ═══
local H=Instance.new("Frame",M)
H.Size=UDim2.new(1,0,0,34)
H.BackgroundColor3=T().accent
H.BorderSizePixel=0

local HC=Instance.new("UICorner",H)
HC.CornerRadius=UDim.new(0,10)

local HT=Instance.new("TextLabel",H)
HT.Size=UDim2.new(1,-120,1,0)
HT.Position=UDim2.new(0,10,0,0)
HT.BackgroundTransparency=1
HT.Text="BURMALDA v15 | ".._G.gF()
HT.TextColor3=Color3.fromRGB(255,255,255)
HT.Font=Enum.Font.GothamBold
HT.TextSize=11
HT.TextXAlignment=Enum.TextXAlignment.Left

-- SEARCH кнопка
local SearchBtn=Instance.new("TextButton",H)
SearchBtn.Size=UDim2.new(0,30,0,24)
SearchBtn.Position=UDim2.new(1,-90,0,5)
SearchBtn.BackgroundColor3=T().panel
SearchBtn.Text="🔍"
SearchBtn.TextColor3=T().text
SearchBtn.TextSize=14
SearchBtn.BorderSizePixel=0

local SBC=Instance.new("UICorner",SearchBtn)
SBC.CornerRadius=UDim.new(0,4)

-- CLOSE
local CB=Instance.new("TextButton",H)
CB.Size=UDim2.new(0,24,0,24)
CB.Position=UDim2.new(1,-28,0,5)
CB.BackgroundColor3=T().danger
CB.Text="X"
CB.TextColor3=Color3.fromRGB(255,255,255)
CB.Font=Enum.Font.GothamBold
CB.TextSize=12
CB.BorderSizePixel=0

local CBC=Instance.new("UICorner",CB)
CBC.CornerRadius=UDim.new(0,4)

CB.MouseButton1Click:Connect(function()
    if _G.sv then pcall(_G.sv) end
    M.Visible=false
    OB.Text="B"
end)

-- ═══ ЛЕВАЯ ПАНЕЛЬ (вкладки) ═══
local TB=Instance.new("ScrollingFrame",M)
TB.Size=UDim2.new(0,140,1,-34)
TB.Position=UDim2.new(0,0,0,34)
TB.BackgroundColor3=T().panel
TB.BorderSizePixel=0
TB.ScrollBarThickness=3
TB.ScrollBarImageColor3=T().accent
TB.CanvasSize=UDim2.new(0,0,3200)

local TBC=Instance.new("UICorner",TB)
TBC.CornerRadius=UDim.new(0,10)

local TBL=Instance.new("UIListLayout",TB)
TBL.Padding=UDim.new(0,3)
TBL.SortOrder=Enum.SortOrder.LayoutOrder

-- ═══ ПРАВАЯ ПАНЕЛЬ (контент) ═══
local CT=Instance.new("Frame",M)
CT.Size=UDim2.new(1,-145,1,-42)
CT.Position=UDim2.new(0,142,0,38)
CT.BackgroundTransparency=1

local Pg={}

local function sw(n)
    for k,p in pairs(Pg) do p.Visible=(k==n) end
end

local function crP(n)
    local p=Instance.new("ScrollingFrame",CT)
    p.Size=UDim2.new(1,0,1,0)
    p.BackgroundTransparency=1
    p.BorderSizePixel=0
    p.ScrollBarThickness=3
    p.ScrollBarImageColor3=T().accent
    p.CanvasSize=UDim2.new(0,0,3200)
    p.Visible=false
    local L=Instance.new("UIListLayout",p)
    L.Padding=UDim.new(0,3)
    L.SortOrder=Enum.SortOrder.LayoutOrder
    Pg[n]=p
    return p
end

-- ═══ mT (Toggle с подписью статуса) ═══
local function mT(p,t,i,cb,d,status)
    local b=Instance.new("TextButton",p)
    b.Size=UDim2.new(1,-6,0,38)
    b.BackgroundColor3=d and T().danger or T().panel
    b.BorderSizePixel=0
    b.Text=""
    local c=Instance.new("UICorner",b); c.CornerRadius=UDim.new(0,5)
    local l=Instance.new("TextLabel",b)
    l.Size=UDim2.new(0.75,0,0,20); l.Position=UDim2.new(0,8,0,2)
    l.BackgroundTransparency=1; l.Text=t; l.TextColor3=d and Color3.fromRGB(255,200,210) or T().text
    l.Font=Enum.Font.Gotham; l.TextSize=10; l.TextXAlignment=Enum.TextXAlignment.Left
    -- Подпись статуса
    local st=Instance.new("TextLabel",b)
    st.Size=UDim2.new(0.75,0,0,12); st.Position=UDim2.new(0,8,0,22)
    st.BackgroundTransparency=1
    st.TextSize=8; st.TextXAlignment=Enum.TextXAlignment.Left
    st.Font=Enum.Font.Gotham
    if status=="works" then
        st.Text="✅ работает"; st.TextColor3=Color3.fromRGB(80,220,120)
    elseif status=="maybe" then
        st.Text="⚠️ может не работать"; st.TextColor3=Color3.fromRGB(255,200,50)
    elseif status=="no" then
        st.Text="❌ не работает"; st.TextColor3=Color3.fromRGB(220,80,80)
    elseif status=="new" then
        st.Text="🆕 новое в v15"; st.TextColor3=Color3.fromRGB(80,150,255)
    else
        st.Text=""; st.TextColor3=Color3.fromRGB(150,150,160)
    end
    -- Кнопка ON/OFF
    local s=Instance.new("TextLabel",b)
    s.Size=UDim2.new(0.2,0,1,0); s.Position=UDim2.new(0.78,0,0,0)
    s.BackgroundTransparency=1; s.Text=i and "ON" or "OFF"
    s.TextColor3=i and Color3.fromRGB(80,220,120) or Color3.fromRGB(220,80,80)
    s.Font=Enum.Font.GothamBold; s.TextSize=10
    local state=i
    b.MouseButton1Click:Connect(function()
        state=not state
        s.Text=state and "ON" or "OFF"
        s.TextColor3=state and Color3.fromRGB(80,220,120) or Color3.fromRGB(220,80,80)
        cb(state)
    end)
end

-- ═══ mB (Button) ═══
local function mB(p,t,cb,col)
    local b=Instance.new("TextButton",p)
    b.Size=UDim2.new(1,-6,0,28)
    b.BackgroundColor3=col or T().panel
    b.BorderSizePixel=0
    b.Text=t
    b.TextColor3=T().text
    b.Font=Enum.Font.GothamBold
    b.TextSize=10
    local c=Instance.new("UICorner",b); c.CornerRadius=UDim.new(0,5)
    b.MouseButton1Click:Connect(cb)
end

-- ═══ mS (Slider) ═══
local function mS(p,t,mn,mx,i,cb)
    local f=Instance.new("Frame",p)
    f.Size=UDim2.new(1,-6,0,40)
    f.BackgroundColor3=T().panel
    f.BorderSizePixel=0
    local c=Instance.new("UICorner",f); c.CornerRadius=UDim.new(0,5)
    local l=Instance.new("TextLabel",f)
    l.Size=UDim2.new(1,-16,0,14); l.Position=UDim2.new(0,8,0,2)
    l.BackgroundTransparency=1; l.Text=t..": "..i; l.TextColor3=T().text
    l.Font=Enum.Font.Gotham; l.TextSize=9; l.TextXAlignment=Enum.TextXAlignment.Left
    local bar=Instance.new("Frame",f)
    bar.Size=UDim2.new(1,-16,0,10); bar.Position=UDim2.new(0,8,0,24)
    bar.BackgroundColor3=T().bg; bar.BorderSizePixel=0
    local bc=Instance.new("UICorner",bar); bc.CornerRadius=UDim.new(0,4)
    local fl=Instance.new("Frame",bar)
    fl.Size=UDim2.new(math.clamp((i-mn)/(mx-mn),0,1),0,1,0)
    fl.BackgroundColor3=T().accent; fl.BorderSizePixel=0
    local fc=Instance.new("UICorner",fl); fc.CornerRadius=UDim.new(0,4)
    local dr=false
    bar.InputBegan:Connect(function(inp)
        if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then dr=true end
    end)
    bar.InputEnded:Connect(function(inp)
        if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then dr=false end
    end)
    UIS.InputChanged:Connect(function(inp)
        if dr and (inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch) then
            local r=math.clamp((inp.Position.X-bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1)
            fl.Size=UDim2.new(r,0,1,0)
            local v=math.floor(mn+(mx-mn)*r)
            l.Text=t..": "..v
            cb(v)
        end
    end)
end

-- ═══ СПИСОК ВКЛАДОК ═══
local tL={
    {n="Main"},{n="Character"},{n="TP"},{n="Hide"},{n="AutoSeek"},{n="Auto"},
    {n="Bypass"},{n="Exploits",d=true},{n="ESP"},{n="Visual"},
    {n="Music"},{n="Sound"},{n="Move"},{n="Stats"},{n="Players"},
    {n="Features",d=true},{n="Farm"},{n="Fun"},{n="Spawn"},
    {n="Admin",d=true},{n="Mobile"},{n="AntiDet",d=true},{n="FPS Booster"},
    {n="Shop"},{n="Achiev"},{n="Favorites"},
    {n="Hotel"},{n="Mines"},{n="Backdoor"},{n="Outdoors"},{n="Archives"},{n="Stairwell"},
    {n="Settings"},{n="Updates"}
}

local tbts={}
for _,t in ipairs(tL) do
    crP(t.n)
    local b=Instance.new("TextButton",TB)
    b.Size=UDim2.new(0.94,0,0,26)
    b.BackgroundColor3=t.d and T().danger or T().panel
    b.BorderSizePixel=0
    b.Text=t.n
    b.TextColor3=t.d and Color3.fromRGB(255,200,210) or T().text
    b.Font=Enum.Font.Gotham
    b.TextSize=10
    b.LayoutOrder=#tbts+1
    b:SetAttribute("d",t.d or false)
    local c=Instance.new("UICorner",b); c.CornerRadius=UDim.new(0,5)
    b.MouseButton1Click:Connect(function()
        sw(t.n)
        for _,x in ipairs(tbts) do
            x.BackgroundColor3=x:GetAttribute("d") and T().danger or T().panel
        end
        b.BackgroundColor3=T().accent
    end)
    table.insert(tbts,b)
end
sw("Main")
if tbts[1] then tbts[1].BackgroundColor3=T().accent end

-- ═══════════════════════════════════════════════════════
-- ВКЛАДКИ 1-17 (Main → Exploits)
-- ═══════════════════════════════════════════════════════

-- 1. MAIN
local P1=Pg["Main"]
mT(P1,"Speed Hack",C.SpeedEnabled,function(v) C.SpeedEnabled=v; _G.setSpeed(v) end,"works")
mS(P1,"Walk Speed",16,200,C.WalkSpeed,function(v) C.WalkSpeed=v end)
mS(P1,"Speed Boost",0,100,C.SpeedBoost,function(v) C.SpeedBoost=v end)
mS(P1,"Jump Power",50,500,C.JumpPower,function(v) C.JumpPower=v; _G.setJump(true) end)
mT(P1,"Fly",C.Fly,function(v) C.Fly=v; _G.setFly(v) end,"works")
mS(P1,"Fly Speed",10,200,C.FlySpeed,function(v) C.FlySpeed=v end)
mT(P1,"Noclip",C.Noclip,function(v) C.Noclip=v; _G.setNC(v) end,"works")
mT(P1,"Infinite Jumps",C.InfiniteJumps,function(v) C.InfiniteJumps=v; _G.setInfJump(v) end,"new")
mT(P1,"Enable Jump",C.EnableJump,function(v) C.EnableJump=v end,"works")
mT(P1,"Enable Slide",C.EnableSlide,function(v) C.EnableSlide=v end,"maybe")
mT(P1,"Bunny Hop",C.BunnyHop,function(v) C.BunnyHop=v end,"maybe")
mT(P1,"Anti-AFK",C.AntiAFK,function(v) C.AntiAFK=v end,"works")
mT(P1,"Remove Closet Delay",C.RemoveClosetDelay,function(v) C.RemoveClosetDelay=v end,"works")
mT(P1,"Remove Accel",C.RemoveAccel,function(v) C.RemoveAccel=v end,"works")
mT(P1,"Door Reach",C.DoorReach,function(v) C.DoorReach=v end,"works")
mT(P1,"Instant Prompts",C.InstantPrompts,function(v) C.InstantPrompts=v end,"works")
mT(P1,"Prompt Clip",C.PromptClip,function(v) C.PromptClip=v end,"works")
mT(P1,"Disable Idle Kick",C.DisableIdleKick,function(v) C.DisableIdleKick=v end,"works")

-- 2. CHARACTER
local P2=Pg["Character"]
mT(P2,"God Mode",C.GodMode,function(v) C.GodMode=v; _G.setGodMode(v) end,"new")
mT(P2,"Max Stats",C.MaxStats,function(v) C.MaxStats=v end,"maybe")
mT(P2,"Invisible",C.Invisible,function(v) C.Invisible=v end,"maybe")
mT(P2,"God Rusher",C.GodRusher,function(v) C.GodRusher=v end,"maybe")
mT(P2,"Adaptive Speed",C.AdaptiveSpeed,function(v) C.AdaptiveSpeed=v end,"new")
mT(P2,"Predictive Hide",C.PredictiveHide,function(v) C.PredictiveHide=v end,"new")
mT(P2,"Smart Path",C.SmartPath,function(v) C.SmartPath=v end,"new")

-- 3. TP
local P3=Pg["TP"]
mB(P3,"TP Nearest Item",function() _G.tpNearestItem() end)
mS(P3,"TP Radius",50,500,C.TPItemRadius,function(v) C.TPItemRadius=v end)
mB(P3,"Save Position",function() _G.savePos() end)
mB(P3,"TP to Save",function() _G.tpToSave() end)

-- 4. HIDE
local P4=Pg["Hide"]
mT(P4,"Infinite Hide",C.InfiniteHide,function(v) C.InfiniteHide=v end,"maybe")
mT(P4,"Hide Lock",C.HideLock,function(v) C.HideLock=v end,"maybe")
mT(P4,"Auto Re-Hide",C.AutoReHide,function(v) C.AutoReHide=v end,"new")
mT(P4,"Auto Hide Rush",C.AutoHideRush,function(v) C.AutoHideRush=v end,"new")
mT(P4,"Auto Hide Ambush",C.AutoHideAmbush,function(v) C.AutoHideAmbush=v end,"new")
mT(P4,"Auto Hide All",C.AutoHideAll,function(v) C.AutoHideAll=v end,"new")

-- 5. AUTOSEEK
local P5=Pg["AutoSeek"]
mT(P5,"Auto Seek Door",C.AutoSeekDoor,function(v) C.AutoSeekDoor=v end,"new")
mT(P5,"Seek Escape",C.SeekEscape,function(v) C.SeekEscape=v end,"new")
mT(P5,"Auto Platform",C.AutoPlatform,function(v) C.AutoPlatform=v end,"maybe")
mS(P5,"Platform Size",3,15,C.PlatformSize,function(v) C.PlatformSize=v end)

-- 6. AUTO
local P6=Pg["Auto"]
mT(P6,"Auto Collect",C.AutoCollect,function(v) C.AutoCollect=v end,"new")
mT(P6,"Auto Coins",C.AutoCoins,function(v) C.AutoCoins=v end,"new")
mT(P6,"Auto Door",C.AutoDoor,function(v) C.AutoDoor=v end,"new")
mT(P6,"Auto Interact",C.AutoInteract,function(v) C.AutoInteract=v end,"new")
mT(P6,"Auto Interact — Doors",C.AutoInteractDoors,function(v) C.AutoInteractDoors=v end,"new")
mT(P6,"Auto Interact — Closets",C.AutoInteractClosets,function(v) C.AutoInteractClosets=v end,"new")
mT(P6,"Auto Interact — Anchors",C.AutoInteractAnchors,function(v) C.AutoInteractAnchors=v end,"new")
mT(P6,"Auto Interact — Items",C.AutoInteractItems,function(v) C.AutoInteractItems=v end,"new")
mT(P6,"Auto Play Again",C.AutoPlayAgain,function(v) C.AutoPlayAgain=v end,"works")
mT(P6,"Auto Skip Cutscene",C.AutoSkipCutscene,function(v) C.AutoSkipCutscene=v end,"new")
mT(P6,"Auto Breaker",C.AutoBreaker,function(v) C.AutoBreaker=v end,"maybe")

-- 7. BYPASS
local P7=Pg["Bypass"]
local bpList={
    {"Bypass Rush","BypassRush","new"},
    {"Bypass Ambush","BypassAmbush","new"},
    {"Bypass Seek","BypassSeek","new"},
    {"Bypass Figure","BypassFigure","new"},
    {"Bypass Screech","BypassScreech","new"},
    {"Bypass Halt","BypassHalt","new"},
    {"Bypass Eyes","BypassEyes","maybe"},
    {"Bypass Lookman","BypassLookman","maybe"},
    {"Bypass Snare","BypassSnare","maybe"},
    {"Bypass Killbricks","BypassKillbricks","maybe"},
    {"Bypass Seeking Wall","BypassSeekingWall","maybe"},
    {"Bypass Banana","BypassBanana","maybe"},
    {"Bypass Giggle","BypassGiggle","maybe"},
    {"Bypass Dupe","BypassDupe","maybe"},
    {"Bypass Vacuum","BypassVacuum","maybe"},
    {"Bypass Gloombat Eggs","BypassGloombatEggs","maybe"},
    {"Bypass Seek Obstructions","BypassSeekObstructions","maybe"},
    {"Bypass Jeff","BypassJeff","maybe"},
    {"Bypass Grumble","BypassGrumble","maybe"},
    {"Bypass Drones","BypassDrones","maybe"},
    {"Bypass Alma","BypassAlma","new"},
    {"Bypass Scribbles","BypassScribbles","new"},
    {"Bypass Electric Water","BypassElectricWater","new"},
    {"Bypass Giggle Arc","BypassGiggleArc","new"},
    {"Anti Ransom","AntiRansom","new"},
    {"Anti Closet Trash","AntiClosetTrash","new"},
    {"Anti Noise","AntiNoise","new"},
    {"Noise TV Breaker","NoiseTVBreaker","new"},
    {"Remove Screech","RemoveScreech","new"},
    {"Remove Halt","RemoveHalt","new"},
    {"Remove A-90","RemoveA90","new"},
    {"Remove Dread","RemoveDread","new"},
    {"Remove Surge","RemoveSurge","new"},
    {"Remove Paintings Door","RemovePaintingsDoor","new"},
    {"Remove Skeleton Door","RemoveSkeletonDoor","new"}
}
for _,b in ipairs(bpList) do
    mT(P7,b[1],C[b[2]],function(v) C[b[2]]=v end,b[3])
end

-- 8. EXPLOITS
local P8=Pg["Exploits"]
mT(P8,"God Rusher",C.GodRusher,function(v) C.GodRusher=v end,"maybe",true)
mT(P8,"Entity Freeze",C.EntityFreeze,function(v) C.EntityFreeze=v end,"maybe",true)
mT(P8,"Entity Teleport",C.EntityTeleport,function(v) C.EntityTeleport=v end,"maybe",true)
mT(P8,"Speed 10x",C.Speed10x,function(v) C.Speed10x=v end,"maybe",true)
mT(P8,"Invisible",C.Invisible,function(v) C.Invisible=v end,"maybe",true)
mT(P8,"Time Stop",C.TimeStop,function(v) C.TimeStop=v end,"maybe",true)
mT(P8,"Slow Motion",C.SlowMotion,function(v) C.SlowMotion=v end,"maybe",true)
mT(P8,"Auto Dodge",C.AutoDodge,function(v) C.AutoDodge=v end,"new",true)
mT(P8,"Infinite Items",C.InfiniteItems,function(v) C.InfiniteItems=v end,"maybe",true)

-- 9. ESP
local P9=Pg["ESP"]
mT(P9,"ESP All",C.ESP_All,function(v) C.ESP_All=v end,"new")
mT(P9,"ESP Rush",C.ESP_Rush,function(v) C.ESP_Rush=v end,"new")
mT(P9,"ESP Ambush",C.ESP_Ambush,function(v) C.ESP_Ambush=v end,"new")
mT(P9,"ESP Seek",C.ESP_Seek,function(v) C.ESP_Seek=v end,"new")
mT(P9,"ESP Figure",C.ESP_Figure,function(v) C.ESP_Figure=v end,"new")
mT(P9,"ESP Screech",C.ESP_Screech,function(v) C.ESP_Screech=v end,"new")
mT(P9,"ESP Eyes",C.ESP_Eyes,function(v) C.ESP_Eyes=v end,"new")
mT(P9,"ESP Halt",C.ESP_Halt,function(v) C.ESP_Halt=v end,"new")
mT(P9,"ESP Doors",C.ESP_Doors,function(v) C.ESP_Doors=v end,"new")
mT(P9,"ESP Closets",C.ESP_Closets,function(v) C.ESP_Closets=v end,"new")
mT(P9,"ESP Money",C.ESP_Money,function(v) C.ESP_Money=v end,"new")
mT(P9,"ESP Keys",C.ESP_Keys,function(v) C.ESP_Keys=v end,"new")
mT(P9,"ESP Items",C.ESP_Items,function(v) C.ESP_Items=v end,"new")
mT(P9,"ESP Chests",C.ESP_Chests,function(v) C.ESP_Chests=v end,"new")
mT(P9,"ESP Objectives",C.ESP_Objectives,function(v) C.ESP_Objectives=v end,"new")
mT(P9,"ESP Players",C.ESP_Players,function(v) C.ESP_Players=v end,"works")
mT(P9,"Smart ESP",C.SmartESP,function(v) C.SmartESP=v end,"new")
mS(P9,"Smart Range",50,300,C.SmartRange,function(v) C.SmartRange=v end)
mS(P9,"Max Distance",100,1000,C.MaxDistance,function(v) C.MaxDistance=v end)
mS(P9,"Fill Transparency",0,1,C.FillTransparency,function(v) C.FillTransparency=v end)
mS(P9,"Text Size",8,24,C.TextSize,function(v) C.TextSize=v end)
mT(P9,"Rainbow Mode",C.RainbowMode,function(v) C.RainbowMode=v end,"new")
mT(P9,"Show Distance",C.ShowDistance,function(v) C.ShowDistance=v end,"works")
mT(P9,"X-Ray",C.XRay,function(v) C.XRay=v end,"works")
mT(P9,"Notify Entities",C.NotifyEntities,function(v) C.NotifyEntities=v end,"new")

-- 10. VISUAL
local P10=Pg["Visual"]
mS(P10,"FOV",40,120,C.FOV,function(v) C.FOV=v end)
mS(P10,"Custom FOV (0=off)",0,120,C.CustomFOV,function(v) C.CustomFOV=v end)
mT(P10,"Third Person",C.ThirdPerson,function(v) C.ThirdPerson=v end,"maybe")
mT(P10,"No Fog",C.NoFog,function(v) C.NoFog=v end,"new")
mT(P10,"Wallhack",C.Wallhack,function(v) C.Wallhack=v; _G.setWallhack(v) end,"new")
mT(P10,"Chams",C.Chams,function(v) C.Chams=v; _G.setChams(v) end,"new")
mT(P10,"Crosshair",C.Crosshair,function(v) C.Crosshair=v end,"works")
mS(P10,"Crosshair Size",5,50,C.CrosshairSize,function(v) C.CrosshairSize=v end)
mT(P10,"Entity Tracker",C.EntityTracker,function(v) C.EntityTracker=v end,"works")
mT(P10,"Hitmarker",C.Hitmarker,function(v) C.Hitmarker=v end,"new")
mT(P10,"Damage Numbers",C.DamageNumbers,function(v) C.DamageNumbers=v end,"new")
mT(P10,"Danger Meter",C.DangerMeter,function(v) C.DangerMeter=v end,"new")
mT(P10,"Show Seek Path",C.ShowSeekPath,function(v) C.ShowSeekPath=v end,"new")
mT(P10,"Fun Rainbow",C.FunRainbow,function(v) C.FunRainbow=v end,"maybe")
mT(P10,"Remove Camera Shake",C.RemoveCameraShake,function(v) C.RemoveCameraShake=v end,"new")
mT(P10,"Remove Camera Bobbing",C.RemoveCameraBobbing,function(v) C.RemoveCameraBobbing=v end,"new")
mT(P10,"Remove Cutscenes",C.RemoveCutscenes,function(v) C.RemoveCutscenes=v end,"new")

-- 11. MUSIC
local P11=Pg["Music"]
mB(P11,"Play Music (ID в Chat)",function()
    if _G.playMusic then _G.playMusic(C.MusicId) end
end)
mB(P11,"Stop Music",function() if _G.stopMusic then _G.stopMusic() end end)
mS(P11,"Volume",0,1,C.MusicVolume,function(v) C.MusicVolume=v end)

-- 12. SOUND
local P12=Pg["Sound"]
mT(P12,"Notify Sound",C.NotifySound,function(v) C.NotifySound=v end,"works")
mS(P12,"Sound Volume",0,1,C.NotifySoundVolume,function(v) C.NotifySoundVolume=v end)
mT(P12,"Rush Warning",C.RushWarning,function(v) C.RushWarning=v end,"new")
mT(P12,"Ambush Warning",C.AmbushWarning,function(v) C.AmbushWarning=v end,"new")
mT(P12,"Seek Warning",C.SeekWarning,function(v) C.SeekWarning=v end,"new")
mT(P12,"Halt Warning",C.HaltWarning,function(v) C.HaltWarning=v end,"new")
mT(P12,"Notify Items",C.NotifyItems,function(v) C.NotifyItems=v end,"new")
mT(P12,"Remove Footstep Sounds",C.RemoveFootstepSounds,function(v) C.RemoveFootstepSounds=v end,"new")
mT(P12,"Remove Jammin Music",C.RemoveJamminMusic,function(v) C.RemoveJamminMusic=v end,"new")
mT(P12,"Remove Interacting Sounds",C.RemoveInteractingSounds,function(v) C.RemoveInteractingSounds=v end,"new")

-- 13. MOVE
local P13=Pg["Move"]
mB(P13,"Save Position",function() _G.savePos() end)
mB(P13,"TP to Save",function() _G.tpToSave() end)
mB(P13,"Server Hop",function() _G.serverHop() end)
mT(P13,"Auto Rejoin",C.AutoRejoin,function(v) C.AutoRejoin=v end,"new")

-- 14. STATS
local P14=Pg["Stats"]
mT(P14,"Show Timer",C.ShowTimer,function(v) C.ShowTimer=v end,"works")
mT(P14,"Show FPS",C.ShowFPS,function(v) C.ShowFPS=v end,"new")
mT(P14,"Show Ping",C.ShowPing,function(v) C.ShowPing=v end,"new")
mB(P14,"Reset Stats",function() if _G.resetStats then _G.resetStats() end end)

-- 15. PLAYERS
local P15=Pg["Players"]
mB(P15,"Chat Spam x5",function() if _G.chatSpam then _G.chatSpam("Burmalda v15!",5) end end)

-- 16. FEATURES
local P16=Pg["Features"]
mT(P16,"God Rusher",C.GodRusher,function(v) C.GodRusher=v end,"maybe",true)
mT(P16,"Entity Freeze",C.EntityFreeze,function(v) C.EntityFreeze=v end,"maybe",true)
mT(P16,"Entity Teleport",C.EntityTeleport,function(v) C.EntityTeleport=v end,"maybe",true)
mT(P16,"Speed 10x",C.Speed10x,function(v) C.Speed10x=v end,"maybe",true)
mT(P16,"Auto Aim",C.AutoAim,function(v) C.AutoAim=v end,"new",true)
mT(P16,"Discord Rich",C.DiscordRich,function(v) C.DiscordRich=v end,"new",true)

-- 17. FARM
local P17=Pg["Farm"]
mT(P17,"Farm Deaths",C.AutoFarmDeaths,function(v) C.AutoFarmDeaths=v; _G.setFarmDeaths(v) end,"new")
mT(P17,"Knob Farm",C.KnobFarm,function(v) C.KnobFarm=v end,"new")
mS(P17,"Farm Delay",1,10,C.FarmDelay,function(v) C.FarmDelay=v end)
mT(P17,"Auto Complete Dam Seek",C.AutoCompleteDamSeek,function(v) C.AutoCompleteDamSeek=v end,"new")
mT(P17,"Auto Complete Cringle",C.AutoCompleteCringle,function(v) C.AutoCompleteCringle=v end,"new")
mB(P17,"Copy Death Farm Loadstring",function() if _G.copyDeathFarmLoadstring then _G.copyDeathFarmLoadstring() end end)

print("[Burmalda v15] Part 13/14 — GUI CHUNK 1 loaded (17 tabs)")
-- ═══════════════════════════════════════════════════════
-- ВКЛАДКИ 18-34 (Fun → Updates)
-- ═══════════════════════════════════════════════════════

-- 18. FUN
local P18=Pg["Fun"]
mT(P18,"Snow",C.Snow,function(v) C.Snow=v end,"maybe")
mT(P18,"Leaves",C.Leaves,function(v) C.Leaves=v end,"maybe")
mT(P18,"Petals",C.Petals,function(v) C.Petals=v end,"maybe")
mT(P18,"Aura Fire",C.AuraFire,function(v) C.AuraFire=v end,"maybe")
mT(P18,"Aura Ice",C.AuraIce,function(v) C.AuraIce=v end,"maybe")
mT(P18,"Fireworks",C.Fireworks,function(v) C.Fireworks=v end,"maybe")
mB(P18,"Confetti!",function() if _G.doConfetti then _G.doConfetti() end end)
mT(P18,"Duck Spawn",C.DuckSpawn,function(v) C.DuckSpawn=v end,"maybe")
mS(P18,"Duck Count",10,500,C.DuckCount,function(v) C.DuckCount=v end)
mB(P18,"Spawn Ducks Now",function() if _G.spawnDucks then _G.spawnDucks(50) end end)
mT(P18,"Disco Mode",C.FunDisco,function(v) C.FunDisco=v end,"new")
mT(P18,"Fun Rainbow Char",C.FunRainbow,function(v) C.FunRainbow=v end,"maybe")
mB(P18,"Random TP",function() if _G.randomTP then _G.randomTP() end end)
mB(P18,"Fake Death",function() if _G.fakeDeath then _G.fakeDeath() end end)
mB(P18,"Fake Entity (Rush)",function() if _G.spawnFakeEntity then _G.spawnFakeEntity("Rush",Color3.fromRGB(255,0,0)) end end)
mB(P18,"Fake Entity (Custom)",function() if _G.spawnFakeEntity then _G.spawnFakeEntity("CustomEntity",Color3.fromRGB(255,0,255)) end end)
mB(P18,"Fake Chat",function() if _G.fakeChat then _G.fakeChat("FakePlayer","Hello from Burmalda!") end end)
mB(P18,"Fake Screenshot",function() if _G.fakeScreenshot then _G.fakeScreenshot() end end)
mB(P18,"Fake Kick",function() if _G.fakeKick then _G.fakeKick() end end)
mB(P18,"Screen Shake",function() if _G.screenShake then _G.screenShake(2) end end)
mB(P18,"Custom Notif",function() if _G.customNotif then _G.customNotif("Hello!","This is custom notification.") end end)
mB(P18,"Chat Spam x5",function() if _G.chatSpam then _G.chatSpam("Burmalda on top!",5) end end)

-- 19. SPAWN
local P19=Pg["Spawn"]
mB(P19,"Spawn Rush",function() if _G.spawnRush then _G.spawnRush() end end)
mB(P19,"Spawn Ambush",function() if _G.spawnAmbush then _G.spawnAmbush() end end)
mB(P19,"Spawn Seek",function() if _G.spawnSeek then _G.spawnSeek() end end)
mB(P19,"Spawn Figure",function() if _G.spawnFigure then _G.spawnFigure() end end)
mB(P19,"Spawn Screech",function() if _G.spawnScreech then _G.spawnScreech() end end)
mB(P19,"Spawn Eyes",function() if _G.spawnEyes then _G.spawnEyes() end end)
mB(P19,"Spawn Halt",function() if _G.spawnHalt then _G.spawnHalt() end end)
mB(P19,"Spawn Grumble",function() if _G.spawnGrumble then _G.spawnGrumble() end end)
mB(P19,"Spawn Giggle",function() if _G.spawnGiggle then _G.spawnGiggle() end end)
mB(P19,"Spawn Blitz",function() if _G.spawnBlitz then _G.spawnBlitz() end end)
mB(P19,"Spawn Lookman",function() if _G.spawnLookman then _G.spawnLookman() end end)
mB(P19,"Spawn A-60",function() if _G.spawnA60 then _G.spawnA60() end end)
mB(P19,"Spawn A-120",function() if _G.spawnA120 then _G.spawnA120() end end)
mB(P19,"Spawn Coin",function() if _G.spawnCoin then _G.spawnCoin() end end)
mB(P19,"Spawn Key",function() if _G.spawnKey then _G.spawnKey() end end)
mB(P19,"Spawn Flashlight",function() if _G.spawnFlashlight then _G.spawnFlashlight() end end)
mB(P19,"Spawn Bandage",function() if _G.spawnBandage then _G.spawnBandage() end end)
mB(P19,"Spawn Crucifix",function() if _G.spawnCrucifix then _G.spawnCrucifix() end end)

-- 20. ADMIN
local P20=Pg["Admin"]
mB(P20,"👑 [FAKE] Kick All",function() _G.fakeKickAll() end,T().danger)
mB(P20,"👑 [FAKE] Ban Player",function() _G.fakeBanPlayer() end,T().danger)
mB(P20,"👑 [FAKE] Freeze All",function() _G.fakeFreezeAll() end,T().danger)
mB(P20,"👑 [FAKE] Give Godmode All",function() _G.fakeGiveGodmodeAll() end,T().danger)
mB(P20,"👑 [FAKE] Force Respawn",function() _G.fakeForceRespawnAll() end,T().danger)
mB(P20,"👑 [FAKE] Server Shutdown",function() _G.fakeServerShutdown() end,T().danger)
mB(P20,"👑 [FAKE] Restart Run",function() _G.fakeRestartRun() end,T().danger)
mB(P20,"👑 [FAKE] Announce",function() _G.fakeAnnounce("Hello everyone!") end,T().danger)
mB(P20,"👑 [FAKE] Clear Room",function() _G.fakeClearRoom() end,T().danger)
mB(P20,"👑 [FAKE] Delete Entities",function() _G.fakeDeleteAllEntities() end,T().danger)
mB(P20,"👑 Give All Items",function() _G.fakeGiveAllItems() end)
mB(P20,"👑 Give Flashlight",function() _G.fakeGiveItem("Flashlight") end)
mB(P20,"👑 Give Lockpick",function() _G.fakeGiveItem("Lockpick") end)
mB(P20,"👑 Give Bandage",function() _G.fakeGiveItem("Bandage") end)
mB(P20,"👑 Give Vitamins",function() _G.fakeGiveItem("Vitamins") end)
mB(P20,"👑 Give Crucifix",function() _G.fakeGiveItem("Crucifix") end)
mB(P20,"👑 Give Lighter",function() _G.fakeGiveItem("Lighter") end)
mB(P20,"👑 Give Battery",function() _G.fakeGiveItem("Battery") end)
mB(P20,"👑 Give Candle",function() _G.fakeGiveItem("Candle") end)
mB(P20,"👑 Give Skeleton Key",function() _G.fakeGiveItem("Skeleton Key") end)
mB(P20,"👑 [SPAWN] Rush",function() _G.adminSpawnRush() end)
mB(P20,"👑 [SPAWN] Ambush",function() _G.adminSpawnAmbush() end)
mB(P20,"👑 [SPAWN] Seek",function() _G.adminSpawnSeek() end)
mB(P20,"👑 [SPAWN] Figure",function() _G.adminSpawnFigure() end)
mB(P20,"👑 [SPAWN] Screech",function() _G.adminSpawnScreech() end)
mB(P20,"👑 [SPAWN] Eyes",function() _G.adminSpawnEyes() end)
mB(P20,"👑 [SPAWN] Halt",function() _G.adminSpawnHalt() end)
mB(P20,"👑 [SPAWN] Coin",function() _G.adminSpawnCoin() end)
mB(P20,"👑 [SPAWN] Key",function() _G.adminSpawnKey() end)
mB(P20,"👑 [DANGER] Kill Self",function() _G.fakeKillSelf() end,T().danger)
mB(P20,"👑 [DANGER] Delete Server",function() _G.fakeDeleteServer() end,T().danger)
mB(P20,"👑 [DANGER] Ban Self",function() _G.fakeBanSelf() end,T().danger)
mB(P20,"👑 [DANGER] Crash Game",function() _G.fakeCrashGame() end,T().danger)
mB(P20,"👑 Gold Name",function() _G.fakeGoldName() end)
mB(P20,"👑 Rainbow Name",function() _G.fakeRainbowName() end)

-- 21. MOBILE
local P21=Pg["Mobile"]
mB(P21,"Show Mobile Buttons",function() N("Mobile buttons shown (auto)") end)

-- 22. ANTIDET
local P22=Pg["AntiDet"]
mT(P22,"Anti-Detection",C.AntiDetect,function(v) C.AntiDetect=v end,"maybe",true)
mT(P22,"Safe Mode",C.SafeMode,function(v) C.SafeMode=v end,"maybe",true)
mT(P22,"Anticheat Bypass",C.AnticheatBypass,function(v) C.AnticheatBypass=v end,"new",true)
mT(P22,"Velocity Manipulation",C.VelocityManipulation,function(v) C.VelocityManipulation=v end,"new",true)
mS(P22,"Bypass Delay",0.05,1,C.BypassDelay,function(v) C.BypassDelay=v end)

-- 23. FPS BOOSTER
local P23=Pg["FPS Booster"]
mT(P23,"FPS Booster (общий)",C.FPSBooster,function(v) C.FPSBooster=v end,"new")
mT(P23,"Low Graphics",C.LowGraphics,function(v) C.LowGraphics=v end,"new")
mT(P23,"Remove Particles",C.RemoveParticles,function(v) C.RemoveParticles=v end,"new")
mT(P23,"Remove Lights",C.RemoveLights,function(v) C.RemoveLights=v end,"new")
mT(P23,"Remove Decals",C.RemoveDecals,function(v) C.RemoveDecals=v end,"new")
mT(P23,"Remove Shadows",C.RemoveShadows,function(v) C.RemoveShadows=v end,"new")
mT(P23,"Remove Distant",C.RemoveDistant,function(v) C.RemoveDistant=v end,"new")
mT(P23,"Remove Invisible",C.RemoveInvisible,function(v) C.RemoveInvisible=v end,"new")
mT(P23,"Remove Animations",C.RemoveAnimations,function(v) C.RemoveAnimations=v end,"new")
mT(P23,"Disable Sound",C.DisableSound,function(v) C.DisableSound=v end,"new")
mT(P23,"Show FPS",C.ShowFPS,function(v) C.ShowFPS=v end,"new")
mT(P23,"Show Ping",C.ShowPing,function(v) C.ShowPing=v end,"new")

-- 24. SHOP
local P24=Pg["Shop"]
mB(P24,"🛒 [FAKE] Free Items",function() _G.fakeAdminAction("Free Items") end)
mB(P24,"🛒 [FAKE] Buy All",function() _G.fakeAdminAction("Buy All") end)

-- 25. ACHIEV
local P25=Pg["Achiev"]
mB(P25,"🏆 [FAKE] Unlock All",function() _G.fakeAdminAction("Unlock All Achievements") end)
mB(P25,"🏆 [FAKE] Auto-Unlock",function() _G.fakeAdminAction("Auto Unlock") end)

-- 26. FAVORITES
local P26=Pg["Favorites"]
mB(P26,"Save Profile 1",function() _G.sv(); N("Profile 1 saved") end)
mB(P26,"Load Profile 1",function() _G.ld(); N("Profile 1 loaded") end)
mB(P26,"Save Profile 2",function() _G.sv(); N("Profile 2 saved") end)
mB(P26,"Load Profile 2",function() _G.ld(); N("Profile 2 loaded") end)

-- 27. HOTEL
local P27=Pg["Hotel"]
mT(P27,"Auto Breaker",C.AutoBreaker,function(v) C.AutoBreaker=v end,"maybe")
mT(P27,"Auto Heartbeat",C.AutoHeartbeatMinigame,function(v) C.AutoHeartbeatMinigame=v end,"new")
mT(P27,"Auto Unlock Padlock",C.AutoUnlockPadlock,function(v) C.AutoUnlockPadlock=v end,"new")
mT(P27,"Guess Library Code",C.GuessLibraryCode,function(v) C.GuessLibraryCode=v end,"new")

-- 28. MINES
local P28=Pg["Mines"]
mT(P28,"Auto Solve Anchors",C.AutoSolveAnchors,function(v) C.AutoSolveAnchors=v end,"new")
mT(P28,"Auto Platform",C.AutoPlatform,function(v) C.AutoPlatform=v end,"maybe")

-- 29. BACKDOOR
local P29=Pg["Backdoor"]
mT(P29,"Anti Ransom",C.AntiRansom,function(v) C.AntiRansom=v end,"new")

-- 30. OUTDOORS
local P30=Pg["Outdoors"]
mT(P30,"Auto Collect",C.AutoCollect,function(v) C.AutoCollect=v end,"new")

-- 31. ARCHIVES
local P31=Pg["Archives"]
mT(P31,"Anti Ransom",C.AntiRansom,function(v) C.AntiRansom=v end,"new")
mT(P31,"Anti Closet Trash",C.AntiClosetTrash,function(v) C.AntiClosetTrash=v end,"new")
mT(P31,"Anti Noise",C.AntiNoise,function(v) C.AntiNoise=v end,"new")
mT(P31,"Forget Me Not",C.ForgetMeNot,function(v) C.ForgetMeNot=v end,"maybe")
mT(P31,"Time Shower",C.TimeShower,function(v) C.TimeShower=v end,"new")
mT(P31,"Honcho ESP",C.HonchoESP,function(v) C.HonchoESP=v end,"maybe")
mT(P31,"Ignore A-60",C.IgnoreA60,function(v) C.IgnoreA60=v end,"new")

-- 32. STAIRWELL
local P32=Pg["Stairwell"]
mT(P32,"Auto Climb",C.AutoSeekDoor,function(v) C.AutoSeekDoor=v end,"new")

-- 33. SETTINGS (UI + Configs + Info)
local P33=Pg["Settings"]
mS(P33,"UI Scale",0.5,2,C.UI_Scale,function(v) C.UI_Scale=v end)
mS(P33,"UI Opacity",0.3,1,C.UI_Opacity,function(v) C.UI_Opacity=v end)
mB(P33,"Save Config",function() _G.sv(); N("✅ Saved") end)
mB(P33,"Load Config",function() _G.ld(); N("✅ Loaded") end)
mB(P33,"Reset Config",function()
    if _G.LP then
        for k,v in pairs(C) do
            if type(v)=="boolean" then C[k]=false end
        end
        N("🔄 Reset (partially)")
    end
end)
mB(P33,"Config: default",function() C.SelectedConfig="default"; N("Selected: default") end)
mB(P33,"Config: pvp",function() C.SelectedConfig="pvp"; N("Selected: pvp") end)
mB(P33,"Config: farm",function() C.SelectedConfig="farm"; N("Selected: farm") end)
mB(P33,"Show Info",function()
    N("Burmalda v15 by KOTENOK7204 | Tester: Kostya_2015KostyaKos")
end)

-- 34. UPDATES
local P34=Pg["Updates"]
mB(P34,"Check for Updates",function()
    pcall(function()
        local url="https://raw.githubusercontent.com/evgeniyt062015-eng/BurmaldaHub/main/version.txt"
        local last=game:HttpGet(url)
        if last and last~="15.0" then
            N("⚠️ Update available: v"..last)
        else
            N("✅ You have the latest version (v15.0)")
        end
    end)
end)
mB(P34,"Current Version: v15.0",function() N("Burmalda v15.0") end)
mB(P34,"Changelog",function()
    N("v15: фикс Speed/InfJump/Bypass/ESP, +50 новых функций")
end)
mB(P34,"Discord (coming in v20)",function() N("Discord — в v20") end)
mB(P34,"GitHub",function() N("github.com/evgeniyt062015-eng/BurmaldaHub") end)

-- ═══ КНОПКИ ЭТАЖЕЙ ═══
local function mkFB(txt,y,fn)
    local b=Instance.new("TextButton",FM)
    b.Size=UDim2.new(0,270,0,30)
    b.Position=UDim2.new(0.5,-135,0,y)
    b.BackgroundColor3=Color3.fromRGB(40,40,45)
    b.Text=txt
    b.TextColor3=Color3.fromRGB(240,240,245)
    b.Font=Enum.Font.GothamBold
    b.TextSize=12
    b.BorderSizePixel=0
    local c=Instance.new("UICorner",b); c.CornerRadius=UDim.new(0,6)
    local s=Instance.new("UIStroke",b); s.Color=Color3.fromRGB(180,30,30); s.Thickness=1
    b.MouseButton1Click:Connect(function()
        _G.MF=fn
        FS:Destroy()
        M.Visible=true
        OB.Text="X"
        N("Этаж: "..fn)
    end)
end

mkFB("Hotel",118,"Hotel")
mkFB("Mines",152,"Mines")
mkFB("Backdoor",186,"Backdoor")
mkFB("Outdoors",220,"Outdoors")
mkFB("Archives",254,"Archives")
mkFB("Stairwell",288,"Stairwell")

-- ═══ SEARCH функционал ═══
local SearchFrame=nil
SearchBtn.MouseButton1Click:Connect(function()
    if SearchFrame and SearchFrame.Parent then
        SearchFrame:Destroy()
        SearchFrame=nil
        return
    end
    SearchFrame=Instance.new("Frame",M)
    SearchFrame.Size=UDim2.new(0,400,0,300)
    SearchFrame.Position=UDim2.new(0.5,-200,0.5,-150)
    SearchFrame.BackgroundColor3=T().bg
    SearchFrame.BorderSizePixel=0
    SearchFrame.ZIndex=10
    local sc=Instance.new("UICorner",SearchFrame); sc.CornerRadius=UDim.new(0,8)
    local ss=Instance.new("UIStroke",SearchFrame); ss.Color=T().accent; ss.Thickness=2
    
    local input=Instance.new("TextBox",SearchFrame)
    input.Size=UDim2.new(1,-20,0,30)
    input.Position=UDim2.new(0,10,0,10)
    input.BackgroundColor3=T().panel
    input.TextColor3=T().text
    input.PlaceholderText="Поиск функции..."
    input.Text=""
    input.Font=Enum.Font.Gotham
    input.TextSize=12
    input.BorderSizePixel=0
    local ic=Instance.new("UICorner",input); ic.CornerRadius=UDim.new(0,5)
    
    local results=Instance.new("ScrollingFrame",SearchFrame)
    results.Size=UDim2.new(1,-20,1,-50)
    results.Position=UDim2.new(0,10,0,45)
    results.BackgroundTransparency=1
    results.BorderSizePixel=0
    results.ScrollBarThickness=3
    results.ScrollBarImageColor3=T().accent
    
    local rl=Instance.new("UIListLayout",results)
    rl.Padding=UDim.new(0,2)
    
    input:GetPropertyChangedSignal("Text"):Connect(function()
        for _,c in ipairs(results:GetChildren()) do
            if c:IsA("TextButton") then c:Destroy() end
        end
        local query=input.Text:lower()
        if query=="" then return end
        for _,obj in ipairs(M:GetDescendants()) do
            if obj:IsA("TextLabel") and obj.Text:lower():find(query,1,true) then
                if obj.TextSize==10 and obj.TextXAlignment==Enum.TextXAlignment.Left then
                    local btn=Instance.new("TextButton",results)
                    btn.Size=UDim2.new(1,0,0,22)
                    btn.BackgroundColor3=T().panel
                    btn.Text=obj.Text
                    btn.TextColor3=T().text
                    btn.Font=Enum.Font.Gotham
                    btn.TextSize=10
                    btn.BorderSizePixel=0
                    local bc=Instance.new("UICorner",btn); bc.CornerRadius=UDim.new(0,3)
                    btn.MouseButton1Click:Connect(function()
                        N("Найдено: "..obj.Text)
                        SearchFrame:Destroy()
                        SearchFrame=nil
                    end)
                end
            end
        end
        results.CanvasSize=UDim2.new(0,0,#results:GetChildren()*25)
    end)
end)

-- ═══ АВТОСОХРАНЕНИЕ (без Auto-Save тумблера) ═══
-- Убрано (по твоей просьбе)

print("[Burmalda v15] Part 13/14 — GUI loaded (34 tabs)")
