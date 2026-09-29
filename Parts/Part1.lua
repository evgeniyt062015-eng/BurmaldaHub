-- BURMALDA v15 | Part 1/14 — CORE
-- By KOTENOK7204 | Tester: Kostya_2015KostyaKos

local P=game:GetService("Players")
local RS=game:GetService("ReplicatedStorage")
local Run=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local HS=game:GetService("HttpService")
local VU=game:GetService("VirtualUser")
local SS=game:GetService("SoundService")
local Lighting=game:GetService("Lighting")
local TS=game:GetService("TweenService")
local Debris=game:GetService("Debris")
local LP=P.LocalPlayer

local function findRemote()
    local names={"RemotesFolder","EntityInfo","Bricks","Remotes"}
    for _,n in ipairs(names) do
        local o=RS:FindFirstChild(n)
        if o then return o end
    end
    return nil
end

local RF=findRemote()
local GD=RS:FindFirstChild("GameData")
local CR=workspace:FindFirstChild("CurrentRooms")

local CF="Hotel"
local MF=nil
pcall(function()
    if GD and GD:FindFirstChild("Floor") then
        CF=GD.Floor.Value
    end
end)

_G.P=P
_G.RS=RS
_G.Run=Run
_G.UIS=UIS
_G.HS=HS
_G.VU=VU
_G.SS=SS
_G.Lighting=Lighting
_G.TS=TS
_G.Debris=Debris
_G.LP=LP
_G.RF=RF
_G.GD=GD
_G.CR=CR
_G.CF=CF
_G.MF=MF

_G.gF=function() return _G.MF or _G.CF end

