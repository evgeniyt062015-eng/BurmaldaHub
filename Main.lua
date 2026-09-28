-- BURMALDA v13 FINAL | By KOTENOK7204 | Tester: Kostya_2015KostyaKos
pcall(function()
local P=game:GetService("Players")
local RS=game:GetService("ReplicatedStorage")
local Run=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local HS=game:GetService("HttpService")
local VU=game:GetService("VirtualUser")
local SS=game:GetService("SoundService")
local Lighting=game:GetService("Lighting")
local LP=P.LocalPlayer
local RF=RS:FindFirstChild("RemotesFolder")or RS:FindFirstChild("EntityInfo")or RS:FindFirstChild("Bricks")
local GD=RS:FindFirstChild("GameData")
local CR=workspace:FindFirstChild("CurrentRooms")
local CF="Hotel";local MF=nil
pcall(function()if GD and GD:FindFirstChild("Floor")then CF=GD.Floor.Value end end)
function gF()return MF or CF end
_G.C={SpeedEnabled=false,WalkSpeed=22,SpeedBoost=0,JumpPower=50,InfiniteJumps=false,EnableJump=false,EnableSlide=false,BunnyHop=false,Fly=false,FlySpeed=50,Noclip=false,RemoveClosetDelay=false,RemoveAccel=false,DoorReach=false,InstantPrompts=false,PromptClip=false,PromptReach=1,DisableIdleKick=false,AutoBreaker=false,AutoInteract=false,AutoCloset=false,AutoCollect=false,AutoCoins=false,AutoDoor=false,AutoSeek=false,AutoPlay=false,AutoPickupAll=false,AutoSolve=false,AutoRevive=false,AutoBuy=false,TPItemRadius=200,BringItems=false,BringRadius=100,InfiniteHide=false,HideLock=false,AutoReHide=false,InfiniteItems=false,GodRusher=false,EntityFreeze=false,EntityTeleport=false,Speed10x=false,MaxStats=false,Invisible=false,TimeStop=false,SlowMotion=false,AutoPlatform=false,PlatformSize=5,BypassScreech=false,BypassHalt=false,BypassEyes=false,BypassLookman=false,BypassSnare=false,BypassKillbricks=false,BypassSeekingWall=false,BypassBanana=false,BypassGiggle=false,BypassDupe=false,BypassVacuum=false,BypassGloombatEggs=false,BypassSeekObstructions=false,BypassJeff=false,BypassRush=false,BypassAmbush=false,BypassSeek=false,BypassFigure=false,BypassGrumble=false,BypassGiggleArc=false,BypassDrones=false,AntiRansom=false,AntiClosetTrash=false,ForgetMeNot=false,HonchoESP=false,TimeShower=false,FigureInvisible=false,AutoCrouch=false,GodMode=false,InfiniteRevive=false,AutoDodge=false,AutoHideRush=false,AutoHideAmbush=false,AutoHideAll=false,AdaptiveSpeed=false,PredictiveHide=false,SmartPath=false,AntiAFK=true,ESP_All=false,ESP_Rush=false,ESP_Ambush=false,ESP_Seek=false,ESP_Figure=false,ESP_Screech=false,ESP_Hide=false,ESP_Eyes=false,ESP_Halt=false,ESP_Grumble=false,ESP_Giggle=false,ESP_Blitz=false,ESP_Lookman=false,ESP_Noise=false,ESP_Creak=false,ESP_Scribbles=false,ESP_Teller=false,ESP_Drones=false,ESP_Bash=false,ESP_Monument=false,ESP_Sally=false,ESP_Frozen=false,ESP_Doors=false,ESP_Closets=false,ESP_Money=false,ESP_Keys=false,ESP_Items=false,ESP_Ladders=false,ESP_Players=false,ESP_Library=false,ESP_Breaker=false,ESP_Elevators=false,ESP_Chests=false,ESP_Paintings=false,ESP_Minecart=false,ESP_Rails=false,ESP_Turns=false,ESP_Pits=false,ESP_Lava=false,ESP_Bombs=false,ESP_Objectives=false,ESPColor=Color3.fromRGB(180,30,30),DoorColor=Color3.fromRGB(120,20,40),ClosetColor=Color3.fromRGB(100,255,100),MaxDistance=500,RainbowMode=false,XRay=true,ShowDistance=true,FillTransparency=0.55,TextSize=12,ESPUpdateRate=1.5,Theme="GrayBlack",AutoSave=true,BypassDelay=0.1,NotifyMonsters=false,NotifyItems=false,NotifySound=true,RushWarning=false,AmbushWarning=false,SeekWarning=false,HaltWarning=false,RushTracer=false,LightColor=Color3.fromRGB(255,255,255),LightBrightness=2,Crosshair=false,CrosshairColor=Color3.fromRGB(255,0,0),CrosshairSize=20,FOV=70,ThirdPerson=false,Freecam=false,NoFog=false,Wallhack=false,Chams=false,Hitmarker=false,DamageNumbers=false,DangerMeter=false,EntityTracker=false,SmartESP=false,SmartRange=100,ShowRoomNum=false,ShowTimer=false,SpeedrunTimer=0,BestRun=0,AutoScreenshot=false,DuckSpawn=false,DuckCount=100,MusicId="",MusicPlaying=false,MusicVolume=0.5,AntiDetect=false,SafeMode=false,FunFire=false,FunConfetti=false,FunRainbow=false,FunDisco=false,Snow=false,Leaves=false,Petals=false,AuraFire=false,AuraIce=false,ChatSpam=false,RandomTP=false,FakeDeath=false,KnobESP=false,Level=1,XP=0,DailyQuests=false,Profile=1,AutoFarm=false,AutoFarmDeaths=false,FarmDoors=1,FarmDelay=3,AutoPlayAgain=true,KnobCounter=0,CoinsCounter=0,DeathsCounter=0,DoorsCounter=0,StartTime=os.time(),MonsterList={Rush=true,Ambush=true,Seek=true,Figure=true,Screech=true,Hide=true,Eyes=true,Halt=true,Grumble=true,Giggle=true,Dupe=true,Jack=true,Snare=true,Timothy=true,Glitch=true,Shadow=true,Blitz=true,Lookman=true,Noise=true,Creak=true,Scribbles=true,Drones=true,Jeff=true,Bash=true,Monument=true,Sally=true}} local C=_G.C
_G.Th={GrayBlack={bg=Color3.fromRGB(20,20,25),panel=Color3.fromRGB(40,40,45),accent=Color3.fromRGB(120,20,40),text=Color3.fromRGB(240,240,245),danger=Color3.fromRGB(180,30,30)},Black={bg=Color3.fromRGB(10,10,12),panel=Color3.fromRGB(25,25,28),accent=Color3.fromRGB(120,20,40),text=Color3.fromRGB(230,230,235),danger=Color3.fromRGB(180,30,30)},Blood={bg=Color3.fromRGB(25,10,10),panel=Color3.fromRGB(45,15,15),accent=Color3.fromRGB(220,40,40),text=Color3.fromRGB(255,230,230),danger=Color3.fromRGB(200,40,40)},Toxic={bg=Color3.fromRGB(10,25,15),panel=Color3.fromRGB(20,45,30),accent=Color3.fromRGB(50,220,100),text=Color3.fromRGB(230,255,235),danger=Color3.fromRGB(180,30,30)},Gold={bg=Color3.fromRGB(30,25,10),panel=Color3.fromRGB(50,40,15),accent=Color3.fromRGB(255,200,50),text=Color3.fromRGB(255,245,220),danger=Color3.fromRGB(180,30,30)},Neon={bg=Color3.fromRGB(5,5,15),panel=Color3.fromRGB(15,15,35),accent=Color3.fromRGB(0,255,180),text=Color3.fromRGB(220,255,250),danger=Color3.fromRGB(180,30,30)},Cyberpunk={bg=Color3.fromRGB(15,5,30),panel=Color3.fromRGB(30,10,55),accent=Color3.fromRGB(255,0,200),text=Color3.fromRGB(0,255,255),danger=Color3.fromRGB(180,30,30)}} local Th=_G.Th
function TTS(text)if C.NotifySound then pcall(function()local s=Instance.new("Sound",SS);s.SoundId="rbxassetid://8784885431";s.Volume=0.6;s:Play();task.delay(2,function()s:Destroy()end)end)end;pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="WARNING",Text=text,Duration=4})end)end
local CFG="BurmaldaV13.json"
function sv()pcall(function()local d={};for k,v in pairs(C)do if type(v)=="Color3"then d[k]={__c=true,r=v.R,g=v.G,b=v.B}else d[k]=v end end;writefile(CFG,HS:JSONEncode(d))end)end
function ld()pcall(function()if isfile and isfile(CFG)then local d=HS:JSONDecode(readfile(CFG));for k,v in pairs(d)do if type(v)=="table"and v.__c then C[k]=Color3.new(v.r,v.g,v.b)else C[k]=v end end end end) end
ld()
local FBV,FBG,FC
function setFly(s)
    local ch=LP.Character;if not ch then return end
    local hum=ch:FindFirstChildOfClass("Humanoid");local root=ch:FindFirstChild("HumanoidRootPart");if not root then return end
    if FBV then FBV:Destroy()FBV=nil end;if FBG then FBG:Destroy()FBG=nil end;if FC then FC:Disconnect()FC=nil end
    if not s then if hum then hum.PlatformStand=false end return end
    FBV=Instance.new("BodyVelocity",root);FBV.MaxForce=Vector3.new(9e9,9e9,9e9);FBV.Velocity=Vector3.zero;FBV.P=1250
    FBG=Instance.new("BodyGyro",root);FBG.MaxTorque=Vector3.new(9e9,9e9,9e9);FBG.P=1000;FBG.D=50;FBG.CFrame=root.CFrame
    if hum then hum.PlatformStand=true end
    FC=Run.RenderStepped:Connect(function()
        if not C.Fly then return end
        local c=LP.Character;if not c then return end
        local h=c:FindFirstChildOfClass("Humanoid");local r=c:FindFirstChild("HumanoidRootPart");if not r or not h then return end
local cam=workspace.CurrentCamera;local cf=Vector3.new(cam.CFrame.LookVector.X,0,cam.CFrame.LookVector.Z);local fl=CFrame.new(cam.CFrame.Position,cam.CFrame.Position+cf);local dir=h.MoveDirection;local v=(cam.CFrame*CFrame.new(fl:VectorToObjectSpace(dir))).Position-cam.CFrame.Position;if v.Magnitude>0 then v=v.Unit end
        local vert=0;if UIS:IsKeyDown(Enum.KeyCode.Space)then vert=1 elseif UIS:IsKeyDown(Enum.KeyCode.LeftShift)then vert=-1 end
        FBV.Velocity=v*C.FlySpeed+Vector3.new(0,vert*C.FlySpeed*0.5,0);FBG.CFrame=CFrame.new(r.Position,r.Position+cf)
    end)
end
LP.CharacterAdded:Connect(function()task.wait(1);if C.Fly then setFly(false);task.wait(0.1);setFly(true)end end)
local NC
function setNC(s)if NC then NC:Disconnect()NC=nil end;if not s then return end;NC=Run.Stepped:Connect(function()local ch=LP.Character;if ch then for _,p in ipairs(ch:GetDescendants())do if p:IsA("BasePart")and p.CanCollide then p.CanCollide=false end end end end)end
local SCA,SCF,SCR=false,nil,nil
function installSC()if SCA or not RF then return end;SCR=RF:FindFirstChild("Screech");if not SCR then return end;SCF=Instance.new("RemoteEvent");SCF.Name="Screech";SCF.Parent=RF;SCR.Name="Screech_REAL";SCA=true end
function removeSC()if not SCA then return end;pcall(function()if SCR and SCR.Parent then SCR.Name="Screech"end if SCF then SCF:Destroy()end end);SCA=false end
local HC
function startH()if HC then HC:Disconnect()end;HC=Run.RenderStepped:Connect(function()if not C.BypassHalt then return end;local ch=LP.Character;if not ch or not ch:FindFirstChild("HumanoidRootPart")then return end;local cam=workspace.CurrentCamera;for _,o in ipairs(workspace:GetDescendants())do if o.Name:lower():find("halt")then local p=o:IsA("BasePart")and o or(o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true));if p and(p.Position-ch.HumanoidRootPart.Position).Magnitude<60 then local a=(ch.HumanoidRootPart.Position-p.Position).Unit;local n=cam.CFrame.Position;cam.CFrame=CFrame.new(n,n+Vector3.new(a.X,0,a.Z))end end end end)end
task.spawn(function()while task.wait(0.5)do if C.GodMode then local ch=LP.Character;local h=ch and ch:FindFirstChildOfClass("Humanoid");if h and h.Health<h.MaxHealth then pcall(function()h.Health=h.MaxHealth end)end end end end)
task.spawn(function()while task.wait(1)do if C.InfiniteRevive and RF then pcall(function()local r=RF:FindFirstChild("Revive");if r then r:FireServer()end end)end end end)
task.spawn(function()
    while task.wait(0.5)do
        local ch=LP.Character;local h=ch and ch:FindFirstChildOfClass("Humanoid")
        if h then local sp=16;if C.SpeedEnabled then sp=C.WalkSpeed+C.SpeedBoost end;if C.Speed10x then sp=160 end;if C.BunnyHop then sp=30 end;h.WalkSpeed=sp;h.JumpPower=C.JumpPower;h.UseJumpPower=true end
        if ch then if C.EnableJump then pcall(function()ch:SetAttribute("CanJump",true)end)end;if C.EnableSlide then pcall(function()ch:SetAttribute("CanSlide",true)end)end end
    end
end)
local infJumpConn
function setInfJump(s)
    if infJumpConn then infJumpConn:Disconnect()infJumpConn=nil end;if not s then return end
    local ch=LP.Character;if not ch then return end;local h=ch:FindFirstChildOfClass("Humanoid");if not h then return end
    infJumpConn=h.StateChanged:Connect(function(o,n)if n==Enum.HumanoidStateType.Freefall and C.InfiniteJumps then task.wait(0.01);h:ChangeState(Enum.HumanoidStateType.Jumping)end end)
end
LP.CharacterAdded:Connect(function()task.wait(1);if C.InfiniteJumps then setInfJump(true)end end)
task.spawn(function()
    while task.wait(0.5)do
        pcall(function()for _,o in ipairs(workspace:GetDescendants())do if o:IsA("ProximityPrompt")then if C.InstantPrompts then o.HoldDuration=0 end;if C.PromptClip then o.RequiresLineOfSight=false end;if C.DoorReach then o.MaxActivationDistance=math.max(o.MaxActivationDistance or 5,15)*C.PromptReach end end end end)
    end
end)
LP.Idled:Connect(function()if C.DisableIdleKick then pcall(function()VU:CaptureController()VU:ClickButton2(Vector2.new())end)end end)
task.spawn(function()while task.wait(1)do if C.RemoveClosetDelay then pcall(function()local ch=LP.Character;if ch then for _,o in ipairs(ch:GetDescendants())do if o:IsA("NumberValue")and o.Name:lower():find("delay")then o.Value=0 end end end end)end end end)
task.spawn(function()while task.wait(1)do if C.RemoveAccel then pcall(function()local ch=LP.Character;if ch then for _,p in ipairs(ch:GetDescendants())do if p:IsA("BasePart")then p.CustomPhysicalProperties=PhysicalProperties.new(0.7,0.3,0.5,1,1)end end end end)end end end)
print("[Burmalda v13] Part 1/6 loaded")
-- Part 2/6 - TP / Hide / Auto-Seek / Bypass / ESP / Visual
-- ВСТАВИТЬ ПОСЛЕ ЧАСТИ 1
function findNearestItem()
    local ch=LP.Character;if not ch or not ch:FindFirstChild("HumanoidRootPart")then return nil end
    local myPos=ch.HumanoidRootPart.Position;local closest,dist=nil,math.huge
    for _,o in ipairs(workspace:GetDescendants())do
        if o:IsA("Model")or o:IsA("BasePart")then
            if P:GetPlayerFromCharacter(o)then continue end
            if o==ch then continue end
            if ch:IsAncestorOf(o)then continue end
            local n=o.Name:lower()
            if n:find("crucifix")or n:find("lockpick")or n:find("bandage")or n:find("flashlight")or n:find("lighter")or n:find("battery")or n:find("vitamin")or n:find("key")or n:find("coin")or n:find("gold")or n:find("candle")or n:find("skeleton")or n:find("shakelight")or n:find("straplight")or n:find("bulklight")or n:find("lantern")or n:find("shears")or n:find("scanner")or n:find("compass")then
                local p=o:IsA("BasePart")and o or(o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true))
                if p then local d=(p.Position-myPos).Magnitude;if d<dist and d<C.TPItemRadius and d>3 then dist=d closest=p end end
            end
        end
    end
    return closest
end
function tpNearestItem()local item=findNearestItem();if item then local ch=LP.Character;if ch and ch:FindFirstChild("HumanoidRootPart")then ch.HumanoidRootPart.CFrame=CFrame.new(item.Position+Vector3.new(0,3,0));N("TP to item")end else N("No items")end end
function tpToPlayer(t)local ch=LP.Character;if not ch or not ch:FindFirstChild("HumanoidRootPart")then return end;local tg=t.Character;if not tg then N("No char")return end;local tr=tg:FindFirstChild("HumanoidRootPart");if not tr then N("Not in game")return end;ch.HumanoidRootPart.CFrame=CFrame.new(tr.Position+Vector3.new(0,3,0));N("TP to "..t.Name)end
function bringPlayer(t)local ch=LP.Character;if not ch or not ch:FindFirstChild("HumanoidRootPart")then return end;local myPos=ch.HumanoidRootPart.Position;local tg=t.Character;if not tg then return end;local tr=tg:FindFirstChild("HumanoidRootPart");if not tr then return end;tr.CFrame=CFrame.new(myPos+Vector3.new(0,3,0));N("Brought "..t.Name)end
function isInsideCloset()local ch=LP.Character;if not ch then return false end;if ch:GetAttribute("Hiding")then return true end;if ch:GetAttribute("InCloset")then return true end;if ch:GetAttribute("Hidden")then return true end;if ch:FindFirstChild("Hidden")then return true end;if ch:FindFirstChild("InCloset")then return true end;return false end
function forceHide()
    local ch=LP.Character;if not ch or not ch:FindFirstChild("HumanoidRootPart")then return false end
    local pos=ch.HumanoidRootPart.Position;local closest,prompt,dist=nil,nil,math.huge
    for _,o in ipairs(workspace:GetDescendants())do
        if o:IsA("Model")then local n=o.Name:lower()
            if n:find("closet")or n:find("hiding")or n:find("wardrobe")or n:find("cabinet")or n:find("locker")then
                local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true)
                if p then local d=(p.Position-pos).Magnitude
                    if d<dist then local pr=o:FindFirstChildWhichIsA("ProximityPrompt",true);if pr and pr.Enabled then dist=d closest=o prompt=pr end end
                end
            end
        end
    end
    if closest and prompt and dist<100 then local p=closest.PrimaryPart or closest:FindFirstChildWhichIsA("BasePart",true);if p then ch.HumanoidRootPart.CFrame=CFrame.new(p.Position+Vector3.new(0,2,0))end;task.wait(0.1);pcall(function()prompt:InputHoldBegin()task.wait(math.max(prompt.HoldDuration or 0,0.05))prompt:InputHoldEnd()end);return true end
    return false
end
task.spawn(function()
    while task.wait(0.3)do
        if C.InfiniteHide then if not isInsideCloset()then pcall(forceHide)end end
if C.HideLock then for _,o in ipairs(workspace:GetDescendants())do if o:IsA("ProximityPrompt")and o.Enabled then local a=(o.ActionText or ""):lower();if a:find("exit")or a:find("leave")then pcall(function()o.Enabled=false end)end end end end
    end
end)
local HD=0;local IH=false
function aH()
    local ch=LP.Character;if not ch or not ch:FindFirstChild("HumanoidRootPart")then return end
    local pos=ch.HumanoidRootPart.Position;local dg=false
    for _,o in ipairs(workspace:GetDescendants())do if o:IsA("Model")then local n=o.Name:lower();if(n:find("rush")and C.AutoHideRush)or(n:find("ambush")and C.AutoHideAmbush)or(C.AutoHideAll and(n:find("seek")or n:find("figure")))then local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true);if p and(p.Position-pos).Magnitude<100 then dg=true break end end end end
    if not dg or IH or tick()-HD<2 then return end
    local cl,pr,dt=nil,nil,math.huge
    for _,o in ipairs(workspace:GetDescendants())do if o:IsA("Model")then local n=o.Name:lower();if n:find("closet")or n:find("hiding")or n:find("wardrobe")then local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true);if p then local d=(p.Position-pos).Magnitude;if d<dt then local pp=o:FindFirstChildWhichIsA("ProximityPrompt",true);if pp and pp.Enabled then dt=d cl=o pr=pp end end end end end end
    if cl and pr and dt<50 then local p=cl.PrimaryPart or cl:FindFirstChildWhichIsA("BasePart",true);if p then ch.HumanoidRootPart.CFrame=CFrame.new(p.Position+Vector3.new(0,2,0))end;task.wait(0.15);IH=true;pcall(function()pr:InputHoldBegin()task.wait(math.max(pr.HoldDuration or 0,0.05))pr:InputHoldEnd()end);HD=tick();task.wait(1);IH=false end
