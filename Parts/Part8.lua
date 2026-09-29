-- BURMALDA v13 | Part 8/8 — FULL GUI (32 вкладки + кнопка B + стартовый экран)
-- Финальная часть

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local UIS=_G.UIS
local P=_G.P

-- ═══════════════════════════════════════════════
-- FLOOR SELECT (стартовый экран)
-- ═══════════════════════════════════════════════
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
FT.Text="BURMALDA v13"
FT.TextColor3=Color3.fromRGB(120,20,40)
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

-- ═══ MAIN GUI ═══
local SG=Instance.new("ScreenGui")
SG.Name="BurmaldaV13GUI"
SG.ResetOnSpawn=false
SG.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
SG.Parent=LP:WaitForChild("PlayerGui")

-- Кнопка B
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

-- Главное окно M
local M=Instance.new("Frame",SG)
M.Size=UDim2.new(0,440,0,420)
M.Position=UDim2.new(0.5,-220,0.5,-210)
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

-- Header
local H=Instance.new("Frame",M)
H.Size=UDim2.new(1,0,0,34)
H.BackgroundColor3=T().accent
H.BorderSizePixel=0

local HC=Instance.new("UICorner",H)
HC.CornerRadius=UDim.new(0,10)

local HT=Instance.new("TextLabel",H)
HT.Size=UDim2.new(1,-40,1,0)
HT.Position=UDim2.new(0,10,0,0)
HT.BackgroundTransparency=1
HT.Text="BURMALDA v13 | ".._G.gF()
HT.TextColor3=Color3.fromRGB(255,255,255)
HT.Font=Enum.Font.GothamBold
HT.TextSize=11
HT.TextXAlignment=Enum.TextXAlignment.Left

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
    if _G.sv then _G.sv() end
    M.Visible=false
    OB.Text="B"
end)
-- Левая колонка (кнопки вкладок)
local TB=Instance.new("ScrollingFrame",M)
TB.Size=UDim2.new(0,120,1,-34)
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

-- Контент
local CT=Instance.new("Frame",M)
CT.Size=UDim2.new(1,-125,1,-42)
CT.Position=UDim2.new(0,122,0,38)
CT.BackgroundTransparency=1

local Pg={}

-- ═══ SW — переключение вкладок ═══
local function sw(n)
    for k,p in pairs(Pg) do
        p.Visible=(k==n)
    end
end

-- ═══ CrP — создание вкладки ═══
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

-- ═══ mT — Toggle ═══
local function mT(p,t,i,cb,d)
    local b=Instance.new("TextButton",p)
    b.Size=UDim2.new(1,-6,0,26)
    b.BackgroundColor3=d and T().danger or T().panel
    b.BorderSizePixel=0
    b.Text=""
    local c=Instance.new("UICorner",b); c.CornerRadius=UDim.new(0,5)
    local l=Instance.new("TextLabel",b)
    l.Size=UDim2.new(0.75,0,1,0); l.Position=UDim2.new(0,8,0,0)
    l.BackgroundTransparency=1; l.Text=t; l.TextColor3=d and Color3.fromRGB(255,200,210) or T().text
    l.Font=Enum.Font.Gotham; l.TextSize=9; l.TextXAlignment=Enum.TextXAlignment.Left
    local s=Instance.new("TextLabel",b)
    s.Size=UDim2.new(0.2,0,1,0); s.Position=UDim2.new(0.75,0,0,0)
    s.BackgroundTransparency=1; s.Text=i and "ON" or "OFF"
    s.TextColor3=i and Color3.fromRGB(80,220,120) or Color3.fromRGB(220,80,80)
    s.Font=Enum.Font.GothamBold; s.TextSize=9
    local st=i
    b.MouseButton1Click:Connect(function()
        st=not st
        s.Text=st and "ON" or "OFF"
        s.TextColor3=st and Color3.fromRGB(80,220,120) or Color3.fromRGB(220,80,80)
        cb(st)
    end)
