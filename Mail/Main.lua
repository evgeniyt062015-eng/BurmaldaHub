-- BURMALDA v9.6 | By KOTENOK7204 | Fly Fix + Lobby Msg
local P=game:GetService("Players")
local RS=game:GetService("ReplicatedStorage")
local Run=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local HS=game:GetService("HttpService")
local VU=game:GetService("VirtualUser")
local LP=P.LocalPlayer
local RF=RS:FindFirstChild("RemotesFolder")or RS:FindFirstChild("EntityInfo")or RS:FindFirstChild("Bricks")

local InLobby=false
pcall(function() if not workspace:FindFirstChild("CurrentRooms")then InLobby=true end end)

local CF="Hotel"; local MF=nil
pcall(function() local G=RS:FindFirstChild("GameData"); if G and G:FindFirstChild("Floor")then CF=G.Floor.Value end end)
local function gF()return MF or CF end

if InLobby then
    task.spawn(function()
        task.wait(1.5)
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title="Burmalda v9.6",
                Text="You are in the Lobby. Please enter the elevator to start the run.",
                Duration=15
            })
        end)
    end)
end

local C={
    BypassScreech=false,BypassHalt=false,BypassEyes=false,BypassLookman=false,
    BypassSnare=false,BypassKillbricks=false,BypassSeekingWall=false,
    BypassBanana=false,BypassGiggle=false,BypassDupe=false,BypassVacuum=false,
    BypassGloombatEggs=false,BypassJeff=false,
    GodMode=false,InfiniteItems=false,InfiniteRevive=false,
    SpeedEnabled=false,WalkSpeed=22,JumpPower=50,InfiniteJump=false,
    Fly=false,FlySpeed=50,Noclip=false,
    AutoHideRush=false,AutoHideAmbush=false,AutoHideAll=false,AntiAFK=true,
    AutoCollect=false,AutoOpenClosets=false,AutoDoor=false,AutoCoins=false,
    ESP_All=false,ESP_Rush=false,ESP_Ambush=false,ESP_Seek=false,ESP_Figure=false,
    ESP_Screech=false,ESP_Hide=false,ESP_Eyes=false,ESP_Halt=false,
    ESP_Grumble=false,ESP_Giggle=false,
    ESP_Doors=false,ESP_Closets=false,ESP_Money=false,ESP_Keys=false,
    ESP_Items=false,ESP_Ladders=false,
    ESPColor=Color3.fromRGB(180,30,30),DoorColor=Color3.fromRGB(120,20,40),
    MaxDistance=500,RainbowMode=false,XRay=true,ShowDistance=true,
    FillTransparency=0.55,TextSize=12,ESPUpdateRate=1.5,
    Theme="GrayBlack",AutoSave=true,BypassDelay=0.1,
    AntiCheatStairway=false,
    OverlayEnabled=false,OverlayX=10,OverlayY=150,
    OverlayLadders=true,OverlayMonsters=true,OverlayMoney=true,OverlayItems=true,
    OverlayFPS=true,OverlayTransparency=0.3,
}

local Th={
    GrayBlack={bg=Color3.fromRGB(20,20,25),panel=Color3.fromRGB(40,40,45),accent=Color3.fromRGB(120,20,40),text=Color3.fromRGB(240,240,245),danger=Color3.fromRGB(180,30,30)},
    Black={bg=Color3.fromRGB(10,10,12),panel=Color3.fromRGB(25,25,28),accent=Color3.fromRGB(120,20,40),text=Color3.fromRGB(230,230,235),danger=Color3.fromRGB(180,30,30)},
    Blood={bg=Color3.fromRGB(25,10,10),panel=Color3.fromRGB(45,15,15),accent=Color3.fromRGB(220,40,40),text=Color3.fromRGB(255,230,230),danger=Color3.fromRGB(200,40,40)},
    Dark={bg=Color3.fromRGB(20,20,28),panel=Color3.fromRGB(30,30,42),accent=Color3.fromRGB(100,60,200),text=Color3.fromRGB(255,255,255),danger=Color3.fromRGB(180,30,30)},
    Toxic={bg=Color3.fromRGB(10,25,15),panel=Color3.fromRGB(20,45,30),accent=Color3.fromRGB(50,220,100),text=Color3.fromRGB(230,255,235),danger=Color3.fromRGB(180,30,30)},
    Gold={bg=Color3.fromRGB(30,25,10),panel=Color3.fromRGB(50,40,15),accent=Color3.fromRGB(255,200,50),text=Color3.fromRGB(255,245,220),danger=Color3.fromRGB(180,30,30)},
    Cyberpunk={bg=Color3.fromRGB(15,5,30),panel=Color3.fromRGB(30,10,55),accent=Color3.fromRGB(255,0,200),text=Color3.fromRGB(0,255,255),danger=Color3.fromRGB(180,30,30)},
    Matrix={bg=Color3.fromRGB(5,15,5),panel=Color3.fromRGB(10,30,10),accent=Color3.fromRGB(0,255,0),text=Color3.fromRGB(200,255,200),danger=Color3.fromRGB(180,30,30)},
}
local function T()return Th[C.Theme]or Th.GrayBlack end
local function N(t)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="Burmalda",Text=t,Duration=3})end)end

local CFG="BurmaldaV96.json"
local function sv()
    pcall(function()
        local d={}
        for k,v in pairs(C)do
            if type(v)=="Color3"then d[k]={__c=true,r=v.R,g=v.G,b=v.B}else d[k]=v end
        end
        writefile(CFG,HS:JSONEncode(d))
    end)
end
local function ld()
    pcall(function()
        if isfile and isfile(CFG)then
            local d=HS:JSONDecode(readfile(CFG))
            for k,v in pairs(d)do
                if type(v)=="table"and v.__c then C[k]=Color3.new(v.r,v.g,v.b)else C[k]=v end
            end
        end
    end)
