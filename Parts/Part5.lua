-- BURMALDA v15 | Part 5/14 — VISUAL
-- FOV, Chams, Wallhack, Crosshair, Ambient, Camera, Tracker — с полным выключением

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local UIS=_G.UIS
local Lighting=_G.Lighting
local P=_G.P

-- ═══ FOV (каждый кадр) ═══
task.spawn(function()
    while task.wait(0.1) do
        local cam=workspace.CurrentCamera
        if cam then
            local target=C.FOV
            if C.CustomFOV and C.CustomFOV>0 then target=C.CustomFOV end
            if target~=cam.FieldOfView then cam.FieldOfView=target end
        end
    end
end)

-- ═══ THIRD PERSON + OFFSET ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.ThirdPerson then
            LP.CameraMode=Enum.CameraMode.Classic
            local cam=workspace.CurrentCamera
            if cam then
                cam.CFrame=cam.CFrame*CFrame.new(C.XOffset,C.YOffset,0)
            end
        else
            LP.CameraMode=Enum.CameraMode.LockFirstPerson
        end
    end
end)

-- ═══ NO FOG + LIGHT + AMBIENT ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.NoFog then
            Lighting.FogEnd=1e5
            for _,o in ipairs(Lighting:GetChildren()) do
                if o:IsA("Atmosphere") then
                    o.Density=0
                end
            end
        end
        if C.LightBrightness~=2 then Lighting.Brightness=C.LightBrightness end
        if C.AmbientColor then Lighting.Ambient=C.AmbientColor end
    end
end)

-- ═══ REMOVE CAMERA SHAKE / BOBBING / CUTSCENES ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.RemoveCameraShake or C.RemoveCameraBobbing or C.RemoveCutscenes then
            local ch=LP.Character
            if ch then
                for _,o in ipairs(ch:GetDescendants()) do
                    if o:IsA("NumberValue") then
                        local n=o.Name:lower()
                        if C.RemoveCameraShake and n:find("shake") then o.Value=0 end
                        if C.RemoveCameraBobbing and n:find("bobb") then o.Value=0 end
                    end
                end
            end
            if C.RemoveCutscenes then
                pcall(function()
                    local pg=LP:FindFirstChild("PlayerGui")
                    if pg then
                        local cam=workspace.CurrentCamera
                        if cam then cam.CameraType=Enum.CameraType.Custom end
                    end
                end)
            end
        end
    end
end)

-- ═══ WALLHACK (с полным выключением) ═══
local WallConn
_G.setWallhack=function(on)
    if WallConn then WallConn:Disconnect(); WallConn=nil end
    if not on then
        for _,o in ipairs(workspace:GetDescendants()) do
            local h=o:FindFirstChild("WhHl")
            if h then h:Destroy() end
        end
        return
    end
    WallConn=Run.Heartbeat:Connect(function()
        if not C.Wallhack then
            for _,o in ipairs(workspace:GetDescendants()) do
                local h=o:FindFirstChild("WhHl")
                if h then h:Destroy() end
            end
            return
        end
        for _,o in ipairs(workspace:GetDescendants()) do
            if o:IsA("Model") and not o:FindFirstChild("WhHl") then
                local hasHum=o:FindFirstChildOfClass("Humanoid")
                local n=o.Name:lower()
                local isEnt=n:find("rush") or n:find("ambush") or n:find("seek")
                    or n:find("figure") or n:find("screech") or n:find("halt")
                    or n:find("grumble") or n:find("giggle") or n:find("blitz")
                if hasHum or isEnt or P:GetPlayerFromCharacter(o) then
                    local h=Instance.new("SelectionBox",o)
                    h.Name="WhHl"
                    h.Adornee=o
                    h.Color3=Color3.fromRGB(255,255,255)
                    h.LineThickness=0.03
                end
            end
        end
    end)
end

-- ═══ CHAMS (с полным выключением) ═══
local ChamsConn
_G.setChams=function(on)
    if ChamsConn then ChamsConn:Disconnect(); ChamsConn=nil end
    if not on then
        for _,o in ipairs(workspace:GetDescendants()) do
            local h=o:FindFirstChild("ChHl")
            if h then h:Destroy() end
        end
        return
    end
    ChamsConn=Run.Heartbeat:Connect(function()
        if not C.Chams then
            for _,o in ipairs(workspace:GetDescendants()) do
                local h=o:FindFirstChild("ChHl")
                if h then h:Destroy() end
            end
            return
        end
        for _,o in ipairs(workspace:GetDescendants()) do
            if o:IsA("Model") and not o:FindFirstChild("ChHl") then
                local hasHum=o:FindFirstChildOfClass("Humanoid")
                local n=o.Name:lower()
                local isEnt=n:find("rush") or n:find("ambush") or n:find("seek")
                    or n:find("figure") or n:find("screech") or n:find("halt")
                    or n:find("grumble") or n:find("giggle") or n:find("blitz")
                if hasHum or isEnt or P:GetPlayerFromCharacter(o) then
                    local h=Instance.new("Highlight",o)
                    h.Name="ChHl"
                    h.FillColor=C.ChamsColor
                    h.FillTransparency=0.5
                    h.OutlineColor=C.ChamsColor
                    h.OutlineTransparency=0.3
                    h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
                end
            end
        end
    end)
