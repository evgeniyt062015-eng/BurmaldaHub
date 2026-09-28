-- BURMALDA v11.2 MOBILE | By KOTENOK7204
local P=game:GetService("Players")
local RS=game:GetService("ReplicatedStorage")
local Run=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local HS=game:GetService("HttpService")
local VU=game:GetService("VirtualUser")
local LP=P.LocalPlayer
local RF=RS:FindFirstChild("RemotesFolder")or RS:FindFirstChild("EntityInfo")or RS:FindFirstChild("Bricks")
local GD=RS:FindFirstChild("GameData")

local CF="Hotel";local MF=nil
pcall(function()if GD and GD:FindFirstChild("Floor")then CF=GD.Floor.Value end end)
local function gF()return MF or CF end

local C={SpeedEnabled=false,WalkSpeed=22,SpeedBoost=0,JumpPower=50,InfiniteJumps=false,EnableJump=false,EnableSlide=false,Fly=false,FlySpeed=50,Noclip=false,RemoveClosetDelay=false,RemoveAccel=false,DoorReach=false,InstantPrompts=false,PromptClip=false,PromptReach=1,DisableIdleKick=false,AutoBreaker=false,AutoInteract=false,AutoCloset=false,AutoCollect=false,AutoCoins=false,AutoDoor=false,AutoTpDoor=false,TPItemRadius=500,BringItems=false,BringRadius=100,BypassScreech=false,BypassHalt=false,BypassEyes=false,BypassLookman=false,BypassSnare=false,BypassKillbricks=false,BypassSeekingWall=false,BypassBanana=false,BypassGiggle=false,BypassDupe=false,BypassVacuum=false,BypassGloombatEggs=false,BypassSeekObstructions=false,BypassJeff=false,AntiRansom=false,AntiClosetTrash=false,GodMode=false,InfiniteRevive=false,InfiniteItems=false,AutoHideRush=false,AutoHideAmbush=false,AutoHideAll=false,AntiAFK=true,ESP_All=false,ESP_Rush=false,ESP_Ambush=false,ESP_Seek=false,ESP_Figure=false,ESP_Screech=false,ESP_Hide=false,ESP_Eyes=false,ESP_Halt=false,ESP_Grumble=false,ESP_Giggle=false,ESP_Blitz=false,ESP_Lookman=false,ESP_Noise=false,ESP_Creak=false,ESP_Scribbles=false,ESP_Teller=false,ESP_Drones=false,ESP_Minecart=false,ESP_Rails=false,ESP_Turns=false,ESP_Pits=false,ESP_Lava=false,ESP_Doors=false,ESP_Closets=false,ESP_Money=false,ESP_Keys=false,ESP_Items=false,ESP_Ladders=false,ESP_Players=false,ESPColor=Color3.fromRGB(180,30,30),DoorColor=Color3.fromRGB(120,20,40),MaxDistance=500,RainbowMode=false,XRay=true,ShowDistance=true,FillTransparency=0.55,TextSize=12,ESPUpdateRate=1.5,Theme="GrayBlack",AutoSave=true,BypassDelay=0.1,NotifyMonsters=false,NotifyItems=false,NotifySound=true,MonsterList={Rush=true,Ambush=true,Seek=true,Figure=true,Screech=true,Hide=true,Eyes=true,Halt=true,Grumble=true,Giggle=true,Dupe=true,Jack=true,Snare=true,Timothy=true,Glitch=true,Shadow=true,Blitz=true,Lookman=true,Noise=true,Creak=true,Scribbles=true,Drones=true,Jeff=true},QuickBtnX=20,QuickBtnY=250}

local Th={GrayBlack={bg=Color3.fromRGB(20,20,25),panel=Color3.fromRGB(40,40,45),accent=Color3.fromRGB(120,20,40),text=Color3.fromRGB(240,240,245),danger=Color3.fromRGB(180,30,30)},Black={bg=Color3.fromRGB(10,10,12),panel=Color3.fromRGB(25,25,28),accent=Color3.fromRGB(120,20,40),text=Color3.fromRGB(230,230,235),danger=Color3.fromRGB(180,30,30)},Blood={bg=Color3.fromRGB(25,10,10),panel=Color3.fromRGB(45,15,15),accent=Color3.fromRGB(220,40,40),text=Color3.fromRGB(255,230,230),danger=Color3.fromRGB(200,40,40)},Toxic={bg=Color3.fromRGB(10,25,15),panel=Color3.fromRGB(20,45,30),accent=Color3.fromRGB(50,220,100),text=Color3.fromRGB(230,255,235),danger=Color3.fromRGB(180,30,30)}}
local function T()return Th[C.Theme]or Th.GrayBlack end
local function N(t)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="Burmalda",Text=t,Duration=3})end)end

local CFG="BurmaldaV112.json"
local function sv()pcall(function()local d={};for k,v in pairs(C)do if type(v)=="Color3"then d[k]={__c=true,r=v.R,g=v.G,b=v.B}else d[k]=v end end;writefile(CFG,HS:JSONEncode(d))end)end
local function ld()pcall(function()if isfile and isfile(CFG)then local d=HS:JSONDecode(readfile(CFG));for k,v in pairs(d)do if type(v)=="table"and v.__c then C[k]=Color3.new(v.r,v.g,v.b)else C[k]=v end end end end)end
ld()