end

-- ═══ mB — Button ═══
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

-- ═══ mS — Slider ═══
local function mS(p,t,mn,mx,i,cb)
    local f=Instance.new("Frame",p)
    f.Size=UDim2.new(1,-6,0,36)
    f.BackgroundColor3=T().panel
    f.BorderSizePixel=0
    local c=Instance.new("UICorner",f); c.CornerRadius=UDim.new(0,5)
    local l=Instance.new("TextLabel",f)
    l.Size=UDim2.new(1,-16,0,14); l.Position=UDim2.new(0,8,0,2)
    l.BackgroundTransparency=1; l.Text=t..": "..i; l.TextColor3=T().text
    l.Font=Enum.Font.Gotham; l.TextSize=9; l.TextXAlignment=Enum.TextXAlignment.Left
    local bar=Instance.new("Frame",f)
    bar.Size=UDim2.new(1,-16,0,10); bar.Position=UDim2.new(0,8,0,22)
    bar.BackgroundColor3=T().bg; bar.BorderSizePixel=0
    local bc=Instance.new("UICorner",bar); bc.CornerRadius=UDim.new(0,4)
    local fl=Instance.new("Frame",bar)
    fl.Size=UDim2.new((i-mn)/(mx-mn),0,1,0)
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

-- ═══ LIST вкладок ═══
local tL={
    {n="Main"},{n="Character"},{n="TP"},{n="Hide"},{n="AutoSeek"},
    {n="Bypass"},{n="Exploits",d=true},{n="ESP"},{n="Visual"},
    {n="Music"},{n="Sound"},{n="Move"},{n="Stats"},{n="Players"},
    {n="Features",d=true},{n="Farm"},{n="Fun"},{n="Spawn"},
    {n="Admin",d=true},{n="Mobile"},{n="AntiDet",d=true},
    {n="Shop"},{n="Achiev"},{n="Favorites"},
    {n="Hotel"},{n="Mines"},{n="Backdoor"},{n="Outdoors"},{n="Archives"},{n="Stairwell"},
    {n="Settings"},{n="Info"}
}

-- Кнопки вкладок
local tbts={}
for _,t in ipairs(tL) do
    crP(t.n)
    local b=Instance.new("TextButton",TB)
    b.Size=UDim2.new(0.9,0,0,24)
    b.BackgroundColor3=t.d and T().danger or T().panel
    b.BorderSizePixel=0
    b.Text=t.n
    b.TextColor3=t.d and Color3.fromRGB(255,200,210) or T().text
    b.Font=Enum.Font.Gotham
    b.TextSize=9
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

-- ═══════════════════════════════════════════════
-- НАПОЛНЕНИЕ ВКЛАДОК
-- ═══════════════════════════════════════════════

-- === MAIN ===
local PgMain=Pg["Main"]
mT(PgMain,"Speed Hack",C.SpeedEnabled,function(v) C.SpeedEnabled=v end)
mS(PgMain,"Walk Speed",16,200,C.WalkSpeed,function(v) C.WalkSpeed=v end)
mS(PgMain,"Speed Boost",0,100,C.SpeedBoost,function(v) C.SpeedBoost=v end)
mS(PgMain,"Jump Power",50,500,C.JumpPower,function(v) C.JumpPower=v end)
mT(PgMain,"Fly",C.Fly,function(v) C.Fly=v; _G.setFly(v) end)
mS(PgMain,"Fly Speed",10,200,C.FlySpeed,function(v) C.FlySpeed=v end)
mT(PgMain,"Noclip",C.Noclip,function(v) C.Noclip=v; _G.setNC(v) end)
mT(PgMain,"Infinite Jumps",C.InfiniteJumps,function(v) C.InfiniteJumps=v; _G.setInfJump(v) end)
mT(PgMain,"Enable Jump",C.EnableJump,function(v) C.EnableJump=v end)
mT(PgMain,"Enable Slide",C.EnableSlide,function(v) C.EnableSlide=v end)
mT(PgMain,"Bunny Hop",C.BunnyHop,function(v) C.BunnyHop=v end)
mT(PgMain,"Anti-AFK",C.AntiAFK,function(v) C.AntiAFK=v end)

