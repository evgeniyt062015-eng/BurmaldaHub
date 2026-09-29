-- BURMALDA v15 | Part 3/14 — TP + HIDE + AUTO
-- TP Item/Player, Infinite Hide, Auto Collect/Coins/Door/Interact/Closet/Seek

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local RF=_G.RF
local P=_G.P
local GD=_G.GD

local function getR()
    local ch=LP.Character
    return ch and ch:FindFirstChild("HumanoidRootPart")
end

local function getPart(o)
    if o:IsA("BasePart") then return o end
    if o.PrimaryPart then return o.PrimaryPart end
    return o:FindFirstChildWhichIsA("BasePart",true)
end

local ITEM_NAMES={"crucifix","lockpick","bandage","flashlight","lighter","battery","vitamin","candle","skeleton","lantern","shears","scanner","compass","key","coin","gold","shakelight","straplight","bulklight"}

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
                local p=getPart(o)
                if p then
                    local d=(p.Position-myPos).Magnitude
                    if d<dist and d<C.TPItemRadius and d>3 then
                        dist=d; closest=p
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

-- ═══ TP TO PLAYER / BRING ═══
_G.tpToPlayer=function(t)
    local r=getR(); if not r then return end
    local tg=t.Character; if not tg then N("No char"); return end
    local tr=tg:FindFirstChild("HumanoidRootPart"); if not tr then return end
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

-- ═══ SAVE / TP TO SAVE ═══
local savedPos=nil
_G.savePos=function()
    local r=getR()
    if r then savedPos=r.CFrame; N("Saved") end
end
_G.tpToSave=function()
    if not savedPos then N("No save"); return end
    local r=getR()
    if r then r.CFrame=savedPos; N("TP to save") end
end

-- ═══ HIDE HELPERS ═══
_G.isInsideCloset=function()
    local ch=LP.Character
    if not ch then return false end
    if ch:GetAttribute("Hiding") then return true end
    if ch:GetAttribute("InCloset") then return true end
    if ch:GetAttribute("Hidden") then return true end
    if ch:FindFirstChild("Hidden") then return true end
    return false
end

local function findCloset(pos, maxDist, sameRoomOnly)
    local closest,prompt,dist=nil,nil,math.huge
    local curRoom=LP:GetAttribute("CurrentRoom")
    for _,o in ipairs(workspace:GetDescendants()) do
        if o:IsA("Model") then
            local n=o.Name:lower()
            if n:find("closet") or n:find("hiding") or n:find("wardrobe") or n:find("locker") then
                if sameRoomOnly and curRoom then
                    local pRoom=o:GetAttribute("ParentRoom")
                    if pRoom and tonumber(pRoom)~=tonumber(curRoom) then continue end
                end
                local p=getPart(o)
                if p then
                    local d=(p.Position-pos).Magnitude
                    if d<dist and d<maxDist then
                        local pr=o:FindFirstChildWhichIsA("ProximityPrompt",true)
                        if pr and pr.Enabled then
                            dist=d; closest=o; prompt=pr
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
    local closest,prompt,dist=findCloset(r.Position,100,false)
    if not closest then return false end
    local p=getPart(closest)
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
                local p=getPart(o)
                if p and (p.Position-pos).Magnitude<100 then danger=true; break end
            end
        end
    end
    if not danger or IH or tick()-HD<2 then return end
    local closest,prompt,dist=findCloset(pos,50,true)
    if not closest then
        closest,prompt,dist=findCloset(pos,50,false)
    end
    if closest and prompt then
        local p=getPart(closest)
        if p then
            if dist>10 then
                pcall(function()
                    local h=LP.Character:FindFirstChildOfClass("Humanoid")
                    if h then h:MoveTo(p.Position) end
                end)
                task.wait(1.5)
            end
            local r2=getR()
            if r2 then r2.CFrame=CFrame.new(p.Position+Vector3.new(0,2,0)) end
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
end

-- ═══ AUTO RE-HIDE ═══
task.spawn(function()
    while task.wait(1) do
        if C.AutoReHide and C.InfiniteHide then
            if not _G.isInsideCloset() then pcall(_G.forceHide) end
        end
    end
end)