-- FLY
local FBV,FBG,FC
local function setFly(s)
  local ch=LP.Character;if not ch then return end
    local hum=ch:FindFirstChildOfClass("Humanoid");local root=ch:FindFirstChild("HumanoidRootPart");if not root then return end
    if FBV then FBV:Destroy() FBV=nil end;if FBG then FBG:Destroy() FBG=nil end;if FC then FC:Disconnect() FC=nil end
    if not s then if hum then hum.PlatformStand=false end return end
    FBV=Instance.new("BodyVelocity",root);FBV.MaxForce=Vector3.new(9e9,9e9,9e9);FBV.Velocity=Vector3.zero;FBV.P=1250
    FBG=Instance.new("BodyGyro",root);FBG.MaxTorque=Vector3.new(9e9,9e9,9e9);FBG.P=1000;FBG.D=50;FBG.CFrame=root.CFrame
    if hum then hum.PlatformStand=true end
    FC=Run.RenderStepped:Connect(function()
        if not C.Fly then return end
        local c=LP.Character;if not c then return end
        local h=c:FindFirstChildOfClass("Humanoid");local r=c:FindFirstChild("HumanoidRootPart");if not r or not h then return end
        local cam=workspace.CurrentCamera
        local dir=h.MoveDirection
        local camFlat=Vector3.new(cam.CFrame.LookVector.X,0,cam.CFrame.LookVector.Z)
        local v=Vector3.zero
        if UIS.TouchEnabled then
            local mv=Vector3.zero
            if UIS:IsKeyDown(Enum.KeyCode.W)then mv=mv+cam.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S)then mv=mv-cam.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A)then mv=mv-cam.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D)then mv=mv+cam.CFrame.RightVector end
            if mv.Magnitude>0 then v=mv.Unit end
        else
            local flat=CFrame.new(cam.CFrame.Position,cam.CFrame.Position+camFlat)
            v=(cam.CFrame*CFrame.new(flat:VectorToObjectSpace(dir))).Position-cam.CFrame.Position
            if v.Magnitude>0 then v=v.Unit end
        end
        local vert=0
        if UIS:IsKeyDown(Enum.KeyCode.Space)then vert=1 elseif UIS:IsKeyDown(Enum.KeyCode.LeftShift)then vert=-1 end
        FBV.Velocity=v*C.FlySpeed+Vector3.new(0,vert*C.FlySpeed*0.5,0)
        FBG.CFrame=CFrame.new(r.Position,r.Position+camFlat)
    end)
end
LP.CharacterAdded:Connect(function()task.wait(1);if C.Fly then setFly(false);task.wait(0.1);setFly(true)end end)

local NC
local function setNC(s)
    if NC then NC:Disconnect() NC=nil end
    if not s then return end
    NC=Run.Stepped:Connect(function()local ch=LP.Character;if ch then for _,p in ipairs(ch:GetDescendants())do if p:IsA("BasePart")and p.CanCollide then p.CanCollide=false end end end end)
end

local SCA,SCF,SCR=false,nil,nil
local function installSC()if SCA or not RF then return end;SCR=RF:FindFirstChild("Screech");if not SCR then return end;SCF=Instance.new("RemoteEvent");SCF.Name="Screech";SCF.Parent=RF;SCR.Name="Screech_REAL";SCA=true end
local function removeSC()if not SCA then return end;pcall(function()if SCR and SCR.Parent then SCR.Name="Screech"end if SCF then SCF:Destroy()end end);SCA=false end

local HC
local function startH()
    if HC then HC:Disconnect() end
    HC=Run.RenderStepped:Connect(function()
        if not C.BypassHalt then return end
        local ch=LP.Character;if not ch or not ch:FindFirstChild("HumanoidRootPart")then return end
        local cam=workspace.CurrentCamera
        for _,o in ipairs(workspace:GetDescendants())do if o.Name:lower():find("halt")then local p=o:IsA("BasePart")and o or(o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true));if p and(p.Position-ch.HumanoidRootPart.Position).Magnitude<60 then local a=(ch.HumanoidRootPart.Position-p.Position).Unit;local n=cam.CFrame.Position;cam.CFrame=CFrame.new(n,n+Vector3.new(a.X,0,a.Z))end end end
    end)
end

task.spawn(function()while task.wait(0.5)do if C.GodMode then local ch=LP.Character;local h=ch and ch:FindFirstChildOfClass("Humanoid");if h and h.Health<h.MaxHealth then pcall(function()h.Health=h.MaxHealth end)end end end end)
task.spawn(function()while task.wait(1)do if C.InfiniteRevive and RF then pcall(function()local r=RF:FindFirstChild("Revive");if r then r:FireServer()end end)end end end)

task.spawn(function()
    while task.wait(0.5)do
        local ch=LP.Character;local h=ch and ch:FindFirstChildOfClass("Humanoid")
        if h then local sp=16;if C.SpeedEnabled then sp=C.WalkSpeed+C.SpeedBoost end;h.WalkSpeed=sp;h.JumpPower=C.JumpPower;h.UseJumpPower=true end
        if ch then if C.EnableJump then pcall(function()ch:SetAttribute("CanJump",true)end)end;if C.EnableSlide then pcall(function()ch:SetAttribute("CanSlide",true)end)end end
    end
end)
UIS.JumpRequest:Connect(function()if C.InfiniteJumps then local ch=LP.Character;local h=ch and ch:FindFirstChildOfClass("Humanoid");if h then h:ChangeState(Enum.HumanoidStateType.Jumping)end end end)

task.spawn(function()
    while task.wait(0.5)do
        pcall(function()for _,o in ipairs(workspace:GetDescendants())do if o:IsA("ProximityPrompt")then if C.InstantPrompts then o.HoldDuration=0 end;if C.PromptClip then o.RequiresLineOfSight=false end;if C.DoorReach then o.MaxActivationDistance=math.max(o.MaxActivationDistance or 5,15)*C.PromptReach end end end end)
    end
end)
LP.Idled:Connect(function()if C.DisableIdleKick then pcall(function()VU:CaptureController()VU:ClickButton2(Vector2.new())end)end end)

task.spawn(function()while task.wait(1)do if C.RemoveClosetDelay then pcall(function()local ch=LP.Character;if ch then for _,o in ipairs(ch:GetDescendants())do if o:IsA("NumberValue")and o.Name:lower():find("delay")then o.Value=0 end end end end)end end end)
task.spawn(function()while task.wait(1)do if C.RemoveAccel then pcall(function()local ch=LP.Character;if ch then for _,p in ipairs(ch:GetDescendants())do if p:IsA("BasePart")then p.CustomPhysicalProperties=PhysicalProperties.new(0.7,0.3,0.5,1,1)end end end end)end end end)

-- TP TO ITEMS
local function findNearestItem()
    local ch=LP.Character;if not ch or not ch:FindFirstChild("HumanoidRootPart")then return nil end
    local myPos=ch.HumanoidRootPart.Position;local closest,dist=nil,math.huge
    for _,o in ipairs(workspace:GetDescendants())do
        if o:IsA("Model")or o:IsA("BasePart")then
            local n=o.Name:lower()
            if n:find("crucifix")or n:find("lockpick")or n:find("bandage")or n:find("flashlight")or n:find("lighter")or n:find("battery")or n:find("vitamin")or n:find("key")or n:find("coin")or n:find("gold")or n:find("candle")or n:find("skeleton")then
                local p=o:IsA("BasePart")and o or(o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true))
                if p then local d=(p.Position-myPos).Magnitude;if d<dist and d<C.TPItemRadius then dist=d closest=p end end
            end
        end
    end
    return closest
