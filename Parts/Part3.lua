-- BURMALDA v15 | Part 3/14 — TP + HIDE + AUTO
-- Всё внутри pcall, без continue, без nil-вызовов

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local RF=_G.RF
local P=_G.P
local GD=_G.GD

-- ═══ БЕЗОПАСНЫЕ ХЕЛПЕРЫ ═══
local function safeCall(fn)
    if type(fn)=="function" then
        pcall(fn)
    end
end

local function getR()
    pcall(function()
        local ch=LP and LP.Character
        if ch then
            return ch:FindFirstChild("HumanoidRootPart")
        end
    end)
    local ch=LP and LP.Character
    if not ch then return nil end
    return ch:FindFirstChild("HumanoidRootPart")
end

local function getPart(o)
    if not o then return nil end
    pcall(function()
        if o:IsA("BasePart") then return o end
    end)
    if o:IsA("BasePart") then return o end
    if o.PrimaryPart then return o.PrimaryPart end
    return o:FindFirstChildWhichIsA("BasePart",true)
end

local ITEM_NAMES={"crucifix","lockpick","bandage","flashlight","lighter","battery","vitamin","candle","skeleton","lantern","shears","scanner","compass","key","coin","gold","shakelight","straplight","bulklight"}

local function isItem(name)
    if not name then return false end
    local n=string.lower(tostring(name))
    for _,k in ipairs(ITEM_NAMES) do
        if string.find(n,k,1,true) then return true end
    end
    return false
end

-- ═══ TP NEAREST ITEM ═══
_G.tpNearestItem=function()
    pcall(function()
        local ch=LP and LP.Character
        if not ch then N("Нет персонажа"); return end
        local r=ch:FindFirstChild("HumanoidRootPart")
        if not r then N("Нет HumanoidRootPart"); return end
        local myPos=r.Position
        local closest,dist=nil,math.huge
        for _,o in ipairs(workspace:GetDescendants()) do
            if o:IsA("Model") or o:IsA("BasePart") then
                if not P:GetPlayerFromCharacter(o) then
                    if not ch:IsAncestorOf(o) then
                        if isItem(o.Name) then
                            local p=getPart(o)
                            if p and p.Position then
                                local d=(p.Position-myPos).Magnitude
                                if d<dist and d<C.TPItemRadius and d>3 then
                                    dist=d
                                    closest=p
                                end
                            end
                        end
                    end
                end
            end
        end
        if closest and closest.Position then
            r.CFrame=CFrame.new(closest.Position+Vector3.new(0,3,0))
            N("TP to item")
        else
            N("No items nearby")
        end
    end)
end

-- ═══ TP TO PLAYER ═══
_G.tpToPlayer=function(t)
    pcall(function()
        if not t then return end
        local ch=LP and LP.Character
        if not ch then return end
        local r=ch:FindFirstChild("HumanoidRootPart")
        if not r then return end
        local tg=t.Character
        if not tg then N("No char"); return end
        local tr=tg:FindFirstChild("HumanoidRootPart")
        if not tr then return end
        r.CFrame=CFrame.new(tr.Position+Vector3.new(0,3,0))
        N("TP to "..tostring(t.Name))
    end)
end

-- ═══ BRING PLAYER ═══
_G.bringPlayer=function(t)
    pcall(function()
        if not t then return end
        local ch=LP and LP.Character
        if not ch then return end
        local r=ch:FindFirstChild("HumanoidRootPart")
        if not r then return end
        local tg=t.Character
        if not tg then return end
        local tr=tg:FindFirstChild("HumanoidRootPart")
        if not tr then return end
        tr.CFrame=CFrame.new(r.Position+Vector3.new(0,3,0))
        N("Brought "..tostring(t.Name))
    end)
end

-- ═══ SAVE / TP TO SAVE ═══
local savedPos=nil
_G.savePos=function()
    pcall(function()
        local r=getR()
        if r and r.CFrame then
            savedPos=r.CFrame
            N("Saved")
        end
    end)
end
_G.tpToSave=function()
    pcall(function()
        if not savedPos then N("No save"); return end
        local r=getR()
        if r then r.CFrame=savedPos; N("TP to save") end
    end)
end

-- ═══ HIDE HELPERS ═══
_G.isInsideCloset=function()
    local result=false
    pcall(function()
        local ch=LP and LP.Character
        if not ch then return end
        if ch:GetAttribute("Hiding") or ch:GetAttribute("InCloset") or ch:GetAttribute("Hidden") then
            result=true
            return
        end
        if ch:FindFirstChild("Hidden") or ch:FindFirstChild("InCloset") then
            result=true
            return
        end
    end)
    return result
