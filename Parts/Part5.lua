-- BURMALDA v15.1 | Part 5/14 — VISUAL
-- Фиксы: No Fog (сохранение оригинала), Chams (правильный Highlight),
-- Crosshair (центр), Tracker (очистка), Hitmarker, Danger Meter

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local UIS=_G.UIS
local Lighting=_G.Lighting
local P=_G.P

-- ═══════════════════════════════════════════════
-- FOV (каждый кадр)
-- ═══════════════════════════════════════════════
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

-- ═══════════════════════════════════════════════
-- THIRD PERSON
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(0.3) do
        if C.ThirdPerson then
            if LP.CameraMode~=Enum.CameraMode.Classic then
                LP.CameraMode=Enum.CameraMode.Classic
            end
        else
            if LP.CameraMode~=Enum.CameraMode.LockFirstPerson then
                LP.CameraMode=Enum.CameraMode.LockFirstPerson
            end
        end
    end
end)

-- ═══════════════════════════════════════════════
-- NO FOG (FIX: сохраняем оригинал)
-- ═══════════════════════════════════════════════
local origFogEnd=Lighting.FogEnd
local origFogStart=Lighting.FogStart
local origAmbient=Lighting.Ambient
local origBrightness=Lighting.Brightness
local origAtmosphereDensity={}

-- Сохраняем плотность всех атмосфер
for _,o in ipairs(Lighting:GetChildren()) do
    if o:IsA("Atmosphere") then
        table.insert(origAtmosphereDensity,{obj=o,density=o.Density})
    end
end

task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if C.NoFog then
                Lighting.FogEnd=100000
                Lighting.FogStart=100000
                for _,o in ipairs(Lighting:GetChildren()) do
                    if o:IsA("Atmosphere") then o.Density=0 end
                end
            else
                Lighting.FogEnd=origFogEnd
                Lighting.FogStart=origFogStart
                for _,entry in ipairs(origAtmosphereDensity) do
                    if entry.obj and entry.obj.Parent then
                        entry.obj.Density=entry.density
                    end
                end
            end
            
            -- Ambient
            if C.AmbientColor then
                Lighting.Ambient=C.AmbientColor
            else
                Lighting.Ambient=origAmbient
            end
            
            -- Fullbright
            if C.Fullbright then
                Lighting.Brightness=3
                Lighting.ClockTime=14
                Lighting.OutdoorAmbient=Color3.fromRGB(200,200,200)
            else
                Lighting.Brightness=origBrightness
            end
        end)
    end
end)

-- ═══════════════════════════════════════════════
-- REMOVE CAMERA SHAKE / BOBBING / CUTSCENES
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local ch=LP.Character
            if ch then
                for _,o in ipairs(ch:GetDescendants()) do
                    if o:IsA("NumberValue") then
                        local n=string.lower(o.Name)
                        if C.RemoveCameraShake and string.find(n,"shake",1,true) then o.Value=0 end
                        if C.RemoveCameraBobbing and string.find(n,"bobb",1,true) then o.Value=0 end
                    end
                end
            end
            if C.RemoveCutscenes then
                local cam=workspace.CurrentCamera
                if cam and cam.CameraType~=Enum.CameraType.Custom then
                    cam.CameraType=Enum.CameraType.Custom
                end
            end
        end)
    end
end)