end

local function tpNearestItem()
    local item=findNearestItem()
    if item then
        local ch=LP.Character
        if ch and ch:FindFirstChild("HumanoidRootPart")then
            ch.HumanoidRootPart.CFrame=CFrame.new(item.Position+Vector3.new(0,3,0))
            N("TP to item")
        end
    else N("No items") end
end

-- BRING ITEMS
task.spawn(function()
    while task.wait(0.5)do
        if C.BringItems then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart")then
                local myPos=ch.HumanoidRootPart.Position
                for _,o in ipairs(workspace:GetDescendants())do
                    if o:IsA("Model")or o:IsA("BasePart")then
                        local n=o.Name:lower()
                        if n:find("crucifix")or n:find("lockpick")or n:find("bandage")or n:find("flashlight")or n:find("coin")or n:find("key")then
                            local p=o:IsA("BasePart")and o or(o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true))
                if p and p:IsA("BasePart")then local d=(p.Position-myPos).Magnitude;if d<C.BringRadius then pcall(function()p.CFrame=CFrame.new(myPos+Vector3.new(0,2,0))end)end end
                        end
                    end
                end
            end
        end
    end
end)

-- ESP
local ENT={"RushMoving","AmbushMoving","Seek","Figure","Screech","Hide","Eyes","Glitch","Dupe","Jack","Snare","Timothy","Shadow","Halt","Grumble","Giggle","Gloombat","Monument","Sally","JeffTheKiller","Bash","Blitz","A60","A120","Noise","Creak","Scribbles","Lookman","DronesStampede","Groundskeeper","TellerRig"}
local EN={RushMoving="Rush",AmbushMoving="Ambush",Seek="Seek",Figure="Figure",Screech="Screech",Hide="Hide",Eyes="Eyes",Glitch="Glitch",Dupe="Dupe",Jack="Jack",Snare="Snare",Timothy="Timothy",Shadow="Shadow",Halt="Halt",Grumble="Grumble",Giggle="Giggle",Gloombat="Gloombat",Monument="Monument",Sally="Sally",JeffTheKiller="Jeff",Bash="Bash",Blitz="Blitz",A60="A-60",A120="A-120",Noise="Noise",Creak="Creak",Scribbles="Scribbles",Lookman="Lookman",DronesStampede="Drones",Groundskeeper="Groundskeeper",TellerRig="Teller"}
local function isE(o)if not o:IsA("Model")and not o:IsA("BasePart")then return false,nil,nil end;local n=o.Name:lower();for _,e in ipairs(ENT)do if n==e:lower()or n:find(e:lower(),1,true)then return true,e,EN[e]or e end end;return false,nil,nil end
local ESP={}
local function clearESP()for _,v in pairs(ESP)do pcall(function()v:Destroy()end)end;ESP={}end
local function makeESP(o,col,txt,yo)
    if ESP[o]and ESP[o].Parent then return end
    local bb=Instance.new("BillboardGui");bb.Size=UDim2.new(0,130,0,28);bb.StudsOffset=Vector3.new(0,yo or 4,0);bb.AlwaysOnTop=true;bb.Adornee=o;bb.Parent=o
    local h=Instance.new("Highlight",o);h.FillColor=col;h.FillTransparency=C.FillTransparency;h.OutlineColor=col;h.OutlineTransparency=0.3;h.DepthMode=C.XRay and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded;h.Adornee=o
    local lb=Instance.new("TextLabel",bb);lb.Size=UDim2.new(1,0,1,0);lb.BackgroundTransparency=1;lb.Text=txt;lb.TextColor3=col;lb.TextStrokeTransparency=0;lb.TextStrokeColor3=Color3.fromRGB(0,0,0);lb.Font=Enum.Font.GothamBold;lb.TextSize=C.TextSize
    ESP[o]=bb
end
local function getP(o)if o:IsA("BasePart")then return o.Position end;if o.PrimaryPart then return o.PrimaryPart.Position end;local p=o:FindFirstChildWhichIsA("BasePart",true);return p and p.Position end
local function myP()local ch=LP.Character;if ch and ch:FindFirstChild("HumanoidRootPart")then return ch.HumanoidRootPart.Position end end
local function cO(b)if C.RainbowMode then return Color3.fromHSV(tick()%5/5,1,1)end return b end
local function updESP()
    local pos=myP();if not pos then return end
    for _,o in ipairs(workspace:GetDescendants())do
        if ESP[o]then continue end
        local op=getP(o);if not op or(op-pos).Magnitude>C.MaxDistance then continue end
        local n=o.Name:lower()
        local ok,key,ne=isE(o)
        if ok then local cK="ESP_"..key;if C.ESP_All or C[cK]then local t=ne;if C.ShowDistance then t=t.." ["..math.floor((op-pos).Magnitude).."m]" end;makeESP(o,cO(C.ESPColor),t,5);continue end end
        if C.ESP_Doors and n:find("door")and not n:find("handler")then makeESP(o,cO(C.DoorColor),"Door",3)continue end
        if C.ESP_Closets and(n:find("closet")or n:find("hiding"))then makeESP(o,cO(Color3.fromRGB(100,255,100)),"Hide",3)continue end
        if C.ESP_Money and(n:find("coin")or n:find("gold"))then makeESP(o,cO(Color3.fromRGB(255,215,0)),"Money",3)continue end
        if C.ESP_Keys and n:find("key")then makeESP(o,cO(Color3.fromRGB(255,255,100)),"Key",3)continue end
        if C.ESP_Items and(n:find("bandage")or n:find("flashlight")or n:find("lighter")or n:find("lockpick")or n:find("crucifix"))then makeESP(o,cO(Color3.fromRGB(255,220,50)),o.Name,3)continue end
        if C.ESP_Ladders and(n:find("ladder")or n:find("stair"))then makeESP(o,cO(Color3.fromRGB(0,200,255)),"Ladder",3)continue end
    if C.ESP_Minecart and(n:find("minecart")or n:find("cart"))then makeESP(o,cO(Color3.fromRGB(255,150,0)),"Cart",3)continue end
        if C.ESP_Lava and(n:find("lava"))then makeESP(o,cO(Color3.fromRGB(255,80,0)),"LAVA",3)continue end
        if C.ESP_Players and o:IsA("Model")then local pl=P:GetPlayerFromCharacter(o);if pl and pl~=LP then makeESP(o,cO(Color3.fromRGB(255,255,0)),pl.Name,5);continue end end
    end