-- === CHARACTER ===
local PgCh=Pg["Character"]
mT(PgCh,"God Mode",C.GodMode,function(v) C.GodMode=v end)
mT(PgCh,"Infinite Revive",C.InfiniteRevive,function(v) C.InfiniteRevive=v end)
mT(PgCh,"Max Stats",C.MaxStats,function(v) C.MaxStats=v end)
mT(PgCh,"Invisible",C.Invisible,function(v) C.Invisible=v end)
mT(PgCh,"Auto Crouch",C.AutoCrouch,function(v) C.AutoCrouch=v end)
mT(PgCh,"Remove Closet Delay",C.RemoveClosetDelay,function(v) C.RemoveClosetDelay=v end)
mT(PgCh,"Remove Accel",C.RemoveAccel,function(v) C.RemoveAccel=v end)

-- === TP ===
local PgTP=Pg["TP"]
mB(PgTP,"TP Nearest Item",function() _G.tpNearestItem() end)
mS(PgTP,"TP Item Radius",50,500,C.TPItemRadius,function(v) C.TPItemRadius=v end)
mT(PgTP,"Auto Collect",C.AutoCollect,function(v) C.AutoCollect=v end)
mT(PgTP,"Auto Coins",C.AutoCoins,function(v) C.AutoCoins=v end)

-- === HIDE ===
local PgHide=Pg["Hide"]
mT(PgHide,"Infinite Hide",C.InfiniteHide,function(v) C.InfiniteHide=v end)
mT(PgHide,"Hide Lock",C.HideLock,function(v) C.HideLock=v end)
mT(PgHide,"Auto Re-Hide",C.AutoReHide,function(v) C.AutoReHide=v end)
mT(PgHide,"Auto Hide Rush",C.AutoHideRush,function(v) C.AutoHideRush=v end)
mT(PgHide,"Auto Hide Ambush",C.AutoHideAmbush,function(v) C.AutoHideAmbush=v end)
mT(PgHide,"Auto Hide All",C.AutoHideAll,function(v) C.AutoHideAll=v end)

-- === AUTOSEEK ===
local PgAS=Pg["AutoSeek"]
mT(PgAS,"Auto Seek",C.AutoSeek,function(v) C.AutoSeek=v end)
mT(PgAS,"Auto Platform",C.AutoPlatform,function(v) C.AutoPlatform=v end)

-- === BYPASS ===
local PgB=Pg["Bypass"]
local bypassList={"BypassScreech","BypassHalt","BypassEyes","BypassLookman","BypassSnare","BypassKillbricks","BypassSeekingWall","BypassBanana","BypassGiggle","BypassDupe","BypassVacuum","BypassGloombatEggs","BypassSeekObstructions","BypassJeff","BypassRush","BypassAmbush","BypassSeek","BypassFigure","BypassGrumble","BypassDrones"}
for _,b in ipairs(bypassList) do
    mT(PgB,b:gsub("Bypass",""),C[b],function(v) C[b]=v end)
end

-- === EXPLOITS ===
local PgE=Pg["Exploits"]
mT(PgE,"God Rusher",C.GodRusher,function(v) C.GodRusher=v end,true)
mT(PgE,"Entity Freeze",C.EntityFreeze,function(v) C.EntityFreeze=v end,true)
mT(PgE,"Entity Teleport",C.EntityTeleport,function(v) C.EntityTeleport=v end,true)
mT(PgE,"Speed 10x",C.Speed10x,function(v) C.Speed10x=v end,true)
mT(PgE,"Invisible",C.Invisible,function(v) C.Invisible=v end,true)
mT(PgE,"Time Stop",C.TimeStop,function(v) C.TimeStop=v end,true)
mT(PgE,"Slow Motion",C.SlowMotion,function(v) C.SlowMotion=v end,true)
mT(PgE,"Auto Dodge",C.AutoDodge,function(v) C.AutoDodge=v end,true)

