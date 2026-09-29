-- BURMALDA v14 | Part 3/8 — TP + HIDE + AUTOSEEK
-- TP Items/Players, Infinite Hide, Auto Seek, Route Arrow, Platform

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local UIS=_G.UIS
local RF=_G.RF
local P=_G.P
local GD=_G.GD

-- ═══ HELPERS ═══
local function getR()
    local ch=LP.Character
    return ch and ch:FindFirstChild("HumanoidRootPart")
end

local function getItemPart(o)
    if o:IsA("BasePart") then return o end
    if o.PrimaryPart then return o.PrimaryPart end
    return o:FindFirstChildWhichIsA("BasePart",true)
end

local ITEM_NAMES={"crucifix","lockpick","bandage","flashlight","lighter","battery",
"vitamin","key","coin","gold","candle","skeleton","shakelight","straplight",
"bulklight","lantern","shears","scanner","compass","bottle","crate","pizza",
"donut","cheese","bread","smoothie","nanner","glowstick"}

local function isItem(name)
    local n=name:lower()
    for _,k in ipairs(ITEM_NAMES) do
        if n:find(k,1,true) then return true end
    end
    return false
end

-- ═══ TP NEAREST ITEM ═══
_G.tpNearestItem=function()
    local r=getR(); if not r then return end
    local myPos=r.Position
    local closest,dist=nil,math.huge
    for _,o in ipairs(workspace:GetDescendants()) do
        if o:IsA("Model") or o:IsA("BasePart") then
            if P:GetPlayerFromCharacter(o) then continue end
            local ch=LP.Character
            if ch and ch:IsAncestorOf(o) then continue end
            if isItem(o.Name) then
                local p=getItemPart(o)
                if p then
                    local d=(p.Position-myPos).Magnitude
                    if d<dist and d<C.TPItemRadius and d>3 then
                        dist=d
                        closest=p
                    end
                end
            end
        end
    end
    if closest then
        r.CFrame=CFrame.new(closest.Position+Vector3.new(0,3,0))
        N("TP to item")
    else
        N("No items nearby")
    end
end

_G.tpToPlayer=function(t)
    local r=getR(); if not r then return end
    local tg=t.Character; if not tg then N("No char"); return end
    local tr=tg:FindFirstChild("HumanoidRootPart"); if not tr then N("Not in game"); return end
    r.CFrame=CFrame.new(tr.Position+Vector3.new(0,3,0))
    N("TP to "..t.Name)
end

_G.bringPlayer=function(t)
    local r=getR(); if not r then return end
    local tg=t.Character; if not tg then return end
    local tr=tg:FindFirstChild("HumanoidRootPart"); if not tr then return end
    tr.CFrame=CFrame.new(r.Position+Vector3.new(0,3,0))
    N("Brought "..t.Name)
end

-- ═══ HIDE HELPERS ═══
_G.isInsideCloset=function()
    local ch=LP.Character
    if not ch then return false end
    if ch:GetAttribute("Hiding") then return true end
    if ch:GetAttribute("InCloset") then return true end
    if ch:GetAttribute("Hidden") then return true end
    if ch:FindFirstChild("Hidden") then return true end
    if ch:FindFirstChild("InCloset") then return true end
    return false
end

local function findCloset(pos, maxDist)
    local closest,prompt,dist=nil,nil,math.huge
    for _,o in ipairs(workspace:GetDescendants()) do
        if o:IsA("Model") then
            local n=o.Name:lower()
            if n:find("closet") or n:find("hiding") or n:find("wardrobe")
            or n:find("cabinet") or n:find("locker") then
                local p=getItemPart(o)
                if p then
                    local d=(p.Position-pos).Magnitude
                    if d<dist and d<maxDist then
                        local pr=o:FindFirstChildWhichIsA("ProximityPrompt",true)
                        if pr and pr.Enabled then
                            dist=d
                            closest=o
                            prompt=pr
                        end
                    end
                end
            end
        end
    end
    return closest,prompt,dist
end

_G.forceHide=function()
    local r=getR(); if not r then return false end
    local closest,prompt,dist=findCloset(r.Position,100)
    if not closest then return false end
    local p=getItemPart(closest)
    if p then r.CFrame=CFrame.new(p.Position+Vector3.new(0,2,0)) end
    task.wait(0.1)
    pcall(function()
        prompt:InputHoldBegin()
        task.wait(math.max(prompt.HoldDuration or 0,0.05))
        prompt:InputHoldEnd()
    end)
    return true
