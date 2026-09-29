
-- BURMALDA v13 | Part 3/8 — TP + HIDE + AUTOSEEK
-- TP Items/Players, Infinite Hide, Auto Seek, Route Arrow, Platform, Steer

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

-- ═══ FIND NEAREST ITEM ═══
local function findNearestItem()
    local ch=LP.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart") then return nil end
    local myPos=ch.HumanoidRootPart.Position
    local closest,dist=nil,math.huge
    for _,o in ipairs(workspace:GetDescendants()) do
        if o:IsA("Model") or o:IsA("BasePart") then
            if P:GetPlayerFromCharacter(o) then continue end
            if o==ch then continue end
            if ch:IsAncestorOf(o) then continue end
            local n=o.Name:lower()
            if n:find("crucifix") or n:find("lockpick") or n:find("bandage")
            or n:find("flashlight") or n:find("lighter") or n:find("battery")
            or n:find("vitamin") or n:find("key") or n:find("coin")
            or n:find("gold") or n:find("candle") or n:find("skeleton")
            or n:find("shakelight") or n:find("straplight") or n:find("bulklight")
            or n:find("lantern") or n:find("shears") or n:find("scanner")
            or n:find("compass") then
                local p=o:IsA("BasePart") and o or (o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true))
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
    return closest
end

_G.tpNearestItem=function()
    local item=findNearestItem()
    if item then
        local ch=LP.Character
        if ch and ch:FindFirstChild("HumanoidRootPart") then
            ch.HumanoidRootPart.CFrame=CFrame.new(item.Position+Vector3.new(0,3,0))
            N("TP to item")
        end
    else
        N("No items")
    end
end

_G.tpToPlayer=function(t)
    local ch=LP.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart") then return end
    local tg=t.Character
    if not tg then N("No char"); return end
    local tr=tg:FindFirstChild("HumanoidRootPart")
    if not tr then N("Not in game"); return end
    ch.HumanoidRootPart.CFrame=CFrame.new(tr.Position+Vector3.new(0,3,0))
    N("TP to "..t.Name)
end

_G.bringPlayer=function(t)
    local ch=LP.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart") then return end
    local myPos=ch.HumanoidRootPart.Position
    local tg=t.Character
    if not tg then return end
    local tr=tg:FindFirstChild("HumanoidRootPart")
    if not tr then return end
    tr.CFrame=CFrame.new(myPos+Vector3.new(0,3,0))
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

_G.forceHide=function()
    local ch=LP.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart") then return false end
    local pos=ch.HumanoidRootPart.Position
    local closest,prompt,dist=nil,nil,math.huge
    for _,o in ipairs(workspace:GetDescendants()) do
        if o:IsA("Model") then
            local n=o.Name:lower()
            if n:find("closet") or n:find("hiding") or n:find("wardrobe")
            or n:find("cabinet") or n:find("locker") then
                local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true)
                if p thenlocal d=(p.Position-pos).Magnitude
                    if d<dist then
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
    if closest and prompt and dist<100 then
        local p=closest.PrimaryPart or closest:FindFirstChildWhichIsA("BasePart",true)
        if p then ch.HumanoidRootPart.CFrame=CFrame.new(p.Position+Vector3.new(0,2,0)) end
        task.wait(0.1)
        pcall(function()
            prompt:InputHoldBegin()
            task.wait(math.max(prompt.HoldDuration or 0,0.05))
            prompt:InputHoldEnd()
        end)
        return true
    end
    return false
end