end
ld()

-- ═══ FLY (как в Abysall: BodyVelocity + BodyGyro + PlatformStand) ═══
local FLY_BV,FLY_BG,FLY_CONN
local function setFly(s)
    local ch=LP.Character
    if not ch then return end
    local hum=ch:FindFirstChildOfClass("Humanoid")
    local root=ch:FindFirstChild("HumanoidRootPart")
    if not root then return end
    if FLY_BV then FLY_BV:Destroy() FLY_BV=nil end
    if FLY_BG then FLY_BG:Destroy() FLY_BG=nil end
    if FLY_CONN then FLY_CONN:Disconnect() FLY_CONN=nil end
    if not s then
        if hum then hum.PlatformStand=false end
        return
    end
    FLY_BV=Instance.new("BodyVelocity",root)
    FLY_BV.MaxForce=Vector3.new(9e9,9e9,9e9)
    FLY_BV.Velocity=Vector3.zero
    FLY_BV.P=1250
    FLY_BG=Instance.new("BodyGyro",root)
    FLY_BG.MaxTorque=Vector3.new(9e9,9e9,9e9)
    FLY_BG.P=1000
    FLY_BG.D=50
    FLY_BG.CFrame=root.CFrame
    if hum then hum.PlatformStand=true end
    FLY_CONN=Run.RenderStepped:Connect(function()
        if not C.Fly then return end
        local char=LP.Character
        if not char then return end
        local r=char:FindFirstChild("HumanoidRootPart")
        if not r then return end
        local cam=workspace.CurrentCamera
        local mv=Vector3.zero
        if UIS:IsKeyDown(Enum.KeyCode.W)then mv=mv+cam.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.S)then mv=mv-cam.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.A)then mv=mv-cam.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.D)then mv=mv+cam.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.Space)then mv=mv+Vector3.new(0,1,0) end
        if UIS:IsKeyDown(Enum.KeyCode.LeftShift)then mv=mv-Vector3.new(0,1,0) end
        FLY_BV.Velocity=mv*C.FlySpeed
        FLY_BG.CFrame=CFrame.new(r.Position,r.Position+cam.CFrame.LookVector)
    end)
end
LP.CharacterAdded:Connect(function()
    task.wait(1)
    if C.Fly then setFly(false) task.wait(0.1) setFly(true) end
end)

-- SCREECH
local SCF,SCR,SCA=false,nil,nil
local function installSC()
    if SCA or not RF then return end
    SCR=RF:FindFirstChild("Screech")
    if not SCR then return end
    SCF=Instance.new("RemoteEvent")
    SCF.Name="Screech"
    SCF.Parent=RF
    SCR.Name="Screech_REAL"
    SCA=true
end
local function removeSC()
    if not SCA then return end
    pcall(function()
        if SCR and SCR.Parent then SCR.Name="Screech" end
        if SCF then SCF:Destroy() end
    end)
    SCA=false
end

-- HALT
local HC
local function startH()
    if HC then HC:Disconnect() end
    HC=Run.RenderStepped:Connect(function()
        if not C.BypassHalt then return end
        local ch=LP.Character
        if not ch or not ch:FindFirstChild("HumanoidRootPart")then return end
        local cam=workspace.CurrentCamera
        for _,o in ipairs(workspace:GetDescendants())do
            if o.Name:lower():find("halt")then
                local p=o:IsA("BasePart")and o or(o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true))
                if p and(p.Position-ch.HumanoidRootPart.Position).Magnitude<60 then
                    local a=(ch.HumanoidRootPart.Position-p.Position).Unit
                    local n=cam.CFrame.Position
                    cam.CFrame=CFrame.new(n,n+Vector3.new(a.X,0,a.Z))
                end
            end
        end
    end)
end

-- GOD
task.spawn(function()
    while task.wait(0.5)do
        if C.GodMode then
            local ch=LP.Character
            local h=ch and ch:FindFirstChildOfClass("Humanoid")
            if h and h.Health<h.MaxHealth then pcall(function()h.Health=h.MaxHealth end)end
        end
    end
end)

-- REVIVE
task.spawn(function()
    while task.wait(1)do
        if C.InfiniteRevive and RF then
            pcall(function()
                local r=RF:FindFirstChild("Revive")
                if r then r:FireServer() end
            end)
        end
    end
end)

-- NOCLIP
local NC
local function setNC(s)
    if NC then NC:Disconnect() NC=nil end
    if not s then return end
    NC=Run.Stepped:Connect(function()
        local ch=LP.Character
        if ch then
            for _,p in ipairs(ch:GetDescendants())do
                if p:IsA("BasePart")and p.CanCollide then p.CanCollide=false end
            end
        end
    end)
end

UIS.JumpRequest:Connect(function()
    if C.InfiniteJump then
        local ch=LP.Character
        local h=ch and ch:FindFirstChildOfClass("Humanoid")
        if h then h:ChangeState(Enum.HumanoidStateType.Jumping)end
    end
end)

task.spawn(function()
    while task.wait(0.5)do
        local ch=LP.Character
        local h=ch and ch:FindFirstChildOfClass("Humanoid")
        if h then
            if C.SpeedEnabled then h.WalkSpeed=C.WalkSpeed else h.WalkSpeed=16 end
            h.JumpPower=C.JumpPower
            h.UseJumpPower=true
        end
    end
end)