end

local function findCloset(pos, maxDist, sameRoomOnly)
    local closest,prompt,dist=nil,nil,math.huge
    pcall(function()
        local curRoom=nil
        if sameRoomOnly then
            curRoom=LP:GetAttribute("CurrentRoom")
        end
        for _,o in ipairs(workspace:GetDescendants()) do
            if o:IsA("Model") then
                local n=string.lower(o.Name)
                if string.find(n,"closet",1,true) or string.find(n,"hiding",1,true) or string.find(n,"wardrobe",1,true) or string.find(n,"locker",1,true) then
                    local skip=false
                    if sameRoomOnly and curRoom then
                        local pRoom=o:GetAttribute("ParentRoom")
                        if pRoom and tostring(pRoom)~=tostring(curRoom) then
                            skip=true
                        end
                    end
                    if not skip then
                        local p=getPart(o)
                        if p and p.Position then
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
        end
    end)
    return closest,prompt,dist
end

_G.forceHide=function()
    local success=false
    pcall(function()
        local r=getR()
        if not r then return end
        local closest,prompt,dist=findCloset(r.Position,100,false)
        if not closest then return end
        local p=getPart(closest)
        if p and p.Position then
            r.CFrame=CFrame.new(p.Position+Vector3.new(0,2,0))
        end
        task.wait(0.1)
        if prompt then
            pcall(function()
                prompt:InputHoldBegin()
                task.wait(math.max(prompt.HoldDuration or 0,0.05))
                prompt:InputHoldEnd()
            end)
            success=true
        end
    end)
    return success
end

-- ═══ INFINITE HIDE ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.InfiniteHide then
            if not _G.isInsideCloset() then
                pcall(_G.forceHide)
            end
        end
        if C.HideLock then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("ProximityPrompt") and o.Enabled then
                        local a=string.lower(tostring(o.ActionText or ""))
                        if string.find(a,"exit",1,true) or string.find(a,"leave",1,true) then
                            o.Enabled=false
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ AUTO HIDE ═══
local HD=0
local IH=false
_G.aH=function()
    pcall(function()
        local r=getR()
        if not r then return end
        local pos=r.Position
        local danger=false
        for _,o in ipairs(workspace:GetDescendants()) do
            if o:IsA("Model") then
                local n=string.lower(o.Name)
                local isRush=string.find(n,"rush",1,true)
                local isAmb=string.find(n,"ambush",1,true)
                local isSeek=string.find(n,"seek",1,true)
                local isFig=string.find(n,"figure",1,true)
                local isBlitz=string.find(n,"blitz",1,true)
                if (isRush and C.AutoHideRush) or (isAmb and C.AutoHideAmbush) or (C.AutoHideAll and (isSeek or isFig or isBlitz)) then
                    local p=getPart(o)
                    if p and p.Position and (p.Position-pos).Magnitude<100 then
                        danger=true
                        break
                    end
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
            if p and p.Position then
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
    end)
end

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

-- ═══ AUTO COLLECT ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.AutoCollect then
            pcall(function()
                local r=getR()
                if not r then return end
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") or o:IsA("BasePart") then
                        if not P:GetPlayerFromCharacter(o) then
                            if isItem(o.Name) then
                                local p=getPart(o)
                                if p and p.Position and (p.Position-r.Position).Magnitude<50 then
                                    local prompt=o:FindFirstChildWhichIsA("ProximityPrompt",true)
                                    if prompt and prompt.Enabled then
                                        if (p.Position-r.Position).Magnitude>10 then
                                            pcall(function()
                                                local h=LP.Character:FindFirstChildOfClass("Humanoid")
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
            end)
        end
    end
end)

-- ═══ AUTO COINS ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.AutoCoins then
            pcall(function()
                local r=getR()
                if not r then return end
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("BasePart") then
                        local n=string.lower(o.Name)
                        if string.find(n,"coin",1,true) or string.find(n,"gold",1,true) then
                            if (o.Position-r.Position).Magnitude<30 then
                                local prompt=o:FindFirstChildWhichIsA("ProximityPrompt",true)
                                if prompt and prompt.Enabled then
                                    if (o.Position-r.Position).Magnitude>8 then
                                        pcall(function()
                                            local h=LP.Character:FindFirstChildOfClass("Humanoid")
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
            end)
        end
    end
end)