end

-- ═══ INFINITE HIDE ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.InfiniteHide then
            if not _G.isInsideCloset() then pcall(_G.forceHide) end
        end
        if C.HideLock then
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("ProximityPrompt") and o.Enabled then
                    local a=(o.ActionText or ""):lower()
                    if a:find("exit") or a:find("leave") then
                        pcall(function() o.Enabled=false end)
                    end
                end
            end
        end
    end
end)

-- ═══ AUTO HIDE ═══
local HD=0
local IH=false

_G.aH=function()
    local r=getR(); if not r then return end
    local pos=r.Position
    local danger=false
    for _,o in ipairs(workspace:GetDescendants()) do
        if o:IsA("Model") then
            local n=o.Name:lower()
            if (n:find("rush") and C.AutoHideRush)
            or (n:find("ambush") and C.AutoHideAmbush)
            or (C.AutoHideAll and (n:find("seek") or n:find("figure") or n:find("blitz"))) then
                local p=getItemPart(o)
                if p and (p.Position-pos).Magnitude<100 then
                    danger=true
                    break
                end
            end
        end
    end
    if not danger or IH or tick()-HD<2 then return end
    local closest,prompt,dist=findCloset(pos,50)
    if closest and prompt then
        local p=getItemPart(closest)
        if p then r.CFrame=CFrame.new(p.Position+Vector3.new(0,2,0)) end
        task.wait(0.15)
        IH=true
        pcall(function()
            prompt:InputHoldBegin()
            task.wait(math.max(prompt.HoldDuration or 0,0.05))
            prompt:InputHoldEnd()
        end)
        HD=tick()
        task.wait(1)
        IH=false
    end
end

-- ═══ AUTO RE-HIDE ═══
task.spawn(function()
    while task.wait(1) do
        if C.AutoReHide and C.InfiniteHide then
            if not _G.isInsideCloset() then pcall(_G.forceHide) end
        end
    end
end)

-- ═══ AUTO-PLATFORM ═══
local platFolder=Instance.new("Folder",workspace)
platFolder.Name="BurmaldaPlatforms"

local function makePlatform(pos,size)
    local p=Instance.new("Part",platFolder)
    p.Size=size or Vector3.new(C.PlatformSize,1,C.PlatformSize)
    p.Position=pos
    p.Anchored=true
    p.CanCollide=true
    p.Transparency=0.4
    p.Color=Color3.fromRGB(0,255,255)
    p.Material=Enum.Material.Neon
    game:GetService("Debris"):AddItem(p,3)
end

task.spawn(function()
    while task.wait(0.2) do
        if C.AutoPlatform then
            local r=getR()
            if r then
                local fwd=r.CFrame.LookVector*5
                makePlatform(r.Position+fwd-Vector3.new(0,2,0))
                makePlatform(r.Position-Vector3.new(0,3,0))
            end
        end
    end
end)