-- ENTITIES
local ENT={"RushMoving","AmbushMoving","Seek","Figure","Screech","Hide","Eyes","Glitch","Dupe","Jack","Snare","Timothy","Shadow","Halt","Grumble","Giggle","Gloombat","Monument","Sally","JeffTheKiller","Bash","Blitz","A60","A120","Noise","Creak","Scribbles","Lookman","DronesStampede","Groundskeeper"}
local EN={RushMoving="Rush",AmbushMoving="Ambush",Seek="Seek",Figure="Figure",Screech="Screech",Hide="Hide",Eyes="Eyes",Glitch="Glitch",Dupe="Dupe",Jack="Jack",Snare="Snare",Timothy="Timothy",Shadow="Shadow",Halt="Halt",Grumble="Grumble",Giggle="Giggle",Gloombat="Gloombat",Monument="Monument",Sally="Sally",JeffTheKiller="Jeff the Killer",Bash="Bash",Blitz="Blitz",A60="A-60",A120="A-120",Noise="Noise",Creak="Creak",Scribbles="Scribbles",Lookman="Lookman",DronesStampede="Drones Stampede",Groundskeeper="Groundskeeper"}
local function isE(o)
    if not o:IsA("Model")and not o:IsA("BasePart")then return false,nil,nil end
    local n=o.Name:lower()
    for _,e in ipairs(ENT)do
        if n==e:lower()or n:find(e:lower(),1,true)then return true,e,EN[e]or e end
    end
    return false,nil,nil
end

local ESP={}
local function clearESP()
    for _,v in pairs(ESP)do pcall(function()v:Destroy()end)end
    ESP={}
end
local function makeESP(o,col,txt,yo)
    if ESP[o]and ESP[o].Parent then return end
    local bb=Instance.new("BillboardGui")
    bb.Size=UDim2.new(0,130,0,28)
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
local function getP(o)
    if o:IsA("BasePart")then return o.Position end
    if o.PrimaryPart then return o.PrimaryPart.Position end
    local p=o:FindFirstChildWhichIsA("BasePart",true)
    return p and p.Position
end
local function myP()
    local ch=LP.Character
    if ch and ch:FindFirstChild("HumanoidRootPart")then return ch.HumanoidRootPart.Position end
end
local function cO(b)
  if C.RainbowMode then return Color3.fromHSV(tick()%5/5,1,1)end
    return b
end

local function updESP()
    local pos=myP()
    if not pos then return end
    for _,o in ipairs(workspace:GetDescendants())do
        if ESP[o]then continue end
        local op=getP(o)
        if not op or(op-pos).Magnitude>C.MaxDistance then continue end
        local n=o.Name:lower()
        local ok,key,ne=isE(o)
        if ok then
            local cK="ESP_"..key
            if C.ESP_All or C[cK]then
                local t=ne
                if C.ShowDistance then t=t.." ["..math.floor((op-pos).Magnitude).."m]" end
                makeESP(o,cO(C.ESPColor),t,5)
                continue
            end
        end
        if C.ESP_Doors and n:find("door")and not n:find("handler")then makeESP(o,cO(C.DoorColor),"Door",3) continue end
        if C.ESP_Closets and(n:find("closet")or n:find("hiding")or n:find("wardrobe"))then makeESP(o,cO(Color3.fromRGB(100,255,100)),"Hide",3) continue end
        if C.ESP_Money and(n:find("coin")or n:find("gold"))then makeESP(o,cO(Color3.fromRGB(255,215,0)),"Money",3) continue end
        if C.ESP_Keys and n:find("key")then makeESP(o,cO(Color3.fromRGB(255,255,100)),"Key",3) continue end
        if C.ESP_Items and(n:find("bandage")or n:find("flashlight")or n:find("lighter")or n:find("lockpick")or n:find("crucifix")or n:find("battery"))then makeESP(o,cO(Color3.fromRGB(255,220,50)),o.Name,3) continue end
        if C.ESP_Ladders and(n:find("ladder")or n:find("stair"))then makeESP(o,cO(Color3.fromRGB(0,200,255)),"Ladder",3) continue end
    end
end

local function byT(names,state)
    for _,o in ipairs(workspace:GetDescendants())do
        if o:IsA("Model")then
            local n=o.Name:lower()
            for _,t in ipairs(names)do
                if n==t:lower()or n:find(t:lower(),1,true)then
                    for _,p in ipairs(o:GetDescendants())do
                        if p:IsA("BasePart")then pcall(function()p.CanTouch=not state end)end
                    end
                end
            end
        end
    end
end
task.spawn(function()
    while task.wait(C.BypassDelay)do
        pcall(function()
            if C.BypassEyes or C.BypassLookman then
                local m=RF and RF:FindFirstChild("MotorReplication")
                if m then m:FireServer(-(600+math.random(0,100)))end
            end
            if C.BypassSnare then byT({"Snare"},true)end
            if C.BypassKillbricks then byT({"Lava"},true)end
            if C.BypassBanana then byT({"BananaPeel"},true)end
            if C.BypassSeekingWall then byT({"ScaryWall"},true)end
        end)
    end
end)

local function getR()
    local ch=LP.Character
    return ch and ch:FindFirstChild("HumanoidRootPart")
end