end
-- AUTO-PLATFORM
local platFolder=Instance.new("Folder",workspace);platFolder.Name="BurmaldaPlatforms"
function makePlatform(pos,size)
    local p=Instance.new("Part",platFolder)
    p.Size=size or Vector3.new(C.PlatformSize,1,C.PlatformSize)
    p.Position=pos;p.Anchored=true;p.CanCollide=true;p.Transparency=0.4;p.Color=Color3.fromRGB(0,255,255);p.Material=Enum.Material.Neon
    game:GetService("Debris"):AddItem(p,3)
end
task.spawn(function()
    while task.wait(0.15)do
        if C.AutoPlatform then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart")then
                local root=ch.HumanoidRootPart
                local fwd=root.CFrame.LookVector*5
                makePlatform(root.Position+fwd-Vector3.new(0,2,0))
                makePlatform(root.Position-Vector3.new(0,3,0))
                for _,o in ipairs(workspace:GetDescendants())do
                    if o:IsA("BasePart")and(o.Name:lower():find("water")or o.Material==Enum.Material.Water)then
                        if(o.Position-root.Position).Magnitude<30 then
                            makePlatform(Vector3.new(root.Position.X,o.Position.Y+3,root.Position.Z),Vector3.new(8,0.5,8))
                        end
                    end
                end
            end
        end
    end
end)
-- AUTO-SEEK
task.spawn(function()
    while task.wait(0.15)do
        if C.AutoSeek then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart")then
                local h=ch:FindFirstChildOfClass("Humanoid");local root=ch.HumanoidRootPart
                if h then
                    pcall(function()
                        local ray=Ray.new(root.Position,root.CFrame.LookVector*4)
                        local hit=workspace:FindPartOnRay(ray,ch)
                        if hit and hit.CanCollide and C.AutoPlatform then makePlatform(root.Position+root.CFrame.LookVector*4-Vector3.new(0,1,0),Vector3.new(5,0.5,5))end
                        if hit and hit.CanCollide and not C.AutoPlatform then h:ChangeState(Enum.HumanoidStateType.Jumping)end
                    end)
                    pcall(function()
                        local ray=Ray.new(root.Position+Vector3.new(0,2,0),Vector3.new(0,3,0))
local hit=workspace:FindPartOnRay(ray,ch)
                        if RF then if hit and hit.CanCollide then if RF:FindFirstChild("Crouch")then RF.Crouch:FireServer(true)end else if RF:FindFirstChild("Crouch")then RF.Crouch:FireServer(false)end end end
                    end)
                    local myPos=root.Position;local latestRoom=0
                    if GD and GD:FindFirstChild("LatestRoom")then latestRoom=GD.LatestRoom.Value end
                    local bestDoor,bestNum=nil,math.huge
                    for _,o in ipairs(workspace:GetDescendants())do
                        if o:IsA("Model")and o.Name:lower()=="door"then
                            local op=o:GetAttribute("Open")
                            if op==false or op==nil then local rn=tonumber(o.Parent and o.Parent.Name);if rn and rn>=latestRoom and rn<bestNum then bestNum=rn bestDoor=o end end
                        end
                    end
                    if bestDoor then
                        local dp=bestDoor.PrimaryPart or bestDoor:FindFirstChildWhichIsA("BasePart",true)
                        if dp then local dir=(dp.Position-myPos).Unit;h:Move(dir,false)
                            if(dp.Position-myPos).Magnitude<5 then for _,pr in ipairs(bestDoor:GetDescendants())do if pr:IsA("ProximityPrompt")then pcall(function()pr:InputHoldBegin();task.wait(0.05);pr:InputHoldEnd()end)end end end
                        end
                    end
                end
            end
        end
    end
end)
-- SEEK ROUTE ARROW
local seekGui=Instance.new("ScreenGui");seekGui.Name="SeekArrow";seekGui.ResetOnSpawn=false;seekGui.Parent=LP:WaitForChild("PlayerGui")
local seekArrow=Instance.new("TextLabel",seekGui);seekArrow.Size=UDim2.new(0,120,0,60);seekArrow.Position=UDim2.new(0.5,-60,0.7,0);seekArrow.BackgroundTransparency=0.5;seekArrow.BackgroundColor3=Color3.fromRGB(20,20,25);seekArrow.Text="↑";seekArrow.TextColor3=Color3.fromRGB(255,50,50);seekArrow.Font=Enum.Font.GothamBlack;seekArrow.TextSize=48;seekArrow.Visible=false
local sac=Instance.new("UICorner",seekArrow)sac.CornerRadius=UDim.new(0,10)
task.spawn(function()
    while task.wait(0.1)do
        if C.AutoSeek then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart")then
                local myPos=ch.HumanoidRootPart.Position;local latestRoom=0
                if GD and GD:FindFirstChild("LatestRoom")then latestRoom=GD.LatestRoom.Value end
                local bestDoor,bestNum=nil,math.huge
                for _,o in ipairs(workspace:GetDescendants())do if o:IsA("Model")and o.Name:lower()=="door"then local op=o:GetAttribute("Open");if op==false or op==nil then local rn=tonumber(o.Parent and o.Parent.Name);if rn and rn>=latestRoom and rn<bestNum then bestNum=rn bestDoor=o end end end end
                if bestDoor then local dp=bestDoor.PrimaryPart or bestDoor:FindFirstChildWhichIsA("BasePart",true);if dp then local dir=(dp.Position-myPos).Unit;local cam=workspace.CurrentCamera;local cl=cam.CFrame.LookVector;local angle=math.atan2(dir.X-cl.X,dir.Z-cl.Z)*57.3;seekArrow.Rotation=-angle;seekArrow.Visible=true end else seekArrow.Visible=false end
            else seekArrow.Visible=false end
        else seekArrow.Visible=false end
    end
end)
-- MINES AUTO-STEER
task.spawn(function()
    while task.wait(0.1)do
        if C.AutoSeek and RF then
            local cam=workspace.CurrentCamera
            local mc=cam:FindFirstChild("MinecartRig")
            if mc then
                local move=RF:FindFirstChild("MinecartMove")
                if move then local myPos=mc:GetPivot().Position;local ct,td=nil,math.huge
                    for _,o in ipairs(workspace:GetDescendants())do if o:IsA("Model")and(o.Name:lower():find("turn")or o.Name:lower():find("junction"))then local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true);if p then local d=(p.Position-myPos).Magnitude;if d<td then td=d ct=o end end end end
if ct and td<15 then local dir=(ct.PrimaryPart.Position-myPos).Unit;local right=mc:GetPivot().RightVector;if dir:Dot(right)>0 then pcall(function()move:FireServer(Vector3.new(1,0,0))end)else pcall(function()move:FireServer(Vector3.new(-1,0,0))end)end
                    else pcall(function()move:FireServer(Vector3.new(0,0,1))end)end
                end
            end
        end
    end
end)
-- ESP
local ENT={"RushMoving","AmbushMoving","Seek","Figure","Screech","Hide","Eyes","Glitch","Dupe","Jack","Snare","Timothy","Shadow","Halt","Grumble","Giggle","Gloombat","Monument","Sally","JeffTheKiller","Bash","Blitz","A60","A120","Noise","Creak","Scribbles","Lookman","DronesStampede","Groundskeeper","TellerRig","NoiseModel","FrozenAmbush","CustomEntity","StemsEntity"}
local EN={RushMoving="Rush",AmbushMoving="Ambush",Seek="Seek",Figure="Figure",Screech="Screech",Hide="Hide",Eyes="Eyes",Glitch="Glitch",Dupe="Dupe",Jack="Jack",Snare="Snare",Timothy="Timothy",Shadow="Shadow",Halt="Halt",Grumble="Grumble",Giggle="Giggle",Gloombat="Gloombat",Monument="Monument",Sally="Sally",JeffTheKiller="Jeff",Bash="Bash",Blitz="Blitz",A60="A-60",A120="A-120",Noise="Noise",Creak="Creak",Scribbles="Scribbles",Lookman="Lookman",DronesStampede="Drones",Groundskeeper="Groundskeeper",TellerRig="Teller",NoiseModel="Noise",FrozenAmbush="Frozen Ambush",CustomEntity="Custom",StemsEntity="Balls"}
function isE(o)if not o:IsA("Model")and not o:IsA("BasePart")then return false,nil,nil end;local n=o.Name:lower();for _,e in ipairs(ENT)do if n==e:lower()or n:find(e:lower(),1,true)then return true,e,EN[e]or e end end;return false,nil,nil end
local ESP={}
function clearESP()for _,v in pairs(ESP)do pcall(function()v:Destroy()end)end;ESP={}end
function makeESP(o,col,txt,yo)
    if ESP[o]and ESP[o].Parent then return end
    local bb=Instance.new("BillboardGui");bb.Size=UDim2.new(0,140,0,28);bb.StudsOffset=Vector3.new(0,yo or 4,0);bb.AlwaysOnTop=true;bb.Adornee=o;bb.Parent=o
    local h=Instance.new("Highlight",o);h.FillColor=col;h.FillTransparency=C.FillTransparency;h.OutlineColor=col;h.OutlineTransparency=0.3;h.DepthMode=C.XRay and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded;h.Adornee=o
    local lb=Instance.new("TextLabel",bb);lb.Size=UDim2.new(1,0,1,0);lb.BackgroundTransparency=1;lb.Text=txt;lb.TextColor3=col;lb.TextStrokeTransparency=0;lb.TextStrokeColor3=Color3.fromRGB(0,0,0);lb.Font=Enum.Font.GothamBold;lb.TextSize=C.TextSize
    ESP[o]=bb
end
function getP(o)if o:IsA("BasePart")then return o.Position end;if o.PrimaryPart then return o.PrimaryPart.Position end;local p=o:FindFirstChildWhichIsA("BasePart",true);return p and p.Position end
function myP()local ch=LP.Character;if ch and ch:FindFirstChild("HumanoidRootPart")then return ch.HumanoidRootPart.Position end end
function cO(b)if C.RainbowMode then return Color3.fromHSV(tick()%5/5,1,1)end return b end
function getDoorNum(o)local n=tonumber(o.Parent and o.Parent.Name)or tonumber(o.Parent and o.Parent.Parent and o.Parent.Parent.Name);if n then return tostring(n+1)end;return "?"end
function updESP()
    local pos=myP();if not pos then return end
    for _,o in ipairs(workspace:GetDescendants())do
        if ESP[o]then continue end
        local op=getP(o);if not op or(op-pos).Magnitude>C.MaxDistance then continue end
        local n=o.Name:lower();local ok,key,ne=isE(o)
        if ok then local cK="ESP_"..key;if C.ESP_All or C[cK]or(C.SmartESP and(op-pos).Magnitude<C.SmartRange)then local t=ne;if C.ShowDistance then t=t.." ["..math.floor((op-pos).Magnitude).."m]" end;makeESP(o,cO(C.ESPColor),t,5);continue end end
        if C.ESP_Doors and n:find("door")and not n:find("handler")and not n:find("fake")then makeESP(o,cO(C.DoorColor),"Door #"..getDoorNum(o),3)continue end
        if C.ESP_Closets and(n:find("closet")or n:find("hiding")or n:find("wardrobe")or n:find("locker"))then makeESP(o,cO(C.ClosetColor),"Hide",3)continue end
if C.ESP_Money and(n:find("coin")or n:find("gold"))then makeESP(o,cO(Color3.fromRGB(255,215,0)),"Money",3)continue end
        if C.ESP_Keys and n:find("key")then makeESP(o,cO(Color3.fromRGB(255,255,100)),"Key",3)continue end
        if C.ESP_Items and(n:find("bandage")or n:find("flashlight")or n:find("lighter")or n:find("lockpick")or n:find("crucifix")or n:find("battery")or n:find("vitamin")or n:find("candle")or n:find("skeleton")or n:find("lantern")or n:find("shears")or n:find("scanner"))then makeESP(o,cO(Color3.fromRGB(255,220,50)),o.Name,3)continue end
        if C.ESP_Ladders and(n:find("ladder")or n:find("stair"))then makeESP(o,cO(Color3.fromRGB(0,200,255)),"Ladder",3)continue end
        if C.ESP_Minecart and(n:find("minecart")or n:find("cart"))then makeESP(o,cO(Color3.fromRGB(255,150,0)),"Cart",3)continue end
        if C.ESP_Lava and(n:find("lava"))then makeESP(o,cO(Color3.fromRGB(255,80,0)),"LAVA",3)continue end
        if C.ESP_Library and(n:find("library")or n:find("bookshelf"))then makeESP(o,cO(Color3.fromRGB(200,150,255)),"Library",3)continue end
        if C.ESP_Breaker and(n:find("breaker")or n:find("fuse"))then makeESP(o,cO(Color3.fromRGB(255,255,100)),"Breaker",3)continue end
        if C.ESP_Objectives and(n:find("anchor")or n:find("objective")or n:find("valve"))then makeESP(o,cO(Color3.fromRGB(0,255,0)),"Objective",3)continue end
        if C.ESP_Players and o:IsA("Model")then local pl=P:GetPlayerFromCharacter(o);if pl and pl~=LP then makeESP(o,cO(Color3.fromRGB(255,255,0)),pl.Name,5);continue end end
    end
end
-- BYPASS
task.spawn(function()
    while task.wait(0.3)do
        pcall(function()
            if C.BypassRush then for _,o in ipairs(workspace:GetDescendants())do if o.Name:lower():find("rush")and(o:IsA("Model")or o:IsA("BasePart"))then for _,p in ipairs(o:GetDescendants())do if p:IsA("BasePart")then p.CanTouch=false p.CanCollide=false end end end end end
            if C.BypassAmbush then for _,o in ipairs(workspace:GetDescendants())do if o.Name:lower():find("ambush")and(o:IsA("Model")or o:IsA("BasePart"))then for _,p in ipairs(o:GetDescendants())do if p:IsA("BasePart")then p.CanTouch=false p.CanCollide=false end end end end end
            if C.BypassSeek then for _,o in ipairs(workspace:GetDescendants())do if o.Name:lower():find("seek")and(o:IsA("Model")or o:IsA("BasePart"))then for _,p in ipairs(o:GetDescendants())do if p:IsA("BasePart")then p.CanTouch=false end end end end end
            if C.BypassFigure then for _,o in ipairs(workspace:GetDescendants())do if o.Name:lower():find("figure")and(o:IsA("Model")or o:IsA("BasePart"))then for _,p in ipairs(o:GetDescendants())do if p:IsA("BasePart")then p.CanTouch=false p.CanCollide=false end end end end end
            if C.BypassGrumble then for _,o in ipairs(workspace:GetDescendants())do if o.Name:lower():find("grumble")and(o:IsA("Model")or o:IsA("BasePart"))then for _,p in ipairs(o:GetDescendants())do if p:IsA("BasePart")then p.CanTouch=false end end end end end
            if C.FigureInvisible then
                local ch=LP.Character
                if ch then
                    local isCrouch=false
                    if ch:GetAttribute("Crouching")then isCrouch=true end
                    local h=ch:FindFirstChildOfClass("Humanoid")
                    if h and h.WalkSpeed<10 then isCrouch=true end
                    if not isCrouch then for _,o in ipairs(workspace:GetDescendants())do if o.Name:lower():find("figure")and o:IsA("Model")then for _,p in ipairs(o:GetDescendants())do if p:IsA("BasePart")then p.CanTouch=false p.CanCollide=false p.Transparency=0.5 end end;local fh=o:FindFirstChildWhichIsA("Humanoid");if fh then fh.WalkSpeed=0 fh.JumpPower=0 end end end end
                end
            end
if C.BypassDrones then for _,o in ipairs(workspace:GetDescendants())do if o.Name:lower():find("drones")and(o:IsA("Model")or o:IsA("BasePart"))then for _,p in ipairs(o:GetDescendants())do if p:IsA("BasePart")then p.CanTouch=false end end end end end
        end)
    end
end)
function byT(names,state)for _,o in ipairs(workspace:GetDescendants())do if o:IsA("Model")then local n=o.Name:lower();for _,t in ipairs(names)do if n==t:lower()or n:find(t:lower(),1,true)then for _,p in ipairs(o:GetDescendants())do if p:IsA("BasePart")then pcall(function()p.CanTouch=not state end)end end end end end end end
task.spawn(function()
    while task.wait(C.BypassDelay)do
        pcall(function()
            if C.BypassEyes or C.BypassLookman then local m=RF and RF:FindFirstChild("MotorReplication");if m then m:FireServer(-(600+math.random(0,100)))end end
            if C.BypassSnare then byT({"Snare"},true)end
            if C.BypassKillbricks then byT({"Lava"},true)end
            if C.BypassBanana then byT({"BananaPeel"},true)end
            if C.BypassSeekingWall then byT({"ScaryWall"},true)end
            if C.BypassDupe then byT({"DoorFake","FakeDoor"},true)end
            if C.BypassVacuum then byT({"SideroomSpace"},true)end
            if C.BypassGloombatEggs then byT({"Gloombat"},true)end
            if C.BypassSeekObstructions then byT({"SeekFloodline"},true)end
            if C.BypassJeff then byT({"JeffTheKiller"},true)end
            if C.AntiRansom then byT({"Ransom"},true)end
            if C.AntiClosetTrash then byT({"ClosetTrash"},true)end
        end)
    end
end)
-- ABYSSALL: Anti Scribbles (перехват)
local AntiScribbles_OldNamecall,AntiScribbles_IsHooked=false,false
function HookAntiScribbles()
    if AntiScribbles_IsHooked then return end
    pcall(function()
        AntiScribbles_OldNamecall=hookmetamethod(game,"__namecall",function(self,...)
            local method=getnamecallmethod()
            if method=="FireServer"or method=="InvokeServer"then
                local args={...}
                if tostring(self):lower():find("scribble")then return nil end
            end
            return AntiScribbles_OldNamecall(self,...)
        end)
        AntiScribbles_IsHooked=true
    end)