_G.C={
    -- Character
    SpeedEnabled=false,WalkSpeed=22,SpeedBoost=0,JumpPower=50,
    InfiniteJumps=false,EnableJump=false,EnableSlide=false,BunnyHop=false,
    Fly=false,FlySpeed=50,Noclip=false,
    RemoveClosetDelay=false,RemoveAccel=false,
    DoorReach=false,InstantPrompts=false,PromptClip=false,PromptReach=1,
    DisableIdleKick=false,
    -- Auto
    AutoBreaker=false,AutoInteract=false,AutoCollect=false,AutoCoins=false,
    AutoDoor=false,AutoSeekDoor=false,SeekEscape=false,AutoPlatform=false,PlatformSize=5,
    AutoPlayAgain=false,AutoCompleteRoom=false,AutoNextRoom=false,AutoSkipCutscene=false,
    AutoCollectAll=false,AutoEquipBest=false,
    AutoInteractItems=true,AutoInteractDoors=true,AutoInteractClosets=true,AutoInteractAnchors=true,
    AutoHideRush=false,AutoHideAmbush=false,AutoHideAll=false,
    AutoClosetMode="same-room",
    -- TP
    TPItemRadius=200,
    -- Hide
    InfiniteHide=false,HideLock=false,AutoReHide=false,
    -- Exploits
    InfiniteItems=false,GodRusher=false,EntityFreeze=false,EntityTeleport=false,
    Speed10x=false,MaxStats=false,Invisible=false,TimeStop=false,SlowMotion=false,
    AutoDodge=false,GodMode=false,
    -- Bypass (базовые)
    BypassScreech=false,BypassHalt=false,BypassEyes=false,BypassLookman=false,
    BypassSnare=false,BypassKillbricks=false,BypassSeekingWall=false,
    BypassBanana=false,BypassGiggle=false,BypassDupe=false,BypassVacuum=false,
    BypassGloombatEggs=false,BypassSeekObstructions=false,BypassJeff=false,
    BypassRush=false,BypassAmbush=false,BypassSeek=false,BypassFigure=false,
    BypassGrumble=false,BypassGiggleArc=false,BypassDrones=false,
    -- Bypass (Abysall)
    BypassElectricWater=false,BypassAlma=false,BypassScribbles=false,
    RemoveScreech=false,RemoveHalt=false,RemoveA90=false,RemoveDread=false,RemoveSurge=false,
    NoScreechDamage=false,NoHaltDamage=false,NoA90Damage=false,
    AnticheatBypass=false,VelocityManipulation=false,
    AntiRansom=false,AntiClosetTrash=false,AntiNoise=false,NoiseTVBreaker=false,
    RemovePaintingsDoor=false,RemoveSkeletonDoor=false,
    PathfindTimeout=1,IgnoreA60=false,SpoofFootsteps=false,
    -- Visual
    ESP_All=false,ESP_Rush=false,ESP_Ambush=false,ESP_Seek=false,ESP_Figure=false,
    ESP_Screech=false,ESP_Eyes=false,ESP_Halt=false,ESP_Grumble=false,ESP_Giggle=false,
    ESP_Blitz=false,ESP_Lookman=false,ESP_Doors=false,ESP_Closets=false,
    ESP_Money=false,ESP_Keys=false,ESP_Items=false,ESP_Ladders=false,
    ESP_Chests=false,ESP_Objectives=false,ESP_Players=false,
    ESPColor=Color3.fromRGB(180,30,30),
    DoorColor=Color3.fromRGB(120,20,40),
    ClosetColor=Color3.fromRGB(100,255,100),
    MoneyColor=Color3.fromRGB(255,215,0),
    KeyColor=Color3.fromRGB(255,255,100),
    ItemColor=Color3.fromRGB(255,220,50),
    PlayerColor=Color3.fromRGB(255,255,0),
    MaxDistance=500,RainbowMode=false,XRay=true,ShowDistance=true,
    FillTransparency=0.55,TextSize=12,ESPUpdateRate=1.0,
    SmartESP=false,SmartRange=100,
    -- Visual 2
    FOV=70,CustomFOV=0,ThirdPerson=false,NoFog=false,
    Wallhack=false,Chams=false,ChamsColor=Color3.fromRGB(255,0,0),
    Crosshair=false,CrosshairColor=Color3.fromRGB(255,0,0),CrosshairSize=20,
    EntityTracker=false,FunRainbow=false,
    AmbientColor=Color3.fromRGB(128,128,128),
    RemoveCameraShake=false,RemoveCameraBobbing=false,RemoveCutscenes=false,
    XOffset=1.5,YOffset=1,
    ShowPath=false,ShowSeekPath=false,ShowEyestalkPath=false,
    Hitmarker=false,DamageNumbers=false,DangerMeter=false,
    LightColor=Color3.fromRGB(255,255,255),LightBrightness=2,
    -- Music/Sound
    MusicId="",MusicPlaying=false,MusicVolume=0.5,
    NotifySound=true,NotifySoundVolume=0.6,
    RushWarning=false,AmbushWarning=false,SeekWarning=false,HaltWarning=false,
    NotifyEntities=false,NotifyItems=false,
    NotifyLibraryCode=false,NotifyOxygenLevel=false,NotifyHasteTime=false,
    RemoveFootstepSounds=false,RemoveJamminMusic=false,RemoveInteractingSounds=false,
    -- Farm
    KnobFarm=false,AutoFarmDeaths=false,FarmDelay=3,
    AutoCompleteDamSeek=false,AutoCompleteCringle=false,
    -- Fun
    Snow=false,Leaves=false,Petals=false,AuraFire=false,AuraIce=false,
    Fireworks=false,Confetti=false,DuckSpawn=false,DuckCount=100,
    FunDisco=false,RandomTP=false,FakeDeath=false,
    -- FPS
    FPSBooster=false,LowGraphics=false,RemoveParticles=false,
    RemoveLights=false,RemoveDecals=false,RemoveShadows=false,
    RemoveDistant=false,RemoveInvisible=false,RemoveAnimations=false,
    DisableSound=false,ShowFPS=false,ShowPing=false,
    -- GUI
    Theme="GrayBlack",UI_Scale=1,UI_Opacity=1,
    MenuMinimized=false,MenuLocked=false,
    SearchOpen=false,
    -- Misc
    AntiAFK=true,AntiDetect=false,SafeMode=false,BypassDelay=0.1,
    AutoRejoin=false,AutoAim=false,
    Configs={},SelectedConfig="default",
    Favorites={},
}
local C=_G.C

_G.Th={
    GrayBlack={bg=Color3.fromRGB(20,20,25),panel=Color3.fromRGB(40,40,45),accent=Color3.fromRGB(120,20,40),text=Color3.fromRGB(240,240,245),danger=Color3.fromRGB(180,30,30)},
    Black={bg=Color3.fromRGB(10,10,12),panel=Color3.fromRGB(25,25,28),accent=Color3.fromRGB(120,20,40),text=Color3.fromRGB(230,230,235),danger=Color3.fromRGB(180,30,30)},
    Blood={bg=Color3.fromRGB(25,10,10),panel=Color3.fromRGB(45,15,15),accent=Color3.fromRGB(220,40,40),text=Color3.fromRGB(255,230,230),danger=Color3.fromRGB(200,40,40)},
    Toxic={bg=Color3.fromRGB(10,25,15),panel=Color3.fromRGB(20,45,30),accent=Color3.fromRGB(50,220,100),text=Color3.fromRGB(230,255,235),danger=Color3.fromRGB(180,30,30)},
    Gold={bg=Color3.fromRGB(30,25,10),panel=Color3.fromRGB(50,40,15),accent=Color3.fromRGB(255,200,50),text=Color3.fromRGB(255,245,220),danger=Color3.fromRGB(180,30,30)},
    Neon={bg=Color3.fromRGB(5,5,15),panel=Color3.fromRGB(15,15,35),accent=Color3.fromRGB(0,255,180),text=Color3.fromRGB(220,255,250),danger=Color3.fromRGB(180,30,30)},
    Cyberpunk={bg=Color3.fromRGB(15,5,30),panel=Color3.fromRGB(30,10,55),accent=Color3.fromRGB(255,0,200),text=Color3.fromRGB(0,255,255),danger=Color3.fromRGB(180,30,30)}
}
local Th=_G.Th