-- ═══════════════════════════════════════════════
-- WALLHACK (FIX: не дублировать)
-- ═══════════════════════════════════════════════
local WallConn
_G.setWallhack=function(on)
    if WallConn then WallConn:Disconnect(); WallConn=nil end
    -- Всегда удаляем старое
    pcall(function()
        for _,o in ipairs(workspace:GetDescendants()) do
            local h=o:FindFirstChild("WhHl")
            if h then h:Destroy() end
        end
    end)
    if not on then return end
    WallConn=Run.Heartbeat:Connect(function()
        if not C.Wallhack then return end
        pcall(function()
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Model") and not o:FindFirstChild("WhHl") then
                    local hasHum=o:FindFirstChildOfClass("Humanoid")
                    local n=string.lower(o.Name)
                    local isEnt=string.find(n,"rush",1,true) or string.find(n,"ambush",1,true)
                        or string.find(n,"seek",1,true) or string.find(n,"figure",1,true)
                        or string.find(n,"screech",1,true) or string.find(n,"halt",1,true)
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
    end)
end

-- ═══════════════════════════════════════════════
-- CHAMS (FIX: правильный Highlight)
-- ═══════════════════════════════════════════════
local ChamsConn
_G.setChams=function(on)
    if ChamsConn then ChamsConn:Disconnect(); ChamsConn=nil end
    -- Всегда удаляем старое
    pcall(function()
        for _,o in ipairs(workspace:GetDescendants()) do
            local h=o:FindFirstChild("ChHl")
            if h then h:Destroy() end
        end
    end)
    if not on then return end
    ChamsConn=Run.Heartbeat:Connect(function()
        if not C.Chams then return end
        pcall(function()
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Model") and not o:FindFirstChild("ChHl") then
                    local hasHum=o:FindFirstChildOfClass("Humanoid")
                    local n=string.lower(o.Name)
                    local isEnt=string.find(n,"rush",1,true) or string.find(n,"ambush",1,true)
                        or string.find(n,"seek",1,true) or string.find(n,"figure",1,true)
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
    end)
end

-- ═══════════════════════════════════════════════
-- CROSSHAIR (FIX: центр через AnchorPoint)
-- ═══════════════════════════════════════════════
local crossGui=Instance.new("ScreenGui")
crossGui.Name="BurmaldaCross"
crossGui.ResetOnSpawn=false
crossGui.DisplayOrder=100
crossGui.IgnoreGuiInset=true
crossGui.Parent=LP:WaitForChild("PlayerGui")

local function makeCrossFrame(name)
    local f=Instance.new("Frame",crossGui)
    f.Name=name
    f.BackgroundColor3=C.CrosshairColor
    f.BorderSizePixel=0
    f.Visible=false
    return f
end

local chTop=makeCrossFrame("Top")
local chBottom=makeCrossFrame("Bottom")
local chLeft=makeCrossFrame("Left")
local chRight=makeCrossFrame("Right")
local chCenter=makeCrossFrame("Center")

-- Обновление позиции Crosshair
task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            local v=C.Crosshair
            chTop.Visible=v; chBottom.Visible=v; chLeft.Visible=v; chRight.Visible=v
            chCenter.Visible=v and C.CrosshairStyle=="dot"
            
            local size=C.CrosshairSize or 20
            local col=C.CrosshairColor or Color3.fromRGB(255,0,0)
            local gap=8
            
            -- TOP (AnchorPoint: центр-низ)
            chTop.AnchorPoint=Vector2.new(0.5,1)
            chTop.Size=UDim2.new(0,2,0,size)
            chTop.Position=UDim2.new(0.5,0,0.5,-gap)
            chTop.BackgroundColor3=col
            
            -- BOTTOM (AnchorPoint: центр-верх)
            chBottom.AnchorPoint=Vector2.new(0.5,0)
            chBottom.Size=UDim2.new(0,2,0,size)
            chBottom.Position=UDim2.new(0.5,0,0.5,gap)
            chBottom.BackgroundColor3=col
            
            -- LEFT (AnchorPoint: право-центр)
            chLeft.AnchorPoint=Vector2.new(1,0.5)
            chLeft.Size=UDim2.new(0,size,0,2)
            chLeft.Position=UDim2.new(0.5,-gap,0.5,0)
            chLeft.BackgroundColor3=col
            
            -- RIGHT (AnchorPoint: лево-центр)
            chRight.AnchorPoint=Vector2.new(0,0.5)
            chRight.Size=UDim2.new(0,size,0,2)
            chRight.Position=UDim2.new(0.5,gap,0.5,0)
            chRight.BackgroundColor3=col
            
            -- CENTER (dot)
            chCenter.AnchorPoint=Vector2.new(0.5,0.5)
            chCenter.Size=UDim2.new(0,4,0,4)
            chCenter.Position=UDim2.new(0.5,0,0.5,0)
            chCenter.BackgroundColor3=col
            
            -- Если стиль "dot" — скрываем крест
            if C.CrosshairStyle=="dot" then
                chTop.Visible=false; chBottom.Visible=false
                chLeft.Visible=false; chRight.Visible=false
            end
        end)
    end
end)