end
task.spawn(function()while task.wait(1)do if C.BypassGiggleArc then HookAntiScribbles()end end end)
-- VISUAL EXTRAS
task.spawn(function()
    while task.wait(0.3)do
        pcall(function()
            if C.Invisible then local ch=LP.Character;if ch then for _,p in ipairs(ch:GetDescendants())do if p:IsA("BasePart")then p.Transparency=1 end;if p:IsA("Decal")then p.Transparency=1 end end end end
            if C.Wallhack then for _,o in ipairs(workspace:GetDescendants())do if o:IsA("BasePart")and not o:FindFirstChild("WhHl")then local h=Instance.new("SelectionBox",o);h.Name="WhHl";h.Adornee=o;h.Color3=Color3.fromRGB(255,255,255);h.LineThickness=0.02 end end end
            if C.Chams then for _,o in ipairs(workspace:GetDescendants())do if o:IsA("BasePart")and not o:FindFirstChild("ChHl")then local h=Instance.new("Highlight",o);h.Name="ChHl";h.FillColor=Color3.fromRGB(255,0,0);h.FillTransparency=0.5;h.Adornee=o end end end
            if C.EntityFreeze then for _,o in ipairs(workspace:GetDescendants())do local ok,_,_=isE(o);if ok and o:IsA("Model")then local h=o:FindFirstChildWhichIsA("Humanoid");if h then pcall(function()h.WalkSpeed=0 h.JumpPower=0 end)end;for _,p in ipairs(o:GetDescendants())do if p:IsA("BasePart")then pcall(function()p.Anchored=true end)end end end end end
            if C.GodRusher then local ch=LP.Character;if ch then local h=ch:FindFirstChildOfClass("Humanoid");if h then h.Health=h.MaxHealth end end end
            if C.FunRainbow then local ch=LP.Character;if ch then for _,p in ipairs(ch:GetDescendants())do if p:IsA("BasePart")then p.Color=Color3.fromHSV(tick()%5/5,1,1)end end end end
        end)
    end
end)
task.spawn(function()while task.wait(0.3)do if C.FOV~=70 then workspace.CurrentCamera.FieldOfView=C.FOV end end end)
task.spawn(function()while task.wait(0.5)do if C.ThirdPerson then LP.CameraMode=Enum.CameraMode.Classic else LP.CameraMode=Enum.CameraMode.LockFirstPerson end end end)
task.spawn(function()while task.wait(0.5)do if C.NoFog then Lighting.FogEnd=1e5 end;if C.LightBrightness~=2 then Lighting.Brightness=C.LightBrightness end end end)
-- CROSSHAIR
local crossGui=Instance.new("ScreenGui");crossGui.Name="BCross";crossGui.ResetOnSpawn=false;crossGui.Parent=LP:WaitForChild("PlayerGui")
local ch1=Instance.new("Frame",crossGui);ch1.Size=UDim2.new(0,2,0,20);ch1.Position=UDim2.new(0.5,-1,0.5,-30);ch1.BackgroundColor3=C.CrosshairColor;ch1.BorderSizePixel=0;ch1.Visible=false
local ch2=Instance.new("Frame",crossGui);ch2.Size=UDim2.new(0,2,0,20);ch2.Position=UDim2.new(0.5,-1,0.5,10);ch2.BackgroundColor3=C.CrosshairColor;ch2.BorderSizePixel=0;ch2.Visible=false
local ch3=Instance.new("Frame",crossGui);ch3.Size=UDim2.new(0,20,0,2);ch3.Position=UDim2.new(0.5,-30,0.5,-1);ch3.BackgroundColor3=C.CrosshairColor;ch3.BorderSizePixel=0;ch3.Visible=false
local ch4=Instance.new("Frame",crossGui);ch4.Size=UDim2.new(0,20,0,2);ch4.Position=UDim2.new(0.5,10,0.5,-1);ch4.BackgroundColor3=C.CrosshairColor;ch4.BorderSizePixel=0;ch4.Visible=false
task.spawn(function()while task.wait(0.3)do local v=C.Crosshair;ch1.Visible=v;ch2.Visible=v;ch3.Visible=v;ch4.Visible=v;ch1.BackgroundColor3=C.CrosshairColor;ch2.BackgroundColor3=C.CrosshairColor;ch3.BackgroundColor3=C.CrosshairColor;ch4.BackgroundColor3=C.CrosshairColor end end)
-- RUN LOOPS
task.spawn(function()while task.wait(60)do if C.AntiAFK then pcall(function()VU:CaptureController()VU:ClickButton2(Vector2.new())end)end end end)
Run.Heartbeat:Connect(function()if C.AutoHideRush or C.AutoHideAmbush or C.AutoHideAll then pcall(aH)end end)
task.spawn(function()while task.wait(C.ESPUpdateRate)do pcall(updESP)end end)
task.spawn(function()while task.wait(30)do if C.AutoSave then pcall(sv)end end end)
print("[Burmalda v13] Part 2/6 loaded")
-- Part 3/6 - Farm / Music / Sound / Move / Stats / Players / Features / AntiDet
-- ВСТАВИТЬ ПОСЛЕ ЧАСТИ 2
-- AUTO
function getR()local ch=LP.Character;return ch and ch:FindFirstChild("HumanoidRootPart")end
task.spawn(function()
    while task.wait(0.3)do
        if C.AutoCollect then local r=getR();if r then for _,o in ipairs(workspace:GetDescendants())do if o:IsA("Model")or o:IsA("BasePart")then if P:GetPlayerFromCharacter(o)then continue end;local n=o.Name:lower();if n:find("crucifix")or n:find("lockpick")or n:find("bandage")or n:find("flashlight")or n:find("lighter")or n:find("battery")then local p=o:IsA("BasePart")and o or(o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true));if p and(p.Position-r.Position).Magnitude<20 then pcall(function()r.CFrame=CFrame.new(p.Position)end)end end end end end end
        if C.AutoCoins then local r=getR();if r then for _,o in ipairs(workspace:GetDescendants())do if o:IsA("BasePart")and(o.Name:lower():find("coin")or o.Name:lower():find("gold"))then if(o.Position-r.Position).Magnitude<15 then pcall(function()r.CFrame=CFrame.new(o.Position)end)end end end end end
        if C.AutoDoor then local r=getR();if r then local pos=r.Position;for _,o in ipairs(workspace:GetDescendants())do if o:IsA("ProximityPrompt")and o.Enabled then local a=(o.ActionText or ""):lower();if a:find("open")or a:find("door")then local par=o.Parent;local pp=par and(par:IsA("BasePart")and par or par:FindFirstChildWhichIsA("BasePart",true));if pp and(pp.Position-pos).Magnitude<5 then pcall(function()o:InputHoldBegin()task.wait(0.05)o:InputHoldEnd()end)end end end end end end
        if C.AutoInteract then local r=getR();if r then local pos=r.Position;for _,o in ipairs(workspace:GetDescendants())do if o:IsA("ProximityPrompt")and o.Enabled then local par=o.Parent;local pp=par and(par:IsA("BasePart")and par or par:FindFirstChildWhichIsA("BasePart",true));if pp and(pp.Position-pos).Magnitude<8 then pcall(function()o:InputHoldBegin()task.wait(0.05)o:InputHoldEnd()end)end end end end end
        if C.AutoCloset then local r=getR();if r then local pos=r.Position;for _,o in ipairs(workspace:GetDescendants())do if o:IsA("ProximityPrompt")and o.Enabled then local par=o.Parent;if par then local n=(par.Name..(o.ActionText or "")..(o.ObjectText or "")):lower();if n:find("closet")or n:find("hiding")then local pp=par:IsA("BasePart")and par or par:FindFirstChildWhichIsA("BasePart",true);if pp and(pp.Position-pos).Magnitude<10 then pcall(function()o:InputHoldBegin()task.wait(0.05)o:InputHoldEnd()end)end end end end end end end
        if C.AutoBreaker and RF then local r=getR();if r then local rooms=workspace:FindFirstChild("CurrentRooms");if rooms then local b=rooms:FindFirstChild("ElevatorBreaker",true);if b and b:IsA("Model")then local bp=b.PrimaryPart or b:FindFirstChildWhichIsA("BasePart",true);if bp and(bp.Position-r.Position).Magnitude<15 then local eb=RF:FindFirstChild("EBF");if eb then pcall(function()eb:FireServer()end)end end end end end end
    end
end)
task.spawn(function()
    while task.wait(0.3)do
        if C.AutoDodge then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart")then
                local pos=ch.HumanoidRootPart.Position
                for _,o in ipairs(workspace:GetDescendants())do
                    if o:IsA("Model")then
                        local n=o.Name:lower();local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true)
                        if p then local d=(p.Position-pos).Magnitude
                            if(n:find("rush")or n:find("ambush"))and d<80 then if not isInsideCloset()then pcall(aH)end break end
                            if n:find("seek")and d<50 then if isInsideCloset()and RF and RF:FindFirstChild("CamLock")then pcall(function()RF.CamLock:FireServer()end)end end
                        end
                    end
                end
            end
        end
    end
end)
-- AUTO-FARM
task.spawn(function()
while task.wait(0.5)do
        if C.AutoFarm or C.AutoFarmDeaths then
            if C.AutoPlayAgain and RF and RF:FindFirstChild("PlayAgain")then pcall(function()RF.PlayAgain:FireServer()end)end
        end
    end
end)
task.spawn(function()
    while task.wait(1)do
        if C.AutoFarmDeaths then
            local ch=LP.Character
            if ch then local h=ch:FindFirstChildOfClass("Humanoid");if h then pcall(function()h.Health=0 end)end end
            task.wait(C.FarmDelay)
            if RF and RF:FindFirstChild("PlayAgain")then pcall(function()RF.PlayAgain:FireServer()end)end
        end
    end
end)
-- MUSIC
local musicSound
function playMusic(id)if musicSound then musicSound:Destroy()end;if id==""or not id then N("No ID")return end;musicSound=Instance.new("Sound",SS);musicSound.SoundId="rbxassetid://"..id;musicSound.Volume=C.MusicVolume;musicSound.Looped=true;musicSound:Play();C.MusicId=id;C.MusicPlaying=true end
function stopMusic()if musicSound then musicSound:Stop();musicSound:Destroy()end;musicSound=nil;C.MusicPlaying=false end
-- DUCKS
function spawnDucks(count)
    for i=1,count do task.spawn(function()
        local duck=Instance.new("Part",workspace)
        duck.Size=Vector3.new(2,2,2);duck.Shape=Enum.PartType.Ball;duck.Color=Color3.fromRGB(255,255,0);duck.Material=Enum.Material.Plastic;duck.CanCollide=true
        duck.Position=Vector3.new(math.random(-200,200),200+math.random(0,100),math.random(-200,200))
        local s=Instance.new("Sound",duck);s.SoundId="rbxassetid://9041358218";s.Volume=1;s:Play()
        game:GetService("Debris"):AddItem(duck,10)
    end)end
end
task.spawn(function()while task.wait(1)do if C.DuckSpawn then pcall(function()spawnDucks(10)end)end end end)
-- FUN EXTRAS
task.spawn(function()
    while task.wait(0.5)do
        pcall(function()
            if C.Snow then local p=Instance.new("Part",workspace);p.Size=Vector3.new(0.5,0.5,0.5);p.Color=Color3.fromRGB(255,255,255);p.CanCollide=false;local ch=LP.Character;if ch and ch:FindFirstChild("HumanoidRootPart")then p.Position=ch.HumanoidRootPart.Position+Vector3.new(math.random(-40,40),30,math.random(-40,40))end;game:GetService("Debris"):AddItem(p,5)end
            if C.Leaves then local p=Instance.new("Part",workspace);p.Size=Vector3.new(0.5,0.5,0.5);p.Color=Color3.fromRGB(80,180,60);p.CanCollide=false;local ch=LP.Character;if ch and ch:FindFirstChild("HumanoidRootPart")then p.Position=ch.HumanoidRootPart.Position+Vector3.new(math.random(-40,40),30,math.random(-40,40))end;game:GetService("Debris"):AddItem(p,5)end
            if C.Petals then local p=Instance.new("Part",workspace);p.Size=Vector3.new(0.5,0.5,0.5);p.Color=Color3.fromRGB(255,150,200);p.CanCollide=false;local ch=LP.Character;if ch and ch:FindFirstChild("HumanoidRootPart")then p.Position=ch.HumanoidRootPart.Position+Vector3.new(math.random(-40,40),30,math.random(-40,40))end;game:GetService("Debris"):AddItem(p,5)end
            if C.AuraFire then local ch=LP.Character;if ch then local root=ch:FindFirstChild("HumanoidRootPart");if root and not root:FindFirstChild("FireAura")then local att=Instance.new("Attachment",root);att.Name="FireAura";local fire=Instance.new("Fire",att);fire.Size=5 end end end
            if C.AuraIce then local ch=LP.Character;if ch then local root=ch:FindFirstChild("HumanoidRootPart");if root and not root:FindFirstChild("IceAura")then local att=Instance.new("Attachment",root);att.Name="IceAura";local smoke=Instance.new("Smoke",att);smoke.Color=Color3.fromRGB(150,200,255)end end end
        end)
    end
end)
-- TIME STOP
task.spawn(function()
    while task.wait(0.1)do
        if C.TimeStop then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants())do
                    local ok,_,_=isE(o)
                    if ok and o:IsA("Model")then
                        local h=o:FindFirstChildWhichIsA("Humanoid")
                        if h then h.WalkSpeed=0 h.JumpPower=0 end
                    end
end
            end)
        end
    end
end)
-- SLOW MOTION
task.spawn(function()
    while task.wait(0.1)do
        if C.SlowMotion then
            pcall(function()workspace.Gravity=50 end)
        else
            pcall(function()workspace.Gravity=196.2 end)
        end
    end
end)
-- TIMER
task.spawn(function()while task.wait(1)do if C.ShowTimer then C.SpeedrunTimer=C.SpeedrunTimer+1 end end end)
-- ENTITY TRACKER (радар)
local trackerGui=Instance.new("ScreenGui");trackerGui.Name="EntityTracker";trackerGui.ResetOnSpawn=false;trackerGui.Parent=LP:WaitForChild("PlayerGui")
local trackerFrame=Instance.new("Frame",trackerGui);trackerFrame.Size=UDim2.new(0,140,0,140);trackerFrame.Position=UDim2.new(1,-160,0,100);trackerFrame.BackgroundColor3=Color3.fromRGB(20,20,25);trackerFrame.BackgroundTransparency=0.4;trackerFrame.BorderSizePixel=0;trackerFrame.Visible=false
local tfc=Instance.new("UICorner",trackerFrame)tfc.CornerRadius=UDim.new(1,0)
local tfs=Instance.new("UIStroke",trackerFrame)tfs.Color=Color3.fromRGB(120,20,40)tfs.Thickness=2
local tTitle=Instance.new("TextLabel",trackerFrame);tTitle.Size=UDim2.new(1,0,0,16);tTitle.BackgroundTransparency=1;tTitle.Text="RADAR";tTitle.TextColor3=Color3.fromRGB(120,20,40);tTitle.Font=Enum.Font.GothamBold;tTitle.TextSize=10
task.spawn(function()
    while task.wait(0.3)do
        if C.EntityTracker then
            trackerFrame.Visible=true
            for _,c in ipairs(trackerFrame:GetChildren())do if c:IsA("Frame")and c.Name=="Dot"then c:Destroy()end end
            local ch=LP.Character;local root=ch and ch:FindFirstChild("HumanoidRootPart")
            if root then
                local pos=root.Position
                for _,o in ipairs(workspace:GetDescendants())do
                    local ok,_,ne=isE(o)
                    if ok then
                        local op=getP(o)
                        if op then
                            local d=(op-pos).Magnitude
                            if d<150 then
                                local dot=Instance.new("Frame",trackerFrame);dot.Name="Dot";dot.Size=UDim2.new(0,8,0,8)
                                local rx=math.clamp((op.X-pos.X)/150*0.5+0.5,0,1)
                                local rz=math.clamp((op.Z-pos.Z)/150*0.5+0.5,0,1)
                                dot.Position=UDim2.new(rx,-4,rz,-4);dot.BackgroundColor3=C.ESPColor;dot.BorderSizePixel=0
                                local dc=Instance.new("UICorner",dot)dc.CornerRadius=UDim.new(1,0)
                            end
                        end
                    end
                end
            end
        else trackerFrame.Visible=false end
    end
end)
-- LIGHT COLOR
task.spawn(function()while task.wait(0.5)do if C.LightBrightness~=2 then Lighting.Brightness=C.LightBrightness end end end)
-- ABYSSALL: TIME SHOWER (Archives)
local TS=Instance.new("TextLabel",LP:WaitForChild("PlayerGui"))
TS.Name="TimeShower";TS.AnchorPoint=Vector2.new(0,1);TS.Position=UDim2.new(0,12,1,-12);TS.Size=UDim2.new(0,180,0,32)
TS.BackgroundTransparency=1;TS.TextColor3=Color3.fromRGB(255,255,255);TS.TextStrokeColor3=Color3.fromRGB(0,0,0);TS.TextStrokeTransparency=0.35
TS.Font=Enum.Font.GothamBold;TS.TextSize=18;TS.TextXAlignment=Enum.TextXAlignment.Left;TS.Text="Time: --:--";TS.Visible=false
task.spawn(function()
    while task.wait(0.5)do
        if C.TimeShower then
            TS.Visible=true
            local label=nil
            if CR then
                for _,r in ipairs(CR:GetChildren())do
                    local c=r:FindFirstChild("ArchivesClock",true)
                    if c then local t=c:FindFirstChild("Time",true);if t then local tl=t:FindFirstChild("TextLabel");if tl then label=tl break end end end
                end
            end
            if label then TS.Text="Time: "..label.Text else TS.Text="Time: --:--" end
        else TS.Visible=false end
    end
end)
print("[Burmalda v13] Part 3/6 loaded")
-- Part 4/6 - Fun / Spawn / Admin / Mobile / Shop / Achiev / Favorites / Mobile Custom Buttons
-- ВСТАВИТЬ ПОСЛЕ ЧАСТИ 3

-- MOBILE CUSTOM BUTTONS (работает до GUI)
local SG_Mobile=Instance.new("ScreenGui")
SG_Mobile.Name="BurmaldaMobileBtns"
SG_Mobile.ResetOnSpawn=false
SG_Mobile.Parent=LP:WaitForChild("PlayerGui")

local QBF=Instance.new("Frame",SG_Mobile)
QBF.Size=UDim2.new(0,65,0,220)
QBF.Position=UDim2.new(1,-75,0,200)
QBF.BackgroundTransparency=1
QBF.Active=true
local QBL=Instance.new("UIListLayout",QBF)
QBL.Padding=UDim.new(0,8)
QBL.SortOrder=Enum.SortOrder.LayoutOrder

function makeQuickBtn(text,col,cb)
    local b=Instance.new("TextButton",QBF)
    b.Size=UDim2.new(1,0,0,65)
    b.BackgroundColor3=col
    b.Text=text
    b.TextColor3=Color3.fromRGB(255,255,255)
    b.Font=Enum.Font.GothamBold
    b.TextSize=11
    b.BorderSizePixel=0
    local c=Instance.new("UICorner",b);c.CornerRadius=UDim.new(1,0)
    local s=Instance.new("UIStroke",b);s.Color=Color3.fromRGB(255,255,255);s.Thickness=2
    b.MouseButton1Click:Connect(cb)
    return b
end

makeQuickBtn("TP",Color3.fromRGB(120,20,40),function()pcall(tpNearestItem)end)
makeQuickBtn("HIDE",Color3.fromRGB(40,120,60),function()pcall(aH)end)
makeQuickBtn("FLY",Color3.fromRGB(60,80,140),function()C.Fly=not C.Fly;setFly(C.Fly);N(C.Fly and "Fly ON"or "Fly OFF")end)
makeQuickBtn("NOCLIP",Color3.fromRGB(80,60,120),function()C.Noclip=not C.Noclip;setNC(C.Noclip);N(C.Noclip and "Noclip ON"or "Noclip OFF")end)

-- SPAWN MENU (визуальный)
local spawnFolder=Instance.new("Folder",workspace)
spawnFolder.Name="BurmaldaSpawned"

function spawnVisual(name,color,size,shape)
    local ch=LP.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart")then return end
    local p=Instance.new("Part",spawnFolder)
    p.Size=size or Vector3.new(2,2,2)
    p.Shape=shape or Enum.PartType.Block
    p.Color=color or Color3.fromRGB(255,0,0)
    p.Position=ch.HumanoidRootPart.Position+Vector3.new(math.random(-5,5),3,math.random(-5,5))
    p.CanCollide=false
    p.Material=Enum.Material.Neon
    game:GetService("Debris"):AddItem(p,15)
end

function spawnRush()spawnVisual("Rush",Color3.fromRGB(255,0,0),Vector3.new(5,5,5),Enum.PartType.Ball)end
function spawnAmbush()spawnVisual("Ambush",Color3.fromRGB(255,80,0),Vector3.new(5,5,5),Enum.PartType.Ball)end
function spawnSeek()spawnVisual("Seek",Color3.fromRGB(150,0,255),Vector3.new(5,5,5),Enum.PartType.Ball)end
function spawnFigure()spawnVisual("Figure",Color3.fromRGB(100,0,0),Vector3.new(5,5,5),Enum.PartType.Ball)end
function spawnCoin()spawnVisual("Coin",Color3.fromRGB(255,215,0),Vector3.new(1.5,1.5,1.5),Enum.PartType.Ball)end
function spawnKey()spawnVisual("Key",Color3.fromRGB(255,255,100),Vector3.new(1,1,1),Enum.PartType.Block)end

-- FUN: Confetti
function doConfetti()
    for i=1,50 do
        task.spawn(function()
            local ch=LP.Character
            if not ch or not ch:FindFirstChild("HumanoidRootPart")then return end
            local p=Instance.new("Part",workspace)
            p.Size=Vector3.new(0.5,0.5,0.5)
            p.Color=Color3.fromHSV(math.random(),1,1)
            p.CanCollide=false
            p.Position=ch.HumanoidRootPart.Position+Vector3.new(math.random(-30,30),20+math.random(0,20),math.random(-30,30))
            game:GetService("Debris"):AddItem(p,5)
        end)
    end
end

-- FUN: Fireworks
task.spawn(function()
    while task.wait(0.5)do
        if C.FunFire then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart")then
                for i=1,3 do
                    local p=Instance.new("Part",workspace)
                    p.Size=Vector3.new(0.5,0.5,0.5)
                    p.Color=Color3.fromHSV(math.random(),1,1)
                    p.Material=Enum.Material.Neon
                    p.CanCollide=false
p.Position=ch.HumanoidRootPart.Position+Vector3.new(math.random(-50,50),50+math.random(0,30),math.random(-50,50))
                    game:GetService("Debris"):AddItem(p,2)
                end
            end
        end
    end
end)

-- FUN: Chat Spam
function chatSpam(msg,count)
    pcall(function()
        local Folder=RS:FindFirstChild("DefaultChatSystemEvents")or Instance.new("Folder")
        local Event=Folder:FindFirstChild("SayMessageRequest")or Instance.new("RemoteEvent")
        for i=1,(count or 5)do Event:FireServer(msg or "Burmalda on top!","All")end
    end)
end

-- FUN: Random TP
function randomTP()
    local ch=LP.Character
    if ch and ch:FindFirstChild("HumanoidRootPart")then
        ch.HumanoidRootPart.CFrame=CFrame.new(math.random(-200,200),50,math.random(-200,200))
        N("Random TP")
    end