-- === ESP ===
local PgESP=Pg["ESP"]
mT(PgESP,"ESP All",C.ESP_All,function(v) C.ESP_All=v end)
local espMonsters={"Rush","Ambush","Seek","Figure","Screech","Hide","Eyes","Halt","Grumble","Giggle","Blitz","Lookman","Noise","Creak","Scribbles","Teller","Drones","Bash","Monument","Sally","Frozen"}
for _,m in ipairs(espMonsters) do
    local key="ESP_"..m
    if C[key]~=nil then
        mT(PgESP,"ESP "..m,C[key],function(v) C[key]=v end)
    end
end
mT(PgESP,"ESP Doors",C.ESP_Doors,function(v) C.ESP_Doors=v end)
mT(PgESP,"ESP Closets",C.ESP_Closets,function(v) C.ESP_Closets=v end)
mT(PgESP,"ESP Money",C.ESP_Money,function(v) C.ESP_Money=v end)
mT(PgESP,"ESP Keys",C.ESP_Keys,function(v) C.ESP_Keys=v end)
mT(PgESP,"ESP Items",C.ESP_Items,function(v) C.ESP_Items=v end)
mT(PgESP,"ESP Players",C.ESP_Players,function(v) C.ESP_Players=v end)
mT(PgESP,"Smart ESP",C.SmartESP,function(v) C.SmartESP=v end)
mS(PgESP,"Smart Range",50,300,C.SmartRange,function(v) C.SmartRange=v end)
mS(PgESP,"Max Distance",100,1000,C.MaxDistance,function(v) C.MaxDistance=v end)
mS(PgESP,"Fill Transparency",0,1,C.FillTransparency,function(v) C.FillTransparency=v end)
mS(PgESP,"Text Size",8,24,C.TextSize,function(v) C.TextSize=v end)
mS(PgESP,"Update Rate",0.3,3,C.ESPUpdateRate,function(v) C.ESPUpdateRate=v end)

-- === VISUAL ===
local PgV=Pg["Visual"]
mS(PgV,"FOV",40,120,C.FOV,function(v) C.FOV=v end)
mT(PgV,"Third Person",C.ThirdPerson,function(v) C.ThirdPerson=v end)
mT(PgV,"No Fog",C.NoFog,function(v) C.NoFog=v end)
mT(PgV,"Wallhack",C.Wallhack,function(v) C.Wallhack=v end)
mT(PgV,"Chams",C.Chams,function(v) C.Chams=v end)
mT(PgV,"Crosshair",C.Crosshair,function(v) C.Crosshair=v end)
mT(PgV,"Entity Tracker",C.EntityTracker,function(v) C.EntityTracker=v end)
mT(PgV,"Rainbow Mode",C.RainbowMode,function(v) C.RainbowMode=v end)
mT(PgV,"Fun Rainbow",C.FunRainbow,function(v) C.FunRainbow=v end)

-- === MUSIC ===
local PgM=Pg["Music"]
mB(PgM,"Play Music",function()
    if _G.playMusic then _G.playMusic(C.MusicId) end
end)
mB(PgM,"Stop Music",function()
    if _G.stopMusic then _G.stopMusic() end
end)
mS(PgM,"Volume",0,1,C.MusicVolume,function(v) C.MusicVolume=v end)

-- === SOUND ===
local PgS=Pg["Sound"]
mT(PgS,"Notify Sound",C.NotifySound,function(v) C.NotifySound=v end)
mT(PgS,"Rush Warning",C.RushWarning,function(v) C.RushWarning=v end)

-- === MOVE ===
local PgMv=Pg["Move"]
mB(PgMv,"Save Position",function() _G.savePos() end)
mB(PgMv,"TP to Save",function() _G.tpToSave() end)