end

-- ═══ CROSSHAIR ═══
local crossGui=Instance.new("ScreenGui")
crossGui.Name="BurmaldaCross"
crossGui.ResetOnSpawn=false
crossGui.DisplayOrder=100
crossGui.Parent=LP:WaitForChild("PlayerGui")

local ch1=Instance.new("Frame",crossGui)
ch1.Size=UDim2.new(0,2,0,C.CrosshairSize)
ch1.Position=UDim2.new(0.5,-1,0.5,-C.CrosshairSize-10)
ch1.BackgroundColor3=C.CrosshairColor
ch1.BorderSizePixel=0
ch1.Visible=false
ch1.Name="ChTop"

local ch2=Instance.new("Frame",crossGui)
ch2.Size=UDim2.new(0,2,0,C.CrosshairSize)
ch2.Position=UDim2.new(0.5,-1,0.5,10)
ch2.BackgroundColor3=C.CrosshairColor
ch2.BorderSizePixel=0
ch2.Visible=false
ch2.Name="ChBottom"

local ch3=Instance.new("Frame",crossGui)
ch3.Size=UDim2.new(0,C.CrosshairSize,0,2)
ch3.Position=UDim2.new(0.5,-C.CrosshairSize-10,0.5,-1)
ch3.BackgroundColor3=C.CrosshairColor
ch3.BorderSizePixel=0
ch3.Visible=false
ch3.Name="ChLeft"

local ch4=Instance.new("Frame",crossGui)
ch4.Size=UDim2.new(0,C.CrosshairSize,0,2)
ch4.Position=UDim2.new(0.5,10,0.5,-1)
ch4.BackgroundColor3=C.CrosshairColor
ch4.BorderSizePixel=0
ch4.Visible=false
ch4.Name="ChRight"

