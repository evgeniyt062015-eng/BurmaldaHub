-- BURMALDA v13 | Part 6/8 — VISUAL + MUSIC + SOUND + MOVE + STATS
-- FOV, Crosshair, Tracker, Wallhack, Chams, Music Player

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local UIS=_G.UIS
local SS=_G.SS
local Lighting=_G.Lighting
local P=_G.P

-- ═══ FOV ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.FOV~=70 then workspace.CurrentCamera.FieldOfView=C.FOV end
    end
end)

-- ═══ THIRD PERSON ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.ThirdPerson then
            LP.CameraMode=Enum.CameraMode.Classic
        else
            LP.CameraMode=Enum.CameraMode.LockFirstPerson
        end
    end
end)

-- ═══ NO FOG / LIGHT ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.NoFog then Lighting.FogEnd=1e5 end
        if C.LightBrightness~=2 then Lighting.Brightness=C.LightBrightness end
    end
end)

-- ═══ WALLHACK ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.Wallhack then
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("BasePart") and not o:FindFirstChild("WhHl") then
                    local h=Instance.new("SelectionBox",o)
                    h.Name="WhHl"
                    h.Adornee=o
                    h.Color3=Color3.fromRGB(255,255,255)
                    h.LineThickness=0.02
                end
            end
        end
    end
end)

-- ═══ CHAMS ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.Chams then
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("BasePart") and not o:FindFirstChild("ChHl") then
                    local h=Instance.new("Highlight",o)
                    h.Name="ChHl"
                    h.FillColor=Color3.fromRGB(255,0,0)
                    h.FillTransparency=0.5
                    h.Adornee=o
                end
            end
        end
    end
end)

-- ═══ INVISIBLE ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.Invisible then
            local ch=LP.Character
            if ch then
                for _,p in ipairs(ch:GetDescendants()) do
                    if p:IsA("BasePart") then p.Transparency=1 end
                    if p:IsA("Decal") then p.Transparency=1 end
                end
            end
        end
    end
end)

-- ═══ FUN RAINBOW (персонаж) ═══
task.spawn(function()
    while task.wait(0.1) do
        if C.FunRainbow then
            local ch=LP.Character
            if ch then
                for _,p in ipairs(ch:GetDescendants()) do
                    if p:IsA("BasePart") then p.Color=Color3.fromHSV(tick()%5/5,1,1) end
                end
            end
        end
    end
end)

-- ═══ CROSSHAIR ═══
local crossGui=Instance.new("ScreenGui")
crossGui.Name="BCross"
crossGui.ResetOnSpawn=false
crossGui.Parent=LP:WaitForChild("PlayerGui")

local ch1=Instance.new("Frame",crossGui)
ch1.Size=UDim2.new(0,2,0,20)
ch1.Position=UDim2.new(0.5,-1,0.5,-30)
ch1.BackgroundColor3=C.CrosshairColor
ch1.BorderSizePixel=0
ch1.Visible=false

local ch2=Instance.new("Frame",crossGui)
ch2.Size=UDim2.new(0,2,0,20)
ch2.Position=UDim2.new(0.5,-1,0.5,10)
ch2.BackgroundColor3=C.CrosshairColor
ch2.BorderSizePixel=0
ch2.Visible=false

local ch3=Instance.new("Frame",crossGui)
ch3.Size=UDim2.new(0,20,0,2)
ch3.Position=UDim2.new(0.5,-30,0.5,-1)
ch3.BackgroundColor3=C.CrosshairColor
ch3.BorderSizePixel=0
ch3.Visible=false

local ch4=Instance.new("Frame",crossGui)
ch4.Size=UDim2.new(0,20,0,2)
ch4.Position=UDim2.new(0.5,10,0.5,-1)
ch4.BackgroundColor3=C.CrosshairColor
ch4.BorderSizePixel=0
ch4.Visible=false

task.spawn(function()
    while task.wait(0.3) do
        local v=C.Crosshair
        ch1.Visible=v; ch2.Visible=v; ch3.Visible=v; ch4.Visible=v
        ch1.BackgroundColor3=C.CrosshairColor
        ch2.BackgroundColor3=C.CrosshairColor
        ch3.BackgroundColor3=C.CrosshairColor
        ch4.BackgroundColor3=C.CrosshairColor
    end
end)

-- ═══ MUSIC PLAYER ═══
local musicSound=nil
_G.playMusic=function(id)
    if musicSound then musicSound:Destroy() end
    if id=="" or not id then N("No ID"); return end
    musicSound=Instance.new("Sound",SS)
    musicSound.SoundId="rbxassetid://"..id
    musicSound.Volume=C.MusicVolume
    musicSound.Looped=true
    musicSound:Play()
    C.MusicId=id
    C.MusicPlaying=true
end

_G.stopMusic=function()
    if musicSound then musicSound:Stop(); musicSound:Destroy() end
    musicSound=nil
    C.MusicPlaying=false
end

-- ═══ SOUND WARNINGS ═══
task.spawn(function()
    while task.wait(1) do
        if C.RushWarning then
            for _,o in ipairs(workspace:GetDescendants()) do
                if o.Name:lower():find("rush") and o:IsA("Model") then
                    pcall(function()
                        local s=Instance.new("Sound",SS)
                        s.SoundId="rbxassetid://8784885431"
                        s.Volume=1
                        s:Play()
                        task.delay(2,function() s:Destroy() end)
                    end)
                    break
                end
            end
        end
    end
end)

-- ═══ MOVE: SAVE / TP TO SAVE ═══
local savedPos=nil

_G.savePos=function()
    local ch=LP.Character
    if ch and ch:FindFirstChild("HumanoidRootPart") then
        savedPos=ch.HumanoidRootPart.CFrame
        N("Position saved")
    end
end

