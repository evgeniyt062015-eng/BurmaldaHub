-- BURMALDA v14 | Part 1/8 — CORE
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
_G.LP=LP
_G.RF=RF
_G.GD=GD
_G.CR=CR
_G.CF=CF
_G.MF=MF

_G.gF=function() return _G.MF or _G.CF end

_G.C={
    SpeedEnabled=false,WalkSpeed=22,SpeedBoost=0,JumpPower=50,
    InfiniteJumps=false,EnableJump=false,EnableSlide=false,BunnyHop=false,
    Fly=false,FlySpeed=50,Noclip=false,
    RemoveClosetDelay=false,RemoveAccel=false,
    DoorReach=false,InstantPrompts=false,PromptClip=false,PromptReach=1,
    DisableIdleKick=false,
    AutoBreaker=false,AutoInteract=false,AutoCloset=false,
    AutoCollect=false,AutoCoins=false,AutoDoor=false,AutoSeek=false,
    AutoPlay=false,AutoPickupAll=false,AutoSolve=false,AutoRevive=false,AutoBuy=false,
    TPItemRadius=200,BringItems=false,BringRadius=100,
    InfiniteHide=false,HideLock=false,AutoReHide=false,
    InfiniteItems=false,GodRusher=false,EntityFreeze=false,EntityTeleport=false,
    Speed10x=false,MaxStats=false,Invisible=false,TimeStop=false,SlowMotion=false,
    AutoPlatform=false,PlatformSize=5,
    BypassScreech=false,BypassHalt=false,BypassEyes=false,BypassLookman=false,
    BypassSnare=false,BypassKillbricks=false,BypassSeekingWall=false,
    BypassBanana=false,BypassGiggle=false,BypassDupe=false,BypassVacuum=false,
    BypassGloombatEggs=false,BypassSeekObstructions=false,BypassJeff=false,
    BypassRush=false,BypassAmbush=false,BypassSeek=false,BypassFigure=false,
    BypassGrumble=false,BypassGiggleArc=false,BypassDrones=false,
    AntiRansom=false,AntiClosetTrash=false,ForgetMeNot=false,
    HonchoESP=false,TimeShower=false,FigureInvisible=false,AutoCrouch=false,
    GodMode=false,InfiniteRevive=false,AutoDodge=false,
    AutoHideRush=false,AutoHideAmbush=false,AutoHideAll=false,
    AdaptiveSpeed=false,PredictiveHide=false,SmartPath=false,AntiAFK=true,
    ESP_All=false,ESP_Rush=false,ESP_Ambush=false,ESP_Seek=false,ESP_Figure=false,
    ESP_Screech=false,ESP_Hide=false,ESP_Eyes=false,ESP_Halt=false,
    ESP_Grumble=false,ESP_Giggle=false,ESP_Blitz=false,ESP_Lookman=false,
    ESP_Noise=false,ESP_Creak=false,ESP_Scribbles=false,ESP_Teller=false,
    ESP_Drones=false,ESP_Bash=false,ESP_Monument=false,ESP_Sally=false,ESP_Frozen=false,
    ESP_Doors=false,ESP_Closets=false,ESP_Money=false,ESP_Keys=false,
    ESP_Items=false,ESP_Ladders=false,ESP_Players=false,ESP_Library=false,
    ESP_Breaker=false,ESP_Elevators=false,ESP_Chests=false,ESP_Paintings=false,
    ESP_Minecart=false,ESP_Rails=false,ESP_Turns=false,ESP_Pits=false,
    ESP_Lava=false,ESP_Bombs=false,ESP_Objectives=false,
    ESPColor=Color3.fromRGB(180,30,30),
    DoorColor=Color3.fromRGB(120,20,40),
    ClosetColor=Color3.fromRGB(100,255,100),
    MaxDistance=500,RainbowMode=false,XRay=true,ShowDistance=true,
    FillTransparency=0.55,TextSize=12,ESPUpdateRate=1.5,
    Theme="GrayBlack",AutoSave=true,BypassDelay=0.1,
    NotifyMonsters=false,NotifyItems=false,NotifySound=true,
    RushWarning=false,AmbushWarning=false,SeekWarning=false,HaltWarning=false,
    RushTracer=false,
    LightColor=Color3.fromRGB(255,255,255),LightBrightness=2,
    Crosshair=false,CrosshairColor=Color3.fromRGB(255,0,0),CrosshairSize=20,
    FOV=70,ThirdPerson=false,Freecam=false,NoFog=false,
    Wallhack=false,Chams=false,Hitmarker=false,DamageNumbers=false,DangerMeter=false,
    EntityTracker=false,SmartESP=false,SmartRange=100,
    ShowRoomNum=false,ShowTimer=false,SpeedrunTimer=0,BestRun=0,
    AutoScreenshot=false,
    DuckSpawn=false,DuckCount=100,
    MusicId="",MusicPlaying=false,MusicVolume=0.5,
    AntiDetect=false,SafeMode=false,
    FunFire=false,FunConfetti=false,FunRainbow=false,FunDisco=false,
    Snow=false,Leaves=false,Petals=false,AuraFire=false,AuraIce=false,
    ChatSpam=false,RandomTP=false,FakeDeath=false,
    KnobESP=false,Level=1,XP=0,DailyQuests=false,Profile=1,
    AutoFarm=false,AutoFarmDeaths=false,FarmDoors=1,FarmDelay=3,AutoPlayAgain=true,
    KnobCounter=0,CoinsCounter=0,DeathsCounter=0,DoorsCounter=0,StartTime=os.time(),
    AutoAim=false,AntiKick=false,FollowPlayer=false,DiscordRich=false,
    AchievementsUnlock=false,RoomESP=false,AutoRejoin=false,UI_Scale=1,
    MonsterList={Rush=true,Ambush=true,Seek=true,Figure=true,Screech=true,Hide=true,Eyes=true,Halt=true,Grumble=true,Giggle=true,Dupe=true,Jack=true,Snare=true,Timothy=true,Glitch=true,Shadow=true,Blitz=true,Lookman=true,Noise=true,Creak=true,Scribbles=true,Drones=true,Jeff=true,Bash=true,Monument=true,Sally=true}
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

_G.N=function(text)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title="Burmalda",
            Text=tostring(text),
            Duration=3
        })
    end)
end

_G.TTS=function(text)
    pcall(function()
        if C.NotifySound then
            local s=Instance.new("Sound",SS)
            s.SoundId="rbxassetid://8784885431"
            s.Volume=0.6
            s:Play()
            task.delay(2,function() s:Destroy() end)
        end
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title="Burmalda",
            Text=tostring(text),
            Duration=4
        })
    end)
end

local CFG="BurmaldaV14.json"

_G.sv=function()
    pcall(function()
        local d={}
        for k,v in pairs(C) do
            if type(v)=="Color3" then
                d[k]={__c=true,r=v.R,g=v.G,b=v.B}
            else
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

print("[Burmalda v14] Part 1/8 — CORE loaded")
