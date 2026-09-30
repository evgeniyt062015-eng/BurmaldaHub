-- BURMALDA v15.1 | Part 1/14 — CORE
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

-- ═══════════════════════════════════════════════
-- CONFIG
-- ═══════════════════════════════════════════════
_G.C={
    SpeedEnabled=false,WalkSpeed=22,SpeedBoost=0,JumpPower=50,
    InfiniteJumps=false,EnableJump=false,EnableSlide=false,BunnyHop=false,
    Fly=false,FlySpeed=50,Noclip=false,
    RemoveClosetDelay=false,RemoveAccel=false,
    DoorReach=false,InstantPrompts=false,PromptClip=false,PromptReach=1,
    DisableIdleKick=false,
    AutoBreaker=false,AutoInteract=false,AutoInteractDoors=true,AutoInteractClosets=true,AutoInteractAnchors=true,AutoInteractItems=true,
    AutoCollect=false,AutoCoins=false,AutoDoor=false,AutoSeekDoor=false,SeekEscape=false,AutoPlatform=false,PlatformSize=5,
    AutoPlayAgain=false,AutoCompleteRoom=false,AutoNextRoom=false,AutoSkipCutscene=false,AutoCollectAll=false,AutoEquipBest=false,
    AutoHideRush=false,AutoHideAmbush=false,AutoHideAll=false,AutoClosetMode="same-room",
    TPItemRadius=200,
    InfiniteHide=false,HideLock=false,AutoReHide=false,
    InfiniteItems=false,GodRusher=false,EntityFreeze=false,EntityTeleport=false,
    Speed10x=false,MaxStats=false,Invisible=false,TimeStop=false,SlowMotion=false,
    AutoDodge=false,GodMode=false,
    BypassScreech=false,BypassHalt=false,BypassEyes=false,BypassLookman=false,
    BypassSnare=false,BypassKillbricks=false,BypassSeekingWall=false,
    BypassBanana=false,BypassGiggle=false,BypassDupe=false,BypassVacuum=false,
    BypassGloombatEggs=false,BypassSeekObstructions=false,BypassJeff=false,
    BypassRush=false,BypassAmbush=false,BypassSeek=false,BypassFigure=false,
    BypassGrumble=false,BypassGiggleArc=false,BypassDrones=false,
    BypassElectricWater=false,BypassAlma=false,BypassScribbles=false,
    RemoveScreech=false,RemoveHalt=false,RemoveA90=false,RemoveDread=false,RemoveSurge=false,
    NoScreechDamage=false,NoHaltDamage=false,NoA90Damage=false,
    AnticheatBypass=false,VelocityManipulation=false,
    AntiRansom=false,AntiClosetTrash=false,AntiNoise=false,NoiseTVBreaker=false,
    RemovePaintingsDoor=false,RemoveSkeletonDoor=false,
    PathfindTimeout=1,IgnoreA60=false,SpoofFootsteps=false,
    FigureInvisible=false,
    ESP_All=false,ESP_Rush=false,ESP_Ambush=false,ESP_Seek=false,ESP_Figure=false,
    ESP_Screech=false,ESP_Eyes=false,ESP_Halt=false,ESP_Grumble=false,ESP_Giggle=false,
    ESP_Blitz=false,ESP_Lookman=false,ESP_Doors=false,ESP_Closets=false,
    ESP_Money=false,ESP_Keys=false,ESP_Items=false,ESP_Ladders=false,
    ESP_Chests=false,ESP_Objectives=false,ESP_Players=false,ESP_Breaker=false,
    ESPColor=Color3.fromRGB(180,30,30),
    DoorColor=Color3.fromRGB(50,150,255),
    ClosetColor=Color3.fromRGB(80,220,80),
    MoneyColor=Color3.fromRGB(255,215,0),
    KeyColor=Color3.fromRGB(255,255,100),
    ItemColor=Color3.fromRGB(180,100,255),
    PlayerColor=Color3.fromRGB(100,255,150),
    ChestColor=Color3.fromRGB(255,150,50),
    ObjectiveColor=Color3.fromRGB(0,200,255),
    BreakerColor=Color3.fromRGB(255,255,0),
    MaxDistance=500,RainbowMode=false,XRay=true,ShowDistance=true,
    FillTransparency=0.55,TextSize=12,ESPUpdateRate=1.0,
    SmartESP=false,SmartRange=100,
    NotifyEntities=false,
    FOV=70,CustomFOV=0,ThirdPerson=false,NoFog=false,
    Wallhack=false,Chams=false,ChamsColor=Color3.fromRGB(255,0,0),
    Crosshair=false,CrosshairColor=Color3.fromRGB(255,0,0),CrosshairSize=20,
    CrosshairStyle="cross",
    EntityTracker=false,FunRainbow=false,
    AmbientColor=Color3.fromRGB(128,128,128),
    Fullbright=false,
    RemoveCameraShake=false,RemoveCameraBobbing=false,RemoveCutscenes=false,
    Hitmarker=false,DamageNumbers=false,DangerMeter=false,
    ShowSeekPath=false,
    BoxESP=false,BoxColor=Color3.fromRGB(255,0,0),BoxThickness=1.5,BoxFill=false,
    SkeletonESP=false,SkeletonColor=Color3.fromRGB(255,255,255),
    Tracers=false,TracerColor=Color3.fromRGB(255,0,0),TracerThickness=1,TracerOrigin="Bottom",
    LightColor=Color3.fromRGB(255,255,255),LightBrightness=2,
    MusicId="",MusicPlaying=false,MusicVolume=0.5,
    NotifySound=true,NotifySoundVolume=0.6,
    NotifyLoading=true,
    NotifyEntitiesSwitch=false,
    NotifyItems=false,
    NotifyErrors=true,
    NotifyActions=false,
    NotifyOnlyImportant=false,
    NotifyPosition="BottomRight",
    NotifyDuration=4,
    RushWarning=false,AmbushWarning=false,SeekWarning=false,HaltWarning=false,
    NotifyLibraryCode=false,NotifyOxygenLevel=false,NotifyHasteTime=false,
    RemoveFootstepSounds=false,RemoveJamminMusic=false,RemoveInteractingSounds=false,
    KnobFarm=false,AutoFarmDeaths=false,FarmDelay=3,
    AutoCompleteDamSeek=false,AutoCompleteCringle=false,
    Snow=false,Leaves=false,Petals=false,AuraFire=false,AuraIce=false,
    Fireworks=false,Confetti=false,DuckSpawn=false,DuckCount=100,
    FunDisco=false,RandomTP=false,FakeDeath=false,
    FPSBooster=false,LowGraphics=false,RemoveParticles=false,
    RemoveLights=false,RemoveDecals=false,RemoveShadows=false,
    RemoveDistant=false,RemoveInvisible=false,RemoveAnimations=false,
    DisableSound=false,ShowFPS=false,ShowPing=false,
    Theme="GrayBlack",UI_Scale=1,UI_Opacity=1,
    AntiAFK=true,AntiDetect=false,SafeMode=false,BypassDelay=0.1,
    AutoRejoin=false,AutoAim=false,DiscordRich=false,
    Configs={},SelectedConfig="default",Favorites={},
}
local C=_G.C