-- === STATS ===
local PgSt=Pg["Stats"]
mT(PgSt,"Show Timer",C.ShowTimer,function(v) C.ShowTimer=v end)

-- === FEATURES ===
local PgF=Pg["Features"]
mT(PgF,"Auto Aim",C.AutoAim,function(v) C.AutoAim=v end,true)
mT(PgF,"Discord Rich",C.DiscordRich,function(v) C.DiscordRich=v end,true)
mT(PgF,"Auto Rejoin",C.AutoRejoin,function(v) C.AutoRejoin=v end,true)

-- === FARM ===
local PgFa=Pg["Farm"]
mT(PgFa,"Auto Farm",C.AutoFarm,function(v) C.AutoFarm=v end)
mT(PgFa,"Farm Deaths",C.AutoFarmDeaths,function(v) C.AutoFarmDeaths=v end)
mS(PgFa,"Farm Delay",1,10,C.FarmDelay,function(v) C.FarmDelay=v end)
mT(PgFa,"Auto Play Again",C.AutoPlayAgain,function(v) C.AutoPlayAgain=v end)

-- === FUN ===
local PgFu=Pg["Fun"]
mT(PgFu,"Snow",C.Snow,function(v) C.Snow=v end)
mT(PgFu,"Leaves",C.Leaves,function(v) C.Leaves=v end)
mT(PgFu,"Petals",C.Petals,function(v) C.Petals=v end)
mT(PgFu,"Aura Fire",C.AuraFire,function(v) C.AuraFire=v end)
mT(PgFu,"Aura Ice",C.AuraIce,function(v) C.AuraIce=v end)
mT(PgFu,"Fireworks",C.FunFire,function(v) C.FunFire=v end)
mT(PgFu,"Duck Spawn",C.DuckSpawn,function(v) C.DuckSpawn=v end)
mB(PgFu,"Confetti!",function() _G.doConfetti() end)
mB(PgFu,"Random TP",function() _G.randomTP() end)
mB(PgFu,"Fake Death",function() _G.fakeDeath() end)
mB(PgFu,"Chat Spam",function() _G.chatSpam("Burmalda on top!",5) end)

-- === SPAWN ===
local PgSp=Pg["Spawn"]
mB(PgSp,"Spawn Rush",function() _G.spawnRush() end)
mB(PgSp,"Spawn Ambush",function() _G.spawnAmbush() end)
mB(PgSp,"Spawn Seek",function() _G.spawnSeek() end)
mB(PgSp,"Spawn Figure",function() _G.spawnFigure() end)
mB(PgSp,"Spawn Coin",function() _G.spawnCoin() end)
mB(PgSp,"Spawn Key",function() _G.spawnKey() end)

-- === ADMIN (Fake Panel) ===
local PgA=Pg["Admin"]
mB(PgA,"🎭 [FAKE] Kick All",function() _G.fakeAdminAction("Kick All") end,T().danger)
mB(PgA,"🎭 [FAKE] Ban Player",function() _G.fakeAdminAction("Ban Player") end,T().danger)
mB(PgA,"🎭 [FAKE] Server Shutdown",function() _G.fakeAdminAction("Server Shutdown") end,T().danger)
mB(PgA,"🎭 [FAKE] Give Godmode",function() _G.fakeAdminAction("Give Godmode") end,T().danger)
mB(PgA,"🎭 [FAKE] Give Flashlight",function() _G.fakeAdminGiveItem("Flashlight") end)
mB(PgA,"🎭 [FAKE] Give Lockpick",function() _G.fakeAdminGiveItem("Lockpick") end)
mB(PgA,"🎭 [FAKE] Give Bandage",function() _G.fakeAdminGiveItem("Bandage") end)
mB(PgA,"🎭 [FAKE] Give Vitamins",function() _G.fakeAdminGiveItem("Vitamins") end)
mB(PgA,"🎭 [FAKE] Give Crucifix",function() _G.fakeAdminGiveItem("Crucifix") end)