_G.T=function() return Th[C.Theme] or Th.GrayBlack end

-- ═══ СВОЙ GUI ДЛЯ УВЕДОМЛЕНИЙ ═══
local NotifGui=Instance.new("ScreenGui")
NotifGui.Name="BurmaldaNotifs"
NotifGui.ResetOnSpawn=false
NotifGui.DisplayOrder=999
NotifGui.Parent=LP:WaitForChild("PlayerGui")

local notifList={}

_G.N=function(text)
    local frame=Instance.new("Frame")
    frame.Size=UDim2.new(0,300,0,55)
    frame.Position=UDim2.new(1,310,0,60)
    frame.BackgroundColor3=Color3.fromRGB(20,20,25)
    frame.BackgroundTransparency=0.1
    frame.BorderSizePixel=0
    frame.Parent=NotifGui
    
    local c=Instance.new("UICorner",frame)
    c.CornerRadius=UDim.new(0,8)
    
    local s=Instance.new("UIStroke",frame)
    s.Color=Color3.fromRGB(180,30,30)
    s.Thickness=2
    
    local bar=Instance.new("Frame",frame)
    bar.Size=UDim2.new(0,4,1,0)
    bar.BackgroundColor3=Color3.fromRGB(180,30,30)
    bar.BorderSizePixel=0
    
    local barC=Instance.new("UICorner",bar)
    barC.CornerRadius=UDim.new(0,8)
    
    local title=Instance.new("TextLabel",frame)
    title.Size=UDim2.new(1,-20,0,20)
    title.Position=UDim2.new(0,15,0,5)
    title.BackgroundTransparency=1
    title.Text="Burmalda v15"
    title.TextColor3=Color3.fromRGB(180,30,30)
    title.Font=Enum.Font.GothamBold
    title.TextSize=11
    title.TextXAlignment=Enum.TextXAlignment.Left
    
    local desc=Instance.new("TextLabel",frame)
    desc.Size=UDim2.new(1,-20,0,20)
    desc.Position=UDim2.new(0,15,0,27)
    desc.BackgroundTransparency=1
    desc.Text=tostring(text)
    desc.TextColor3=Color3.fromRGB(240,240,245)
    desc.Font=Enum.Font.Gotham
    desc.TextSize=10
    desc.TextXAlignment=Enum.TextXAlignment.Left
    desc.TextWrapped=true
    
    table.insert(notifList,frame)
    
    -- Пересчёт позиций
    for i,notif in ipairs(notifList) do
        notif.Position=UDim2.new(1,310,0,60+(i-1)*65)
    end
    
    -- Анимация появления
    TS:Create(frame,TweenInfo.new(0.3,Enum.EasingStyle.Quad),{Position=UDim2.new(1,-310,0,frame.Position.Y.Offset)}):Play()
    
    -- Удаление
    task.delay(4,function()
        TS:Create(frame,TweenInfo.new(0.3,Enum.EasingStyle.Quad),{Position=UDim2.new(1,310,0,frame.Position.Y.Offset)}):Play()
        task.wait(0.35)
        for i,n in ipairs(notifList) do
            if n==frame then
                table.remove(notifList,i)
                break
            end
        end
        frame:Destroy()
        for i,notif in ipairs(notifList) do
            TS:Create(notif,TweenInfo.new(0.2),{Position=UDim2.new(1,-310,0,60+(i-1)*65)}):Play()
        end
    end)
end

_G.TTS=function(text)
    pcall(function()
        if C.NotifySound then
            local s=Instance.new("Sound",SS)
            s.SoundId="rbxassetid://8784885431"
            s.Volume=C.NotifySoundVolume
            s:Play()
            task.delay(2,function() s:Destroy() end)
        end
    end)
    _G.N(text)
end

-- ═══ SAVE/LOAD ═══
local CFG="BurmaldaV15.json"

_G.sv=function()
    pcall(function()
        local d={}
        for k,v in pairs(C) do
            if type(v)=="Color3" then
                d[k]={__c=true,r=v.R,g=v.G,b=v.B}
            elseif type(v)~="table" then
                d[k]=v
            end
        end
        writefile(CFG,HS:JSONEncode(d))
    end)
end

_G.ld=function()
    pcall(function()
        if isfile and isfile(CFG) then
            local d=HS:JSONDecode(readfile(CFG))
            for k,v in pairs(d) do
                if type(v)=="table" and v.__c then
                    C[k]=Color3.new(v.r,v.g,v.b)
                else
                    C[k]=v
                end
            end
        end
    end)
end

_G.ld()

print("[Burmalda v15] Part 1/14 — CORE loaded")