-- ═══ AUTO COLLECT (Г — радиус 50, без телепорта) ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.AutoCollect then
            local r=getR()
            if r then
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") or o:IsA("BasePart") then
                        if P:GetPlayerFromCharacter(o) then continue end
                        local ch=LP.Character
                        if ch and ch:IsAncestorOf(o) then continue end
                        if isItem(o.Name) then
                            local p=getPart(o)
                            if p and (p.Position-r.Position).Magnitude<50 then
                                local prompt=o:FindFirstChildWhichIsA("ProximityPrompt",true)
                                    or (p.Parent and p.Parent:FindFirstChildWhichIsA("ProximityPrompt",true))
                                if prompt and prompt.Enabled then
                                    -- Подойти если далеко
                                    if (p.Position-r.Position).Magnitude>10 then
                                        pcall(function()
                                            local h=ch:FindFirstChildOfClass("Humanoid")
                                            if h then h:MoveTo(p.Position) end
                                        end)
                                        task.wait(0.5)
                                    end
                                    pcall(function()
                                        prompt:InputHoldBegin()
                                        task.wait(math.max(prompt.HoldDuration or 0,0.05))
                                        prompt:InputHoldEnd()
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

-- ═══ AUTO COINS (Б — радиус 30, без телепорта) ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.AutoCoins then
            local r=getR()
            if r then
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("BasePart") then
                        local n=o.Name:lower()
                        if n:find("coin") or n:find("gold") then
                            if (o.Position-r.Position).Magnitude<30 then
                                local prompt=o:FindFirstChildWhichIsA("ProximityPrompt",true)
                                    or (o.Parent and o.Parent:FindFirstChildWhichIsA("ProximityPrompt",true))
                                if prompt and prompt.Enabled then
                                    if (o.Position-r.Position).Magnitude>8 then
                                        pcall(function()
                                            local ch=LP.Character
                                            local h=ch:FindFirstChildOfClass("Humanoid")
                                            if h then h:MoveTo(o.Position) end
                                        end)
                                        task.wait(0.3)
                                    end
                                    pcall(function()
                                        prompt:InputHoldBegin()
                                        task.wait(math.max(prompt.HoldDuration or 0,0.05))
                                        prompt:InputHoldEnd()
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

-- ═══ AUTO DOOR (Г — только следующая) ═══
task.spawn(function()
    while task.wait(0.4) do
        if C.AutoDoor then
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
                    local dp=getPart(bestDoor)
                    if dp and (dp.Position-r.Position).Magnitude<8 then
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
end)

-- ═══ AUTO INTERACT (Б — чекбоксы) ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.AutoInteract then
            local r=getR()
            if r then
                local pos=r.Position
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("ProximityPrompt") and o.Enabled then
                        local par=o.Parent
                        local pp=par and (par:IsA("BasePart") and par or par:FindFirstChildWhichIsA("BasePart",true))
                        if pp and (pp.Position-pos).Magnitude<8 then
                            local n=(par.Name..(o.ActionText or "")..(o.ObjectText or "")):lower()
                            local should=false
                            if C.AutoInteractDoors and (n:find("door") or n:find("open")) then should=true end
                            if C.AutoInteractClosets and (n:find("closet") or n:find("hiding")) then should=true end
                            if C.AutoInteractAnchors and (n:find("anchor") or n:find("valve")) then should=true end
                            if C.AutoInteractItems and (n:find("pickup") or n:find("take") or n:find("collect")) then should=true end
                            if should then
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
end)

-- ═══ AUTO SEEK DOOR ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.AutoSeekDoor then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart") then
                local h=ch:FindFirstChildOfClass("Humanoid")
                local root=ch.HumanoidRootPart
                if h then
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
                        local dp=getPart(bestDoor)
                        if dp then
                            local dir=(dp.Position-root.Position).Unit
                            h:Move(dir,false)
                            if (dp.Position-root.Position).Magnitude<5 then
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

-- ═══ SEEK ESCAPE (побег от Seek) ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.SeekEscape then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart") then
                local h=ch:FindFirstChildOfClass("Humanoid")
                local root=ch.HumanoidRootPart
                local seekObj=nil
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") and o.Name:lower()=="seek" then
                        seekObj=o; break
                    end
                end
                if seekObj and h then
                    local sp=getPart(seekObj)
                    if sp then
                        local dir=(root.Position-sp.Position).Unit
                        h:Move(dir,false)
                    end
                end
            end
        end
    end
end)

-- ═══ AUTO PLATFORM ═══
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

-- ═══ AUTO PLAY AGAIN ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.AutoPlayAgain and RF and RF:FindFirstChild("PlayAgain") then
            pcall(function() RF.PlayAgain:FireServer() end)
        end
    end
end)

-- ═══ AUTO COMPLETE ROOM (следующая дверь) ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.AutoCompleteRoom then
            pcall(function() _G.tpNearestItem and nil end)
        end
    end
end)

-- ═══ AUTO SKIP CUTSCENE ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.AutoSkipCutscene then
            pcall(function()
                local pg=LP:FindFirstChild("PlayerGui")
                if pg then
                    for _,o in ipairs(pg:GetDescendants()) do
                        if o:IsA("TextButton") and (o.Name:lower():find("skip") or o.Text:lower():find("skip")) then
                            o:Activate()
                        end
                    end
                end
            end)
        end
    end
end)

print("[Burmalda v15] Part 3/14 — TP + HIDE + AUTO loaded")