end

task.spawn(function()
    local seen={}
    while task.wait(0.3)do
        if C.NotifyMonsters then for _,o in ipairs(workspace:GetDescendants())do local ok,_,ne=isE(o);if ok and not seen[o]then seen[o]=true;if C.NotifySound then pcall(function()local s=Instance.new("Sound",game:GetService("SoundService"));s.SoundId="rbxassetid://8784885431";s.Volume=0.5;s:Play();task.delay(2,function()s:Destroy()end)end)end;pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="MONSTER",Text=ne.."!",Duration=5})end);task.delay(15,function()seen[o]=nil end)end end end
    end
end)

local function byT(names,state)
    for _,o in ipairs(workspace:GetDescendants())do
        if o:IsA("Model")then local n=o.Name:lower();for _,t in ipairs(names)do if n==t:lower()or n:find(t:lower(),1,true)then for _,p in ipairs(o:GetDescendants())do if p:IsA("BasePart")then pcall(function()p.CanTouch=not state end)end end end end end
    end
end
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

local function getR()local ch=LP.Character;return ch and ch:FindFirstChild("HumanoidRootPart")end
task.spawn(function()
    while task.wait(0.3)do
        if C.AutoCollect then local r=getR();if r then for _,o in ipairs(workspace:GetDescendants())do if o:IsA("Model")or o:IsA("BasePart")then local n=o.Name:lower();if n:find("crucifix")or n:find("lockpick")or n:find("bandage")or n:find("flashlight")then local p=o:IsA("BasePart")and o or(o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true));if p and(p.Position-r.Position).Magnitude<20 then pcall(function()r.CFrame=CFrame.new(p.Position)end)end end end end end end
        if C.AutoCoins then local r=getR();if r then for _,o in ipairs(workspace:GetDescendants())do if o:IsA("BasePart")and(o.Name:lower():find("coin")or o.Name:lower():find("gold"))then if(o.Position-r.Position).Magnitude<15 then pcall(function()r.CFrame=CFrame.new(o.Position)end)end end end end end
        if C.AutoDoor then local r=getR();if r then local pos=r.Position;for _,o in ipairs(workspace:GetDescendants())do if o:IsA("ProximityPrompt")and o.Enabled then local a=(o.ActionText or ""):lower();if a:find("open")or a:find("door")then local par=o.Parent;local pp=par and(par:IsA("BasePart")and par or par:FindFirstChildWhichIsA("BasePart",true));if pp and(pp.Position-pos).Magnitude<8 then pcall(function()o:InputHoldBegin()task.wait(0.05)o:InputHoldEnd()end)end end end end end end
      if C.AutoInteract then local r=getR();if r then local pos=r.Position;for _,o in ipairs(workspace:GetDescendants())do if o:IsA("ProximityPrompt")and o.Enabled then local par=o.Parent;local pp=par and(par:IsA("BasePart")and par or par:FindFirstChildWhichIsA("BasePart",true));if pp and(pp.Position-pos).Magnitude<8 then pcall(function()o:InputHoldBegin()task.wait(0.05)o:InputHoldEnd()end)end end end end end
        if C.AutoCloset then local r=getR();if r then local pos=r.Position;for _,o in ipairs(workspace:GetDescendants())do if o:IsA("ProximityPrompt")and o.Enabled then local par=o.Parent;if par then local n=(par.Name..(o.ActionText or "")..(o.ObjectText or "")):lower();if n:find("closet")or n:find("hiding")then local pp=par:IsA("BasePart")and par or par:FindFirstChildWhichIsA("BasePart",true);if pp and(pp.Position-pos).Magnitude<10 then pcall(function()o:InputHoldBegin()task.wait(0.05)o:InputHoldEnd()end)end end end end end end end
        if C.AutoBreaker and RF then local r=getR();if r then local rooms=workspace:FindFirstChild("CurrentRooms");if rooms then local b=rooms:FindFirstChild("ElevatorBreaker",true);if b and b:IsA("Model")then local bp=b.PrimaryPart or b:FindFirstChildWhichIsA("BasePart",true);if bp and(bp.Position-r.Position).Magnitude<15 then local eb=RF:FindFirstChild("EBF");if eb then pcall(function()eb:FireServer()end)end end end end end end
    end
end)

local HD=0;local IH=false
local function aH()
    local ch=LP.Character;if not ch or not ch:FindFirstChild("HumanoidRootPart")then return end
    local pos=ch.HumanoidRootPart.Position;local dg=false
    for _,o in ipairs(workspace:GetDescendants())do if o:IsA("Model")then local n=o.Name:lower();if(n:find("rush")and C.AutoHideRush)or(n:find("ambush")and C.AutoHideAmbush)or(C.AutoHideAll and(n:find("seek")or n:find("figure")))then local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true);if p and(p.Position-pos).Magnitude<100 then dg=true break end end end end
    if not dg or IH or tick()-HD<2 then return end
    local cl,pr,dt=nil,nil,math.huge
    for _,o in ipairs(workspace:GetDescendants())do if o:IsA("Model")then local n=o.Name:lower();if n:find("closet")or n:find("hiding")then local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true);if p then local d=(p.Position-pos).Magnitude;if d<dt then local pp=o:FindFirstChildWhichIsA("ProximityPrompt",true);if pp and pp.Enabled then dt=d cl=o pr=pp end end end end end end
    if cl and pr and dt<50 then
        local p=cl.PrimaryPart or cl:FindFirstChildWhichIsA("BasePart",true)
        if p then ch.HumanoidRootPart.CFrame=CFrame.new(p.Position+Vector3.new(0,2,0))end
        task.wait(0.15);IH=true
        pcall(function()pr:InputHoldBegin()task.wait(math.max(pr.HoldDuration or 0,0.05))pr:InputHoldEnd()end)
        HD=tick();task.wait(1);IH=false
    end