task.spawn(function()
    while task.wait(0.3)do
        if C.AutoCollect then
            local r=getR()
            if r then
                for _,o in ipairs(workspace:GetDescendants())do
                    if o:IsA("Model")or o:IsA("BasePart")then
                        local n=o.Name:lower()
                        if n:find("crucifix")or n:find("lockpick")or n:find("bandage")or n:find("lighter")or n:find("flashlight")or n:find("battery")then
                            local p=o:IsA("BasePart")and o or(o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true))
                            if p and(p.Position-r.Position).Magnitude<20 then
                                pcall(function()r.CFrame=CFrame.new(p.Position)end)
                            end
                        end
                    end
                end
            end
        end
        if C.AutoCoins then
            local r=getR()
            if r then
                for _,o in ipairs(workspace:GetDescendants())do
                    if o:IsA("BasePart")and(o.Name:lower():find("coin")or o.Name:lower():find("gold"))then
                        if(o.Position-r.Position).Magnitude<15 then
                pcall(function()r.CFrame=CFrame.new(o.Position)end)
                        end
                    end
                end
            end
        end
        if C.AutoOpenClosets then
            local r=getR()
            if r then
                local pos=r.Position
                for _,o in ipairs(workspace:GetDescendants())do
                    if o:IsA("ProximityPrompt")and o.Enabled then
                        local par=o.Parent
                        if par then
                            local n=(par.Name..(o.ActionText or "")..(o.ObjectText or "")):lower()
                            if n:find("closet")or n:find("hiding")or n:find("wardrobe")then
                                local pp=par:IsA("BasePart")and par or par:FindFirstChildWhichIsA("BasePart",true)
                                if pp and(pp.Position-pos).Magnitude<10 then
                                    pcall(function()o:InputHoldBegin() task.wait(0.05) o:InputHoldEnd() end)
                                end
                            end
                        end
                    end
                end
            end
        end
        if C.AutoDoor then
            local r=getR()
            if r then
                local pos=r.Position
                for _,o in ipairs(workspace:GetDescendants())do
                    if o:IsA("ProximityPrompt")and o.Enabled then
                        local a=(o.ActionText or ""):lower()
                        if a:find("open")or a:find("door")then
                            local par=o.Parent
                            local pp=par and(par:IsA("BasePart")and par or par:FindFirstChildWhichIsA("BasePart",true))
                            if pp and(pp.Position-pos).Magnitude<8 then
                                pcall(function()o:InputHoldBegin() task.wait(0.05) o:InputHoldEnd() end)
                            end
                        end
                    end
                end
            end
        end
    end
end)

local HD=0
local IH=false
local function aH()
    local ch=LP.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart")then return end
    local pos=ch.HumanoidRootPart.Position
    local dg=false
    for _,o in ipairs(workspace:GetDescendants())do
        if o:IsA("Model")then
            local n=o.Name:lower()
            if(n:find("rush")and C.AutoHideRush)or(n:find("ambush")and C.AutoHideAmbush)or(C.AutoHideAll and(n:find("seek")or n:find("figure")))then
                local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true)
                if p and(p.Position-pos).Magnitude<100 then dg=true break end
            end
        end
    end
    if not dg or IH or tick()-HD<2 then return end
    local cl,pr,dt=nil,nil,math.huge
    for _,o in ipairs(workspace:GetDescendants())do
        if o:IsA("Model")then
            local n=o.Name:lower()
            if n:find("closet")or n:find("hiding")or n:find("wardrobe")then
                local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true)
                if p then
                    local d=(p.Position-pos).Magnitude
                    if d<dt then
                        local pp=o:FindFirstChildWhichIsA("ProximityPrompt",true)
                        if pp and pp.Enabled then dt=d cl=o pr=pp end
                    end
                end
            end
        end
    end
    if cl and pr and dt<50 then
        local p=cl.PrimaryPart or cl:FindFirstChildWhichIsA("BasePart",true)
        if p then ch.HumanoidRootPart.CFrame=CFrame.new(p.Position+Vector3.new(0,2,0))end
        task.wait(0.15)
        IH=true
        pcall(function()pr:InputHoldBegin() task.wait(math.max(pr.HoldDuration or 0,0.05)) pr:InputHoldEnd() end)
        HD=tick()
        task.wait(1)
        IH=false
    end
end

task.spawn(function()
    while task.wait(60)do
        if C.AntiAFK then pcall(function()VU:CaptureController() VU:ClickButton2(Vector2.new())end)end
    end
end)

Run.Heartbeat:Connect(function()
    if C.AutoHideRush or C.AutoHideAmbush or C.AutoHideAll then pcall(aH)end
end)
task.spawn(function() while task.wait(C.ESPUpdateRate)do pcall(updESP)end end)
task.spawn(function() while task.wait(30)do if C.AutoSave then pcall(sv)end end end)

-- OVERLAY
local OG=Instance.new("ScreenGui")
OG.Name="BurmaldaOverlay"
OG.ResetOnSpawn=false
OG.Parent=LP:WaitForChild("PlayerGui")
local OF=Instance.new("Frame",OG)
OF.Size=UDim2.new(0,180,0,110)
OF.Position=UDim2.new(0,C.OverlayX,0,C.OverlayY)
OF.BackgroundColor3=Color3.fromRGB(20,20,25)
OF.BackgroundTransparency=C.OverlayTransparency
OF.BorderSizePixel=0
OF.Active=true
OF.Draggable=true
OF.Visible=false
local OC=Instance.new("UICorner",OF)OC.CornerRadius=UDim.new(0,8)
local OS=Instance.new("UIStroke",OF)OS.Color=Color3.fromRGB(120,20,40)OS.Thickness=1
local OT=Instance.new("TextLabel",OF)
OT.Size=UDim2.new(1,0,0,20)
OT.BackgroundTransparency=1
OT.Text="BURMALDA"
OT.TextColor3=Color3.fromRGB(120,20,40)
OT.Font=Enum.Font.GothamBold
OT.TextSize=11
local OCo=Instance.new("TextLabel",OF)
OCo.Size=UDim2.new(1,-8,1,-24)
OCo.Position=UDim2.new(0,4,0,22)
OCo.BackgroundTransparency=1
OCo.Text=""
OCo.TextColor3=Color3.fromRGB(240,240,245)
OCo.Font=Enum.Font.Gotham
OCo.TextSize=10
OCo.TextXAlignment=Enum.TextXAlignment.Left
OCo.TextYAlignment=Enum.TextYAlignment.Top
OCo.TextWrapped=true
OF.MouseButton1Up:Connect(function()C.OverlayX=OF.Position.X.Offset C.OverlayY=OF.Position.Y.Offset sv()end)