-- === MOBILE ===
local PgMb=Pg["Mobile"]
mT(PgMb,"Show Mobile Buttons",true,function(v) end)

-- === ANTIDET ===
local PgAD=Pg["AntiDet"]
mT(PgAD,"Anti-Detection",C.AntiDetect,function(v) C.AntiDetect=v end,true)
mT(PgAD,"Safe Mode",C.SafeMode,function(v) C.SafeMode=v end,true)
mS(PgAD,"Bypass Delay",0.05,1,C.BypassDelay,function(v) C.BypassDelay=v end)

-- === HOTEL ===
local PgH=Pg["Hotel"]
mT(PgH,"Auto Breaker",C.AutoBreaker,function(v) C.AutoBreaker=v end)

-- === MINES ===
local PgMi=Pg["Mines"]
mT(PgMi,"Mines Auto-Steer",C.AutoSeek,function(v) C.AutoSeek=v end)

-- === ARCHIVES ===
local PgAr=Pg["Archives"]
mT(PgAr,"Time Shower",C.TimeShower,function(v) C.TimeShower=v end)
mT(PgAr,"Anti Ransom",C.AntiRansom,function(v) C.AntiRansom=v end)
mT(PgAr,"Anti Closet Trash",C.AntiClosetTrash,function(v) C.AntiClosetTrash=v end)
mT(PgAr,"Forget Me Not Skipper",C.ForgetMeNot,function(v) C.ForgetMeNot=v end)
mT(PgAr,"Honcho ESP",C.HonchoESP,function(v) C.HonchoESP=v end)

-- === SETTINGS ===
local PgSett=Pg["Settings"]
mS(PgSett,"UI Scale",0.5,2,C.UI_Scale,function(v) C.UI_Scale=v end)
mB(PgSett,"Save Config",function() _G.sv(); N("Saved!") end)
mB(PgSett,"Load Config",function() _G.ld(); N("Loaded!") end)

-- === INFO ===
local PgI=Pg["Info"]
mB(PgI,"Burmalda v13 | KOTENOK7204",function()
    N("Burmalda v13 FINAL — by KOTENOK7204, tester Kostya_2015KostyaKos")
end)

-- ═══ Стартовый экран: кнопки этажей ═══
local function mkFB(txt,y,fn)
    local b=Instance.new("TextButton",FM)
b.Size=UDim2.new(0,270,0,32)
    b.Position=UDim2.new(0.5,-135,0,y)
    b.BackgroundColor3=Color3.fromRGB(40,40,45)
    b.Text=txt
    b.TextColor3=Color3.fromRGB(240,240,245)
    b.Font=Enum.Font.GothamBold
    b.TextSize=12
    b.BorderSizePixel=0
    local c=Instance.new("UICorner",b); c.CornerRadius=UDim.new(0,6)
    local s=Instance.new("UIStroke",b); s.Color=Color3.fromRGB(120,20,40); s.Thickness=1
    b.MouseButton1Click:Connect(function()
        _G.MF=fn
        FS:Destroy()
        M.Visible=true
        OB.Text="X"
        N("Floor: "..fn)
    end)
end

mkFB("Hotel",118,"Hotel")
mkFB("Mines",155,"Mines")
mkFB("Backdoor",192,"Backdoor")
mkFB("Outdoors",229,"Outdoors")
mkFB("Archives",266,"Archives")
mkFB("Stairwell",303,"Stairwell")

-- ═══ Автосохранение ═══
task.spawn(function()
    while task.wait(30) do
        if C.AutoSave and _G.sv then pcall(_G.sv) end
    end
end)

print("[Burmalda v13] Part 8/8 — GUI loaded. Script ready!")
print("[Burmalda v13] By KOTENOK7204 | Tester: Kostya_2015KostyaKos")