-- ═══════════════════════════════════════════════
-- ENTITY TRACKER (FIX: очистка старых точек)
-- ═══════════════════════════════════════════════
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
tfs.Color=Color3.fromRGB(180,30,30)
tfs.Thickness=2

local tTitle=Instance.new("TextLabel",trackerFrame)
tTitle.Size=UDim2.new(1,0,0,16)
tTitle.BackgroundTransparency=1
tTitle.Text="RADAR"
tTitle.TextColor3=Color3.fromRGB(180,30,30)
tTitle.Font=Enum.Font.GothamBold
tTitle.TextSize=10

local trackerDots=Instance.new("Folder",trackerFrame)
trackerDots.Name="Dots"

task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if C.EntityTracker then
                trackerFrame.Visible=true
                -- ОЧИСТКА старых точек
                for _,c in ipairs(trackerDots:GetChildren()) do
                    c:Destroy()
                end
                local ch=LP.Character
                local root=ch and ch:FindFirstChild("HumanoidRootPart")
                if root then
                    local pos=root.Position
                    for _,o in ipairs(workspace:GetDescendants()) do
                        if o:IsA("Model") then
                            local n=string.lower(o.Name)
                            local isEnt=string.find(n,"rush",1,true) or string.find(n,"ambush",1,true)
                                or string.find(n,"seek",1,true) or string.find(n,"figure",1,true)
                                or string.find(n,"screech",1,true) or string.find(n,"halt",1,true)
                                or string.find(n,"grumble",1,true) or string.find(n,"giggle",1,true)
                            if isEnt then
                                local op=o.PrimaryPart and o.PrimaryPart.Position
                                if op then
                                    local d=(op-pos).Magnitude
                                    if d<150 then
                                        local dot=Instance.new("Frame",trackerDots)
                                        dot.Size=UDim2.new(0,8,0,8)
                                        dot.AnchorPoint=Vector2.new(0.5,0.5)
                                        local rx=math.clamp((op.X-pos.X)/150*0.5+0.5,0,1)
                                        local rz=math.clamp((op.Z-pos.Z)/150*0.5+0.5,0,1)
                                        dot.Position=UDim2.new(rx,0,rz,0)
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
        end)
    end
end)

-- ═══════════════════════════════════════════════
-- HITMARKER (FIX: hook на HealthChanged)
-- ═══════════════════════════════════════════════
local hitGui=Instance.new("ScreenGui")
hitGui.Name="BurmaldaHit"
hitGui.ResetOnSpawn=false
hitGui.DisplayOrder=200
hitGui.Parent=LP:WaitForChild("PlayerGui")

local hitLabel=Instance.new("TextLabel",hitGui)
hitLabel.Size=UDim2.new(0,60,0,60)
hitLabel.AnchorPoint=Vector2.new(0.5,0.5)
hitLabel.Position=UDim2.new(0.5,0,0.5,0)
hitLabel.BackgroundTransparency=1
hitLabel.Text="✕"
hitLabel.TextColor3=Color3.fromRGB(255,0,0)
hitLabel.TextSize=48
hitLabel.Font=Enum.Font.GothamBold
hitLabel.Visible=false

local hitToken=0
local function showHitmarker()
    if not C.Hitmarker then return end
    hitToken=hitToken+1
    local myToken=hitToken
    hitLabel.Visible=true
    hitLabel.TextTransparency=0
    local ts=game:GetService("TweenService")
    ts:Create(hitLabel,TweenInfo.new(0.5),{TextTransparency=1}):Play()
    task.delay(0.5,function()
        if myToken==hitToken then
            hitLabel.Visible=false
        end
    end)
end

_G.showHitmarker=showHitmarker