task.spawn(function()
    while task.wait(0.5)do
        if C.OverlayEnabled then
            OF.Visible=true
            OF.Position=UDim2.new(0,C.OverlayX,0,C.OverlayY)
            OF.BackgroundTransparency=C.OverlayTransparency
            local txt=""
            local ch=LP.Character
            local r=ch and ch:FindFirstChild("HumanoidRootPart")
            if r then
                local pos=r.Position
                if C.OverlayLadders then
                    local cl,dl=nil,math.huge
                    for _,o in ipairs(workspace:GetDescendants())do
                        local n=o.Name:lower()
                        if n:find("ladder")or n:find("stair")then
                            local p=o:IsA("BasePart")and o or(o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true))
                            if p then local d=(p.Position-pos).Magnitude if d<dl then dl=d cl=o end end
                        end
                    end
                    txt=txt.."Ladder: "..(cl and math.floor(dl).."m"or"-").."\n"
                end
                if C.OverlayMonsters then
                    local cm,dm,nm=nil,math.huge,"?"
                    for _,o in ipairs(workspace:GetDescendants())do
                        local ok,_,ne=isE(o)
                        if ok then
                            local p=getP(o)
                            if p then local d=(p-pos).Magnitude if d<dm then dm=d cm=o nm=ne end end
                        end
                    end
                    txt=txt.."Monster: "..(cm and nm.." "..math.floor(dm).."m"or"-").."\n"
                end
                if C.OverlayMoney then
                    local cc,dc=nil,math.huge
                    for _,o in ipairs(workspace:GetDescendants())do
                        if o:IsA("BasePart")and(o.Name:lower():find("coin")or o.Name:lower():find("gold"))then
                            local d=(o.Position-pos).Magnitude if d<dc then dc=d cc=o end
                        end
                    end
                    txt=txt.."Coin: "..(cc and math.floor(dc).."m"or"-").."\n"
                end
                if C.OverlayItems then
                    local ci,di,ni=nil,math.huge,"?"
                    for _,o in ipairs(workspace:GetDescendants())do
                        local n=o.Name:lower()
                        if n:find("item")or n:find("crucifix")or n:find("bandage")or n:find("flashlight")then
                local p=o:IsA("BasePart")and o or(o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true))
                            if p then local d=(p.Position-pos).Magnitude if d<di then di=d ci=o ni=o.Name end end
                        end
                    end
                    txt=txt.."Item: "..(ci and ni.." "..math.floor(di).."m"or"-").."\n"
                end
            end
            if C.OverlayFPS then txt=txt.."Ping: "..math.floor(LP:GetNetworkPing()*1000).."ms" end
            OCo.Text=txt
        else
            OF.Visible=false
        end
    end
end)

-- FLOOR SELECT
local FS=Instance.new("ScreenGui")
FS.Name="BurmaldaFloorSelect"
FS.ResetOnSpawn=false
FS.IgnoreGuiInset=true
FS.Parent=LP:WaitForChild("PlayerGui")
local FB=Instance.new("Frame",FS)
FB.Size=UDim2.new(1,0,1,0)
FB.BackgroundColor3=Color3.fromRGB(15,15,18)
FB.BackgroundTransparency=0.3
FB.BorderSizePixel=0
local FM=Instance.new("Frame",FB)
FM.Size=UDim2.new(0,360,0,400)
FM.Position=UDim2.new(0.5,-180,0.5,-200)
FM.BackgroundColor3=Color3.fromRGB(20,20,25)
FM.BorderSizePixel=0
local FMC=Instance.new("UICorner",FM)FMC.CornerRadius=UDim.new(0,12)
local FMS=Instance.new("UIStroke",FM)FMS.Color=Color3.fromRGB(120,20,40)FMS.Thickness=2
local FT=Instance.new("TextLabel",FM)
FT.Size=UDim2.new(1,0,0,50)
FT.Position=UDim2.new(0,0,0,10)
FT.BackgroundTransparency=1
FT.Text="BURMALDA v9.6"
FT.TextColor3=Color3.fromRGB(120,20,40)
FT.Font=Enum.Font.GothamBlack
FT.TextSize=26
local FSu=Instance.new("TextLabel",FM)
FSu.Size=UDim2.new(1,0,0,20)
FSu.Position=UDim2.new(0,0,0,58)
FSu.BackgroundTransparency=1
FSu.Text="By KOTENOK7204"
FSu.TextColor3=Color3.fromRGB(200,200,210)
FSu.Font=Enum.Font.Gotham
FSu.TextSize=12
local FQ=Instance.new("TextLabel",FM)
FQ.Size=UDim2.new(1,0,0,25)
FQ.Position=UDim2.new(0,0,0,88)
FQ.BackgroundTransparency=1
FQ.Text="Where are you?"
FQ.TextColor3=Color3.fromRGB(240,240,245)
FQ.Font=Enum.Font.GothamBold
FQ.TextSize=15

local function mkFB(txt,y,fn)
    local b=Instance.new("TextButton",FM)
    b.Size=UDim2.new(0,320,0,36)
    b.Position=UDim2.new(0.5,-160,0,y)
    b.BackgroundColor3=Color3.fromRGB(40,40,45)
    b.Text=txt
    b.TextColor3=Color3.fromRGB(240,240,245)
    b.Font=Enum.Font.GothamBold
    b.TextSize=14
    b.BorderSizePixel=0
    local c=Instance.new("UICorner",b)c.CornerRadius=UDim.new(0,6)
    local s=Instance.new("UIStroke",b)s.Color=Color3.fromRGB(120,20,40)s.Thickness=1
    b.MouseButton1Click:Connect(function()
        MF=fn
        sv()
        FS:Destroy()
        N("Floor: "..fn)
    end)
end
mkFB("Hotel",125,"Hotel")
mkFB("Mines",166,"Mines")
mkFB("Backdoor",207,"Backdoor")
mkFB("Outdoors",248,"Outdoors")
mkFB("Archives",289,"Archives")
mkFB("Stairwell",330,"Stairwell")

