    LightColor=Color3.fromRGB(255,255,255), LightBrightness=2,
    Crosshair=false, CrosshairColor=Color3.fromRGB(255,0,0), CrosshairSize=20,
    FOV=70, ThirdPerson=false, Freecam=false, NoFog=false,
    Wallhack=false, Chams=false, Hitmarker=false, DamageNumbers=false, DangerMeter=false,
    EntityTracker=false, SmartESP=false, SmartRange=100,
    ShowRoomNum=false, ShowTimer=false, SpeedrunTimer=0, BestRun=0,
    AutoScreenshot=false,
    -- Fun
    DuckSpawn=false, DuckCount=100,
    MusicId="", MusicPlaying=false, MusicVolume=0.5,
    AntiDetect=false, SafeMode=false,
    FunFire=false, FunConfetti=false, FunRainbow=false, FunDisco=false,
    Snow=false, Leaves=false, Petals=false, AuraFire=false, AuraIce=false,
    ChatSpam=false, RandomTP=false, FakeDeath=false,
    -- Misc
    KnobESP=false, Level=1, XP=0, DailyQuests=false, Profile=1,
    AutoFarm=false, AutoFarmDeaths=false, FarmDoors=1, FarmDelay=3, AutoPlayAgain=true,
    KnobCounter=0, CoinsCounter=0, DeathsCounter=0, DoorsCounter=0, StartTime=os.time(),
    -- Extra (from Abysall)
    AutoAim=false, AntiKick=false, FollowPlayer=false, DiscordRich=false,
    AchievementsUnlock=false, RoomESP=false, AutoRejoin=false, UI_Scale=1,
    -- Monsters list
    MonsterList={Rush=true,Ambush=true,Seek=true,Figure=true,Screech=true,Hide=true,Eyes=true,Halt=true,Grumble=true,Giggle=true,Dupe=true,Jack=true,Snare=true,Timothy=true,Glitch=true,Shadow=true,Blitz=true,Lookman=true,Noise=true,Creak=true,Scribbles=true,Drones=true,Jeff=true,Bash=true,Monument=true,Sally=true}
}
local C=_G.C

-- ═══ THEMES (Th) ═══
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

-- ═══ T() — Get Theme ═══
_G.T=function()
    return Th[C.Theme] or Th.GrayBlack
end

-- ═══ N() — Notify ═══
_G.N=function(text)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title="Burmalda v13",
            Text=tostring(text),
            Duration=3
        })
    end)
end

-- ═══ TTS() — Notify with Sound ═══
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
            Title="Burmalda v13",
            Text=tostring(text),
            Duration=4
        })
    end)
end

-- ═══ SAVE / LOAD ═══
local CFG="BurmaldaV13.json"
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

print("[Burmalda v13] Part 1/8 — CORE loaded")