end
task.spawn(function()while task.wait(60)do if C.AntiAFK then pcall(function()VU:CaptureController()VU:ClickButton2(Vector2.new())end)end end end)
Run.Heartbeat:Connect(function()if C.AutoHideRush or C.AutoHideAmbush or C.AutoHideAll then pcall(aH)end end)
task.spawn(function()while task.wait(C.ESPUpdateRate)do pcall(updESP)end end)
task.spawn(function()while task.wait(30)do if C.AutoSave then pcall(sv)end end end)

-- FLOOR SELECT
local FS=Instance.new("ScreenGui");FS.Name="BurmaldaFS";FS.ResetOnSpawn=false;FS.IgnoreGuiInset=true;FS.Parent=LP:WaitForChild("PlayerGui")
local FB=Instance.new("Frame",FS);FB.Size=UDim2.new(1,0,1,0);FB.BackgroundColor3=Color3.fromRGB(15,15,18);FB.BackgroundTransparency=0.4;FB.BorderSizePixel=0
local FM=Instance.new("Frame",FB);FM.Size=UDim2.new(0,300,0,340);FM.Position=UDim2.new(0.5,-150,0.5,-170);FM.BackgroundColor3=Color3.fromRGB(20,20,25);FM.BorderSizePixel=0
local FMC=Instance.new("UICorner",FM)FMC.CornerRadius=UDim.new(0,12)
local FMS=Instance.new("UIStroke",FM)FMS.Color=Color3.fromRGB(120,20,40)FMS.Thickness=2
local FT=Instance.new("TextLabel",FM);FT.Size=UDim2.new(1,0,0,35);FT.Position=UDim2.new(0,0,0,12);FT.BackgroundTransparency=1;FT.Text="BURMALDA v11.2";FT.TextColor3=Color3.fromRGB(120,20,40);FT.Font=Enum.Font.GothamBlack;FT.TextSize=20
local FSu=Instance.new("TextLabel",FM);FSu.Size=UDim2.new(1,0,0,20);FSu.Position=UDim2.new(0,0,0,48);FSu.BackgroundTransparency=1;FSu.Text="By KOTENOK7204";FSu.TextColor3=Color3.fromRGB(200,200,210);FSu.Font=Enum.Font.Gotham;FSu.TextSize=11
local FQ=Instance.new("TextLabel",FM);FQ.Size=UDim2.new(1,0,0,22);FQ.Position=UDim2.new(0,0,0,72);FQ.BackgroundTransparency=1;FQ.Text="Where are you?";FQ.TextColor3=Color3.fromRGB(240,240,245);FQ.Font=Enum.Font.GothamBold;FQ.TextSize=14
local function mkFB(txt,y,fn)
    local b=Instance.new("TextButton",FM);b.Size=UDim2.new(0,270,0,34);b.Position=UDim2.new(0.5,-135,0,y);b.BackgroundColor3=Color3.fromRGB(40,40,45);b.Text=txt;b.TextColor3=Color3.fromRGB(240,240,245);b.Font=Enum.Font.GothamBold;b.TextSize=13;b.BorderSizePixel=0
    local c=Instance.new("UICorner",b)c.CornerRadius=UDim.new(0,6)
    local s=Instance.new("UIStroke",b)s.Color=Color3.fromRGB(120,20,40)s.Thickness=1
    b.MouseButton1Click:Connect(function()MF=fn;sv();FS:Destroy();N("Floor: "..fn)end)
end
mkFB("Hotel",110,"Hotel");mkFB("Mines",148,"Mines");mkFB("Backdoor",186,"Backdoor");mkFB("Outdoors",224,"Outdoors");mkFB("Archives",262,"Archives");mkFB("Stairwell",300,"Stairwell")

-- MAIN GUI (Mobile) + QUICK BUTTONS
local SG=Instance.new("ScreenGui");SG.Name="BurmaldaV112";SG.ResetOnSpawn=false;SG.Parent=LP:WaitForChild("PlayerGui")

-- Open button
local OB=Instance.new("TextButton",SG);OB.Size=UDim2.new(0,50,0,50);OB.Position=UDim2.new(0,10,0.5,-25);OB.BackgroundColor3=Color3.fromRGB(120,20,40);OB.Text="B";OB.TextColor3=Color3.fromRGB(255,255,255);OB.TextSize=20;OB.Font=Enum.Font.GothamBlack;OB.BorderSizePixel=0;OB.Draggable=true
local OBC=Instance.new("UICorner",OB)OBC.CornerRadius=UDim.new(1,0)
local OBS=Instance.new("UIStroke",OB)OBS.Color=Color3.fromRGB(240,240,245)OBS.Thickness=2

-- QUICK BUTTONS (для телефона)
local QBContainer=Instance.new("Frame",SG);QBContainer.Size=UDim2.new(0,65,0,230);QBContainer.Position=UDim2.new(1,-75,0,C.QuickBtnY);QBContainer.BackgroundTransparency=1;QBContainer.Active=true
local QBLayout=Instance.new("UIListLayout",QBContainer)QBLayout.Padding=UDim.new(0,8)QBLayout.SortOrder=Enum.SortOrder.LayoutOrder

local function makeQuickBtn(text,col,cb)
    local b=Instance.new("TextButton",QBContainer);b.Size=UDim2.new(1,0,0,65);b.BackgroundColor3=col;b.Text=text;b.TextColor3=Color3.fromRGB(255,255,255);b.Font=Enum.Font.GothamBold;b.TextSize=12;b.BorderSizePixel=0;b.LayoutOrder=#QBContainer:GetChildren()
    local c=Instance.new("UICorner",b)c.CornerRadius=UDim.new(1,0)
    local s=Instance.new("UIStroke",b)s.Color=Color3.fromRGB(255,255,255)s.Thickness=2
    b.MouseButton1Click:Connect(cb)
    return b
end

makeQuickBtn("TP",Color3.fromRGB(120,20,40),function()pcall(tpNearestItem)end)
makeQuickBtn("BRING",Color3.fromRGB(60,80,140),function()C.BringItems=not C.BringItems;sv();N(C.BringItems and "Bring ON"or "Bring OFF")end)
makeQuickBtn("HIDE",Color3.fromRGB(40,120,60),function()pcall(aH)end)