-- MAIN GUI
local SG=Instance.new("ScreenGui")
SG.Name="BurmaldaV96"
SG.ResetOnSpawn=false
SG.Parent=LP:WaitForChild("PlayerGui")
local OB=Instance.new("TextButton",SG)
OB.Size=UDim2.new(0,55,0,55)
OB.Position=UDim2.new(0,15,0.5,-27)
OB.BackgroundColor3=Color3.fromRGB(120,20,40)
OB.Text="B"
OB.TextColor3=Color3.fromRGB(255,255,255)
OB.TextSize=22
OB.Font=Enum.Font.GothamBlack
OB.BorderSizePixel=0
OB.Draggable=true
local OBC=Instance.new("UICorner",OB)OBC.CornerRadius=UDim.new(1,0)
local OBS=Instance.new("UIStroke",OB)OBS.Color=Color3.fromRGB(240,240,245)OBS.Thickness=2

local M=Instance.new("Frame",SG)
M.Size=UDim2.new(0,400,0,350)
M.Position=UDim2.new(0.5,-200,0.5,-175)
M.BackgroundColor3=T().bg
M.BorderSizePixel=0
M.Active=true
M.Draggable=true
M.Visible=false
local MC=Instance.new("UICorner",M)MC.CornerRadius=UDim.new(0,10)
local MS=Instance.new("UIStroke",M)MS.Color=T().accent MS.Thickness=2
OB.MouseButton1Click:Connect(function()
    M.Visible=not M.Visible
    OB.Text=M.Visible and "X"or "B"
end)

local H=Instance.new("Frame",M)
H.Size=UDim2.new(1,0,0,34)
H.BackgroundColor3=T().accent
H.BorderSizePixel=0
local HC=Instance.new("UICorner",H)HC.CornerRadius=UDim.new(0,10)
local HT=Instance.new("TextLabel",H)
HT.Size=UDim2.new(1,-40,1,0)
HT.Position=UDim2.new(0,10,0,0)
HT.BackgroundTransparency=1
HT.Text="BURMALDA v9.6 | "..gF()
HT.TextColor3=Color3.fromRGB(255,255,255)
HT.Font=Enum.Font.GothamBold
HT.TextSize=12
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
local CBC=Instance.new("UICorner",CB)CBC.CornerRadius=UDim.new(0,4)
CB.MouseButton1Click:Connect(function()sv()M.Visible=false OB.Text="B"end)

local TB=Instance.new("ScrollingFrame",M)
TB.Size=UDim2.new(0,110,1,-34)
TB.Position=UDim2.new(0,0,0,34)
TB.BackgroundColor3=T().panel
TB.BorderSizePixel=0
TB.ScrollBarThickness=3
TB.ScrollBarImageColor3=T().accent
TB.CanvasSize=UDim2.new(0,0,0,0)
TB.AutomaticCanvasSize=Enum.AutomaticSize.Y
local TBC=Instance.new("UICorner",TB)TBC.CornerRadius=UDim.new(0,10)
local TBL=Instance.new("UIListLayout",TB)TBL.Padding=UDim.new(0,3)TBL.SortOrder=Enum.SortOrder.LayoutOrder

local CT=Instance.new("Frame",M)
CT.Size=UDim2.new(1,-115,1,-42)
CT.Position=UDim2.new(0,112,0,38)
CT.BackgroundTransparency=1

local Pg={}
local function sw(n)for k,p in pairs(Pg)do p.Visible=(k==n)end end
local function crP(n)
    local p=Instance.new("ScrollingFrame",CT)
    p.Size=UDim2.new(1,0,1,0)
    p.BackgroundTransparency=1
    p.BorderSizePixel=0
    p.ScrollBarThickness=3
    p.ScrollBarImageColor3=T().accent
    p.CanvasSize=UDim2.new(0,0,0,0)
    p.AutomaticCanvasSize=Enum.AutomaticSize.Y
    p.Visible=false
    local L=Instance.new("UIListLayout",p)L.Padding=UDim.new(0,3)L.SortOrder=Enum.SortOrder.LayoutOrder
    Pg[n]=p
    return p
end

local tL={
    {n="General"},{n="Exploits",d=true},{n="Bypass"},{n="ESP"},{n="Auto"},
    {n="AutoDoors",d=true},{n="Floors"},{n="Visual"},{n="Settings"},{n="Info"},
}
local tbts={}
for _,t in ipairs(tL)do
    crP(t.n)
    local b=Instance.new("TextButton",TB)
    b.Size=UDim2.new(0.9,0,0,26)
    b.BackgroundColor3=t.d and T().danger or T().panel
    b.BorderSizePixel=0
    b.Text=t.n
    b.TextColor3=t.d and Color3.fromRGB(255,200,210)or T().text
    b.Font=Enum.Font.Gotham
    b.TextSize=10
    b.LayoutOrder=#tbts+1
    b:SetAttribute("d",t.d or false)
    local c=Instance.new("UICorner",b)c.CornerRadius=UDim.new(0,5)
    b.MouseButton1Click:Connect(function()
        sw(t.n)
        for _,x in ipairs(tbts)do x.BackgroundColor3=x:GetAttribute("d")and T().danger or T().panel end
        b.BackgroundColor3=T().accent
    end)
    table.insert(tbts,b)
end
sw("General")
if tbts[1]then tbts[1].BackgroundColor3=T().accent end