-- ═══ AUTO-SEEK ═══
task.spawn(function()
    while task.wait(0.15) do
        if C.AutoSeek then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart") then
                local h=ch:FindFirstChildOfClass("Humanoid")
                local root=ch.HumanoidRootPart
                if h then
                    -- Ray для прыжков
                    pcall(function()
                        local ray=Ray.new(root.Position,root.CFrame.LookVector*4)
                        local hit=workspace:FindPartOnRay(ray,ch)
                        if hit and hit.CanCollide then
                            if C.AutoPlatform then
                                makePlatform(root.Position+root.CFrame.LookVector*4-Vector3.new(0,1,0),Vector3.new(5,0.5,5))
                            else
                                h:ChangeState(Enum.HumanoidStateType.Jumping)
                            end
                        end
                    end)
                    -- Поиск ближайшей двери
                    local myPos=root.Position
                    local latestRoom=0
                    if GD and GD:FindFirstChild("LatestRoom") then
                        latestRoom=GD.LatestRoom.Value
                    end
                    local bestDoor,bestNum=nil,math.huge
                    for _,o in ipairs(workspace:GetDescendants()) do
                        if o:IsA("Model") and o.Name:lower()=="door" then
                            local op=o:GetAttribute("Open")
                            if op==false or op==nil then
                                local rn=tonumber(o.Parent and o.Parent.Name)
                                if rn and rn>=latestRoom and rn<bestNum then
                                    bestNum=rn
                                    bestDoor=o
                                end
                            end
                        end
                    end
                    if bestDoor then
                        local dp=getItemPart(bestDoor)
                        if dp then
                            local dir=(dp.Position-myPos).Unit
                            h:Move(dir,false)
                            if (dp.Position-myPos).Magnitude<5 then
                                for _,pr in ipairs(bestDoor:GetDescendants()) do
                                    if pr:IsA("ProximityPrompt") then
                                        pcall(function()
                                            pr:InputHoldBegin()
                                            task.wait(0.05)
                                            pr:InputHoldEnd()
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- ═══ SEEK ROUTE ARROW ═══
local seekGui=Instance.new("ScreenGui")
seekGui.Name="SeekArrow"
seekGui.ResetOnSpawn=false
seekGui.Parent=LP:WaitForChild("PlayerGui")

local seekArrow=Instance.new("TextLabel",seekGui)
seekArrow.Size=UDim2.new(0,120,0,60)
seekArrow.Position=UDim2.new(0.5,-60,0.7,0)
seekArrow.BackgroundTransparency=0.5
seekArrow.BackgroundColor3=Color3.fromRGB(20,20,25)
seekArrow.Text="↑"
seekArrow.TextColor3=Color3.fromRGB(255,50,50)
seekArrow.Font=Enum.Font.GothamBlack
seekArrow.TextSize=48
seekArrow.Visible=false

local sac=Instance.new("UICorner",seekArrow)
sac.CornerRadius=UDim.new(0,10)

task.spawn(function()
    while task.wait(0.1) do
        if C.AutoSeek then
            local r=getR()
            if r then
                local latestRoom=0
                if GD and GD:FindFirstChild("LatestRoom") then
                    latestRoom=GD.LatestRoom.Value
                end
                local bestDoor,bestNum=nil,math.huge
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") and o.Name:lower()=="door" then
                        local op=o:GetAttribute("Open")
                        if op==false or op==nil then
                            local rn=tonumber(o.Parent and o.Parent.Name)
                            if rn and rn>=latestRoom and rn<bestNum then
                                bestNum=rn
                                bestDoor=o
                            end
                        end
                    end
                end
                if bestDoor then
                    local dp=getItemPart(bestDoor)
                    if dp then
                        local dir=(dp.Position-r.Position).Unit
                        local cam=workspace.CurrentCamera
                        local cl=cam.CFrame.LookVector
                        local angle=math.atan2(dir.X-cl.X,dir.Z-cl.Z)*57.3
                        seekArrow.Rotation=-angle
                        seekArrow.Visible=true
                    end
                else
                    seekArrow.Visible=false
                end
            else
                seekArrow.Visible=false
            end
        else
            seekArrow.Visible=false
        end
    end
end)

-- ═══ MINES AUTO-STEER ═══
task.spawn(function()
    while task.wait(0.1) do
        if C.AutoSeek and RF then
            local cam=workspace.CurrentCamera
            local mc=cam:FindFirstChild("MinecartRig")
            if mc then
                local move=RF:FindFirstChild("MinecartMove")
                if move then
                    local myPos=mc:GetPivot().Position
                    local ct,td=nil,math.huge
                    for _,o in ipairs(workspace:GetDescendants()) do
                        if o:IsA("Model") and (o.Name:lower():find("turn") or o.Name:lower():find("junction")) then
                            local p=getItemPart(o)
                            if p then
                                local d=(p.Position-myPos).Magnitude
                                if d<td then td=d ct=o end
                            end
                        end
                    end
                    if ct and td<15 then
                        local ctPart=getItemPart(ct)
                        if ctPart then
                            local dir=(ctPart.Position-myPos).Unit
                            local right=mc:GetPivot().RightVector
                            if dir:Dot(right)>0 then
                                pcall(function() move:FireServer(Vector3.new(1,0,0)) end)
                            else
                                pcall(function() move:FireServer(Vector3.new(-1,0,0)) end)
                            end
                        end
                    else
                        pcall(function() move:FireServer(Vector3.new(0,0,1)) end)
                    end
                end
            end
        end
    end
end)

print("[Burmalda v14] Part 3/8 — TP + HIDE + AUTOSEEK loaded")