-- ═══ AUTO DOOR ═══
task.spawn(function()
    while task.wait(0.4) do
        if C.AutoDoor then
            pcall(function()
                local r=getR()
                if not r then return end
                local latestRoom=0
                if GD and GD:FindFirstChild("LatestRoom") then
                    latestRoom=GD.LatestRoom.Value
                end
                local bestDoor,bestNum=nil,math.huge
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") and string.lower(o.Name)=="door" then
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
            end)
        end
    end
end)

-- ═══ AUTO INTERACT ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.AutoInteract then
            pcall(function()
                local r=getR()
                if not r then return end
                local pos=r.Position
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("ProximityPrompt") and o.Enabled then
                        local par=o.Parent
                        if par then
                            local pp=par:IsA("BasePart") and par or par:FindFirstChildWhichIsA("BasePart",true)
                            if pp and (pp.Position-pos).Magnitude<8 then
                                local n=string.lower(tostring(par.Name)..tostring(o.ActionText or "")..tostring(o.ObjectText or ""))
                                local should=false
                                if C.AutoInteractDoors and (string.find(n,"door",1,true) or string.find(n,"open",1,true)) then should=true end
                                if C.AutoInteractClosets and (string.find(n,"closet",1,true) or string.find(n,"hiding",1,true)) then should=true end
                                if C.AutoInteractAnchors and (string.find(n,"anchor",1,true) or string.find(n,"valve",1,true)) then should=true end
                                if C.AutoInteractItems and (string.find(n,"pickup",1,true) or string.find(n,"take",1,true)) then should=true end
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
            end)
        end
    end
end)

-- ═══ AUTO SEEK DOOR ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.AutoSeekDoor then
            pcall(function()
                local ch=LP and LP.Character
                if not ch then return end
                local r=ch:FindFirstChild("HumanoidRootPart")
                if not r then return end
                local h=ch:FindFirstChildOfClass("Humanoid")
                if not h then return end
                local latestRoom=0
                if GD and GD:FindFirstChild("LatestRoom") then
                    latestRoom=GD.LatestRoom.Value
                end
                local bestDoor,bestNum=nil,math.huge
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") and string.lower(o.Name)=="door" then
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
                        local dir=(dp.Position-r.Position).Unit
                        h:Move(dir,false)
                        if (dp.Position-r.Position).Magnitude<5 then
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
            end)
        end
    end
end)

-- ═══ SEEK ESCAPE ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.SeekEscape then
            pcall(function()
                local ch=LP and LP.Character
                if not ch then return end
                local r=ch:FindFirstChild("HumanoidRootPart")
                if not r then return end
                local h=ch:FindFirstChildOfClass("Humanoid")
                if not h then return end
                local seekObj=nil
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") and string.lower(o.Name)=="seek" then
                        seekObj=o
                        break
                    end
                end
                if seekObj then
                    local sp=getPart(seekObj)
                    if sp then
                        local dir=(r.Position-sp.Position).Unit
                        h:Move(dir,false)
                    end
                end
            end)
        end
    end
end)

-- ═══ AUTO PLATFORM ═══
local platFolder=Instance.new("Folder",workspace)
platFolder.Name="BurmaldaPlatforms"

local function makePlatform(pos,size)
    pcall(function()
        local p=Instance.new("Part",platFolder)
        p.Size=size or Vector3.new(C.PlatformSize,1,C.PlatformSize)
        p.Position=pos
        p.Anchored=true
        p.CanCollide=true
        p.Transparency=0.4
        p.Color=Color3.fromRGB(0,255,255)
        p.Material=Enum.Material.Neon
        game:GetService("Debris"):AddItem(p,3)
    end)
end

task.spawn(function()
    while task.wait(0.2) do
        if C.AutoPlatform then
            pcall(function()
                local r=getR()
                if r then
                    local fwd=r.CFrame.LookVector*5
                    makePlatform(r.Position+fwd-Vector3.new(0,2,0))
                    makePlatform(r.Position-Vector3.new(0,3,0))
                end
            end)
        end
    end
end)

-- ═══ AUTO PLAY AGAIN ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.AutoPlayAgain and RF then
            pcall(function()
                local pa=RF:FindFirstChild("PlayAgain")
                if pa then pa:FireServer() end
            end)
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
                        if o:IsA("TextButton") then
                            local n=string.lower(o.Name)
                            local txt=string.lower(tostring(o.Text or ""))
                            if string.find(n,"skip",1,true) or string.find(txt,"skip",1,true) then
                                o:Activate()
                            end
                        end
                    end
                end
            end)
        end
    end
end)

print("[Burmalda v15] Part 3/14 — TP + HIDE + AUTO loaded")