local function mT(p,t,i,cb,d)
    local b=Instance.new("TextButton",p)
    b.Size=UDim2.new(1,-6,0,26)
    b.BackgroundColor3=d and T().danger or T().panel
    b.BorderSizePixel=0
    b.Text=""
    local c=Instance.new("UICorner",b)c.CornerRadius=UDim.new(0,5)
    local l=Instance.new("TextLabel",b)
    l.Size=UDim2.new(0.75,0,1,0)
    l.Position=UDim2.new(0,8,0,0)
    l.BackgroundTransparency=1
    l.Text=t
    l.TextColor3=d and Color3.fromRGB(255,200,210)or T().text
    l.Font=Enum.Font.Gotham
    l.TextSize=10
    l.TextXAlignment=Enum.TextXAlignment.Left
    local s=Instance.new("TextLabel",b)
    s.Size=UDim2.new(0.2,0,1,0)
    s.Position=UDim2.new(0.75,0,0,0)
    s.BackgroundTransparency=1
    s.Text=i and "ON"or "OFF"
    s.TextColor3=i and Color3.fromRGB(80,220,120)or Color3.fromRGB(220,80,80)
    s.Font=Enum.Font.GothamBold
    s.TextSize=10
    local st=i
    b.MouseButton1Click:Connect(function()
        st=not st
        s.Text=st and "ON"or "OFF"
        s.TextColor3=st and Color3.fromRGB(80,220,120)or Color3.fromRGB(220,80,80)
        cb(st)
    end)
end
local function mB(p,t,cb,col)
    local b=Instance.new("TextButton",p)
    b.Size=UDim2.new(1,-6,0,26)
    b.BackgroundColor3=col or T().panel
    b.BorderSizePixel=0
    b.Text=t
    b.TextColor3=T().text
  b.Font=Enum.Font.Gotham
    b.TextSize=10
    local c=Instance.new("UICorner",b)c.CornerRadius=UDim.new(0,5)
    b.MouseButton1Click:Connect(cb)