local M=Instance.new("Frame",SG);M.Size=UDim2.new(0,380,0,340);M.Position=UDim2.new(0.5,-190,0.5,-170);M.BackgroundColor3=T().bg;M.BorderSizePixel=0;M.Active=true;M.Draggable=true;M.Visible=false
local MC=Instance.new("UICorner",M)MC.CornerRadius=UDim.new(0,10)
local MS=Instance.new("UIStroke",M)MS.Color=T().accent MS.Thickness=2
OB.MouseButton1Click:Connect(function()M.Visible=not M.Visible;OB.Text=M.Visible and "X"or "B"end)
local H=Instance.new("Frame",M);H.Size=UDim2.new(1,0,0,34);H.BackgroundColor3=T().accent;H.BorderSizePixel=0
local HC=Instance.new("UICorner",H)HC.CornerRadius=UDim.new(0,10)
local HT=Instance.new("TextLabel",H);HT.Size=UDim2.new(1,-40,1,0);HT.Position=UDim2.new(0,10,0,0);HT.BackgroundTransparency=1;HT.Text="BURMALDA v11.2 | "..gF();HT.TextColor3=Color3.fromRGB(255,255,255);HT.Font=Enum.Font.GothamBold;HT.TextSize=11;HT.TextXAlignment=Enum.TextXAlignment.Left
local CB=Instance.new("TextButton",H);CB.Size=UDim2.new(0,24,0,24);CB.Position=UDim2.new(1,-28,0,5);CB.BackgroundColor3=T().danger;CB.Text="X";CB.TextColor3=Color3.fromRGB(255,255,255);CB.Font=Enum.Font.GothamBold;CB.TextSize=12;CB.BorderSizePixel=0
local CBC=Instance.new("UICorner",CB)CBC.CornerRadius=UDim.new(0,4)
CB.MouseButton1Click:Connect(function()sv()M.Visible=false;OB.Text="B"end)
local TB=Instance.new("ScrollingFrame",M);TB.Size=UDim2.new(0,100,1,-34);TB.Position=UDim2.new(0,0,0,34);TB.BackgroundColor3=T().panel;TB.BorderSizePixel=0;TB.ScrollBarThickness=3;TB.ScrollBarImageColor3=T().accent;TB.CanvasSize=UDim2.new(0,0,1200)
local TBC=Instance.new("UICorner",TB)TBC.CornerRadius=UDim.new(0,10)
local TBL=Instance.new("UIListLayout",TB)TBL.Padding=UDim.new(0,3)TBL.SortOrder=Enum.SortOrder.LayoutOrder
local CT=Instance.new("Frame",M);CT.Size=UDim2.new(1,-105,1,-42);CT.Position=UDim2.new(0,102,0,38);CT.BackgroundTransparency=1
local Pg={}
local function sw(n)for k,p in pairs(Pg)do p.Visible=(k==n)end end
local function crP(n)
    local p=Instance.new("ScrollingFrame",CT);p.Size=UDim2.new(1,0,1,0);p.BackgroundTransparency=1;p.BorderSizePixel=0;p.ScrollBarThickness=3;p.ScrollBarImageColor3=T().accent;p.CanvasSize=UDim2.new(0,0,1200);p.Visible=false
    local Ls=Instance.new("UIListLayout",p)Ls.Padding=UDim.new(0,3)Ls.SortOrder=Enum.SortOrder.LayoutOrder
    Pg[n]=p;return p
end
local tL={{n="Main"},{n="Character"},{n="TP"},{n="Bypass"},{n="Exploits",d=true},{n="ESP"},{n="Auto"},{n="Visual"},{n="Hotel"},{n="Mines"},{n="Backdoor"},{n="Outdoors"},{n="Archives"},{n="Stairwell"},{n="Settings"},{n="Info"}}
local tbts={}
for _,t in ipairs(tL)do
    crP(t.n)
    local b=Instance.new("TextButton",TB);b.Size=UDim2.new(0.9,0,0,26);b.BackgroundColor3=t.d and T().danger or T().panel;b.BorderSizePixel=0;b.Text=t.n;b.TextColor3=t.d and Color3.fromRGB(255,200,210)or T().text;b.Font=Enum.Font.Gotham;b.TextSize=10;b.LayoutOrder=#tbts+1;b:SetAttribute("d",t.d or false)
    local c=Instance.new("UICorner",b)c.CornerRadius=UDim.new(0,5)
    b.MouseButton1Click:Connect(function()sw(t.n);for _,x in ipairs(tbts)do x.BackgroundColor3=x:GetAttribute("d")and T().danger or T().panel end;b.BackgroundColor3=T().accent end)
    table.insert(tbts,b)
end
sw("Main");if tbts[1]then tbts[1].BackgroundColor3=T().accent end
local function mT(p,t,i,cb,d)
    local b=Instance.new("TextButton",p);b.Size=UDim2.new(1,-6,0,28);b.BackgroundColor3=d and T().danger or T().panel;b.BorderSizePixel=0;b.Text=""
    local c=Instance.new("UICorner",b)c.CornerRadius=UDim.new(0,5)
    local l=Instance.new("TextLabel",b);l.Size=UDim2.new(0.72,0,1,0);l.Position=UDim2.new(0,8,0,0);l.BackgroundTransparency=1;l.Text=t;l.TextColor3=d and Color3.fromRGB(255,200,210)or T().text;l.Font=Enum.Font.Gotham;l.TextSize=10;l.TextXAlignment=Enum.TextXAlignment.Left
    local s=Instance.new("TextLabel",b);s.Size=UDim2.new(0.22,0,1,0);s.Position=UDim2.new(0.75,0,0,0);s.BackgroundTransparency=1;s.Text=i and "ON"or "OFF";s.TextColor3=i and Color3.fromRGB(80,220,120)or Color3.fromRGB(220,80,80);s.Font=Enum.Font.GothamBold;s.TextSize=10
    local st=i
    b.MouseButton1Click:Connect(function()st=not st;s.Text=st and "ON"or "OFF";s.TextColor3=st and Color3.fromRGB(80,220,120)or Color3.fromRGB(220,80,80);cb(st)end)
end
local function mB(p,t,cb,col)
    local b=Instance.new("TextButton",p);b.Size=UDim2.new(1,-6,0,30);b.BackgroundColor3=col or T().panel;b.BorderSizePixel=0;b.Text=t;b.TextColor3=T().text;b.Font=Enum.Font.GothamBold;b.TextSize=11
    local c=Instance.new("UICorner",b)c.CornerRadius=UDim.new(0,5)
    b.MouseButton1Click:Connect(cb)