-- Hook: следим за монстрами, если у них Health падает — показываем hitmarker
task.spawn(function()
    while task.wait(1) do
        if C.Hitmarker then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") then
                        local h=o:FindFirstChildWhichIsA("Humanoid")
                        if h and not h:GetAttribute("BurmaldaHooked") then
                            h:SetAttribute("BurmaldaHooked",true)
                            local lastHp=h.Health
                            h.HealthChanged:Connect(function(newHp)
                                if newHp<lastHp and C.Hitmarker then
                                    showHitmarker()
                                end
                                lastHp=newHp
                            end)
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- DANGER METER (FIX: все монстры)
-- ═══════════════════════════════════════════════
local dangerGui=Instance.new("ScreenGui")
dangerGui.Name="BurmaldaDanger"
dangerGui.ResetOnSpawn=false
dangerGui.Parent=LP:WaitForChild("PlayerGui")

local dangerBar=Instance.new("Frame",dangerGui)
dangerBar.Size=UDim2.new(0,200,0,8)
dangerBar.AnchorPoint=Vector2.new(0.5,0.5)
dangerBar.Position=UDim2.new(0.5,0,0,60)
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
        pcall(function()
            if C.DangerMeter then
                dangerBar.Visible=true
                local ch=LP.Character
                local root=ch and ch:FindFirstChild("HumanoidRootPart")
                if root then
                    local closest=math.huge
                    for _,o in ipairs(workspace:GetDescendants()) do
                        if o:IsA("Model") then
                            local n=string.lower(o.Name)
                            local isEnt=string.find(n,"rush",1,true) or string.find(n,"ambush",1,true)
                                or string.find(n,"seek",1,true) or string.find(n,"figure",1,true)
                                or string.find(n,"screech",1,true) or string.find(n,"halt",1,true)
                                or string.find(n,"grumble",1,true) or string.find(n,"giggle",1,true)
                                or string.find(n,"blitz",1,true) or string.find(n,"scribble",1,true)
                            if isEnt then
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
        end)
    end
end)

-- ═══════════════════════════════════════════════
-- DAMAGE NUMBERS
-- ═══════════════════════════════════════════════
local dmgFolder=Instance.new("Folder",workspace)
dmgFolder.Name="BurmaldaDmg"

_G.showDamage=function(position, amount)
    if not C.DamageNumbers then return end
    pcall(function()
        local part=Instance.new("Part",dmgFolder)
        part.Size=Vector3.new(0.1,0.1,0.1)
        part.Position=position
        part.Anchored=true
        part.Transparency=1
        part.CanCollide=false
        
        local bb=Instance.new("BillboardGui",part)
        bb.Size=UDim2.new(0,100,0,30)
        bb.StudsOffset=Vector3.new(0,3,0)
        bb.AlwaysOnTop=true
        
        local lbl=Instance.new("TextLabel",bb)
        lbl.Size=UDim2.new(1,0,1,0)
        lbl.BackgroundTransparency=1
        lbl.Text=tostring(amount)
        lbl.TextColor3=Color3.fromRGB(255,50,50)
        lbl.TextStrokeTransparency=0
        lbl.Font=Enum.Font.GothamBold
        lbl.TextSize=18
        
        game:GetService("TweenService"):Create(part,TweenInfo.new(1),{Position=position+Vector3.new(0,3,0)}):Play()
        game:GetService("Debris"):AddItem(part,1.2)
    end)
end