task.spawn(function()
    while task.wait(0.2) do
        local v=C.Crosshair
        ch1.Visible=v; ch2.Visible=v; ch3.Visible=v; ch4.Visible=v
        local size=C.CrosshairSize
        ch1.Size=UDim2.new(0,2,0,size)
        ch1.Position=UDim2.new(0.5,-1,0.5,-size-10)
        ch2.Size=UDim2.new(0,2,0,size)
        ch2.Position=UDim2.new(0.5,-1,0.5,10)
        ch3.Size=UDim2.new(0,size,0,2)
        ch3.Position=UDim2.new(0.5,-size-10,0.5,-1)
        ch4.Size=UDim2.new(0,size,0,2)
        ch4.Position=UDim2.new(0.5,10,0.5,-1)
        ch1.BackgroundColor3=C.CrosshairColor
        ch2.BackgroundColor3=C.CrosshairColor
        ch3.BackgroundColor3=C.CrosshairColor
        ch4.BackgroundColor3=C.CrosshairColor
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

-- ═══ FUN RAINBOW ═══
task.spawn(function()
    while task.wait(0.1) do
        if C.FunRainbow then
            local ch=LP.Character
            if ch then
                for _,p in ipairs(ch:GetDescendants()) do
                    if p:IsA("BasePart") then
                        p.Color=Color3.fromHSV(tick()%5/5,1,1)
                    end
                end
            end
        end
    end
end)

-- ═══ ENTITY TRACKER (радар) ═══
local trackerGui=Instance.new("ScreenGui")
trackerGui.Name="BurmaldaTracker"
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
tTitle.TextColor3=Color3.fromRGB(180,30,30)
tTitle.Font=Enum.Font.GothamBold
tTitle.TextSize=10

task.spawn(function()
    while task.wait(0.5) do
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
                    if o:IsA("Model") then
                        local n=o.Name:lower()
                        local isEnt=n:find("rush") or n:find("ambush") or n:find("seek")
                            or n:find("figure") or n:find("screech") or n:find("halt")
                            or n:find("grumble") or n:find("giggle") or n:find("blitz")
                        if isEnt then
                            local op=o.PrimaryPart and o.PrimaryPart.Position
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
            end
        else
            trackerFrame.Visible=false
        end
    end
end)

-- ═══ HITMARKER ═══
local hitGui=Instance.new("ScreenGui")
hitGui.Name="BurmaldaHit"
hitGui.ResetOnSpawn=false
hitGui.Parent=LP:WaitForChild("PlayerGui")

local hitLabel=Instance.new("TextLabel",hitGui)
hitLabel.Size=UDim2.new(0,60,0,60)
hitLabel.Position=UDim2.new(0.5,-30,0.5,-30)
hitLabel.BackgroundTransparency=1
hitLabel.Text="✕"
hitLabel.TextColor3=Color3.fromRGB(255,0,0)
hitLabel.TextSize=48
hitLabel.Font=Enum.Font.GothamBold
hitLabel.Visible=false

_G.showHitmarker=function()
    if not C.Hitmarker then return end
    hitLabel.Visible=true
    hitLabel.TextTransparency=0
    game:GetService("TweenService"):Create(hitLabel,TweenInfo.new(0.5),{TextTransparency=1}):Play()
    task.delay(0.5,function() hitLabel.Visible=false end)
end

-- ═══ DAMAGE NUMBERS ═══
local dmgFolder=Instance.new("Folder",workspace)
dmgFolder.Name="BurmaldaDmg"

_G.showDamage=function(position, amount)
    if not C.DamageNumbers then return end
    local bb=Instance.new("BillboardGui")
    bb.Size=UDim2.new(0,100,0,30)
    bb.StudsOffset=Vector3.new(0,3,0)
    bb.AlwaysOnTop=true
    bb.Parent=dmgFolder
    
    local lbl=Instance.new("TextLabel",bb)
    lbl.Size=UDim2.new(1,0,1,0)
    lbl.BackgroundTransparency=1
    lbl.Text=tostring(amount)
    lbl.TextColor3=Color3.fromRGB(255,50,50)
    lbl.TextStrokeTransparency=0
    lbl.Font=Enum.Font.GothamBold
    lbl.TextSize=18
    
    local part=Instance.new("Part",dmgFolder)
    part.Size=Vector3.new(0.1,0.1,0.1)
    part.Position=position
    part.Anchored=true
    part.Transparency=1
    part.CanCollide=false
    bb.Adornee=part
    
    game:GetService("TweenService"):Create(part,TweenInfo.new(1),{Position=position+Vector3.new(0,3,0)}):Play()
    game:GetService("Debris"):AddItem(part,1.2)
    task.delay(1,function() bb:Destroy() end)
end

-- ═══ DANGER METER ═══
local dangerGui=Instance.new("ScreenGui")
dangerGui.Name="BurmaldaDanger"
dangerGui.ResetOnSpawn=false
dangerGui.Parent=LP:WaitForChild("PlayerGui")

local dangerBar=Instance.new("Frame",dangerGui)
dangerBar.Size=UDim2.new(0,200,0,8)
dangerBar.Position=UDim2.new(0.5,-100,0,40)
dangerBar.BackgroundColor3=Color3.fromRGB(40,40,45)
dangerBar.BorderSizePixel=0
dangerBar.Visible=false

local dbc=Instance.new("UICorner",dangerBar)
dbc.CornerRadius=UDim.new(1,0)

local dangerFill=Instance.new("Frame",dangerBar)
dangerFill.Size=UDim2.new(0,0,1,0)
dangerFill.BackgroundColor3=Color3.fromRGB(255,0,0)
dangerFill.BorderSizePixel=0

local dfc=Instance.new("UICorner",dangerFill)
dfc.CornerRadius=UDim.new(1,0)

task.spawn(function()
    while task.wait(0.3) do
        if C.DangerMeter then
            dangerBar.Visible=true
            local ch=LP.Character
            local root=ch and ch:FindFirstChild("HumanoidRootPart")
            if root then
                local closest=math.huge
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") then
                        local n=o.Name:lower()
                        if n:find("rush") or n:find("ambush") or n:find("seek") or n:find("figure") then
                            local p=o.PrimaryPart and o.PrimaryPart.Position
                            if p then
                                local d=(p-root.Position).Magnitude
                                if d<closest then closest=d end
                            end
                        end
                    end
                end
                local danger=math.clamp(1-(closest/150),0,1)
                dangerFill.Size=UDim2.new(danger,0,1,0)
                if danger>0.7 then
                    dangerFill.BackgroundColor3=Color3.fromRGB(255,0,0)
                elseif danger>0.4 then
                    dangerFill.BackgroundColor3=Color3.fromRGB(255,150,0)
                else
                    dangerFill.BackgroundColor3=Color3.fromRGB(0,255,100)
                end
            end
        else
            dangerBar.Visible=false
        end
    end
end)

-- ═══ SHOW PATH (Seek) ═══
local pathFolder=Instance.new("Folder",workspace)
pathFolder.Name="BurmaldaPath"

task.spawn(function()
    while task.wait(0.5) do
        if C.ShowSeekPath then
            for _,o in ipairs(pathFolder:GetChildren()) do o:Destroy() end
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Model") and o.Name:lower()=="seek" then
                    local p=o.PrimaryPart
                    if p then
                        local marker=Instance.new("Part",pathFolder)
                        marker.Size=Vector3.new(2,2,2)
                        marker.Shape=Enum.PartType.Ball
                        marker.Position=p.Position
                        marker.Anchored=true
                        marker.CanCollide=false
                        marker.Color=Color3.fromRGB(0,255,0)
                        marker.Material=Enum.Material.Neon
                        marker.Transparency=0.5
                        game:GetService("Debris"):AddItem(marker,0.6)
                    end
                end
            end
        end
    end
end)

print("[Burmalda v15] Part 5/14 — VISUAL loaded")