-- ═══════════════════════════════════════════════
-- THEMES
-- ═══════════════════════════════════════════════
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

-- ═══════════════════════════════════════════════
-- КРАСИВЫЕ УВЕДОМЛЕНИЯ (MM2 MEGA стиль)
-- ═══════════════════════════════════════════════
local NotifGui=Instance.new("ScreenGui")
NotifGui.Name="BurmaldaNotifs"
NotifGui.ResetOnSpawn=false
NotifGui.DisplayOrder=1000
NotifGui.IgnoreGuiInset=false
NotifGui.Parent=LP:WaitForChild("PlayerGui")

local notifList={}

local NOTIF_COLORS={
    success=Color3.fromRGB(80,220,120),
    error=Color3.fromRGB(255,70,70),
    warn=Color3.fromRGB(255,200,50),
    info=Color3.fromRGB(80,150,255)
}

local NOTIF_ICONS={
    success="rbxassetid://6031091004",
    error="rbxassetid://6031090990",
    warn="rbxassetid://6031090994",
    info="rbxassetid://6031280882"
}

local function getNotifPositionY()
    return #notifList
end

local function repositionNotifs()
    for i,n in ipairs(notifList) do
        local targetY
        if C.NotifyPosition=="BottomRight" or C.NotifyPosition=="BottomLeft" then
            targetY=-40-((#notifList-i)*78)
        else
            targetY=40+((i-1)*78)
        end
        local targetX
        if C.NotifyPosition=="BottomRight" or C.NotifyPosition=="TopRight" then
            targetX=-330
        else
            targetX=10
        end
        pcall(function()
            TS:Create(n,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
                Position=UDim2.new(
                    (C.NotifyPosition=="BottomLeft" or C.NotifyPosition=="TopLeft") and 0 or 1,
                    (C.NotifyPosition=="BottomLeft" or C.NotifyPosition=="TopLeft") and 10 or targetX,
                    (C.NotifyPosition=="BottomRight" or C.NotifyPosition=="BottomLeft") and 1 or 0,
                    targetY
                )
            }):Play()
        end)
    end
end

_G.N=function(title, text, notifType)
    -- Если 1 аргумент — только текст
    if text==nil or type(text)~="string" then
        notifType=text
        text=title
        title="Burmalda"
    end
    -- Дефолт
    notifType=notifType or "info"
    
    -- Проверка тумблеров
    if notifType=="info" and not C.NotifyLoading then return end
    if notifType=="error" and not C.NotifyErrors then return end
    if notifType=="success" and not C.NotifyLoading then return end
    if notifType=="warn" and C.NotifyOnlyImportant then return end
    
    local col=NOTIF_COLORS[notifType] or NOTIF_COLORS.info
    local icon=NOTIF_ICONS[notifType] or NOTIF_ICONS.info
    local dur=C.NotifyDuration or 4
    
    local frame=Instance.new("Frame")
    frame.Size=UDim2.new(0,320,0,70)
    frame.AnchorPoint=Vector2.new(0,0)
    
    -- Позиция по настройке
    if C.NotifyPosition=="BottomRight" then
        frame.Position=UDim2.new(1,340,1,-40)
    elseif C.NotifyPosition=="BottomLeft" then
        frame.Position=UDim2.new(0,-340,1,-40)
    elseif C.NotifyPosition=="TopRight" then
        frame.Position=UDim2.new(1,340,0,40)
    else
        frame.Position=UDim2.new(0,-340,0,40)
    end
    
    frame.BackgroundColor3=Color3.fromRGB(15,15,20)
    frame.BackgroundTransparency=0.05
    frame.BorderSizePixel=0
    frame.Parent=NotifGui
    
    local c=Instance.new("UICorner",frame)
    c.CornerRadius=UDim.new(0,10)
    
    local s=Instance.new("UIStroke",frame)
    s.Color=col
    s.Thickness=1.5
    
    -- Иконка
    local iconImg=Instance.new("ImageLabel",frame)
    iconImg.Size=UDim2.new(0,36,0,36)
    iconImg.Position=UDim2.new(0,15,0.5,-18)
    iconImg.BackgroundTransparency=1
    iconImg.Image=icon
    iconImg.ImageColor3=col
    iconImg.ScaleType=Enum.ScaleType.Fit
    
    -- Заголовок
    local titleLbl=Instance.new("TextLabel",frame)
    titleLbl.Size=UDim2.new(1,-75,0,18)
    titleLbl.Position=UDim2.new(0,65,0,12)
    titleLbl.BackgroundTransparency=1
    titleLbl.Text=title
    titleLbl.TextColor3=col
    titleLbl.Font=Enum.Font.GothamBold
    titleLbl.TextSize=13
    titleLbl.TextXAlignment=Enum.TextXAlignment.Left
    
    -- Текст
    local descLbl=Instance.new("TextLabel",frame)
    descLbl.Size=UDim2.new(1,-75,0,20)
    descLbl.Position=UDim2.new(0,65,0,33)
    descLbl.BackgroundTransparency=1
    descLbl.Text=tostring(text)
    descLbl.TextColor3=Color3.fromRGB(240,240,245)
    descLbl.Font=Enum.Font.Gotham
    descLbl.TextSize=11
    descLbl.TextXAlignment=Enum.TextXAlignment.Left
    descLbl.TextWrapped=true
    
    -- Полоска слева
    local bar=Instance.new("Frame",frame)
    bar.Size=UDim2.new(0,4,0.8,0)
    bar.Position=UDim2.new(0,0,0.1,0)
    bar.BackgroundColor3=col
    bar.BorderSizePixel=0
    local bc=Instance.new("UICorner",bar)
    bc.CornerRadius=UDim.new(0,10)
    
    -- Прогресс-бар (шкала снизу)
    local progBG=Instance.new("Frame",frame)
    progBG.Size=UDim2.new(1,-20,0,3)
    progBG.Position=UDim2.new(0,10,1,-8)
    progBG.BackgroundColor3=Color3.fromRGB(40,40,50)
    progBG.BorderSizePixel=0
    local pbc=Instance.new("UICorner",progBG)
    pbc.CornerRadius=UDim.new(1,0)
    
    local prog=Instance.new("Frame",progBG)
    prog.Size=UDim2.new(0,0,1,0)
    prog.BackgroundColor3=col
    prog.BorderSizePixel=0
    local pc=Instance.new("UICorner",prog)
    pc.CornerRadius=UDim.new(1,0)
    
    table.insert(notifList,frame)
    
    -- Анимация появления
    local startPos, endPos
    if C.NotifyPosition=="BottomRight" then
        startPos=UDim2.new(1,340,1,frame.Position.Y.Offset)
        endPos=UDim2.new(1,-330,1,frame.Position.Y.Offset)
    elseif C.NotifyPosition=="BottomLeft" then
        startPos=UDim2.new(0,-340,1,frame.Position.Y.Offset)
        endPos=UDim2.new(0,10,1,frame.Position.Y.Offset)
    elseif C.NotifyPosition=="TopRight" then
        startPos=UDim2.new(1,340,0,frame.Position.Y.Offset)
        endPos=UDim2.new(1,-330,0,frame.Position.Y.Offset)
    else
        startPos=UDim2.new(0,-340,0,frame.Position.Y.Offset)
        endPos=UDim2.new(0,10,0,frame.Position.Y.Offset)
    end
    
    frame.Position=startPos
    TS:Create(frame,TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=endPos}):Play()
    
    -- Прогресс-бар
    TS:Create(prog,TweenInfo.new(dur,Enum.EasingStyle.Linear),{Size=UDim2.new(1,0,1,0)}):Play()
    
    -- Звук
    if C.NotifySound then
        pcall(function()
            local s=Instance.new("Sound",SS)
            s.SoundId="rbxassetid://8784885431"
            s.Volume=C.NotifySoundVolume or 0.6
            s:Play()
            task.delay(1,function() s:Destroy() end)
        end)
    end
    
    -- Удаление
    task.delay(dur,function()
        for i,n in ipairs(notifList) do
            if n==frame then
                table.remove(notifList,i)
                break
            end
        end
        local endPos2
        if C.NotifyPosition=="BottomRight" then
            endPos2=UDim2.new(1,340,1,frame.Position.Y.Offset)
        elseif C.NotifyPosition=="BottomLeft" then
            endPos2=UDim2.new(0,-340,1,frame.Position.Y.Offset)
        elseif C.NotifyPosition=="TopRight" then
            endPos2=UDim2.new(1,340,0,frame.Position.Y.Offset)
        else
            endPos2=UDim2.new(0,-340,0,frame.Position.Y.Offset)
        end
        TS:Create(frame,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position=endPos2}):Play()
        task.wait(0.35)
        frame:Destroy()
        repositionNotifs()
    end)
end

_G.TTS=function(text)
    _G.N("Burmalda", tostring(text), "warn")
end

-- ═══════════════════════════════════════════════
-- SAVE / LOAD
-- ═══════════════════════════════════════════════
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

print("[Burmalda v15.1] Part 1/14 — CORE loaded")