end

-- FUN: Fake Death
function fakeDeath()
    local ch=LP.Character
    local h=ch and ch:FindFirstChildOfClass("Humanoid")
    if h then h.Health=0 end
end

-- ABYSSALL: Spectate Entity
local spectateConn
function startSpectate()
    if spectateConn then spectateConn:Disconnect()end
    spectateConn=Run.Heartbeat:Connect(function()
        if not C.SpectateEntity then return end
        local closest,dist=nil,math.huge
        for _,o in ipairs(workspace:GetDescendants())do
            local ok,_,_=isE(o)
            if ok then
                local p=getP(o)
                if p then
                    local d=(p-LP.Character.HumanoidRootPart.Position).Magnitude
                    if d<dist then dist=d closest=o end
                end
            end
        end
        if closest then
            local hum=closest:FindFirstChildWhichIsA("Humanoid")
            if hum then workspace.CurrentCamera.CameraSubject=hum end
        end
    end)
end

-- ABYSSALL: Auto Solve Anchors
task.spawn(function()
    while task.wait(0.5)do
        if C.AutoSolveAnchors and RF then
            pcall(function()
                if CR then
                    for _,anchor in ipairs(CR:GetDescendants())do
                        if anchor.Name=="MinesAnchor"then
                            local sign=anchor:FindFirstChild("Sign")
                            if sign and sign:FindFirstChild("TextLabel")then
                                local code=sign.TextLabel.Text
                                if code and #code>0 then
                                    local prompt=anchor:FindFirstChildWhichIsA("ProximityPrompt",true)
                                    if prompt and prompt.Enabled then
                                        local pp=prompt.Parent:IsA("BasePart")and prompt.Parent or prompt.Parent:FindFirstChildWhichIsA("BasePart",true)
                                        if pp and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then
                                            if(pp.Position-LP.Character.HumanoidRootPart.Position).Magnitude<20 then
                                                prompt:InputHoldBegin()
                                                task.wait(0.1)
                                                prompt:InputHoldEnd()
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ABYSSALL: Auto Unlock Padlock
task.spawn(function()
    while task.wait(0.5)do
        if C.AutoPadlock and RF then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants())do
                    if o:IsA("ProximityPrompt")and o.Enabled and o.Parent then
                        local n=(o.Parent.Name..(o.ActionText or "")..(o.ObjectText or "")):lower()
                        if n:find("padlock")or n:find("lock")then
local pp=o.Parent:IsA("BasePart")and o.Parent or o.Parent:FindFirstChildWhichIsA("BasePart",true)
                            if pp and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then
                                if(pp.Position-LP.Character.HumanoidRootPart.Position).Magnitude<15 then
                                    o:InputHoldBegin()
                                    task.wait(0.1)
                                    o:InputHoldEnd()
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ABYSSALL: Guess Library Code
function guessLibraryCode()
    pcall(function()
        for _,o in ipairs(workspace:GetDescendants())do
            if o:IsA("ProximityPrompt")and o.Parent then
                local n=(o.Parent.Name..(o.ActionText or "")):lower()
                if n:find("library")or n:find("padlock")then
                    local pp=o.Parent:IsA("BasePart")and o.Parent or o.Parent:FindFirstChildWhichIsA("BasePart",true)
                    if pp and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then
                        if(pp.Position-LP.Character.HumanoidRootPart.Position).Magnitude<15 then
                            for tries=1,10 do
                                local code=""
                                for i=1,5 do code=code..tostring(math.random(0,9))end
                                o:InputHoldBegin()
                                task.wait(0.05)
                                o:InputHoldEnd()
                                task.wait(0.3)
                            end
                        end
                    end
                end
            end
        end
    end)
end

-- ABYSSALL: Auto Heartbeat (Figure minigame)
task.spawn(function()
    while task.wait(0.1)do
        if C.AutoHeartbeat then
            pcall(function()
                local pg=LP:FindFirstChild("PlayerGui")
                if pg then
                    for _,o in ipairs(pg:GetDescendants())do
                        if o:IsA("TextButton")or o:IsA("ImageButton")then
                            local n=o.Name:lower()
                            if n:find("heart")or n:find("beat")then
                                o:Activate()
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ABYSSALL: Honcho Correct Box ESP (Archives)
task.spawn(function()
    while task.wait(3)do
        if C.HonchoESP and CR then
            pcall(function()
                for _,room in ipairs(CR:GetChildren())do
                    if tonumber(room.Name)then
                        local honcho=room:FindFirstChild("ArchivesHonchoRoom",true)
                        if honcho then
                            local boxIDs={}
                            for _,d in ipairs(room:GetDescendants())do
                                if d.Name=="ArchivesPackageDeposit"then
                                    local bid=d:GetAttribute("BoxID")
                                    if bid then boxIDs[bid]=true end
                                end
                            end
                            for _,box in ipairs(honcho:GetDescendants())do
                                if box.Name=="ArchivesStorageBox"then
                                    local tb=box:GetAttribute("Tool_BoxID")
                                    if tb and boxIDs[tb]then
                                        makeESP(box,Color3.fromRGB(0,255,0),"Correct Box",3)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ABYSSALL: Forget Me Not Solver
task.spawn(function()
    while task.wait(0.5)do
        if C.ForgetMeNot then
pcall(function()
                for _,o in ipairs(workspace:GetDescendants())do
                    if o.Name:lower():find("forgetmenot")then
                        local p=o:IsA("BasePart")and o or o:FindFirstChildWhichIsA("BasePart",true)
                        if p and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then
                            if(p.Position-LP.Character.HumanoidRootPart.Position).Magnitude<15 then
                                local prompt=o:FindFirstChildWhichIsA("ProximityPrompt",true)
                                if prompt and prompt.Enabled then
                                    prompt:InputHoldBegin()
                                    task.wait(0.05)
                                    prompt:InputHoldEnd()
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

print("[Burmalda v13] Part 4/6 loaded")
-- Part 5/6 - FULL GUI (все вкладки, тумблеры, слайдеры)
-- ВСТАВИТЬ ПОСЛЕ ЧАСТИ 4

-- FLOOR SELECT (стартовый экран)
local FS=Instance.new("ScreenGui");FS.Name="BurmaldaFS";FS.ResetOnSpawn=false;FS.IgnoreGuiInset=true;FS.Parent=LP:WaitForChild("PlayerGui")
local FB=Instance.new("Frame",FS);FB.Size=UDim2.new(1,0,1,0);FB.BackgroundColor3=Color3.fromRGB(15,15,18);FB.BackgroundTransparency=0.3;FB.BorderSizePixel=0
local FM=Instance.new("Frame",FB);FM.Size=UDim2.new(0,300,0,370);FM.Position=UDim2.new(0.5,-150,0.5,-185);FM.BackgroundColor3=Color3.fromRGB(20,20,25);FM.BorderSizePixel=0
local FMC=Instance.new("UICorner",FM);FMC.CornerRadius=UDim.new(0,12)
local FMS=Instance.new("UIStroke",FM);FMS.Color=Color3.fromRGB(120,20,40);FMS.Thickness=2
local FT=Instance.new("TextLabel",FM);FT.Size=UDim2.new(1,0,0,35);FT.Position=UDim2.new(0,0,0,10);FT.BackgroundTransparency=1;FT.Text="BURMALDA v13";FT.TextColor3=Color3.fromRGB(120,20,40);FT.Font=Enum.Font.GothamBlack;FT.TextSize=22
local FSu=Instance.new("TextLabel",FM);FSu.Size=UDim2.new(1,0,0,18);FSu.Position=UDim2.new(0,0,0,46);FSu.BackgroundTransparency=1;FSu.Text="By KOTENOK7204";FSu.TextColor3=Color3.fromRGB(200,200,210);FSu.Font=Enum.Font.Gotham;FSu.TextSize=10
local FSu2=Instance.new("TextLabel",FM);FSu2.Size=UDim2.new(1,0,0,18);FSu2.Position=UDim2.new(0,0,0,62);FSu2.BackgroundTransparency=1;FSu2.Text="Tester: Kostya_2015KostyaKos";FSu2.TextColor3=Color3.fromRGB(255,200,100);FSu2.Font=Enum.Font.GothamBold;FSu2.TextSize=10
local FQ=Instance.new("TextLabel",FM);FQ.Size=UDim2.new(1,0,0,22);FQ.Position=UDim2.new(0,0,0,84);FQ.BackgroundTransparency=1;FQ.Text="Where are you?";FQ.TextColor3=Color3.fromRGB(240,240,245);FQ.Font=Enum.Font.GothamBold;FQ.TextSize=14
function mkFB(txt,y,fn)local b=Instance.new("TextButton",FM);b.Size=UDim2.new(0,270,0,32);b.Position=UDim2.new(0.5,-135,0,y);b.BackgroundColor3=Color3.fromRGB(40,40,45);b.Text=txt;b.TextColor3=Color3.fromRGB(240,240,245);b.Font=Enum.Font.GothamBold;b.TextSize=12;b.BorderSizePixel=0;local c=Instance.new("UICorner",b);c.CornerRadius=UDim.new(0,6);local s=Instance.new("UIStroke",b);s.Color=Color3.fromRGB(120,20,40);s.Thickness=1;b.MouseButton1Click:Connect(function()MF=fn;sv();FS:Destroy();N("Floor: "..fn)end)end
mkFB("Hotel",118,"Hotel");mkFB("Mines",155,"Mines");mkFB("Backdoor",192,"Backdoor");mkFB("Outdoors",229,"Outdoors");mkFB("Archives",266,"Archives");mkFB("Stairwell",303,"Stairwell")

-- MAIN GUI
_G.SG=Instance.new("ScreenGui");SG.Name="BurmaldaV13GUI";SG.ResetOnSpawn=false;SG.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;SG.Parent=LP:WaitForChild("PlayerGui")
local OB=Instance.new("TextButton",SG);OB.Size=UDim2.new(0,50,0,50);OB.Position=UDim2.new(0,10,0.5,-25);OB.BackgroundColor3=Color3.fromRGB(120,20,40);OB.Text="B";OB.TextColor3=Color3.fromRGB(255,255,255);OB.TextSize=20;OB.Font=Enum.Font.GothamBlack;OB.BorderSizePixel=0;OB.Draggable=true
local OBC=Instance.new("UICorner",OB);OBC.CornerRadius=UDim.new(1,0)
local OBS=Instance.new("UIStroke",OB);OBS.Color=Color3.fromRGB(240,240,245);OBS.Thickness=2
local M=Instance.new("Frame",SG);M.Size=UDim2.new(0,440,0,420);M.Position=UDim2.new(0.5,-220,0.5,-210);M.BackgroundColor3=T().bg;M.BorderSizePixel=0;M.Active=true;M.Draggable=true;M.Visible=false
local MC=Instance.new("UICorner",M);MC.CornerRadius=UDim.new(0,10)
local MS=Instance.new("UIStroke",M);MS.Color=T().accent;MS.Thickness=2
OB.MouseButton1Click:Connect(function()M.Visible=not M.Visible;OB.Text=M.Visible and "X"or "B"end)
local H=Instance.new("Frame",M);H.Size=UDim2.new(1,0,0,34);H.BackgroundColor3=T().accent;H.BorderSizePixel=0
local HC=Instance.new("UICorner",H);HC.CornerRadius=UDim.new(0,10)
local HT=Instance.new("TextLabel",H);HT.Size=UDim2.new(1,-40,1,0);HT.Position=UDim2.new(0,10,0,0);HT.BackgroundTransparency=1;HT.Text="BURMALDA v13 | "..gF();HT.TextColor3=Color3.fromRGB(255,255,255);HT.Font=Enum.Font.GothamBold;HT.TextSize=11;HT.TextXAlignment=Enum.TextXAlignment.Left
local CB=Instance.new("TextButton",H);CB.Size=UDim2.new(0,24,0,24);CB.Position=UDim2.new(1,-28,0,5);CB.BackgroundColor3=T().danger;CB.Text="X";CB.TextColor3=Color3.fromRGB(255,255,255);CB.Font=Enum.Font.GothamBold;CB.TextSize=12;CB.BorderSizePixel=0
local CBC=Instance.new("UICorner",CB);CBC.CornerRadius=UDim.new(0,4)
CB.MouseButton1Click:Connect(function()sv()M.Visible=false;OB.Text="B"end)
local TB=Instance.new("ScrollingFrame",M);TB.Size=UDim2.new(0,120,1,-34);TB.Position=UDim2.new(0,0,0,34);TB.BackgroundColor3=T().panel;TB.BorderSizePixel=0;TB.ScrollBarThickness=3;TB.ScrollBarImageColor3=T().accent;TB.CanvasSize=UDim2.new(0,0,3200)
local TBC=Instance.new("UICorner",TB);TBC.CornerRadius=UDim.new(0,10)
local TBL=Instance.new("UIListLayout",TB);TBL.Padding=UDim.new(0,3);TBL.SortOrder=Enum.SortOrder.LayoutOrder
local CT=Instance.new("Frame",M);CT.Size=UDim2.new(1,-125,1,-42);CT.Position=UDim2.new(0,122,0,38);CT.BackgroundTransparency=1
local Pg={}
function sw(n)for k,p in pairs(Pg)do p.Visible=(k==n)end end
function crP(n)
    local p=Instance.new("ScrollingFrame",CT);p.Size=UDim2.new(1,0,1,0);p.BackgroundTransparency=1;p.BorderSizePixel=0;p.ScrollBarThickness=3;p.ScrollBarImageColor3=T().accent;p.CanvasSize=UDim2.new(0,0,3200);p.Visible=false
    local L=Instance.new("UIListLayout",p);L.Padding=UDim.new(0,3);L.SortOrder=Enum.SortOrder.LayoutOrder
    Pg[n]=p;return p
end
local tL={{n="Main"},{n="Character"},{n="TP"},{n="Hide"},{n="AutoSeek"},{n="Bypass"},{n="Exploits",d=true},{n="ESP"},{n="Visual"},{n="Music"},{n="Sound"},{n="Move"},{n="Stats"},{n="Players"},{n="Features",d=true},{n="Farm"},{n="Fun"},{n="Spawn"},{n="Admin"},{n="Mobile"},{n="AntiDet",d=true},{n="Shop"},{n="Achiev"},{n="Favorites"},{n="Hotel"},{n="Mines"},{n="Backdoor"},{n="Outdoors"},{n="Archives"},{n="Stairwell"},{n="Settings"},{n="Info"}}
local tbts={}
for _,t in ipairs(tL)do crP(t.n);local b=Instance.new("TextButton",TB);b.Size=UDim2.new(0.9,0,0,24);b.BackgroundColor3=t.d and T().danger or T().panel;b.BorderSizePixel=0;b.Text=t.n;b.TextColor3=t.d and Color3.fromRGB(255,200,210)or T().text;b.Font=Enum.Font.Gotham;b.TextSize=9;b.LayoutOrder=#tbts+1;b:SetAttribute("d",t.d or false);local c=Instance.new("UICorner",b);c.CornerRadius=UDim.new(0,5);b.MouseButton1Click:Connect(function()sw(t.n);for _,x in ipairs(tbts)do x.BackgroundColor3=x:GetAttribute("d")and T().danger or T().panel end;b.BackgroundColor3=T().accent end);table.insert(tbts,b)end
sw("Main");if tbts[1]then tbts[1].BackgroundColor3=T().accent end
function mT(p,t,i,cb,d)local b=Instance.new("TextButton",p);b.Size=UDim2.new(1,-6,0,26);b.BackgroundColor3=d and T().danger or T().panel;b.BorderSizePixel=0;b.Text="";local c=Instance.new("UICorner",b);c.CornerRadius=UDim.new(0,5);local l=Instance.new("TextLabel",b);l.Size=UDim2.new(0.75,0,1,0);l.Position=UDim2.new(0,8,0,0);l.BackgroundTransparency=1;l.Text=t;l.TextColor3=d and Color3.fromRGB(255,200,210)or T().text;l.Font=Enum.Font.Gotham;l.TextSize=9;l.TextXAlignment=Enum.TextXAlignment.Left;local s=Instance.new("TextLabel",b);s.Size=UDim2.new(0.2,0,1,0);s.Position=UDim2.new(0.75,0,0,0);s.BackgroundTransparency=1;s.Text=i and "ON"or "OFF";s.TextColor3=i and Color3.fromRGB(80,220,120)or Color3.fromRGB(220,80,80);s.Font=Enum.Font.GothamBold;s.TextSize=9;local st=i;b.MouseButton1Click:Connect(function()st=not st;s.Text=st and "ON"or "OFF";s.TextColor3=st and Color3.fromRGB(80,220,120)or Color3.fromRGB(220,80,80);cb(st)end)end
function mB(p,t,cb,col)local b=Instance.new("TextButton",p);b.Size=UDim2.new(1,-6,0,28);b.BackgroundColor3=col or T().panel;b.BorderSizePixel=0;b.Text=t;b.TextColor3=T().text;b.Font=Enum.Font.GothamBold;b.TextSize=10;local c=Instance.new("UICorner",b);c.CornerRadius=UDim.new(0,5);b.MouseButton1Click:Connect(cb)end
function mS(p,t,mn,mx,i,cb)local f=Instance.new("Frame",p);f.Size=UDim2.new(1,-6,0,36);f.BackgroundColor3=T().panel;f.BorderSizePixel=0;local c=Instance.new("UICorner",f);c.CornerRadius=UDim.new(0,5);local l=Instance.new("TextLabel",f);l.Size=UDim2.new(1,-16,0,14);l.Position=UDim2.new(0,8,0,2);l.BackgroundTransparency=1;l.Text=t..": "..i;l.TextColor3=T().text;l.Font=Enum.Font.Gotham;l.TextSize=9;l.TextXAlignment=Enum.TextXAlignment.Left;local bar=Instance.new("Frame",f);bar.Size=UDim2.new(1,-16,0,10);bar.Position=UDim2.new(0,8,0,22);bar.BackgroundColor3=T().bg;bar.BorderSizePixel=0;local bc=Instance.new("UICorner",bar);bc.CornerRadius=UDim.new(0,4);local fl=Instance.new("Frame",bar);fl.Size=UDim2.new((i-mn)/(mx-mn),0,1,0);fl.BackgroundColor3=T().accent;fl.BorderSizePixel=0;local fc=Instance.new("UICorner",fl);fc.CornerRadius=UDim.new(0,4);local dr=false;bar.InputBegan:Connect(function(inp)if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then dr=true end end);bar.InputEnded:Connect(function(inp)if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then dr=false end end);UIS.InputChanged:Connect(function(inp)if dr and(inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch)then local r=math.clamp((inp.Position.X-bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1);fl.Size=UDim2.new(r,0,1,0);local v=math.floor(mn+(mx-mn)*r);l.Text=t..": "..v;cb(v)end end)end
function mL(p,t,col)local l=Instance.new("TextLabel",p);l.Size=UDim2.new(1,-6,0,20);l.BackgroundTransparency=1;l.Text=t;l.TextColor3=col or T().accent;l.Font=Enum.Font.GothamBold;l.TextSize=10;l.TextXAlignment=Enum.TextXAlignment.Left end

-- MAIN
mL(Pg["Main"],"QUICK")
mB(Pg["Main"],"TP to Item",function()pcall(tpNearestItem)end,T().accent)
mB(Pg["Main"],"Hide Now",function()pcall(aH)end,T().accent)
mB(Pg["Main"],"Save Config",function()sv()N("Saved")end,T().accent)
mL(Pg["Main"],"PLAYERS")
local plrList=Instance.new("Frame",Pg["Main"]);plrList.Size=UDim2.new(1,-6,0,0);plrList.BackgroundTransparency=1;plrList.AutomaticSize=Enum.AutomaticSize.Y
local plrLayout=Instance.new("UIListLayout",plrList);plrLayout.Padding=UDim.new(0,3)
function refreshPlayers()for _,c in ipairs(plrList:GetChildren())do if c:IsA("Frame")then c:Destroy()end end;for _,plr in ipairs(P:GetPlayers())do if plr~=LP then local row=Instance.new("Frame",plrList);row.Size=UDim2.new(1,0,0,28);row.BackgroundColor3=T().panel;row.BorderSizePixel=0;local rc=Instance.new("UICorner",row);rc.CornerRadius=UDim.new(0,5);local nb=Instance.new("TextButton",row);nb.Size=UDim2.new(0.6,0,1,0);nb.BackgroundColor3=T().accent;nb.Text=plr.Name;nb.TextColor3=Color3.fromRGB(255,255,255);nb.Font=Enum.Font.Gotham;nb.TextSize=9;nb.BorderSizePixel=0;local nc=Instance.new("UICorner",nb);nc.CornerRadius=UDim.new(0,5);nb.MouseButton1Click:Connect(function()pcall(function()tpToPlayer(plr)end)end);local bb=Instance.new("TextButton",row);bb.Size=UDim2.new(0.38,0,1,0);bb.Position=UDim2.new(0.62,0,0,0);bb.BackgroundColor3=Color3.fromRGB(60,80,140);bb.Text="Bring";bb.TextColor3=Color3.fromRGB(255,255,255);bb.Font=Enum.Font.GothamBold;bb.TextSize=9;bb.BorderSizePixel=0;local bc=Instance.new("UICorner",bb);bc.CornerRadius=UDim.new(0,5);bb.MouseButton1Click:Connect(function()pcall(function()bringPlayer(plr)end)end)end end end
mB(Pg["Main"],"Refresh Players",function()refreshPlayers()end,T().accent)
task.spawn(function()task.wait(1);refreshPlayers()end)

-- CHARACTER
mL(Pg["Character"],"CHARACTER")
mT(Pg["Character"],"Speed",C.SpeedEnabled,function(s)C.SpeedEnabled=s end)
mS(Pg["Character"],"Speed Boost",0,100,C.SpeedBoost,function(v)C.SpeedBoost=v end)
mS(Pg["Character"],"WalkSpeed",16,60,C.WalkSpeed,function(v)C.WalkSpeed=v end)
mS(Pg["Character"],"JumpPower",50,200,C.JumpPower,function(v)C.JumpPower=v end)
mT(Pg["Character"],"Infinite Jumps",C.InfiniteJumps,function(s)C.InfiniteJumps=s setInfJump(s)end)
mT(Pg["Character"],"Bunny Hop",C.BunnyHop,function(s)C.BunnyHop=s end)
mT(Pg["Character"],"Fly",C.Fly,function(s)C.Fly=s setFly(s)end)
mS(Pg["Character"],"Fly Speed",10,200,C.FlySpeed,function(v)C.FlySpeed=v end)
mT(Pg["Character"],"Noclip",C.Noclip,function(s)C.Noclip=s setNC(s)end)
mT(Pg["Character"],"Remove Closet Delay",C.RemoveClosetDelay,function(s)C.RemoveClosetDelay=s end)
mT(Pg["Character"],"Remove Accel",C.RemoveAccel,function(s)C.RemoveAccel=s end)
mT(Pg["Character"],"Enable Jumping",C.EnableJump,function(s)C.EnableJump=s end)
mT(Pg["Character"],"Enable Sliding",C.EnableSlide,function(s)C.EnableSlide=s end)

-- TP
mL(Pg["TP"],"TP")
mB(Pg["TP"],"TP to Nearest Item",function()pcall(tpNearestItem)end,T().accent)
mS(Pg["TP"],"TP Radius",50,2000,C.TPItemRadius,function(v)C.TPItemRadius=v end)
mT(Pg["TP"],"Bring Items",C.BringItems,function(s)C.BringItems=s end)
mS(Pg["TP"],"Bring Radius",20,500,C.BringRadius,function(v)C.BringRadius=v end)

-- HIDE
mL(Pg["Hide"],"HIDE")
mT(Pg["Hide"],"Infinite Hide",C.InfiniteHide,function(s)C.InfiniteHide=s end)
mT(Pg["Hide"],"Hide Lock",C.HideLock,function(s)C.HideLock=s end,true)
mT(Pg["Hide"],"Auto Re-Hide",C.AutoReHide,function(s)C.AutoReHide=s end)
mB(Pg["Hide"],"Force Hide Now",function()pcall(forceHide)end,T().accent)

-- AUTOSEEK
mL(Pg["AutoSeek"],"AUTO-SEEK")
mT(Pg["AutoSeek"],"Enable Auto-Seek",C.AutoSeek,function(s)C.AutoSeek=s end)
mT(Pg["AutoSeek"],"Auto Door",C.AutoDoor,function(s)C.AutoDoor=s end)
mT(Pg["AutoSeek"],"Auto Interact",C.AutoInteract,function(s)C.AutoInteract=s end)
mT(Pg["AutoSeek"],"Auto Platform (не прыгать)",C.AutoPlatform,function(s)C.AutoPlatform=s end)
mS(Pg["AutoSeek"],"Platform Size",3,15,5,function(v)C.PlatformSize=v end)

-- BYPASS
mL(Pg["Bypass"],"STANDARD")
mT(Pg["Bypass"],"Screech",false,function(s)C.BypassScreech=s if s then installSC()else removeSC()end end)
mT(Pg["Bypass"],"Halt",false,function(s)C.BypassHalt=s if s then startH()end end)
mT(Pg["Bypass"],"Eyes/Lookman",false,function(s)C.BypassEyes=s C.BypassLookman=s end)
mT(Pg["Bypass"],"Snare",false,function(s)C.BypassSnare=s end)
mT(Pg["Bypass"],"Lava",false,function(s)C.BypassKillbricks=s end)
mT(Pg["Bypass"],"ScaryWall",false,function(s)C.BypassSeekingWall=s end)
mT(Pg["Bypass"],"Banana",false,function(s)C.BypassBanana=s end)
mT(Pg["Bypass"],"Giggle",false,function(s)C.BypassGiggle=s end)
mT(Pg["Bypass"],"Dupe",false,function(s)C.BypassDupe=s end)
mT(Pg["Bypass"],"Vacuum",false,function(s)C.BypassVacuum=s end)
mT(Pg["Bypass"],"Gloombat Eggs",false,function(s)C.BypassGloombatEggs=s end)
mT(Pg["Bypass"],"Seek Obstructions",false,function(s)C.BypassSeekObstructions=s end)
mT(Pg["Bypass"],"Jeff",false,function(s)C.BypassJeff=s end)
mL(Pg["Bypass"],"MEGA (DANGER)",T().danger)
mT(Pg["Bypass"],"[DANGER] Bypass Rush",C.BypassRush,function(s)C.BypassRush=s end,true)
mT(Pg["Bypass"],"[DANGER] Bypass Ambush",C.BypassAmbush,function(s)C.BypassAmbush=s end,true)
mT(Pg["Bypass"],"[DANGER] Bypass Seek",C.BypassSeek,function(s)C.BypassSeek=s end,true)
mT(Pg["Bypass"],"[DANGER] Bypass Figure",C.BypassFigure,function(s)C.BypassFigure=s end,true)
mT(Pg["Bypass"],"[DANGER] Bypass Grumble",C.BypassGrumble,function(s)C.BypassGrumble=s end,true)
mT(Pg["Bypass"],"[DANGER] Bypass Giggle (Arch)",C.BypassGiggleArc,function(s)C.BypassGiggleArc=s end,true)
mT(Pg["Bypass"],"[DANGER] Bypass Drones (Arch)",C.BypassDrones,function(s)C.BypassDrones=s end,true)
mT(Pg["Bypass"],"[DANGER] Figure Invisible",C.FigureInvisible,function(s)C.FigureInvisible=s end,true)

-- EXPLOITS
mL(Pg["Exploits"],"EXPLOITS",T().danger)
mT(Pg["Exploits"],"[DANGER] God Mode",C.GodMode,function(s)C.GodMode=s end,true)
mT(Pg["Exploits"],"[DANGER] Infinite Revive",C.InfiniteRevive,function(s)C.InfiniteRevive=s end,true)
mT(Pg["Exploits"],"[DANGER] Infinite Items",C.InfiniteItems,function(s)C.InfiniteItems=s end,true)
mT(Pg["Exploits"],"[DANGER] Auto Dodge",C.AutoDodge,function(s)C.AutoDodge=s end,true)
mT(Pg["Exploits"],"[DANGER] Time Stop",C.TimeStop,function(s)C.TimeStop=s end,true)
mT(Pg["Exploits"],"[DANGER] Slow Motion",C.SlowMotion,function(s)C.SlowMotion=s end,true)
mB(Pg["Exploits"],"Play Again",function()if RF and RF:FindFirstChild("PlayAgain")then pcall(function()RF.PlayAgain:FireServer()end)end end,T().danger)
mB(Pg["Exploits"],"Return to Lobby",function()if RF and RF:FindFirstChild("Lobby")then pcall(function()RF.Lobby:FireServer()end)end end,T().danger)
mB(Pg["Exploits"],"Revive",function()if RF and RF:FindFirstChild("Revive")then pcall(function()RF.Revive:FireServer()end)end end,T().danger)
mB(Pg["Exploits"],"Void",function()local ch=LP.Character;if ch then ch:PivotTo(ch:GetPivot()+Vector3.new(0,-120-ch:GetPivot().Position.Y,0))end end,T().danger)

-- ESP
mL(Pg["ESP"],"MONSTERS")
mT(Pg["ESP"],"ALL",false,function(s)C.ESP_All=s end)
mT(Pg["ESP"],"Rush",false,function(s)C.ESP_Rush=s end)
mT(Pg["ESP"],"Ambush",false,function(s)C.ESP_Ambush=s end)
mT(Pg["ESP"],"Seek",false,function(s)C.ESP_Seek=s end)
mT(Pg["ESP"],"Figure",false,function(s)C.ESP_Figure=s end)
mT(Pg["ESP"],"Screech",false,function(s)C.ESP_Screech=s end)
mT(Pg["ESP"],"Hide",false,function(s)C.ESP_Hide=s end)
mT(Pg["ESP"],"Eyes",false,function(s)C.ESP_Eyes=s end)
mT(Pg["ESP"],"Halt",false,function(s)C.ESP_Halt=s end)
mT(Pg["ESP"],"Grumble",false,function(s)C.ESP_Grumble=s end)
mT(Pg["ESP"],"Giggle",false,function(s)C.ESP_Giggle=s end)
mT(Pg["ESP"],"Blitz",false,function(s)C.ESP_Blitz=s end)
mT(Pg["ESP"],"Lookman",false,function(s)C.ESP_Lookman=s end)
mT(Pg["ESP"],"Noise",false,function(s)C.ESP_Noise=s end)
mT(Pg["ESP"],"Creak",false,function(s)C.ESP_Creak=s end)
mT(Pg["ESP"],"Scribbles",false,function(s)C.ESP_Scribbles=s end)
mT(Pg["ESP"],"Teller",false,function(s)C.ESP_Teller=s end)
mT(Pg["ESP"],"Drones",false,function(s)C.ESP_Drones=s end)
mT(Pg["ESP"],"Bash",false,function(s)C.ESP_Bash=s end)
mT(Pg["ESP"],"Monument",false,function(s)C.ESP_Monument=s end)
mT(Pg["ESP"],"Sally",false,function(s)C.ESP_Sally=s end)
mT(Pg["ESP"],"Frozen Ambush",false,function(s)C.ESP_Frozen=s end)
mL(Pg["ESP"],"OBJECTS")
mT(Pg["ESP"],"Doors",false,function(s)C.ESP_Doors=s end)
mT(Pg["ESP"],"Closets",false,function(s)C.ESP_Closets=s end)
mT(Pg["ESP"],"Money",false,function(s)C.ESP_Money=s end)
mT(Pg["ESP"],"Keys",false,function(s)C.ESP_Keys=s end)
mT(Pg["ESP"],"Items",false,function(s)C.ESP_Items=s end)
mT(Pg["ESP"],"Ladders",false,function(s)C.ESP_Ladders=s end)
mT(Pg["ESP"],"Library",false,function(s)C.ESP_Library=s end)
mT(Pg["ESP"],"Breaker",false,function(s)C.ESP_Breaker=s end)
mT(Pg["ESP"],"Objectives (Anchor/Valve)",false,function(s)C.ESP_Objectives=s end)
mT(Pg["ESP"],"Players",false,function(s)C.ESP_Players=s end)
mL(Pg["ESP"],"SMART")
mT(Pg["ESP"],"Smart ESP",C.SmartESP,function(s)C.SmartESP=s end)
mS(Pg["ESP"],"Smart Range",50,500,C.SmartRange,function(v)C.SmartRange=v end)

-- VISUAL
mL(Pg["Visual"],"COLORS")
mB(Pg["Visual"],"Bordeaux",function()C.ESPColor=Color3.fromRGB(180,30,30)clearESP()end,T().danger)
mB(Pg["Visual"],"Red",function()C.ESPColor=Color3.fromRGB(255,50,50)clearESP()end,T().accent)
mB(Pg["Visual"],"Green",function()C.ESPColor=Color3.fromRGB(50,255,50)clearESP()end,T().accent)
mB(Pg["Visual"],"Blue",function()C.ESPColor=Color3.fromRGB(50,150,255)clearESP()end,T().accent)
mT(Pg["Visual"],"Rainbow",C.RainbowMode,function(s)C.RainbowMode=s end)
mT(Pg["Visual"],"X-Ray",C.XRay,function(s)C.XRay=s end)
mT(Pg["Visual"],"Show Distance",C.ShowDistance,function(s)C.ShowDistance=s end)
mS(Pg["Visual"],"Max Distance",50,1500,500,function(v)C.MaxDistance=v end)
mL(Pg["Visual"],"CAMERA")
mS(Pg["Visual"],"FOV",40,120,C.FOV,function(v)C.FOV=v end)
mT(Pg["Visual"],"Third Person",C.ThirdPerson,function(s)C.ThirdPerson=s end)
mT(Pg["Visual"],"No Fog",C.NoFog,function(s)C.NoFog=s end)
mS(Pg["Visual"],"Light Brightness",0,10,2,function(v)C.LightBrightness=v end)
mL(Pg["Visual"],"EXTRAS")
mT(Pg["Visual"],"Crosshair",C.Crosshair,function(s)C.Crosshair=s end)
mT(Pg["Visual"],"Wallhack",C.Wallhack,function(s)C.Wallhack=s end,true)
mT(Pg["Visual"],"Chams",C.Chams,function(s)C.Chams=s end,true)
mT(Pg["Visual"],"Rush Tracer",C.RushTracer,function(s)C.RushTracer=s end)
mB(Pg["Visual"],"Clear ESP",function()clearESP()N("Cleared")end)

-- MUSIC
mL(Pg["Music"],"MUSIC PLAYER")
local musicBox=Instance.new("TextBox",Pg["Music"]);musicBox.Size=UDim2.new(1,-6,0,30);musicBox.BackgroundColor3=T().panel;musicBox.Text="";musicBox.PlaceholderText="Music ID";musicBox.TextColor3=T().text;musicBox.Font=Enum.Font.Gotham;musicBox.TextSize=10;musicBox.BorderSizePixel=0
local mbc=Instance.new("UICorner",musicBox);mbc.CornerRadius=UDim.new(0,5)
mB(Pg["Music"],"Play",function()playMusic(musicBox.Text)end,T().accent)
mS(Pg["Music"],"Volume",0,10,5,function(v)C.MusicVolume=v/10;if musicSound then musicSound.Volume=v/10 end end)
mB(Pg["Music"],"Stop",function()stopMusic()end,T().danger)
mL(Pg["Music"],"PRESETS")
mB(Pg["Music"],"Doors OST",function()playMusic("1837879082")end,T().accent)
mB(Pg["Music"],"Lofi",function()playMusic("1838398637")end,T().accent)
mB(Pg["Music"],"Rickroll",function()playMusic("1848354536")end,T().accent)

-- SOUND
mL(Pg["Sound"],"WARNINGS")
mT(Pg["Sound"],"Rush Warning",C.RushWarning,function(s)C.RushWarning=s end)
mT(Pg["Sound"],"Ambush Warning",C.AmbushWarning,function(s)C.AmbushWarning=s end)
mT(Pg["Sound"],"Seek Warning",C.SeekWarning,function(s)C.SeekWarning=s end)
mT(Pg["Sound"],"Halt Warning",C.HaltWarning,function(s)C.HaltWarning=s end)
mT(Pg["Sound"],"Sound On",C.NotifySound,function(s)C.NotifySound=s end)
mL(Pg["Sound"],"NOTIFY")
mT(Pg["Sound"],"Notify Monsters",C.NotifyMonsters,function(s)C.NotifyMonsters=s end)
mT(Pg["Sound"],"Notify Items",C.NotifyItems,function(s)C.NotifyItems=s end)

-- MOVE
mL(Pg["Move"],"MOVE")
mT(Pg["Move"],"Bunny Hop",C.BunnyHop,function(s)C.BunnyHop=s end)
mT(Pg["Move"],"Remove Acceleration",C.RemoveAccel,function(s)C.RemoveAccel=s end)
mB(Pg["Move"],"Save Position",function()local ch=LP.Character;if ch and ch:FindFirstChild("HumanoidRootPart")then _G.SavedPos=ch.HumanoidRootPart.CFrame;N("Saved")end end)
mB(Pg["Move"],"TP to Saved",function()local ch=LP.Character;if ch and ch:FindFirstChild("HumanoidRootPart")and _G.SavedPos then ch.HumanoidRootPart.CFrame=_G.SavedPos;N("TP")end end,T().accent)

-- STATS
mL(Pg["Stats"],"STATS")
mL(Pg["Stats"],"Deaths: "..(_G.Deaths or 0))
mL(Pg["Stats"],"Knobs: "..(_G.Knobs or 0))
mL(Pg["Stats"],"Doors: "..(_G.Doors or 0))
mL(Pg["Stats"],"Level: "..C.Level)
mB(Pg["Stats"],"Reset Stats",function()_G.Deaths=0;_G.Knobs=0;_G.Doors=0 end,T().danger)

-- PLAYERS
mL(Pg["Players"],"PLAYERS")
mT(Pg["Players"],"ESP Players",C.ESP_Players,function(s)C.ESP_Players=s end)
mT(Pg["Players"],"Spectate Nearest",C.SpectateEntity,function(s)C.SpectateEntity=s;if s then startSpectate()end end)
mB(Pg["Players"],"List (Console)",function()for _,plr in ipairs(P:GetPlayers())do print(plr.Name,plr.UserId)end;N("Console")end)
mB(Pg["Players"],"Chat Spam",function()chatSpam("Burmalda v13 on top!",5)end,T().danger)

-- FEATURES
mL(Pg["Features"],"КРУТЫЕ ФИШКИ",T().danger)
mT(Pg["Features"],"[DANGER] God Rusher",C.GodRusher,function(s)C.GodRusher=s end,true)
mT(Pg["Features"],"[DANGER] Entity Freeze",C.EntityFreeze,function(s)C.EntityFreeze=s end,true)
mT(Pg["Features"],"[DANGER] Speed 10x",C.Speed10x,function(s)C.Speed10x=s end,true)
mT(Pg["Features"],"[DANGER] Invisible",C.Invisible,function(s)C.Invisible=s end,true)
mT(Pg["Features"],"Entity Tracker (Radar)",C.EntityTracker,function(s)C.EntityTracker=s end)
mT(Pg["Features"],"Adaptive Speed",C.AdaptiveSpeed,function(s)C.AdaptiveSpeed=s end)
mT(Pg["Features"],"Predictive Hide",C.PredictiveHide,function(s)C.PredictiveHide=s end)
mT(Pg["Features"],"Auto-Crouch (Figure)",C.AutoCrouch,function(s)C.AutoCrouch=s end)

-- FARM
mL(Pg["Farm"],"AUTO-FARM")
mT(Pg["Farm"],"Auto Farm",C.AutoFarm,function(s)C.AutoFarm=s end)
mT(Pg["Farm"],"Auto Play Again",C.AutoPlayAgain,function(s)C.AutoPlayAgain=s end)
mL(Pg["Farm"],"FARM DEATHS",T().danger)
mT(Pg["Farm"],"[DANGER] Farm Deaths",C.AutoFarmDeaths,function(s)C.AutoFarmDeaths=s end,true)
mS(Pg["Farm"],"Doors Before Death",1,10,C.FarmDoors,function(v)C.FarmDoors=v end)
mS(Pg["Farm"],"Delay (сек)",1,30,C.FarmDelay,function(v)C.FarmDelay=v end)

-- FUN
mL(Pg["Fun"],"ПРИКОЛЫ")
mT(Pg["Fun"],"Rubber Ducks",C.DuckSpawn,function(s)C.DuckSpawn=s end)
mS(Pg["Fun"],"Duck Count",10,500,C.DuckCount,function(v)C.DuckCount=v end)
mT(Pg["Fun"],"Rainbow Body",C.FunRainbow,function(s)C.FunRainbow=s end)
mT(Pg["Fun"],"Snow",C.Snow,function(s)C.Snow=s end)
mT(Pg["Fun"],"Leaves",C.Leaves,function(s)C.Leaves=s end)
mT(Pg["Fun"],"Petals",C.Petals,function(s)C.Petals=s end)
mT(Pg["Fun"],"Fire Aura",C.AuraFire,function(s)C.AuraFire=s end)
mT(Pg["Fun"],"Ice Aura",C.AuraIce,function(s)C.AuraIce=s end)
mT(Pg["Fun"],"Fireworks",C.FunFire,function(s)C.FunFire=s end)
mB(Pg["Fun"],"Confetti!",function()doConfetti()end,T().accent)
mB(Pg["Fun"],"Random TP",function()randomTP()end,T().accent)
mB(Pg["Fun"],"Fake Death",function()fakeDeath()end,T().danger)

-- SPAWN
mL(Pg["Spawn"],"SPAWN MENU (визуальный)")
mB(Pg["Spawn"],"Spawn Rush",function()spawnRush();N("Rush!")end,T().danger)
mB(Pg["Spawn"],"Spawn Ambush",function()spawnAmbush();N("Ambush!")end,T().danger)
mB(Pg["Spawn"],"Spawn Seek",function()spawnSeek();N("Seek!")end,T().danger)
mB(Pg["Spawn"],"Spawn Figure",function()spawnFigure();N("Figure!")end,T().danger)
mB(Pg["Spawn"],"Spawn Coin",function()spawnCoin()end,T().accent)
mB(Pg["Spawn"],"Spawn Key",function()spawnKey()end,T().accent)
mL(Pg["Spawn"],"⚠️ Только визуально")

-- ADMIN
mL(Pg["Admin"],"ADMIN",T().accent)
mT(Pg["Admin"],"Gold Name",false,function(s)pcall(function()local ch=LP.Character;if ch then local h=ch:FindFirstChildOfClass("Head");if h then local hl=h:FindFirstChild("AH")or Instance.new("Highlight",h);hl.Name="AH";hl.FillColor=Color3.fromRGB(255,215,0);hl.Enabled=s end end end)end)
mB(Pg["Admin"],"Admin Theme",function()C.Theme="Gold";sv();N("Gold theme")end,T().accent)
mB(Pg["Admin"],"Announce",function()N("[ADMIN] KOTENOK7204 | Tester: Kostya_2015KostyaKos")end,T().accent)

-- MOBILE
mL(Pg["Mobile"],"CUSTOM BUTTONS")
mB(Pg["Mobile"],"+ TP Button",function()makeQuickBtn("TP",Color3.fromRGB(120,20,40),function()pcall(tpNearestItem)end);N("TP added")end,T().accent)
mB(Pg["Mobile"],"+ Hide Button",function()makeQuickBtn("HIDE",Color3.fromRGB(40,120,60),function()pcall(aH)end);N("Hide added")end,T().accent)
mB(Pg["Mobile"],"+ Fly Button",function()makeQuickBtn("FLY",Color3.fromRGB(60,80,140),function()C.Fly=not C.Fly;setFly(C.Fly);N(C.Fly and "Fly ON"or "Fly OFF")end);N("Fly added")end,T().accent)
mB(Pg["Mobile"],"+ Noclip Button",function()makeQuickBtn("NOCLIP",Color3.fromRGB(80,60,120),function()C.Noclip=not C.Noclip;setNC(C.Noclip);N(C.Noclip and "Noclip ON"or "Noclip OFF")end);N("Noclip added")end,T().accent)
mB(Pg["Mobile"],"Hide All Buttons",function()QBF.Visible=false end,T().danger)
mB(Pg["Mobile"],"Show All Buttons",function()QBF.Visible=true end,T().accent)

-- ANTIDET
mL(Pg["AntiDet"],"ANTI-DETECT",T().danger)
mT(Pg["AntiDet"],"Delay Actions",C.AntiDetect,function(s)C.AntiDetect=s end)
mT(Pg["AntiDet"],"Safe Mode",C.SafeMode,function(s)C.SafeMode=s end,true)
mB(Pg["AntiDet"],"PANIC (выключить всё)",function()for k,v in pairs(C)do if type(v)=="boolean"then C[k]=false end end;clearESP();if FBV then FBV:Destroy()end;if NC then NC:Disconnect()end;N("PANIC!")end,T().danger)
mB(Pg["AntiDet"],"[DANGER] Disable AntiCheat 30s",function()N("Disabled 30s!");task.spawn(function()local t=tick()+30;while tick()<t do task.wait(0.1);pcall(function()for _,o in ipairs(RS:GetDescendants())do if o:IsA("RemoteEvent")and o.Name:lower():find("check")then o:Destroy()end end end)end end)end,T().danger)

-- SHOP
mL(Pg["Shop"],"SHOP")
mL(Pg["Shop"],"⚠️ Не работает в Doors")
mB(Pg["Shop"],"Free Items",function()N("Not available")end,T().danger)
mB(Pg["Shop"],"Show Prices",function()N("Not available")end,T().danger)

-- ACHIEV
mL(Pg["Achiev"],"ACHIEVEMENTS")
mL(Pg["Achiev"],"Progress shown in-game")
mB(Pg["Achiev"],"Reset Progress",function()N("Cannot reset server")end,T().danger)

-- FAVORITES
mL(Pg["Favorites"],"FAVORITES")
mB(Pg["Favorites"],"Profile 1 (Load)",function()ld();N("Profile 1 loaded")end,T().accent)
mB(Pg["Favorites"],"Save as Profile 1",function()sv();N("Profile saved")end,T().accent)

-- HOTEL
mL(Pg["Hotel"],"HOTEL")
mT(Pg["Hotel"],"Rush",false,function(s)C.ESP_Rush=s end)
mT(Pg["Hotel"],"Ambush",false,function(s)C.ESP_Ambush=s end)
mT(Pg["Hotel"],"Seek",false,function(s)C.ESP_Seek=s end)
mT(Pg["Hotel"],"Figure",false,function(s)C.ESP_Figure=s end)
mT(Pg["Hotel"],"Hide",false,function(s)C.ESP_Hide=s end)

-- MINES
mL(Pg["Mines"],"MINES")
mT(Pg["Mines"],"Grumble",false,function(s)C.ESP_Grumble=s end)
mT(Pg["Mines"],"Giggle",false,function(s)C.ESP_Giggle=s end)
mT(Pg["Mines"],"Minecart",false,function(s)C.ESP_Minecart=s end)
mT(Pg["Mines"],"Lava",false,function(s)C.ESP_Lava=s end)
mT(Pg["Mines"],"Auto Steer Minecart",C.AutoSeek,function(s)C.AutoSeek=s end)

-- BACKDOOR
mL(Pg["Backdoor"],"BACKDOOR")
mT(Pg["Backdoor"],"Halt",false,function(s)C.ESP_Halt=s end)
mT(Pg["Backdoor"],"Blitz",false,function(s)C.ESP_Blitz=s end)
mT(Pg["Backdoor"],"Lookman",false,function(s)C.ESP_Lookman=s end)

-- OUTDOORS
mL(Pg["Outdoors"],"OUTDOORS")
mT(Pg["Outdoors"],"Gloombat",false,function(s)C.ESP_Gloombat=s end)
mT(Pg["Outdoors"],"Hide",false,function(s)C.ESP_Hide=s end)

-- ARCHIVES (Abysall)
mL(Pg["Archives"],"ARCHIVES")
mT(Pg["Archives"],"Noise",false,function(s)C.ESP_Noise=s end)
mT(Pg["Archives"],"Creak",false,function(s)C.ESP_Creak=s end)
mT(Pg["Archives"],"Scribbles",false,function(s)C.ESP_Scribbles=s end)
mT(Pg["Archives"],"Teller",false,function(s)C.ESP_Teller=s end)
mT(Pg["Archives"],"Drones",false,function(s)C.ESP_Drones=s end)
mL(Pg["Archives"],"ABYSSALL")
mT(Pg["Archives"],"Time Shower",C.TimeShower,function(s)C.TimeShower=s end)
mT(Pg["Archives"],"Anti Ransom",C.AntiRansom,function(s)C.AntiRansom=s end,true)
mT(Pg["Archives"],"Anti Closet Trash",C.AntiClosetTrash,function(s)C.AntiClosetTrash=s end,true)
mT(Pg["Archives"],"Forget Me Not Solver",C.ForgetMeNot,function(s)C.ForgetMeNot=s end)
mT(Pg["Archives"],"Honcho Correct Box ESP",C.HonchoESP,function(s)C.HonchoESP=s end)
mT(Pg["Archives"],"Auto Solve Anchors",C.AutoSolveAnchors,function(s)C.AutoSolveAnchors=s end)
mT(Pg["Archives"],"Auto Unlock Padlock",C.AutoPadlock,function(s)C.AutoPadlock=s end)
mT(Pg["Archives"],"Auto Heartbeat (Figure)",C.AutoHeartbeat,function(s)C.AutoHeartbeat=s end)
mB(Pg["Archives"],"Guess Library Code",function()guessLibraryCode();N("Guessing...")end,T().accent)

-- STAIRWELL
mL(Pg["Stairwell"],"STAIRWELL")
mT(Pg["Stairwell"],"Seek",false,function(s)C.ESP_Seek=s end)
mT(Pg["Stairwell"],"Ladders",false,function(s)C.ESP_Ladders=s end)
mT(Pg["Stairwell"],"Doors",false,function(s)C.ESP_Doors=s end)

-- SETTINGS
mL(Pg["Settings"],"THEMES")
for name,_ in pairs(Th)do mB(Pg["Settings"],name,function()C.Theme=name;local t=T();M.BackgroundColor3=t.bg;H.BackgroundColor3=t.accent;TB.BackgroundColor3=t.panel;MS.Color=t.accent;for _,b in ipairs(tbts)do b.BackgroundColor3=b:GetAttribute("d")and t.danger or t.panel;b.TextColor3=t.text end;sv()end,T().accent)end
mL(Pg["Settings"],"SYSTEM")
mT(Pg["Settings"],"Auto Save",C.AutoSave,function(s)C.AutoSave=s end)
mB(Pg["Settings"],"Save Config",function()sv()N("Saved")end,T().accent)
mB(Pg["Settings"],"Load Config",function()ld()N("Loaded")end)
mB(Pg["Settings"],"Reset Config",function()pcall(function()if isfile and isfile(CFG)then delfile(CFG)end end)N("OK")end,T().danger)

-- INFO
mL(Pg["Info"],"INFO")
mL(Pg["Info"],"Script: Burmalda v13 FINAL")
mL(Pg["Info"],"Creator: KOTENOK7204")
mL(Pg["Info"],"Tester: Kostya_2015KostyaKos")
mL(Pg["Info"],"Player: "..LP.Name)
mL(Pg["Info"],"Floor: "..gF())
mL(Pg["Info"],"Ping: "..math.floor(LP:GetNetworkPing()*1000).."ms")
mL(Pg["Info"],"Version: 13.0")

N("Burmalda v13 loaded! Tester: Kostya_2015KostyaKos")
sv()
print("[Burmalda v13] Part 5/6 loaded - GUI READY")
-- Part 6/7 - Ignore Lists / Auto-Screenshot / Freecam / Profiles / Level / Daily
-- ВСТАВИТЬ ПОСЛЕ ЧАСТИ 5

-- AUTO INTERACT IGNORE LIST
local AutoInteractIgnore={
    GlitchFragments=true,
    JeffItems=true,
    DroppedItems=true,
    Currency=false,
    Minecarts=false,
    Locks=false,
    Closets=false,
    Doors=false
}

task.spawn(function()
    while task.wait(0.3)do
        if C.AutoInteract then
            local r=getR()
            if r then
                local pos=r.Position
                for _,o in ipairs(workspace:GetDescendants())do
                    if o:IsA("ProximityPrompt")and o.Enabled then
                        local par=o.Parent
                        if par then
                            local n=(par.Name..(o.ActionText or "")..(o.ObjectText or "")):lower()
                            local skip=false
                            if AutoInteractIgnore.GlitchFragments and n:find("glitch")then skip=true end
                            if AutoInteractIgnore.JeffItems and n:find("jeff")then skip=true end
                            if AutoInteractIgnore.DroppedItems and n:find("drop")then skip=true end
                            if AutoInteractIgnore.Currency and(n:find("coin")or n:find("gold"))then skip=true end
                            if AutoInteractIgnore.Minecarts and n:find("minecart")then skip=true end
                            if AutoInteractIgnore.Locks and n:find("lock")then skip=true end
                            if AutoInteractIgnore.Closets and(n:find("closet")or n:find("hiding"))then skip=true end
                            if AutoInteractIgnore.Doors and n:find("door")and not n:find("handler")then skip=true end
                            if not skip then
                                local pp=par:IsA("BasePart")and par or par:FindFirstChildWhichIsA("BasePart",true)
                                if pp and(pp.Position-pos).Magnitude<8 then
                                    pcall(function()
                                        o:InputHoldBegin()
                                        task.wait(0.05)
                                        o:InputHoldEnd()
                                    end)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- AUTO CLOSET ENTITY LIST
local AutoClosetIgnore={
    Rush=false,
    Ambush=false,
    Blitz=false,
    DronesStampede=false,
    Scribbles=false,
    A60=false,
    A120=false,
    AR0xMBUSH=false,
    RNIUSHCG=false
}

task.spawn(function()
    while task.wait(0.3)do
        if C.AutoCloset then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart")then
                local pos=ch.HumanoidRootPart.Position
                local danger=false
                for _,o in ipairs(workspace:GetDescendants())do
                    if o:IsA("Model")then
                        local n=o.Name:lower()
                        if n:find("rush")and not AutoClosetIgnore.Rush then danger=true end
                        if n:find("ambush")and not AutoClosetIgnore.Ambush then danger=true end
                        if n:find("blitz")and not AutoClosetIgnore.Blitz then danger=true end
                        if n:find("drones")and not AutoClosetIgnore.DronesStampede then danger=true end
                        if n:find("scribble")and not AutoClosetIgnore.Scribbles then danger=true end
                        if n:find("a60")and not AutoClosetIgnore.A60 then danger=true end
                        if n:find("a120")and not AutoClosetIgnore.A120 then danger=true end
                        if danger then
                            local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true)
                            if p and(p.Position-pos).Magnitude<80 then
                                pcall(forceHide)
                                break
end
                        end
                    end
                end
            end
        end
    end
end)

-- AUTO-SCREENSHOT
local screenshotFolder=Instance.new("Folder",workspace)
screenshotFolder.Name="BurmaldaScreenshots"

function takeScreenshot()
    pcall(function()
        local ch=LP.Character
        if ch and ch:FindFirstChild("HumanoidRootPart")then
            -- Визуальный скрин (не настоящий — но сохраняет позицию и время)
            local info=Instance.new("StringValue",screenshotFolder)
            info.Name="SS_"..os.time()
            info.Value=string.format("Pos: %.0f,%.0f,%.0f | Time: %d",ch.HumanoidRootPart.Position.X,ch.HumanoidRootPart.Position.Y,ch.HumanoidRootPart.Position.Z,C.SpeedrunTimer)
            N("Screenshot saved (console)")
            print("[Screenshot]",info.Value)
        end
    end)
end

-- AUTO-SCREENSHOT при победе/смерти
local lastHealth=100
task.spawn(function()
    while task.wait(0.5)do
        if C.AutoScreenshot then
            local ch=LP.Character
            if ch then
                local h=ch:FindFirstChildOfClass("Humanoid")
                if h then
                    if h.Health<=0 and lastHealth>0 then
                        pcall(takeScreenshot)
                        N("Death screenshot")
                    end
                    lastHealth=h.Health
                end
            end
        end
    end
end)

-- FREECAM
local freecamCam=nil
local freecamConn=nil
function setFreecam(state)
    if freecamConn then freecamConn:Disconnect()freecamConn=nil end
    if not state then
        workspace.CurrentCamera.CameraType=Enum.CameraType.Custom
        local ch=LP.Character
        local h=ch and ch:FindFirstChildOfClass("Humanoid")
        if h then workspace.CurrentCamera.CameraSubject=h end
        return
    end
    workspace.CurrentCamera.CameraType=Enum.CameraType.Scriptable
    local speed=1
    local startCF=workspace.CurrentCamera.CFrame
    freecamConn=Run.RenderStepped:Connect(function()
        if not C.Freecam then return end
        local cam=workspace.CurrentCamera
        local move=Vector3.zero
        if UIS:IsKeyDown(Enum.KeyCode.W)then move=move+cam.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.S)then move=move-cam.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.A)then move=move-cam.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.D)then move=move+cam.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.Space)then move=move+Vector3.new(0,1,0)end
        if UIS:IsKeyDown(Enum.KeyCode.LeftShift)then move=move-Vector3.new(0,1,0)end
        if UIS:IsKeyDown(Enum.KeyCode.LeftControl)then speed=5 else speed=1 end
        cam.CFrame=cam.CFrame+move*speed
    end)
end

-- MULTIPLE PROFILES
local Profiles={
    Default={},
    Farm={AutoFarm=true,AutoFarmDeaths=true,AutoPlayAgain=true,FarmDelay=3},
    Safe={ESP_All=true,ESP_Doors=true,ESP_Closets=true,AntiAFK=true},
    Rage={BypassRush=true,BypassAmbush=true,BypassSeek=true,BypassFigure=true,GodMode=true,InfiniteRevive=true},
    Stealth={InfiniteHide=true,HideLock=true,AutoReHide=true,AntiDetect=true,SafeMode=true}
}
local CurrentProfile="Default"

function loadProfile(name)
    if not Profiles[name]then N("Profile not found")return end
    for k,v in pairs(Profiles[name])do C[k]=v end
    CurrentProfile=name
    N("Profile: "..name)
    sv()
end

function saveProfile(name)
    Profiles[name]={}
    for k,v in pairs(C)do
        if type(v)=="boolean"or type(v)=="number"then Profiles[name][k]=v end
    end
    N("Profile saved: "..name)
end

-- LEVEL SYSTEM
task.spawn(function()
    while task.wait(5)do
        C.XP=C.XP+1
        if C.XP>=100 then
            C.XP=0
            C.Level=C.Level+1
            N("Level Up! Lv."..C.Level)
            pcall(function()
                local s=Instance.new("Sound",SS)
                s.SoundId="rbxassetid://9118823101"
                s.Volume=1
                s:Play()
task.delay(2,function()s:Destroy()end)
            end)
        end
    end
end)

-- DAILY QUESTS
local DailyQuests={
    Complete10Doors=false,
    Collect100Coins=false,
    Kill5Monsters=false,
    SurviveRush=false,
    Hide10Times=false
}
local DailyReset=os.time()+86400

task.spawn(function()
    while task.wait(10)do
        if C.DailyQuests then
            if os.time()>=DailyReset then
                for k,_ in pairs(DailyQuests)do DailyQuests[k]=false end
                DailyReset=os.time()+86400
                N("Daily Quests Reset!")
            end
        end
    end
end)

-- EXTRA VISUAL: Hitmarker (клик по экрану)
local hitmarkerGui=Instance.new("ScreenGui");hitmarkerGui.Name="Hitmarker";hitmarkerGui.ResetOnSpawn=false;hitmarkerGui.Parent=LP:WaitForChild("PlayerGui")
local hitLine1=Instance.new("Frame",hitmarkerGui);hitLine1.Size=UDim2.new(0,3,0,15);hitLine1.Position=UDim2.new(0.5,-8,0.5,-10);hitLine1.Rotation=45;hitLine1.BackgroundColor3=Color3.fromRGB(255,255,255);hitLine1.BorderSizePixel=0;hitLine1.Visible=false
local hitLine2=Instance.new("Frame",hitmarkerGui);hitLine2.Size=UDim2.new(0,3,0,15);hitLine2.Position=UDim2.new(0.5,5,0.5,-10);hitLine2.Rotation=-45;hitLine2.BackgroundColor3=Color3.fromRGB(255,255,255);hitLine2.BorderSizePixel=0;hitLine2.Visible=false

UIS.InputBegan:Connect(function(input,gp)
    if gp then return end
    if C.Hitmarker and input.UserInputType==Enum.UserInputType.MouseButton1 then
        hitLine1.Visible=true
        hitLine2.Visible=true
        task.delay(0.15,function()
            hitLine1.Visible=false
            hitLine2.Visible=false
        end)
    end
end)

-- DAMAGE NUMBERS (визуально)
local dmgGui=Instance.new("ScreenGui");dmgGui.Name="DmgNumbers";dmgGui.ResetOnSpawn=false;dmgGui.Parent=LP:WaitForChild("PlayerGui")

function showDamage(amount,pos)
    if not C.DamageNumbers then return end
    local label=Instance.new("TextLabel",dmgGui)
    label.Size=UDim2.new(0,80,0,30)
    label.Position=UDim2.new(pos.X/2000,0,pos.Y/2000,0)
    label.BackgroundTransparency=1
    label.Text="- "..amount
    label.TextColor3=Color3.fromRGB(255,50,50)
    label.TextStrokeTransparency=0
    label.Font=Enum.Font.GothamBlack
    label.TextSize=20
    game:GetService("Debris"):AddItem(label,1)
end

-- DANGER METER
local dangerGui=Instance.new("ScreenGui");dangerGui.Name="DangerMeter";dangerGui.ResetOnSpawn=false;dangerGui.Parent=LP:WaitForChild("PlayerGui")
local dangerFrame=Instance.new("Frame",dangerGui);dangerFrame.Size=UDim2.new(0,200,0,20);dangerFrame.Position=UDim2.new(0.5,-100,0,50);dangerFrame.BackgroundColor3=Color3.fromRGB(30,30,35);dangerFrame.BorderSizePixel=0;dangerFrame.Visible=false
local dfc=Instance.new("UICorner",dangerFrame);dfc.CornerRadius=UDim.new(1,0)
local dangerFill=Instance.new("Frame",dangerFrame);dangerFill.Size=UDim2.new(0,0,1,0);dangerFill.BackgroundColor3=Color3.fromRGB(50,220,100);dangerFill.BorderSizePixel=0
local dfc2=Instance.new("UICorner",dangerFill);dfc2.CornerRadius=UDim.new(1,0)
local dangerText=Instance.new("TextLabel",dangerFrame);dangerText.Size=UDim2.new(1,0,1,0);dangerText.BackgroundTransparency=1;dangerText.Text="DANGER: 0%";dangerText.TextColor3=Color3.fromRGB(255,255,255);dangerText.Font=Enum.Font.GothamBold;dangerText.TextSize=11

task.spawn(function()
    while task.wait(0.3)do
        if C.DangerMeter then
            dangerFrame.Visible=true
            local ch=LP.Character
            local pos=ch and ch:FindFirstChild("HumanoidRootPart")and ch.HumanoidRootPart.Position
            if pos then
                local danger=0
                for _,o in ipairs(workspace:GetDescendants())do
                    local ok,_,_=isE(o)
                    if ok then
                        local op=getP(o)
                        if op then
                            local d=(op-pos).Magnitude
                            if d<100 then danger=danger+(100-d)/10 end
                        end
                    end
                end
danger=math.clamp(danger,0,100)
                dangerFill.Size=UDim2.new(danger/100,0,1,0)
                dangerText.Text="DANGER: "..math.floor(danger).."%"
                if danger>70 then dangerFill.BackgroundColor3=Color3.fromRGB(255,50,50)
                elseif danger>40 then dangerFill.BackgroundColor3=Color3.fromRGB(255,200,50)
                else dangerFill.BackgroundColor3=Color3.fromRGB(50,220,100)end
            end
        else dangerFrame.Visible=false end
    end
end)

-- DROPDOWN UI (для Ignore Lists)
function mkDropdown(parent,label,options,callback)
    local f=Instance.new("Frame",parent);f.Size=UDim2.new(1,-6,0,30);f.BackgroundColor3=T().panel;f.BorderSizePixel=0
    local c=Instance.new("UICorner",f);c.CornerRadius=UDim.new(0,5)
    local btn=Instance.new("TextButton",f);btn.Size=UDim2.new(1,0,1,0);btn.BackgroundTransparency=1;btn.Text=label.." ▼";btn.TextColor3=T().text;btn.Font=Enum.Font.GothamBold;btn.TextSize=10
    local dropdown=Instance.new("Frame",parent);dropdown.Size=UDim2.new(1,-6,0,0);dropdown.BackgroundColor3=T().bg;dropdown.BorderSizePixel=0;dropdown.ClipsDescendants=true
    local dc=Instance.new("UICorner",dropdown);dc.CornerRadius=UDim.new(0,5)
    local dLayout=Instance.new("UIListLayout",dropdown);dLayout.Padding=UDim.new(0,2)
    local opened=false
    btn.MouseButton1Click:Connect(function()
        opened=not opened
        dropdown.Size=opened and UDim2.new(1,-6,0,#options*24) or UDim2.new(1,-6,0,0)
    end)
    for _,opt in ipairs(options)do
        local ob=Instance.new("TextButton",dropdown);ob.Size=UDim2.new(1,-4,0,22);ob.BackgroundColor3=T().panel;ob.Text=opt;ob.TextColor3=T().text;ob.Font=Enum.Font.Gotham;ob.TextSize=9;ob.BorderSizePixel=0
        local oc=Instance.new("UICorner",ob);oc.CornerRadius=UDim.new(0,4)
        ob.MouseButton1Click:Connect(function()
            callback(opt)
            opened=false
            dropdown.Size=UDim2.new(1,-6,0,0)
        end)
    end
end

-- ДОБАВЛЯЕМ UI для ignore lists
mL(Pg["AutoSeek"],"IGNORE LISTS")
mT(Pg["AutoSeek"],"Ignore: Glitch Fragments",AutoInteractIgnore.GlitchFragments,function(s)AutoInteractIgnore.GlitchFragments=s end)
mT(Pg["AutoSeek"],"Ignore: Jeff Items",AutoInteractIgnore.JeffItems,function(s)AutoInteractIgnore.JeffItems=s end)
mT(Pg["AutoSeek"],"Ignore: Dropped Items",AutoInteractIgnore.DroppedItems,function(s)AutoInteractIgnore.DroppedItems=s end)
mT(Pg["AutoSeek"],"Ignore: Currency",AutoInteractIgnore.Currency,function(s)AutoInteractIgnore.Currency=s end)
mT(Pg["AutoSeek"],"Ignore: Closets",AutoInteractIgnore.Closets,function(s)AutoInteractIgnore.Closets=s end)
mT(Pg["AutoSeek"],"Ignore: Doors",AutoInteractIgnore.Doors,function(s)AutoInteractIgnore.Doors=s end)

mL(Pg["AutoHide"],"AUTO CLOSET - IGNORE")
mT(Pg["AutoHide"],"Don't Hide: Rush",AutoClosetIgnore.Rush,function(s)AutoClosetIgnore.Rush=s end)
mT(Pg["AutoHide"],"Don't Hide: Ambush",AutoClosetIgnore.Ambush,function(s)AutoClosetIgnore.Ambush=s end)
mT(Pg["AutoHide"],"Don't Hide: Blitz",AutoClosetIgnore.Blitz,function(s)AutoClosetIgnore.Blitz=s end)
mT(Pg["AutoHide"],"Don't Hide: Drones",AutoClosetIgnore.DronesStampede,function(s)AutoClosetIgnore.DronesStampede=s end)
mT(Pg["AutoHide"],"Don't Hide: Scribbles",AutoClosetIgnore.Scribbles,function(s)AutoClosetIgnore.Scribbles=s end)

mL(Pg["Visual"],"SCREENSHOT / CAMERA")
mT(Pg["Visual"],"Auto-Screenshot",C.AutoScreenshot,function(s)C.AutoScreenshot=s end)
mT(Pg["Visual"],"Freecam",C.Freecam,function(s)C.Freecam=s;setFreecam(s)end)
mB(Pg["Visual"],"Take Screenshot Now",function()takeScreenshot()end,T().accent)
mT(Pg["Visual"],"Hitmarker",C.Hitmarker,function(s)C.Hitmarker=s end)
mT(Pg["Visual"],"Damage Numbers",C.DamageNumbers,function(s)C.DamageNumbers=s end)
mT(Pg["Visual"],"Danger Meter",C.DangerMeter,function(s)C.DangerMeter=s end)

mL(Pg["Favorites"],"PROFILES")
for name,_ in pairs(Profiles)do
    mB(Pg["Favorites"],"Load: "..name,function()loadProfile(name)end,T().accent)
end
mB(Pg["Favorites"],"Save Current as Custom",function()saveProfile("Custom")end,T().accent)
mB(Pg["Favorites"],"Load Custom",function()loadProfile("Custom")end,T().accent)

mL(Pg["Stats"],"LEVEL SYSTEM")
mL(Pg["Stats"],"Level: "..C.Level)
mL(Pg["Stats"],"XP: "..C.XP.."/100")
mL(Pg["Stats"],"Progress: "..math.floor(C.XP).."%")
mB(Pg["Stats"],"Reset Level",function()C.Level=1;C.XP=0;N("Reset")end,T().danger)

mL(Pg["Fun"],"DAILY QUESTS")
mT(Pg["Fun"],"Enable Daily Quests",C.DailyQuests,function(s)C.DailyQuests=s end)
mL(Pg["Fun"],"Complete 10 Doors: "..(DailyQuests.Complete10Doors and "✅"or "❌"))
mL(Pg["Fun"],"Collect 100 Coins: "..(DailyQuests.Collect100Coins and "✅"or "❌"))
mL(Pg["Fun"],"Kill 5 Monsters: "..(DailyQuests.Kill5Monsters and "✅"or "❌"))
mL(Pg["Fun"],"Survive Rush: "..(DailyQuests.SurviveRush and "✅"or "❌"))
mL(Pg["Fun"],"Hide 10 Times: "..(DailyQuests.Hide10Times and "✅"or "❌"))

print("[Burmalda v13] Part 6/7 loaded")
-- Part 7/7 - FINAL: Visual Knobs / Joystick / Color Wheel / Discord / Follow / Aim / Anti-Kick / Fake / Puzzles / Shop / Achievements
-- ВСТАВИТЬ ПОСЛЕ ЧАСТИ 6

-- ═══ VISUAL KNOBS (крутилки) ═══
local KnobGui=Instance.new("ScreenGui")
KnobGui.Name="BurmaldaKnobs"
KnobGui.ResetOnSpawn=false
KnobGui.Parent=LP:WaitForChild("PlayerGui")

local KnobFrame=Instance.new("Frame",KnobGui)
KnobFrame.Size=UDim2.new(0,65,0,260)
KnobFrame.Position=UDim2.new(0,75,0.5,-130)
KnobFrame.BackgroundColor3=Color3.fromRGB(20,20,25)
KnobFrame.BackgroundTransparency=0.25
KnobFrame.BorderSizePixel=0
KnobFrame.Active=true
KnobFrame.Draggable=true
local KFC=Instance.new("UICorner",KnobFrame);KFC.CornerRadius=UDim.new(0,10)
local KFS=Instance.new("UIStroke",KnobFrame);KFS.Color=Color3.fromRGB(120,20,40);KFS.Thickness=2

local KTitle=Instance.new("TextLabel",KnobFrame)
KTitle.Size=UDim2.new(1,0,0,18);KTitle.BackgroundTransparency=1
KTitle.Text="KNOBS";KTitle.TextColor3=Color3.fromRGB(120,20,40)
KTitle.Font=Enum.Font.GothamBold;KTitle.TextSize=10

local KList=Instance.new("UIListLayout",KnobFrame)
KList.Padding=UDim.new(0,6)
KList.SortOrder=Enum.SortOrder.LayoutOrder
KList.HorizontalAlignment=Enum.HorizontalAlignment.Center

function makeKnob(label,minV,maxV,startV,callback,color)
    color=color or Color3.fromRGB(120,20,40)
    local knob=Instance.new("Frame",KnobFrame)
    knob.Size=UDim2.new(1,-8,0,55)
    knob.BackgroundColor3=Color3.fromRGB(30,30,35)
    knob.BorderSizePixel=0
    local kc=Instance.new("UICorner",knob);kc.CornerRadius=UDim.new(0,8)
    
    local dial=Instance.new("Frame",knob)
    dial.Size=UDim2.new(0,35,0,35)
    dial.Position=UDim2.new(0.5,-17.5,0,3)
    dial.BackgroundColor3=color
    dial.BorderSizePixel=0
    local dc=Instance.new("UICorner",dial);dc.CornerRadius=UDim.new(1,0)
    local ds=Instance.new("UIStroke",dial);ds.Color=Color3.fromRGB(255,255,255);ds.Thickness=2
    
    local pointer=Instance.new("Frame",dial)
    pointer.Size=UDim2.new(0,3,0,12)
    pointer.Position=UDim2.new(0.5,-1.5,0,3)
    pointer.BackgroundColor3=Color3.fromRGB(255,255,255)
    pointer.BorderSizePixel=0
    pointer.AnchorPoint=Vector2.new(0.5,0.5)
    
    local lbl=Instance.new("TextLabel",knob)
    lbl.Size=UDim2.new(1,0,0,12)
    lbl.Position=UDim2.new(0,0,0,42)
    lbl.BackgroundTransparency=1
    lbl.Text=label..": "..math.floor(startV)
    lbl.TextColor3=Color3.fromRGB(240,240,245)
    lbl.Font=Enum.Font.GothamBold
    lbl.TextSize=8
    
    local value=startV
    local dragging=false
    local startAngle=0
    local startValue=startV
    
    function updateDial()
        local percent=(value-minV)/(maxV-minV)
        local angle=-135+(percent*270)
        pointer.Rotation=angle
        lbl.Text=label..": "..math.floor(value)
    end
    updateDial()
    
    dial.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
            dragging=true
            local pos=input.Position
            startAngle=math.atan2(pos.Y-dial.AbsolutePosition.Y-17,pos.X-dial.AbsolutePosition.X-17)
            startValue=value
        end
    end)
    
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
            local pos=input.Position
            local curAngle=math.atan2(pos.Y-dial.AbsolutePosition.Y-17,pos.X-dial.AbsolutePosition.X-17)
            local delta=(curAngle-startAngle)*57.3
            value=math.clamp(startValue+(delta/270)*(maxV-minV),minV,maxV)
            updateDial()
            callback(math.floor(value))
        end
    end)
    
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
            dragging=false
        end
    end)
    
    return knob
end
makeKnob("Speed",0,100,C.WalkSpeed,function(v)
    C.WalkSpeed=v
    local ch=LP.Character;local h=ch and ch:FindFirstChildOfClass("Humanoid")
    if h and C.SpeedEnabled then h.WalkSpeed=v end
end,Color3.fromRGB(120,20,40))

makeKnob("Fly",10,200,C.FlySpeed,function(v)C.FlySpeed=v end,Color3.fromRGB(60,80,140))
makeKnob("FOV",40,120,C.FOV,function(v)C.FOV=v;workspace.CurrentCamera.FieldOfView=v end,Color3.fromRGB(80,60,120))
makeKnob("Bright",0,10,C.LightBrightness,function(v)C.LightBrightness=v;Lighting.Brightness=v end,Color3.fromRGB(255,200,50))
makeKnob("Volume",0,10,math.floor(C.MusicVolume*10),function(v)C.MusicVolume=v/10;if musicSound then musicSound.Volume=v/10 end end,Color3.fromRGB(50,220,100))
makeKnob("Ducks",10,500,C.DuckCount,function(v)C.DuckCount=v end,Color3.fromRGB(255,215,0))

-- ═══ JOYSTICK (для мобилы) ═══
local joyGui=Instance.new("ScreenGui");joyGui.Name="BurmaldaJoystick";joyGui.ResetOnSpawn=false;joyGui.Parent=LP:WaitForChild("PlayerGui")
local joyBg=Instance.new("Frame",joyGui);joyBg.Size=UDim2.new(0,130,0,130);joyBg.Position=UDim2.new(0,20,1,-150);joyBg.BackgroundColor3=Color3.fromRGB(30,30,35);joyBg.BackgroundTransparency=0.5;joyBg.BorderSizePixel=0;joyBg.Visible=false
local jbc=Instance.new("UICorner",joyBg);jbc.CornerRadius=UDim.new(1,0)
local joyStick=Instance.new("Frame",joyBg);joyStick.Size=UDim2.new(0,50,0,50);joyStick.Position=UDim2.new(0.5,-25,0.5,-25);joyStick.BackgroundColor3=Color3.fromRGB(120,20,40);joyStick.BorderSizePixel=0
local jsc=Instance.new("UICorner",joyStick);jsc.CornerRadius=UDim.new(1,0)
local js=Instance.new("UIStroke",joyStick);js.Color=Color3.fromRGB(255,255,255);js.Thickness=2

local joyDragging=false
local joyTouchPos=nil

joyBg.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.Touch or input.UserInputType==Enum.UserInputType.MouseButton1 then
        joyDragging=true
        joyTouchPos=input.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if joyDragging and (input.UserInputType==Enum.UserInputType.Touch or input.UserInputType==Enum.UserInputType.MouseMovement) then
        local bgPos=joyBg.AbsolutePosition
        local bgSize=joyBg.AbsoluteSize
        local dx=input.Position.X-bgPos.X-bgSize.X/2
        local dy=input.Position.Y-bgPos.Y-bgSize.Y/2
        local dist=math.sqrt(dx*dx+dy*dy)
        local maxDist=bgSize.X/2-25
        if dist>maxDist then dx=dx/dist*maxDist;dy=dy/dist*maxDist end
        joyStick.Position=UDim2.new(0.5,-25+dx,0.5,-25+dy)
        local ch=LP.Character;local h=ch and ch:FindFirstChildOfClass("Humanoid")
        if h then
            local moveDir=Vector3.new(dx/maxDist,0,dy/maxDist)
            local cam=workspace.CurrentCamera
            local worldDir=(cam.CFrame.LookVector*moveDir.Z+cam.CFrame.RightVector*moveDir.X)
            worldDir=Vector3.new(worldDir.X,0,worldDir.Z).Unit
            h:Move(worldDir,false)
        end
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.Touch or input.UserInputType==Enum.UserInputType.MouseButton1 then
        joyDragging=false
        joyStick.Position=UDim2.new(0.5,-25,0.5,-25)
    end
end)

-- ═══ COLOR WHEEL ═══
local cwGui=Instance.new("ScreenGui");cwGui.Name="ColorWheel";cwGui.ResetOnSpawn=false;cwGui.Parent=LP:WaitForChild("PlayerGui")
local cwFrame=Instance.new("Frame",cwGui);cwFrame.Size=UDim2.new(0,180,0,180);cwFrame.Position=UDim2.new(0.5,-90,0.5,-90);cwFrame.BackgroundColor3=Color3.fromRGB(30,30,35);cwFrame.BorderSizePixel=0;cwFrame.Visible=false
local cwc=Instance.new("UICorner",cwFrame);cwc.CornerRadius=UDim.new(0,10)
local cws=Instance.new("UIStroke",cwFrame);cws.Color=Color3.fromRGB(120,20,40);cws.Thickness=2
local cwTitle=Instance.new("TextLabel",cwFrame);cwTitle.Size=UDim2.new(1,0,0,20);cwTitle.BackgroundTransparency=1;cwTitle.Text="COLOR";cwTitle.TextColor3=Color3.fromRGB(120,20,40);cwTitle.Font=Enum.Font.GothamBold;cwTitle.TextSize=11
local cwR=Instance.new("TextButton",cwFrame);cwR.Size=UDim2.new(0.3,0,0,30);cwR.Position=UDim2.new(0.05,0,0,30);cwR.BackgroundColor3=Color3.fromRGB(255,50,50);cwR.Text="R+";cwR.TextColor3=Color3.fromRGB(255,255,255);cwR.Font=Enum.Font.GothamBold;cwR.TextSize=10;cwR.BorderSizePixel=0
local cwG=Instance.new("TextButton",cwFrame);cwG.Size=UDim2.new(0.3,0,0,30);cwG.Position=UDim2.new(0.35,0,0,30);cwG.BackgroundColor3=Color3.fromRGB(50,255,50);cwG.Text="G+";cwG.TextColor3=Color3.fromRGB(255,255,255);cwG.Font=Enum.Font.GothamBold;cwG.TextSize=10;cwG.BorderSizePixel=0
local cwB=Instance.new("TextButton",cwFrame);cwB.Size=UDim2.new(0.3,0,0,30);cwB.Position=UDim2.new(0.65,0,0,30);cwB.BackgroundColor3=Color3.fromRGB(50,50,255);cwB.Text="B+";cwB.TextColor3=Color3.fromRGB(255,255,255);cwB.Font=Enum.Font.GothamBold;cwB.TextSize=10;cwB.BorderSizePixel=0
local cwPreview=Instance.new("Frame",cwFrame);cwPreview.Size=UDim2.new(1,-20,0,60);cwPreview.Position=UDim2.new(0,10,0,80);cwPreview.BackgroundColor3=C.ESPColor;cwPreview.BorderSizePixel=0
local cwp=Instance.new("UICorner",cwPreview);cwp.CornerRadius=UDim.new(0,6)
local cwApply=Instance.new("TextButton",cwFrame);cwApply.Size=UDim2.new(1,-20,0,30);cwApply.Position=UDim2.new(0,10,0,150);cwApply.BackgroundColor3=Color3.fromRGB(120,20,40);cwApply.Text="APPLY";cwApply.TextColor3=Color3.fromRGB(255,255,255);cwApply.Font=Enum.Font.GothamBold;cwApply.TextSize=11;cwApply.BorderSizePixel=0
local cwac=Instance.new("UICorner",cwApply);cwac.CornerRadius=UDim.new(0,6)

local cwRVal=1;local cwGVal=0;local cwBVal=0
function updateCW()
    cwPreview.BackgroundColor3=Color3.new(cwRVal,cwGVal,cwBVal)
end
cwR.MouseButton1Click:Connect(function()cwRVal=cwRVal+0.1;if cwRVal>1 then cwRVal=0 end;updateCW()end)
cwG.MouseButton1Click:Connect(function()cwGVal=cwGVal+0.1;if cwGVal>1 then cwGVal=0 end;updateCW()end)
cwB.MouseButton1Click:Connect(function()cwBVal=cwBVal+0.1;if cwBVal>1 then cwBVal=0 end;updateCW()end)
cwApply.MouseButton1Click:Connect(function()
    C.ESPColor=Color3.new(cwRVal,cwGVal,cwBVal)
    clearESP()
    N("Color applied")
end)

-- ═══ DISCORD RICH ═══
task.spawn(function()
    while task.wait(15)do
        if C.DiscordRich then
            pcall(function()
                local data={
                    details="Burmalda v13",
                    state="Playing Doors | Floor: "..gF(),
                    largeImageKey="logo",
                    largeImageText="Burmalda v13 by KOTENOK7204"
                }
                if syn and syn.setdiscord then syn.setdiscord(data)end
            end)
        end
    end
end)

-- ═══ FOLLOW PLAYER ═══
local followTarget=nil
local followConn=nil
function startFollow(plr)
    if followConn then followConn:Disconnect()end
    followTarget=plr
    followConn=Run.Heartbeat:Connect(function()
        if not C.FollowPlayer or not followTarget then return end
        local ch=LP.Character;local target=followTarget.Character
        if not ch or not ch:FindFirstChild("HumanoidRootPart")then return end
        if not target or not target:FindFirstChild("HumanoidRootPart")then return end
        local myPos=ch.HumanoidRootPart.Position
        local targetPos=target.HumanoidRootPart.Position
        local dir=(targetPos-myPos).Unit
        local h=ch:FindFirstChildOfClass("Humanoid")
        if h then h:Move(dir,false)end
    end)
end

-- ═══ SILENT AIM / AUTO AIM ═══
task.spawn(function()
    while task.wait(0.1)do
        if C.AutoAim then
            pcall(function()
                local ch=LP.Character
                if not ch or not ch:FindFirstChild("HumanoidRootPart")then return end
                local closest,dist=nil,math.huge
                for _,o in ipairs(workspace:GetDescendants())do
                    local ok,_,_=isE(o)
                    if ok then
                        local op=getP(o)
                        if op then
                            local d=(op-ch.HumanoidRootPart.Position).Magnitude
if d<dist and d<100 then dist=d closest=op end
                        end
                    end
                end
                if closest then
                    workspace.CurrentCamera.CFrame=CFrame.new(workspace.CurrentCamera.CFrame.Position,closest)
                end
            end)
        end
    end
end)

-- ═══ ANTI-KICK ═══
task.spawn(function()
    while task.wait(0.5)do
        if C.AntiKick then
            pcall(function()
                if syn and syn.getconnections then
                    for _,conn in ipairs(syn.getconnections(LP.Kick))do
                        conn:Disconnect()
                    end
                end
            end)
        end
    end
end)

-- ═══ FAKE ENTITY ═══
local fakeEntities={}
function spawnFakeEntity(name)
    local ch=LP.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart")then return end
    local p=Instance.new("Part",workspace)
    p.Name=name
    p.Size=Vector3.new(3,5,3)
    p.Shape=Enum.PartType.Ball
    p.Color=Color3.fromRGB(255,0,0)
    p.Position=ch.HumanoidRootPart.Position+Vector3.new(math.random(-15,15),3,math.random(-15,15))
    p.CanCollide=false
    p.Material=Enum.Material.Neon
    game:GetService("Debris"):AddItem(p,8)
    N("Fake "..name.." spawned")
end

-- ═══ FAKE CHAT ═══
function fakeChat(msg)
    pcall(function()
        local Folder=RS:FindFirstChild("DefaultChatSystemEvents")or Instance.new("Folder")
        local Event=Folder:FindFirstChild("SayMessageRequest")or Instance.new("RemoteEvent")
        Event:FireServer(msg or "Fake message!","All")
    end)
end

-- ═══ AUTO-SOLVE PUZZLES (Fuse, Books) ═══
task.spawn(function()
    while task.wait(0.5)do
        if C.AutoSolve then
            pcall(function()
                local ch=LP.Character
                if not ch or not ch:FindFirstChild("HumanoidRootPart")then return end
                local pos=ch.HumanoidRootPart.Position
                for _,o in ipairs(workspace:GetDescendants())do
                    if o:IsA("ProximityPrompt")and o.Enabled and o.Parent then
                        local n=(o.Parent.Name..(o.ActionText or "")..(o.ObjectText or "")):lower()
                        if n:find("fuse")or n:find("book")or n:find("candle")or n:find("lever")or n:find("button")or n:find("valve")then
                            local pp=o.Parent:IsA("BasePart")and o.Parent or o.Parent:FindFirstChildWhichIsA("BasePart",true)
                            if pp and(pp.Position-pos).Magnitude<8 then
                                o:InputHoldBegin()
                                task.wait(0.05)
                                o:InputHoldEnd()
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ SHOP AUTO-BUY ═══
task.spawn(function()
    while task.wait(1)do
        if C.AutoBuy then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants())do
                    if o:IsA("ProximityPrompt")and o.Enabled then
                        local a=(o.ActionText or ""):lower()
                        if a:find("buy")or a:find("purchase")then
                            o:InputHoldBegin()
                            task.wait(0.05)
                            o:InputHoldEnd()
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ ACHIEVEMENTS UNLOCK (визуально) ═══
task.spawn(function()
    while task.wait(5)do
        if C.AchievementsUnlock then
            pcall(function()
                local pg=LP:FindFirstChild("PlayerGui")
                if pg then
                    for _,o in ipairs(pg:GetDescendants())do
                        if o:IsA("ImageLabel")and o.Name:lower():find("achieve")then
                            o.Visible=true
                        end
                    end
                end
            end)
        end
    end
end)
-- ═══ ДОБАВЛЯЕМ В GUI ═══
mL(Pg["Visual"],"VISUAL KNOBS / JOYSTICK")
mT(Pg["Visual"],"Show Knobs Panel",true,function(s)KnobFrame.Visible=s end)
mT(Pg["Visual"],"Show Joystick",false,function(s)joyBg.Visible=s end)
mT(Pg["Visual"],"Show Color Wheel",false,function(s)cwFrame.Visible=s end)
mB(Pg["Visual"],"Reset Knobs",function()C.WalkSpeed=22;C.FlySpeed=50;C.FOV=70;C.LightBrightness=2;C.MusicVolume=0.5;C.DuckCount=100;N("Knobs reset")end,T().danger)

mL(Pg["Features"],"ДОП ФИШКИ")
mT(Pg["Features"],"[DANGER] Auto Aim (наводит камеру)",C.AutoAim,function(s)C.AutoAim=s end,true)
mT(Pg["Features"],"[DANGER] Anti-Kick",C.AntiKick,function(s)C.AntiKick=s end,true)
mT(Pg["Features"],"Follow Player (nearest)",C.FollowPlayer,function(s)
    C.FollowPlayer=s
    if s then
        local closest,dist=nil,math.huge
        for _,plr in ipairs(P:GetPlayers())do
            if plr~=LP and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")then
                local d=(plr.Character.HumanoidRootPart.Position-LP.Character.HumanoidRootPart.Position).Magnitude
                if d<dist then dist=d closest=plr end
            end
        end
        if closest then startFollow(closest)end
    end
end)
mT(Pg["Features"],"Discord Rich Presence",C.DiscordRich,function(s)C.DiscordRich=s end)

mL(Pg["Fun"],"FAKE / PRANK")
mB(Pg["Fun"],"Fake Entity: Rush",function()spawnFakeEntity("RushMoving")end,T().danger)
mB(Pg["Fun"],"Fake Entity: Ambush",function()spawnFakeEntity("AmbushMoving")end,T().danger)
mB(Pg["Fun"],"Fake Chat: 'GG'",function()fakeChat("GG!")end,T().accent)
mB(Pg["Fun"],"Fake Chat: 'Rush is coming!'",function()fakeChat("Rush is coming!")end,T().danger)
mB(Pg["Fun"],"Fake Chat: 'Nob help!'",function()fakeChat("I need help!")end,T().accent)

mL(Pg["AutoSeek"],"AUTO-SOLVE PUZZLES")
mT(Pg["AutoSeek"],"Auto-Solve Puzzles",C.AutoSolve,function(s)C.AutoSolve=s end)

mL(Pg["Shop"],"SHOP (продвинуто)")
mT(Pg["Shop"],"Auto-Buy",C.AutoBuy,function(s)C.AutoBuy=s end)
mL(Pg["Shop"],"⚠️ Обычно не работает")

mL(Pg["Achiev"],"ACHIEVEMENTS")
mT(Pg["Achiev"],"Auto-Unlock (визуально)",C.AchievementsUnlock,function(s)C.AchievementsUnlock=s end)
mL(Pg["Achiev"],"⚠️ Только визуально")

-- Добавляем в конфиг новые поля
C.AutoAim=false
C.AntiKick=false
C.FollowPlayer=false
C.DiscordRich=false
C.AchievementsUnlock=false

N("Burmalda v13 FINAL loaded! Tester: Kostya_2015KostyaKos")
sv()
print("[Burmalda v13] Part 7/7 loaded - COMPLETE!")
print("[Burmalda v13] Copyright KOTENOK7204 | Tester Kostya_2015KostyaKos")
-- Part 8/8 - FINAL: всё что осталось
-- ВСТАВИТЬ ПОСЛЕ ЧАСТИ 7

-- ═══ ENTITY TELEPORT (функция) ═══
function tpEntityToMe()
    local ch=LP.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart")then return end
    local myPos=ch.HumanoidRootPart.Position
    for _,o in ipairs(workspace:GetDescendants())do
        local ok,_,_=isE(o)
        if ok and o:IsA("Model")then
            local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true)
            if p then pcall(function()p.CFrame=CFrame.new(myPos+Vector3.new(0,3,0))end)end
        end
    end
    N("Entity teleported")
end

task.spawn(function()
    while task.wait(0.3)do
        if C.EntityTeleport then pcall(tpEntityToMe)end
    end
end)

-- ═══ ADAPTIVE SPEED ═══
task.spawn(function()
    while task.wait(0.3)do
        if C.AdaptiveSpeed then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart")then
                local h=ch:FindFirstChildOfClass("Humanoid")
                if h then
                    local danger=false
                    for _,o in ipairs(workspace:GetDescendants())do
                        if o:IsA("Model")then
                            local n=o.Name:lower()
                            if(n:find("rush")or n:find("ambush"))then
                                local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true)
                                if p and(p.Position-ch.HumanoidRootPart.Position).Magnitude<50 then danger=true break end
                            end
                        end
                    end
                    if danger then h.WalkSpeed=35
                    else h.WalkSpeed=C.WalkSpeed end
                end
            end
        end
    end
end)

-- ═══ PREDICTIVE HIDE ═══
task.spawn(function()
    while task.wait(0.3)do
        if C.PredictiveHide then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart")then
                for _,o in ipairs(workspace:GetDescendants())do
                    if o:IsA("Model")then
                        local n=o.Name:lower()
                        if(n:find("rush")or n:find("ambush"))then
                            local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true)
                            if p then
                                local d=(p.Position-ch.HumanoidRootPart.Position).Magnitude
                                if d<150 and d>50 then
                                    if not isInsideCloset()then pcall(forceHide)end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- ═══ SMART PATH (обходит препятствия) ═══
task.spawn(function()
    while task.wait(0.15)do
        if C.SmartPath then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart")then
                local h=ch:FindFirstChildOfClass("Humanoid")
                local root=ch.HumanoidRootPart
                if h then
                    local ray=Ray.new(root.Position,root.CFrame.LookVector*5)
                    local hit=workspace:FindPartOnRay(ray,ch)
                    if hit and hit.CanCollide then
                        local leftRay=Ray.new(root.Position,root.CFrame.RightVector*-5)
                        local rightRay=Ray.new(root.Position,root.CFrame.RightVector*5)
                        local leftHit=workspace:FindPartOnRay(leftRay,ch)
                        local rightHit=workspace:FindPartOnRay(rightRay,ch)
                        if not leftHit then h:Move(root.CFrame.RightVector*-1,false)
                        elseif not rightHit then h:Move(root.CFrame.RightVector*1,false)end
                    end
                end
            end
        end
    end
end)

-- ═══ HOTKEYS (для ПК) ═══
UIS.InputBegan:Connect(function(input,gp)
    if gp then return end
if input.KeyCode==Enum.KeyCode.F1 then M.Visible=not M.Visible;OB.Text=M.Visible and "X"or "B"end
    if input.KeyCode==Enum.KeyCode.F2 then pcall(tpNearestItem)end
    if input.KeyCode==Enum.KeyCode.F3 then pcall(aH)end
    if input.KeyCode==Enum.KeyCode.F4 then C.Fly=not C.Fly;setFly(C.Fly);N(C.Fly and "Fly ON"or "Fly OFF")end
    if input.KeyCode==Enum.KeyCode.F5 then C.NoClip=not C.NoClip;setNC(C.NoClip);N(C.NoClip and "Noclip ON"or "Noclip OFF")end
end)

-- ═══ UI SCALE / OPACITY ═══
local uiScale=C.UI_Scale or 1
function applyUIScale(s)
    uiScale=s
    M.Size=UDim2.new(0,440*s,0,420*s)
    OB.Size=UDim2.new(0,50*s,0,50*s)
end

function applyOpacity(o)
    M.BackgroundTransparency=o
    TB.BackgroundTransparency=o
end

-- ═══ SERVER HOP ═══
function serverHop()
    pcall(function()
        local url="https://games.roblox.com/v1/games/6839171747/servers/Public?sortOrder=Asc&limit=100"
        local response=HS:JSONDecode(game:HttpGet(url))
        if response and response.data and #response.data>0 then
            local servers=response.data
            local randomServer=servers[math.random(1,#servers)]
            if randomServer and randomServer.id~=game.JobId then
                game:GetService("TeleportService"):TeleportToPlaceInstance(6839171747,randomServer.id,LP)
                N("Server hopping...")
            end
        end
    end)
end

-- ═══ AUTO-REJOIN ═══
task.spawn(function()
    while task.wait(5)do
        if C.AutoRejoin then
            pcall(function()
                if GD and GD:FindFirstChild("LatestRoom")then
                    local lastRoom=GD.LatestRoom.Value
                    if lastRoom==0 and C.SpeedrunTimer>60 then
                        if RF and RF:FindFirstChild("PlayAgain")then RF.PlayAgain:FireServer()end
                    end
                end
            end)
        end
    end
end)

-- ═══ ROOM ESP (по комнате) ═══
task.spawn(function()
    while task.wait(0.5)do
        if C.RoomESP and CR then
            pcall(function()
                local currentRoom=tonumber(LP:GetAttribute("CurrentRoom"))
                if currentRoom then
                    for _,room in ipairs(CR:GetChildren())do
                        local rn=tonumber(room.Name)
                        if rn and rn==currentRoom+1 then
                            for _,obj in ipairs(room:GetDescendants())do
                                if obj.Name=="Door"and obj:IsA("Model")then
                                    makeESP(obj,Color3.fromRGB(0,255,0),"NEXT",3)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ FAKE SCREENSHOT ═══
function fakeScreenshot()
    pcall(function()
        local gui=Instance.new("ScreenGui",LP:WaitForChild("PlayerGui"))
        gui.Name="FakeSS"
        local frame=Instance.new("Frame",gui)
        frame.Size=UDim2.new(1,0,1,0)
        frame.BackgroundColor3=Color3.fromRGB(255,255,255)
        frame.BackgroundTransparency=0.3
        frame.BorderSizePixel=0
        local label=Instance.new("TextLabel",frame)
        label.Size=UDim2.new(1,0,0,100)
        label.Position=UDim2.new(0,0,0.4,0)
        label.BackgroundTransparency=1
        label.Text="📸 SCREENSHOT SAVED"
        label.TextColor3=Color3.fromRGB(0,0,0)
        label.Font=Enum.Font.GothamBlack
        label.TextSize=32
        game:GetService("Debris"):AddItem(gui,1.5)
        N("Fake screenshot!")
    end)
end

-- ═══ FAKE DAMAGE NUMBERS ═══
task.spawn(function()
    while task.wait(2)do
        if C.DamageNumbers then
            pcall(function()
                if math.random()<0.3 then
                    local label=Instance.new("TextLabel",dmgGui)
                    label.Size=UDim2.new(0,80,0,30)
                    label.Position=UDim2.new(math.random()*0.8,0,math.random()*0.8,0)
                    label.BackgroundTransparency=1
label.Text="- "..math.random(5,50)
                    label.TextColor3=Color3.fromRGB(255,50,50)
                    label.TextStrokeTransparency=0
                    label.Font=Enum.Font.GothamBlack
                    label.TextSize=20
                    game:GetService("Debris"):AddItem(label,1)
                end
            end)
        end
    end
end)

-- ═══ CUSTOM NOTIFICATIONS ═══
function customNotify(title,text,color)
    pcall(function()
        local gui=Instance.new("ScreenGui",LP:WaitForChild("PlayerGui"))
        gui.Name="CustomNotif"
        local frame=Instance.new("Frame",gui)
        frame.Size=UDim2.new(0,300,0,60)
        frame.Position=UDim2.new(0.5,-150,0,30)
        frame.BackgroundColor3=color or Color3.fromRGB(20,20,25)
        frame.BorderSizePixel=0
        local c=Instance.new("UICorner",frame);c.CornerRadius=UDim.new(0,8)
        local tl=Instance.new("TextLabel",frame)
        tl.Size=UDim2.new(1,-20,0,24);tl.Position=UDim2.new(0,10,0,5)
        tl.BackgroundTransparency=1;tl.Text=title
        tl.TextColor3=Color3.fromRGB(255,255,255);tl.Font=Enum.Font.GothamBold;tl.TextSize=13
        tl.TextXAlignment=Enum.TextXAlignment.Left
        local dl=Instance.new("TextLabel",frame)
        dl.Size=UDim2.new(1,-20,0,24);dl.Position=UDim2.new(0,10,0,28)
        dl.BackgroundTransparency=1;dl.Text=text
        dl.TextColor3=Color3.fromRGB(200,200,210);dl.Font=Enum.Font.Gotham;dl.TextSize=11
        dl.TextXAlignment=Enum.TextXAlignment.Left
        game:GetService("Debris"):AddItem(gui,4)
    end)
end

-- ═══ QUICK PANIC KEY ═══
UIS.InputBegan:Connect(function(input,gp)
    if gp then return end
    if input.KeyCode==Enum.KeyCode.F12 then
        for k,v in pairs(C)do if type(v)=="boolean"then C[k]=false end end
        clearESP()
        if FBV then FBV:Destroy()end
        if NC then NC:Disconnect()end
        N("PANIC! All off")
    end
end)

-- ═══ ДОБАВЛЯЕМ В GUI ═══
mL(Pg["Features"],"ФИНАЛЬНЫЕ ФИШКИ")
mT(Pg["Features"],"[DANGER] Entity Teleport",C.EntityTeleport,function(s)C.EntityTeleport=s end,true)
mT(Pg["Features"],"Adaptive Speed",C.AdaptiveSpeed,function(s)C.AdaptiveSpeed=s end)
mT(Pg["Features"],"Predictive Hide",C.PredictiveHide,function(s)C.PredictiveHide=s end)
mT(Pg["Features"],"Smart Path",C.SmartPath,function(s)C.SmartPath=s end)
mT(Pg["Features"],"Room ESP (next door)",C.RoomESP,function(s)C.RoomESP=s end)
mT(Pg["Features"],"Auto-Rejoin",C.AutoRejoin,function(s)C.AutoRejoin=s end)
mB(Pg["Features"],"Server Hop",function()serverHop()end,T().danger)

mL(Pg["Visual"],"UI")
mS(Pg["Visual"],"UI Scale",5,20,10,function(v)applyUIScale(v/10)end)
mS(Pg["Visual"],"UI Opacity",0,10,0,function(v)applyOpacity(v/10)end)

mL(Pg["Fun"],"FAKE / PRANK 2")
mB(Pg["Fun"],"Fake Screenshot",function()fakeScreenshot()end,T().accent)
mB(Pg["Fun"],"Custom Notif: Win",function()customNotify("VICTORY","You escaped Doors!",Color3.fromRGB(40,120,60))end,T().accent)
mB(Pg["Fun"],"Custom Notif: Danger",function()customNotify("DANGER","Rush incoming!",Color3.fromRGB(180,30,30))end,T().danger)
mB(Pg["Fun"],"Custom Notif: Info",function()customNotify("INFO","Burmalda v13 by KOTENOK7204",Color3.fromRGB(60,80,140))end,T().accent)

mL(Pg["Info"],"HOTKEYS (ПК)")
mL(Pg["Info"],"F1 - Открыть/закрыть меню")
mL(Pg["Info"],"F2 - TP к предмету")
mL(Pg["Info"],"F3 - Hide Now")
mL(Pg["Info"],"F4 - Fly toggle")
mL(Pg["Info"],"F5 - Noclip toggle")
mL(Pg["Info"],"F12 - PANIC (все выкл)")

-- Добавляем новые поля в конфиг
C.RoomESP=false
C.AutoRejoin=false
C.UI_Scale=1

N("Burmalda v13 COMPLETE! Tester: Kostya_2015KostyaKos")
sv()
print("[Burmalda v13] Part 8/8 - ABSOLUTE FINAL")
print("Copyright KOTENOK7204 | Tester Kostya_2015KostyaKos")
    end)