end
local function mS(p,t,mn,mx,i,cb)
    local f=Instance.new("Frame",p)
    f.Size=UDim2.new(1,-6,0,36)
    f.BackgroundColor3=T().panel
    f.BorderSizePixel=0
    local c=Instance.new("UICorner",f)c.CornerRadius=UDim.new(0,5)
    local l=Instance.new("TextLabel",f)
    l.Size=UDim2.new(1,-16,0,14)
    l.Position=UDim2.new(0,8,0,2)
    l.BackgroundTransparency=1
    l.Text=t..": "..i
    l.TextColor3=T().text
    l.Font=Enum.Font.Gotham
    l.TextSize=10
    l.TextXAlignment=Enum.TextXAlignment.Left
    local bar=Instance.new("Frame",f)
    bar.Size=UDim2.new(1,-16,0,8)
    bar.Position=UDim2.new(0,8,0,22)
    bar.BackgroundColor3=T().bg
    bar.BorderSizePixel=0
    local bc=Instance.new("UICorner",bar)bc.CornerRadius=UDim.new(0,4)
    local fl=Instance.new("Frame",bar)
    fl.Size=UDim2.new((i-mn)/(mx-mn),0,1,0)
    fl.BackgroundColor3=T().accent
    fl.BorderSizePixel=0
    local fc=Instance.new("UICorner",fl)fc.CornerRadius=UDim.new(0,4)
    local dr=false
    bar.InputBegan:Connect(function(inp)if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then dr=true end end)
    bar.InputEnded:Connect(function(inp)if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then dr=false end end)
    UIS.InputChanged:Connect(function(inp)
        if dr and(inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch)then
            local r=math.clamp((inp.Position.X-bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1)
            fl.Size=UDim2.new(r,0,1,0)
            local v=math.floor(mn+(mx-mn)*r)
            l.Text=t..": "..v
            cb(v)
        end
    end)
end
local function mL(p,t,col)
    local l=Instance.new("TextLabel",p)
    l.Size=UDim2.new(1,-6,0,20)
    l.BackgroundTransparency=1
    l.Text=t
    l.TextColor3=col or T().accent
    l.Font=Enum.Font.GothamBold
    l.TextSize=11
    l.TextXAlignment=Enum.TextXAlignment.Left
end

mL(Pg["General"],"GENERAL")
mT(Pg["General"],"Speed",C.SpeedEnabled,function(s)C.SpeedEnabled=s end)
mS(Pg["General"],"WalkSpeed",16,60,C.WalkSpeed,function(v)C.WalkSpeed=v end)
mS(Pg["General"],"JumpPower",50,200,C.JumpPower,function(v)C.JumpPower=v end)
mT(Pg["General"],"Fly",C.Fly,function(s)C.Fly=s setFly(s)end)
mS(Pg["General"],"Fly Speed",10,200,C.FlySpeed,function(v)C.FlySpeed=v end)
mT(Pg["General"],"Noclip",C.Noclip,function(s)C.Noclip=s setNC(s)end)
mT(Pg["General"],"Inf Jump",C.InfiniteJump,function(s)C.InfiniteJump=s end)
mT(Pg["General"],"Anti-AFK",C.AntiAFK,function(s)C.AntiAFK=s end)
mT(Pg["General"],"Anti-Cheat Stairway",C.AntiCheatStairway,function(s)C.AntiCheatStairway=s end,true)

mL(Pg["Exploits"],"EXPLOITS",T().danger)
mT(Pg["Exploits"],"[DANGER] God Mode",C.GodMode,function(s)C.GodMode=s end,true)
mT(Pg["Exploits"],"[DANGER] Infinite Revive",C.InfiniteRevive,function(s)C.InfiniteRevive=s end,true)
mT(Pg["Exploits"],"[DANGER] Infinite Items",C.InfiniteItems,function(s)C.InfiniteItems=s end,true)

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
mT(Pg["Bypass"],"Jeff",false,function(s)C.BypassJeff=s end)

mL(Pg["ESP"],"Monsters")
mT(Pg["ESP"],"ALL Monsters",false,function(s)C.ESP_All=s end)
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
mL(Pg["ESP"],"Objects")
mT(Pg["ESP"],"Doors",false,function(s)C.ESP_Doors=s end)
mT(Pg["ESP"],"Closets",false,function(s)C.ESP_Closets=s end)
mT(Pg["ESP"],"Money",false,function(s)C.ESP_Money=s end)
mT(Pg["ESP"],"Keys",false,function(s)C.ESP_Keys=s end)
mT(Pg["ESP"],"Items",false,function(s)C.ESP_Items=s end)
mT(Pg["ESP"],"Ladders",false,function(s)C.ESP_Ladders=s end)

mL(Pg["Auto"],"AUTO")
mT(Pg["Auto"],"Auto-Hide Rush",C.AutoHideRush,function(s)C.AutoHideRush=s end)
mT(Pg["Auto"],"Auto-Hide Ambush",C.AutoHideAmbush,function(s)C.AutoHideAmbush=s end)
mT(Pg["Auto"],"Auto-Hide ALL",C.AutoHideAll,function(s)C.AutoHideAll=s end)
mB(Pg["Auto"],"Hide Now",function()pcall(aH)end)

mL(Pg["AutoDoors"],"AUTO-DOORS",T().danger)
mT(Pg["AutoDoors"],"[B] Auto-Collect",C.AutoCollect,function(s)C.AutoCollect=s end,true)
mT(Pg["AutoDoors"],"[B] Auto-Open Closets",C.AutoOpenClosets,function(s)C.AutoOpenClosets=s end,true)
mT(Pg["AutoDoors"],"[B] Auto-Coins",C.AutoCoins,function(s)C.AutoCoins=s end,true)
mT(Pg["AutoDoors"],"[B] Auto-Door",C.AutoDoor,function(s)C.AutoDoor=s end,true)

mL(Pg["Floors"],"FLOORS")
mL(Pg["Floors"],"Current: "..gF())
mL(Pg["Floors"],"Hotel: Rush, Ambush, Seek, Figure")
mL(Pg["Floors"],"Mines: Grumble, Giggle, Seek")
mL(Pg["Floors"],"Backdoor: Halt, Blitz, Lookman")
mL(Pg["Floors"],"Outdoors: Gloombat, Snare, Eyes")
mL(Pg["Floors"],"Archives: Noise, Creak, Scribbles")
mL(Pg["Floors"],"Stairwell: Seek, Figure")

mL(Pg["Visual"],"Colors")
mB(Pg["Visual"],"Bordeaux",function()C.ESPColor=Color3.fromRGB(180,30,30)clearESP()end,T().danger)
mB(Pg["Visual"],"Red",function()C.ESPColor=Color3.fromRGB(255,50,50)clearESP()end,T().accent)
mB(Pg["Visual"],"Green",function()C.ESPColor=Color3.fromRGB(50,255,50)clearESP()end,T().accent)
mB(Pg["Visual"],"Blue",function()C.ESPColor=Color3.fromRGB(50,150,255)clearESP()end,T().accent)
mT(Pg["Visual"],"Rainbow",C.RainbowMode,function(s)C.RainbowMode=s end)
mT(Pg["Visual"],"X-Ray",C.XRay,function(s)C.XRay=s end)
mT(Pg["Visual"],"Show Distance",C.ShowDistance,function(s)C.ShowDistance=s end)
mS(Pg["Visual"],"Max Distance",50,1500,500,function(v)C.MaxDistance=v end)
mB(Pg["Visual"],"Clear ESP",function()clearESP() N("Cleared")end)

mL(Pg["Settings"],"SETTINGS")
mL(Pg["Settings"],"Theme")
for name,_ in pairs(Th)do
    mB(Pg["Settings"],name,function()
        C.Theme=name
        local t=T()
        M.BackgroundColor3=t.bg
        H.BackgroundColor3=t.accent
        TB.BackgroundColor3=t.panel
        MS.Color=t.accent
        for _,b in ipairs(tbts)do
            b.BackgroundColor3=b:GetAttribute("d")and t.danger or t.panel
            b.TextColor3=t.text
        end
        sv()
    end,T().accent)
end
mL(Pg["Settings"],"Overlay")
mT(Pg["Settings"],"Create Overlay",C.OverlayEnabled,function(s)C.OverlayEnabled=s end)
mT(Pg["Settings"],"Overlay: Ladders",C.OverlayLadders,function(s)C.OverlayLadders=s end)
mT(Pg["Settings"],"Overlay: Monsters",C.OverlayMonsters,function(s)C.OverlayMonsters=s end)
mT(Pg["Settings"],"Overlay: Money",C.OverlayMoney,function(s)C.OverlayMoney=s end)
mT(Pg["Settings"],"Overlay: Items",C.OverlayItems,function(s)C.OverlayItems=s end)
mT(Pg["Settings"],"Overlay: FPS+Ping",C.OverlayFPS,function(s)C.OverlayFPS=s end)
mS(Pg["Settings"],"Overlay Transparency",0,10,3,function(v)C.OverlayTransparency=v/10 end)
mB(Pg["Settings"],"Reset Overlay Pos",function()C.OverlayX=10 C.OverlayY=150 sv() N("Reset")end)
mL(Pg["Settings"],"System")
mT(Pg["Settings"],"Auto Save",C.AutoSave,function(s)C.AutoSave=s end)
mB(Pg["Settings"],"Save",function()sv() N("Saved")end,T().accent)
mB(Pg["Settings"],"Load",function()ld() N("Loaded")end)
mB(Pg["Settings"],"Reset",function()pcall(function()if isfile and isfile(CFG)then delfile(CFG)end end) N("OK")end,T().danger)

mL(Pg["Info"],"INFO")
mL(Pg["Info"],"Script: Burmalda v9.6")
mL(Pg["Info"],"Creator: KOTENOK7204")
mL(Pg["Info"],"Player: "..LP.Name)
mL(Pg["Info"],"Floor: "..gF())
mL(Pg["Info"],"Players: "..#P:GetPlayers())
mL(Pg["Info"],"Ping: "..math.floor(LP:GetNetworkPing()*1000).."ms")

N("Burmalda v9.6 loaded! By KOTENOK7204")
sv()