-- ═══════════════════════════════════════════════
-- INVISIBLE
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(0.3) do
        if C.Invisible then
            pcall(function()
                local ch=LP.Character
                if ch then
                    for _,p in ipairs(ch:GetDescendants()) do
                        if p:IsA("BasePart") then p.Transparency=1 end
                        if p:IsA("Decal") then p.Transparency=1 end
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- FUN RAINBOW
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(0.1) do
        if C.FunRainbow then
            pcall(function()
                local ch=LP.Character
                if ch then
                    for _,p in ipairs(ch:GetDescendants()) do
                        if p:IsA("BasePart") then
                            p.Color=Color3.fromHSV(tick()%5/5,1,1)
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- SHOW SEEK PATH
-- ═══════════════════════════════════════════════
local pathFolder=Instance.new("Folder",workspace)
pathFolder.Name="BurmaldaPath"

task.spawn(function()
    while task.wait(0.5) do
        if C.ShowSeekPath then
            pcall(function()
                for _,o in ipairs(pathFolder:GetChildren()) do o:Destroy() end
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") then
                        local n=string.lower(o.Name)
                        if n=="seek" or n=="seekmoving" then
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
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- BOX ESP (новое)
-- ═══════════════════════════════════════════════
local boxFolder=Instance.new("Folder",workspace)
boxFolder.Name="BurmaldaBox"

local function updateBoxes()
    pcall(function()
        for _,o in ipairs(boxFolder:GetChildren()) do o:Destroy() end
        if not C.BoxESP then return end
        for _,o in ipairs(workspace:GetDescendants()) do
            if o:IsA("Model") then
                local n=string.lower(o.Name)
                local isEnt=string.find(n,"rush",1,true) or string.find(n,"ambush",1,true)
                    or string.find(n,"seek",1,true) or string.find(n,"figure",1,true)
                if isEnt then
                    local p=o.PrimaryPart
                    if p then
                        local box=Instance.new("Part",boxFolder)
                        box.Size=Vector3.new(4,6,4)
                        box.Position=p.Position
                        box.Anchored=true
                        box.CanCollide=false
                        box.Transparency=1
                        local sb=Instance.new("SelectionBox",box)
                        sb.Adornee=box
                        sb.Color3=C.BoxColor
                        sb.LineThickness=C.BoxThickness
                        game:GetService("Debris"):AddItem(box,0.4)
                    end
                end
            end
        end
    end)
end

task.spawn(function()
    while task.wait(0.3) do
        if C.BoxESP then updateBoxes() end
    end
end)

-- ═══════════════════════════════════════════════
-- TRACERS (новое)
-- ═══════════════════════════════════════════════
local tracerGui=Instance.new("ScreenGui")
tracerGui.Name="BurmaldaTracers"
tracerGui.ResetOnSpawn=false
tracerGui.IgnoreGuiInset=true
tracerGui.Parent=LP:WaitForChild("PlayerGui")

local tracerFolder=Instance.new("Folder",tracerGui)
tracerFolder.Name="Lines"

task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            for _,o in ipairs(tracerFolder:GetChildren()) do o:Destroy() end
            if not C.Tracers then return end
            local cam=workspace.CurrentCamera
            if not cam then return end
            local ch=LP.Character
            local root=ch and ch:FindFirstChild("HumanoidRootPart")
            if not root then return end
            
            -- Origin point
            local origin
            if C.TracerOrigin=="Top" then
                origin=Vector2.new(cam.ViewportSize.X/2,0)
            elseif C.TracerOrigin=="Center" then
                origin=Vector2.new(cam.ViewportSize.X/2,cam.ViewportSize.Y/2)
            else
                origin=Vector2.new(cam.ViewportSize.X/2,cam.ViewportSize.Y)
            end
            
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Model") then
                    local n=string.lower(o.Name)
                    local isEnt=string.find(n,"rush",1,true) or string.find(n,"ambush",1,true)
                        or string.find(n,"seek",1,true) or string.find(n,"figure",1,true)
                    if isEnt then
                        local p=o.PrimaryPart
                        if p then
                            local screenPos,onScreen=cam:WorldToViewportPoint(p.Position)
                            if onScreen then
                                local target=Vector2.new(screenPos.X,screenPos.Y)
                                local diff=target-origin
                                local length=diff.Magnitude
                                local angle=math.deg(math.atan2(diff.Y,diff.X))
                                
                                local line=Instance.new("Frame",tracerFolder)
                                line.AnchorPoint=Vector2.new(0,0.5)
                                line.Size=UDim2.new(0,length,0,C.TracerThickness)
                                line.Position=UDim2.new(0,origin.X,0,origin.Y)
                                line.Rotation=angle
                                line.BackgroundColor3=C.TracerColor
                                line.BorderSizePixel=0
                            end
                        end
                    end
                end
            end
        end)
    end
end)

print("[Burmalda v15.1] Part 5/14 — VISUAL loaded")