end
local function mS(p,t,mn,mx,i,cb)
  local f=Instance.new("Frame",p);f.Size=UDim2.new(1,-6,0,38);f.BackgroundColor3=T().panel;f.BorderSizePixel=0
    local c=Instance.new("UICorner",f)c.CornerRadius=UDim.new(0,5)
    local l=Instance.new("TextLabel",f);l.Size=UDim2.new(1,-16,0,14);l.Position=UDim2.new(0,8,0,2);l.BackgroundTransparency=1;l.Text=t..": "..i;l.TextColor3=T().text;l.Font=Enum.Font.Gotham;l.TextSize=10;l.TextXAlignment=Enum.TextXAlignment.Left
    local bar=Instance.new("Frame",f);bar.Size=UDim2.new(1,-16,0,10);bar.Position=UDim2.new(0,8,0,24);bar.BackgroundColor3=T().bg;bar.BorderSizePixel=0
    local bc=Instance.new("UICorner",bar)bc.CornerRadius=UDim.new(0,4)
    local fl=Instance.new("Frame",bar);fl.Size=UDim2.new((i-mn)/(mx-mn),0,1,0);fl.BackgroundColor3=T().accent;fl.BorderSizePixel=0
    local fc=Instance.new("UICorner",fl)fc.CornerRadius=UDim.new(0,4)
    local dr=false
    bar.InputBegan:Connect(function(inp)if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then dr=true end end)
    bar.InputEnded:Connect(function(inp)if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then dr=false end end)
    UIS.InputChanged:Connect(function(inp)if dr and(inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch)then local r=math.clamp((inp.Position.X-bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1);fl.Size=UDim2.new(r,0,1,0);local v=math.floor(mn+(mx-mn)*r);l.Text=t..": "..v;cb(v)end end)
end
local function mL(p,t,col)
    local l=Instance.new("TextLabel",p);l.Size=UDim2.new(1,-6,0,20);l.BackgroundTransparency=1;l.Text=t;l.TextColor3=col or T().accent;l.Font=Enum.Font.GothamBold;l.TextSize=11;l.TextXAlignment=Enum.TextXAlignment.Left
end

mL(Pg["Main"],"QUICK")
mB(Pg["Main"],"TP to Items",function()pcall(tpNearestItem)end,T().accent)
mB(Pg["Main"],"Bring Items (toggle)",function()C.BringItems=not C.BringItems;sv();N(C.BringItems and "Bring ON"or "Bring OFF")end,T().accent)
mB(Pg["Main"],"Hide Now",function()pcall(aH)end,T().accent)
mL(Pg["Main"],"STATUS")
mL(Pg["Main"],"Floor: "..gF())
mL(Pg["Main"],"Player: "..LP.Name)

mL(Pg["Character"],"CHARACTER")
mT(Pg["Character"],"Speed",C.SpeedEnabled,function(s)C.SpeedEnabled=s end)
mS(Pg["Character"],"Speed Boost",0,100,C.SpeedBoost,function(v)C.SpeedBoost=v end)
mS(Pg["Character"],"WalkSpeed",16,60,C.WalkSpeed,function(v)C.WalkSpeed=v end)
mS(Pg["Character"],"JumpPower",50,200,C.JumpPower,function(v)C.JumpPower=v end)
mT(Pg["Character"],"Fly",C.Fly,function(s)C.Fly=s setFly(s)end)
mS(Pg["Character"],"Fly Speed",10,200,C.FlySpeed,function(v)C.FlySpeed=v end)
mT(Pg["Character"],"Noclip",C.Noclip,function(s)C.Noclip=s setNC(s)end)
mT(Pg["Character"],"Inf Jump",C.InfiniteJumps,function(s)C.InfiniteJumps=s end)
mT(Pg["Character"],"Enable Jump",C.EnableJump,function(s)C.EnableJump=s end)
mT(Pg["Character"],"Enable Slide",C.EnableSlide,function(s)C.EnableSlide=s end)

mL(Pg["TP"],"TP TO ITEMS")
mB(Pg["TP"],"TP to Nearest Item",function()pcall(tpNearestItem)end,T().accent)
mS(Pg["TP"],"TP Radius",50,2000,C.TPItemRadius,function(v)C.TPItemRadius=v end)
mL(Pg["TP"],"BRING")
mT(Pg["TP"],"Bring Items",C.BringItems,function(s)C.BringItems=s end)
mS(Pg["TP"],"Bring Radius",20,500,C.BringRadius,function(v)C.BringRadius=v end)

mL(Pg["Bypass"],"BYPASS")
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

mL(Pg["Exploits"],"EXPLOITS (DANGER)",T().danger)
mT(Pg["Exploits"],"[DANGER] God Mode",C.GodMode,function(s)C.GodMode=s end,true)
mT(Pg["Exploits"],"[DANGER] Infinite Revive",C.InfiniteRevive,function(s)C.InfiniteRevive=s end,true)
mT(Pg["Exploits"],"[DANGER] Infinite Items",C.InfiniteItems,function(s)C.InfiniteItems=s end,true)
mB(Pg["Exploits"],"Play Again",function()if RF and RF:FindFirstChild("PlayAgain")then pcall(function()RF.PlayAgain:FireServer()end)end end,T().danger)
mB(Pg["Exploits"],"Return to Lobby",function()if RF and RF:FindFirstChild("Lobby")then pcall(function()RF.Lobby:FireServer()end)end end,T().danger)
mB(Pg["Exploits"],"Revive",function()if RF and RF:FindFirstChild("Revive")then pcall(function()RF.Revive:FireServer()end)end end,T().danger)
mB(Pg["Exploits"],"Void",function()local ch=LP.Character;if ch then ch:PivotTo(ch:GetPivot()+Vector3.new(0,-120-ch:GetPivot().Position.Y,0))end end,T().danger)

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
mL(Pg["ESP"],"OBJECTS")
mT(Pg["ESP"],"Doors",false,function(s)C.ESP_Doors=s end)
mT(Pg["ESP"],"Closets",false,function(s)C.ESP_Closets=s end)
mT(Pg["ESP"],"Money",false,function(s)C.ESP_Money=s end)
mT(Pg["ESP"],"Keys",false,function(s)C.ESP_Keys=s end)
mT(Pg["ESP"],"Items",false,function(s)C.ESP_Items=s end)
mT(Pg["ESP"],"Ladders",false,function(s)C.ESP_Ladders=s end)
mT(Pg["ESP"],"Players",false,function(s)C.ESP_Players=s end)

mL(Pg["Auto"],"AUTOMATION")
mT(Pg["Auto"],"Auto Breaker",C.AutoBreaker,function(s)C.AutoBreaker=s end)
mT(Pg["Auto"],"Auto Interact",C.AutoInteract,function(s)C.AutoInteract=s end)
mT(Pg["Auto"],"Auto Closet",C.AutoCloset,function(s)C.AutoCloset=s end)
mT(Pg["Auto"],"Auto Door",C.AutoDoor,function(s)C.AutoDoor=s end)
mT(Pg["Auto"],"Auto Collect",C.AutoCollect,function(s)C.AutoCollect=s end)
mT(Pg["Auto"],"Auto Coins",C.AutoCoins,function(s)C.AutoCoins=s end)
mT(Pg["Auto"],"Auto-Hide Rush",C.AutoHideRush,function(s)C.AutoHideRush=s end)
mT(Pg["Auto"],"Auto-Hide Ambush",C.AutoHideAmbush,function(s)C.AutoHideAmbush=s end)
mT(Pg["Auto"],"Anti-AFK",C.AntiAFK,function(s)C.AntiAFK=s end)

mL(Pg["Visual"],"COLORS")
mB(Pg["Visual"],"Bordeaux",function()C.ESPColor=Color3.fromRGB(180,30,30)clearESP()end,T().danger)
mB(Pg["Visual"],"Red",function()C.ESPColor=Color3.fromRGB(255,50,50)clearESP()end,T().accent)
mB(Pg["Visual"],"Green",function()C.ESPColor=Color3.fromRGB(50,255,50)clearESP()end,T().accent)
mB(Pg["Visual"],"Blue",function()C.ESPColor=Color3.fromRGB(50,150,255)clearESP()end,T().accent)
mT(Pg["Visual"],"Rainbow",C.RainbowMode,function(s)C.RainbowMode=s end)
mT(Pg["Visual"],"X-Ray",C.XRay,function(s)C.XRay=s end)
mS(Pg["Visual"],"Max Distance",50,1500,500,function(v)C.MaxDistance=v end)
mB(Pg["Visual"],"Clear ESP",function()clearESP()N("Cleared")end)

mL(Pg["Hotel"],"HOTEL")
mT(Pg["Hotel"],"Rush",false,function(s)C.ESP_Rush=s end)
mT(Pg["Hotel"],"Ambush",false,function(s)C.ESP_Ambush=s end)
mT(Pg["Hotel"],"Seek",false,function(s)C.ESP_Seek=s end)
mT(Pg["Hotel"],"Figure",false,function(s)C.ESP_Figure=s end)
mT(Pg["Hotel"],"Hide",false,function(s)C.ESP_Hide=s end)

mL(Pg["Mines"],"MINES")
mT(Pg["Mines"],"Grumble",false,function(s)C.ESP_Grumble=s end)
mT(Pg["Mines"],"Giggle",false,function(s)C.ESP_Giggle=s end)
mT(Pg["Mines"],"Minecart",false,function(s)C.ESP_Minecart=s end)
mT(Pg["Mines"],"Lava",false,function(s)C.ESP_Lava=s end)

mL(Pg["Backdoor"],"BACKDOOR")
mT(Pg["Backdoor"],"Halt",false,function(s)C.ESP_Halt=s end)
mT(Pg["Backdoor"],"Blitz",false,function(s)C.ESP_Blitz=s end)
mT(Pg["Backdoor"],"Lookman",false,function(s)C.ESP_Lookman=s end)

mL(Pg["Outdoors"],"OUTDOORS")
mT(Pg["Outdoors"],"Gloombat",false,function(s)C.ESP_Gloombat=s end)
mT(Pg["Outdoors"],"Hide",false,function(s)C.ESP_Hide=s end)

mL(Pg["Archives"],"ARCHIVES")
mT(Pg["Archives"],"Noise",false,function(s)C.ESP_Noise=s end)
mT(Pg["Archives"],"Creak",false,function(s)C.ESP_Creak=s end)
mT(Pg["Archives"],"Scribbles",false,function(s)C.ESP_Scribbles=s end)
mT(Pg["Archives"],"Teller",false,function(s)C.ESP_Teller=s end)
mT(Pg["Archives"],"Drones",false,function(s)C.ESP_Drones=s end)

mL(Pg["Stairwell"],"STAIRWELL")
mT(Pg["Stairwell"],"Seek",false,function(s)C.ESP_Seek=s end)
mT(Pg["Stairwell"],"Figure",false,function(s)C.ESP_Figure=s end)
mT(Pg["Stairwell"],"Ladders",false,function(s)C.ESP_Ladders=s end)
mT(Pg["Stairwell"],"Doors",false,function(s)C.ESP_Doors=s end)

mL(Pg["Settings"],"THEMES")
for name,_ in pairs(Th)do
    mB(Pg["Settings"],name,function()
        C.Theme=name;local t=T()
        M.BackgroundColor3=t.bg;H.BackgroundColor3=t.accent;TB.BackgroundColor3=t.panel;MS.Color=t.accent
        for _,b in ipairs(tbts)do b.BackgroundColor3=b:GetAttribute("d")and t.danger or t.panel;b.TextColor3=t.text end
        sv()
    end,T().accent)
end
mL(Pg["Settings"],"SYSTEM")
mB(Pg["Settings"],"Save Config",function()sv()N("Saved")end,T().accent)
mB(Pg["Settings"],"Load Config",function()ld()N("Loaded")end)
mB(Pg["Settings"],"Reset Config",function()pcall(function()if isfile and isfile(CFG)then delfile(CFG)end end)N("OK")end,T().danger)
mL(Pg["Settings"],"Quick Buttons Position")
mS(Pg["Settings"],"QB Y",50,600,C.QuickBtnY,function(v)C.QuickBtnY=v;QBContainer.Position=UDim2.new(1,-75,0,v)end)

mL(Pg["Info"],"INFO")
mL(Pg["Info"],"Script: Burmalda v11.2 MOBILE")
mL(Pg["Info"],"Creator: KOTENOK7204")
mL(Pg["Info"],"Player: "..LP.Name)
mL(Pg["Info"],"Floor: "..gF())
mL(Pg["Info"],"Ping: "..math.floor(LP:GetNetworkPing()*1000).."ms")

N("Burmalda v11.2 MOBILE loaded!")
sv()