-- ═══ INFINITE HIDE LOOP ═══
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
    local ch=LP.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart") then return end
    local pos=ch.HumanoidRootPart.Position
    local dg=false
    for _,o in ipairs(workspace:GetDescendants()) do
        if o:IsA("Model") then
            local n=o.Name:lower()
            if (n:find("rush") and C.AutoHideRush)
            or (n:find("ambush") and C.AutoHideAmbush)
            or (C.AutoHideAll and (n:find("seek") or n:find("figure"))) then
                local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true)
                if p and (p.Position-pos).Magnitude<100 then
                    dg=true
                    break
                end
            end
        end
    end
    if not dg or IH or tick()-HD<2 then return end
    local cl,pr,dt=nil,nil,math.huge
    for _,o in ipairs(workspace:GetDescendants()) do
        if o:IsA("Model") then
            local n=o.Name:lower()
            if n:find("closet") or n:find("hiding") or n:find("wardrobe") then
                local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true)
                if p then
                    local d=(p.Position-pos).Magnitude
                    if d<dt then
                        local pp=o:FindFirstChildWhichIsA("ProximityPrompt",true)
                        if pp and pp.Enabled then
                            dt=d
                            cl=o
                            pr=pp
                        end
                    end
                end
            end
        end
    end
    if cl and pr and dt<50 then
        local p=cl.PrimaryPart or cl:FindFirstChildWhichIsA("BasePart",true)
        if p then ch.HumanoidRootPart.CFrame=CFrame.new(p.Position+Vector3.new(0,2,0)) end
        task.wait(0.15)
        IH=true
        pcall(function()
            pr:InputHoldBegin()
            task.wait(math.max(pr.HoldDuration or 0,0.05))
            pr:InputHoldEnd()
        end)
        HD=tick()
        task.wait(1)
        IH=false
    end
end

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
    while task.wait(0.15) do
        if C.AutoPlatform then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart") then
                local root=ch.HumanoidRootPart
                local fwd=root.CFrame.LookVector*5
                makePlatform(root.Position+fwd-Vector3.new(0,2,0))
                makePlatform(root.Position-Vector3.new(0,3,0))
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("BasePart") and (o.Name:lower():find("water") or o.Material==Enum.Material.Water) then
                        if (o.Position-root.Position).Magnitude<30 then
                            makePlatform(Vector3.new(root.Position.X,o.Position.Y+3,root.Position.Z),Vector3.new(8,0.5,8))
                        end
                    end
                end
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
                    pcall(function()
                        local ray=Ray.new(root.Position,root.CFrame.LookVector*4)
                        local hit=workspace:FindPartOnRay(ray,ch)
                        if hit and hit.CanCollide and C.AutoPlatform then
                            makePlatform(root.Position+root.CFrame.LookVector*4-Vector3.new(0,1,0),Vector3.new(5,0.5,5))
                        end
                        if hit and hit.CanCollide and not C.AutoPlatform then
                            h:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                    end)
                    pcall(function()
                        local ray=Ray.new(root.Position+Vector3.new(0,2,0),Vector3.new(0,3,0))
                        local hit=workspace:FindPartOnRay(ray,ch)
                        if RF then
                            if hit and hit.CanCollide then
                                if RF:FindFirstChild("Crouch") then RF.Crouch:FireServer(true) end
                            else
                                if RF:FindFirstChild("Crouch") then RF.Crouch:FireServer(false) end
                            end
                        end
                    end)
                    local myPos=root.Position
                    local latestRoom=0
                    if GD and GD:FindFirstChild("LatestRoom") then latestRoom=GD.LatestRoom.Value end
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
                        local dp=bestDoor.PrimaryPart or bestDoor:FindFirstChildWhichIsA("BasePart",true)
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
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart") then
                local myPos=ch.HumanoidRootPart.Position
                local latestRoom=0
                if GD and GD:FindFirstChild("LatestRoom") then latestRoom=GD.LatestRoom.Value end
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
                    local dp=bestDoor.PrimaryPart or bestDoor:FindFirstChildWhichIsA("BasePart",true)
                    if dp then
                        local dir=(dp.Position-myPos).Unit
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
                            local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true)
                            if p then
                                local d=(p.Position-myPos).Magnitude
                                if d<td then
                                    td=d
                                    ct=o
                                end
                            end
                        end
                    end
                    if ct and td<15 then
                        local dir=(ct.PrimaryPart.Position-myPos).Unit
                        local right=mc:GetPivot().RightVector
if dir:Dot(right)>0 then
                            pcall(function() move:FireServer(Vector3.new(1,0,0)) end)
                        else
                            pcall(function() move:FireServer(Vector3.new(-1,0,0)) end)
                        end
                    else
                        pcall(function() move:FireServer(Vector3.new(0,0,1)) end)
                    end
                end
            end
        end
    end
end)

-- ═══ AUTO RE-HIDE ═══
task.spawn(function()
    while task.wait(1) do
        if C.AutoReHide and C.InfiniteHide then
            if not _G.isInsideCloset() then
                pcall(_G.forceHide)
            end
        end
    end
end)

print("[Burmalda v13] Part 3/8 — TP + HIDE + AUTOSEEK loaded")