_G.tpToSave=function()
    if not savedPos then N("No saved position"); return end
    local ch=LP.Character
    if ch and ch:FindFirstChild("HumanoidRootPart") then
        ch.HumanoidRootPart.CFrame=savedPos
        N("TP to saved")
    end
end

-- ═══ SPECTATE PLAYER ═══
_G.spectatePlayer=function(t)
    local tg=t.Character
    if not tg then return end
    local h=tg:FindFirstChildWhichIsA("Humanoid")
    if h then workspace.CurrentCamera.CameraSubject=h end
end

-- ═══ FOLLOW PLAYER ═══
local followTarget=nil
local followConn=nil

_G.setFollow=function(plr)
    if followConn then followConn:Disconnect(); followConn=nil end
    followTarget=plr
    if not plr then return end
    followConn=Run.Heartbeat:Connect(function()
        if not followTarget then return end
        local myCh=LP.Character
        local tg=followTarget.Character
        if myCh and tg then
            local myRoot=myCh:FindFirstChild("HumanoidRootPart")
            local tgRoot=tg:FindFirstChild("HumanoidRootPart")
            if myRoot and tgRoot then
                myRoot.CFrame=CFrame.new(tgRoot.Position+Vector3.new(0,3,0))
            end
        end
    end)
end

-- ═══ STATS: SPEEDRUN TIMER ═══
task.spawn(function()
    while task.wait(1) do
        if C.ShowTimer then
            C.SpeedrunTimer=C.SpeedrunTimer+1
        end
    end
end)

-- ═══ CHAT SPAM ═══
_G.chatSpam=function(msg,count)
    pcall(function()
        local RS=_G.RS
        local Folder=RS:FindFirstChild("DefaultChatSystemEvents") or Instance.new("Folder")
        local Event=Folder:FindFirstChild("SayMessageRequest") or Instance.new("RemoteEvent")
        for i=1,(count or 5) do
            Event:FireServer(msg or "Burmalda on top!","All")
        end
    end)
end

-- ═══ DUCKS ═══
_G.spawnDucks=function(count)
    for i=1,count do
        task.spawn(function()
            local duck=Instance.new("Part",workspace)
            duck.Size=Vector3.new(2,2,2)
            duck.Shape=Enum.PartType.Ball
            duck.Color=Color3.fromRGB(255,255,0)
            duck.Material=Enum.Material.Plastic
            duck.CanCollide=true
            duck.Position=Vector3.new(math.random(-200,200),200+math.random(0,100),math.random(-200,200))
            local s=Instance.new("Sound",duck)
            s.SoundId="rbxassetid://9041358218"
            s.Volume=1
            s:Play()
            game:GetService("Debris"):AddItem(duck,10)
        end)
    end
end

task.spawn(function()
    while task.wait(1) do
        if C.DuckSpawn then pcall(function() _G.spawnDucks(10) end) end
    end
end)

-- ═══ ENTITY TRACKER (радар) ═══
local trackerGui=Instance.new("ScreenGui")
trackerGui.Name="EntityTracker"
trackerGui.ResetOnSpawn=false
trackerGui.Parent=LP:WaitForChild("PlayerGui")

local trackerFrame=Instance.new("Frame",trackerGui)
trackerFrame.Size=UDim2.new(0,140,0,140)
trackerFrame.Position=UDim2.new(1,-160,0,100)
trackerFrame.BackgroundColor3=Color3.fromRGB(20,20,25)
trackerFrame.BackgroundTransparency=0.4
trackerFrame.BorderSizePixel=0
trackerFrame.Visible=false

local tfc=Instance.new("UICorner",trackerFrame)
tfc.CornerRadius=UDim.new(1,0)

local tfs=Instance.new("UIStroke",trackerFrame)
tfs.Color=Color3.fromRGB(120,20,40)
tfs.Thickness=2

local tTitle=Instance.new("TextLabel",trackerFrame)
tTitle.Size=UDim2.new(1,0,0,16)
tTitle.BackgroundTransparency=1
tTitle.Text="RADAR"
tTitle.TextColor3=Color3.fromRGB(120,20,40)
tTitle.Font=Enum.Font.GothamBold
tTitle.TextSize=10

task.spawn(function()
    while task.wait(0.3) do
        if C.EntityTracker then
            trackerFrame.Visible=true
            for _,c in ipairs(trackerFrame:GetChildren()) do
                if c:IsA("Frame") and c.Name=="Dot" then c:Destroy() end
            end
            local ch=LP.Character
            local root=ch and ch:FindFirstChild("HumanoidRootPart")
            if root then
                local pos=root.Position
                for _,o in ipairs(workspace:GetDescendants()) do
                    local ok,_,ne=_G.isE(o)
                    if ok then
                        local op=o:IsA("BasePart") and o.Position or (o.PrimaryPart and o.PrimaryPart.Position)
                        if op then
                            local d=(op-pos).Magnitude
                            if d<150 then
                                local dot=Instance.new("Frame",trackerFrame)
                                dot.Name="Dot"
                                dot.Size=UDim2.new(0,8,0,8)
                                local rx=math.clamp((op.X-pos.X)/150*0.5+0.5,0,1)
                                local rz=math.clamp((op.Z-pos.Z)/150*0.5+0.5,0,1)
                                dot.Position=UDim2.new(rx,-4,rz,-4)
                                dot.BackgroundColor3=C.ESPColor
                                dot.BorderSizePixel=0
                                local dc=Instance.new("UICorner",dot)
                                dc.CornerRadius=UDim.new(1,0)
                            end
                        end
                    end
                end
            end
        else
            trackerFrame.Visible=false
        end
    end
end)

print("[Burmalda v13] Part 6/8 — VISUAL + MUSIC + SOUND + MOVE + STATS loaded")
