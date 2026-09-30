-- BURMALDA v15.1 | Part 4/14 — BYPASS + EXPLOITS
-- Фиксы: точные имена, WalkSpeed=0 вместо Anchored, всё в pcall

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local RF=_G.RF
local P=_G.P

local function getPart(o)
    if not o then return nil end
    local ok,res=pcall(function()
        if o:IsA("BasePart") then return o end
        if o.PrimaryPart then return o.PrimaryPart end
        return o:FindFirstChildWhichIsA("BasePart",true)
    end)
    if ok then return res end
    return nil
end

-- ═══ БОЛЬШИЕ СПИСКИ ИМЁН ═══
local BYPASS_MODELS={
    {flag="BypassRush",   names={"RushMoving","RushNew","Rush","rush"}},
    {flag="BypassAmbush", names={"AmbushMoving","AmbushNew","Ambush","ambush"}},
    {flag="BypassSeek",   names={"Seek","SeekMoving","seek"}},
    {flag="BypassFigure", names={"FigureRig","Figure","FigureRagdoll","figure"}},
    {flag="BypassScreech",names={"Screech","screech"}},
    {flag="BypassHalt",   names={"Halt","HaltMoving","halt"}},
    {flag="BypassGrumble",names={"Grumble","GrumbleRig","grumble"}},
    {flag="BypassDrones", names={"DronesStampede","Drones","drones"}},
    {flag="BypassJeff",   names={"JeffTheKiller","Jeff","jeff"}},
    {flag="BypassGiggle", names={"GiggleCeiling","Giggle","giggle"}},
    {flag="BypassSnare",  names={"Snare","snare"}},
    {flag="BypassBanana", names={"BananaPeel","Banana","banana"}},
    {flag="BypassDupe",   names={"DoorFake","FakeDoor","dupe"}},
    {flag="BypassVacuum", names={"SideroomSpace","Vacuum","vacuum"}},
    {flag="BypassKillbricks",names={"Lava","Killbrick","killbrick"}},
    {flag="BypassSeekingWall",names={"ScaryWall","SeekingWall"}},
    {flag="BypassSeekObstructions",names={"SeekFloodline","SeekObstruction"}},
    {flag="BypassGloombatEggs",names={"GloombatEgg","GloombatSwarm","Gloombat"}},
    {flag="BypassGiggleArc",names={"Scribbles","GiggleArc"}},
    {flag="BypassAlma",   names={"Alma","alma"}},
    {flag="BypassElectricWater",names={"ElectricWater","Water","water"}},
    {flag="BypassEyes",   names={"Eyes","EyesEntity","eyes"}},
    {flag="BypassLookman",names={"Lookman","BackdoorLookman","lookman"}},
    {flag="RemoveScreech",names={"Screech","screech"}},
    {flag="RemoveHalt",   names={"Halt","halt"}},
    {flag="RemoveA90",    names={"A90","A-90","a90"}},
    {flag="RemoveDread",  names={"Dread","dread"}},
    {flag="RemoveSurge",  names={"Surge","surge"}},
    {flag="AntiRansom",   names={"Ransom","ransom"}},
    {flag="AntiClosetTrash",names={"ClosetTrash","closettrah"}},
    {flag="AntiNoise",    names={"Noise","NoiseModel","noise"}}
}

-- ═══ BYPASS LOOP ═══
task.spawn(function()
    while task.wait(0.4) do
        pcall(function()
            for _,entry in ipairs(BYPASS_MODELS) do
                if C[entry.flag] then
                    for _,name in ipairs(entry.names) do
                        for _,o in ipairs(workspace:GetDescendants()) do
                            if o.Name==name then
                                for _,p in ipairs(o:GetDescendants()) do
                                    if p:IsA("BasePart") then
                                        pcall(function()
                                            p.CanTouch=false
                                            p.CanCollide=false
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

-- ═══ REMOVE PAINTINGS / SKELETON / NOISE TV ═══
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if C.RemovePaintingsDoor then
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o.Name:lower():find("painting") and o:IsA("Model") then
                        for _,p in ipairs(o:GetDescendants()) do
                            if p:IsA("BasePart") then p.CanCollide=false end
                        end
                    end
                end
            end
            if C.RemoveSkeletonDoor then
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o.Name:lower():find("skeleton") and o:IsA("Model") then
                        for _,p in ipairs(o:GetDescendants()) do
                            if p:IsA("BasePart") then p.CanCollide=false end
                        end
                    end
                end
            end
            if C.NoiseTVBreaker then
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o.Name:lower():find("noisetv") then
                        for _,p in ipairs(o:GetDescendants()) do
                            if p:IsA("BasePart") then p.CanCollide=false end
                        end
                    end
                end
            end
        end)
    end
end)

-- ═══ BYPASS EYES / LOOKMAN (через Remote) ═══
task.spawn(function()
    while task.wait(C.BypassDelay or 0.1) do
        if C.BypassEyes or C.BypassLookman then
            pcall(function()
                local m=RF and RF:FindFirstChild("MotorReplication")
                if m then m:FireServer(-(600+math.random(0,100))) end
            end)
        end
    end
end)

-- ═══ ANTI-SCRIBBLES (hookmetamethod) ═══
local hooked=false
local oldNamecall=nil
local function hookAntiScribbles()
    if hooked then return end
    pcall(function()
        oldNamecall=hookmetamethod(game,"__namecall",function(self,...)
            local method=getnamecallmethod()
            if method=="FireServer" or method=="InvokeServer" then
                if tostring(self):lower():find("scribble") then return nil end
            end
            return oldNamecall(self,...)
        end)
        hooked=true
    end)
end
task.spawn(function()
    while task.wait(1) do
        if C.BypassGiggleArc then hookAntiScribbles() end
    end
end)

-- ═══ FIGURE INVISIBLE (FIX: точное имя) ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.FigureInvisible then
            pcall(function()
                local ch=LP.Character
                if not ch then return end
                local isCrouch=false
                if ch:GetAttribute("Crouching") then isCrouch=true end
                local h=ch:FindFirstChildOfClass("Humanoid")
                if h and h.WalkSpeed<10 then isCrouch=true end
                if not isCrouch then
                    for _,o in ipairs(workspace:GetDescendants()) do
                        if o:IsA("Model") then
                            local n=string.lower(o.Name)
                            if n=="figurerig" or n=="figure" or n=="figureragdoll" then
                                for _,p in ipairs(o:GetDescendants()) do
                                    if p:IsA("BasePart") then
                                        p.CanTouch=false
                                        p.CanCollide=false
                                        p.Transparency=0.5
                                    end
                                end
                                local fh=o:FindFirstChildWhichIsA("Humanoid")
                                if fh then fh.WalkSpeed=0; fh.JumpPower=0 end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ GOD MODE ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.GodMode then
            pcall(function()
                local ch=LP.Character
                local h=ch and ch:FindFirstChildOfClass("Humanoid")
                if h and h.Health<h.MaxHealth then
                    h.Health=h.MaxHealth
                end
            end)
        end
    end
end)

-- ═══ GOD RUSHER ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.GodRusher then
            pcall(function()
                local ch=LP.Character
                if ch then
                    local h=ch:FindFirstChildOfClass("Humanoid")
                    if h then h.Health=h.MaxHealth end
                end
            end)
        end
    end
end)

-- ═══ ENTITY FREEZE (FIX: WalkSpeed=0 вместо Anchored) ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.EntityFreeze then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") then
                        local n=string.lower(o.Name)
                        if string.find(n,"rush",1,true) or string.find(n,"ambush",1,true) 
                        or string.find(n,"seek",1,true) or string.find(n,"figure",1,true)
                        or string.find(n,"screech",1,true) or string.find(n,"halt",1,true)
                        or string.find(n,"grumble",1,true) or string.find(n,"giggle",1,true)
                        or string.find(n,"blitz",1,true) or string.find(n,"scribble",1,true)
                        or string.find(n,"dread",1,true) or string.find(n,"surge",1,true) then
                            local h=o:FindFirstChildWhichIsA("Humanoid")
                            if h then
                                pcall(function() h.WalkSpeed=0; h.JumpPower=0 end)
                            end
                            -- Замедляем через BodyVelocity (без Anchored)
                            for _,p in ipairs(o:GetDescendants()) do
                                if p:IsA("BasePart") and not p.Anchored then
                                    pcall(function()
                                        local bv=p:FindFirstChild("BurmaldaFreeze")
                                        if not bv then
                                            bv=Instance.new("BodyVelocity",p)
                                            bv.Name="BurmaldaFreeze"
                                            bv.MaxForce=Vector3.new(9e9,9e9,9e9)
                                            bv.Velocity=Vector3.zero
                                        end
                                    end)
                                end
                            end
                        end
                    end
                end
            end)
        else
            -- Убираем BodyVelocity при OFF
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    local bv=o:FindFirstChild("BurmaldaFreeze")
                    if bv then bv:Destroy() end
                end
            end)
        end
    end
end)

-- ═══ TIME STOP ═══
task.spawn(function()
    while task.wait(0.1) do
        if C.TimeStop then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") then
                        local n=string.lower(o.Name)
                        if string.find(n,"rush",1,true) or string.find(n,"ambush",1,true)
                        or string.find(n,"seek",1,true) or string.find(n,"figure",1,true)
                        or string.find(n,"screech",1,true) then
                            local h=o:FindFirstChildWhichIsA("Humanoid")
                            if h then h.WalkSpeed=0; h.JumpPower=0 end
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ SLOW MOTION ═══
task.spawn(function()
    while task.wait(0.2) do
        if C.SlowMotion then
            if workspace.Gravity~=50 then workspace.Gravity=50 end
        else
            if workspace.Gravity~=196.2 then workspace.Gravity=196.2 end
        end
    end
end)

-- ═══ AUTO DODGE ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.AutoDodge then
            pcall(function()
                local ch=LP.Character
                if not ch then return end
                local r=ch:FindFirstChild("HumanoidRootPart")
                if not r then return end
                local pos=r.Position
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") then
                        local n=string.lower(o.Name)
                        local p=getPart(o)
                        if p then
                            local d=(p.Position-pos).Magnitude
                            if (string.find(n,"rushmoving",1,true) or string.find(n,"ambushmoving",1,true)) and d<80 then
                                if not _G.isInsideCloset() and _G.aH then pcall(_G.aH) end
                                break
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ INFINITE ITEMS ═══
task.spawn(function()
    while task.wait(2) do
        if C.InfiniteItems then
            pcall(function()
                local ch=LP.Character
                if ch then
                    for _,tool in ipairs(LP.Backpack:GetChildren()) do
                        if tool:IsA("Tool") then
                            pcall(function() tool.Parent=ch end)
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ MAX STATS ═══
task.spawn(function()
    while task.wait(1) do
        if C.MaxStats then
            pcall(function()
                local ch=LP.Character
                if ch then
                    local h=ch:FindFirstChildOfClass("Humanoid")
                    if h then
                        h.MaxHealth=math.huge
                        h.Health=math.huge
                    end
                end
            end)
        end
    end
end)

-- ═══ INVISIBLE ═══
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

-- ═══ ANTICHEAT BYPASS ═══
task.spawn(function()
    while task.wait(5) do
        if C.AnticheatBypass then
            pcall(function()
                if getconnections then
                    for _,conn in ipairs(getconnections(LP.OnTeleport)) do
                        pcall(function() conn:Disable() end)
                    end
                end
            end)
        end
    end
end)

-- ═══ VELOCITY MANIPULATION ═══
task.spawn(function()
    while task.wait(0.1) do
        if C.VelocityManipulation then
            pcall(function()
                local ch=LP.Character
                local h=ch and ch:FindFirstChildOfClass("Humanoid")
                if h then
                    local sp=h.WalkSpeed
                    if sp<50 then h.WalkSpeed=sp+2 end
                end
            end)
        end
    end
end)

-- ═══ AUTO HEARTBEAT MINIGAME ═══
task.spawn(function()
    while task.wait(0.1) do
        if C.AutoHeartbeatMinigame then
            pcall(function()
                local pg=LP:FindFirstChild("PlayerGui")
                if pg then
                    for _,o in ipairs(pg:GetDescendants()) do
                        if o:IsA("TextButton") or o:IsA("ImageButton") then
                            local n=string.lower(o.Name)
                            if string.find(n,"heart",1,true) or string.find(n,"beat",1,true) then
                                o:Activate()
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ AUTO SOLVE ANCHORS ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.AutoSolveAnchors and _G.CR then
            pcall(function()
                local ch=LP.Character
                local r=ch and ch:FindFirstChild("HumanoidRootPart")
                if not r then return end
                for _,anchor in ipairs(_G.CR:GetDescendants()) do
                    if anchor.Name=="MinesAnchor" then
                        local prompt=anchor:FindFirstChildWhichIsA("ProximityPrompt",true)
                        if prompt and prompt.Enabled then
                            local pp=getPart(prompt.Parent)
                            if pp and (pp.Position-r.Position).Magnitude<20 then
                                prompt:InputHoldBegin()
                                task.wait(0.1)
                                prompt:InputHoldEnd()
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ AUTO UNLOCK PADLOCK ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.AutoUnlockPadlock then
            pcall(function()
                local ch=LP.Character
                local r=ch and ch:FindFirstChild("HumanoidRootPart")
                if not r then return end
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("ProximityPrompt") and o.Enabled and o.Parent then
                        local n=string.lower(tostring(o.Parent.Name)..tostring(o.ActionText or ""))
                        if string.find(n,"padlock",1,true) or string.find(n,"lock",1,true) then
                            local pp=getPart(o.Parent)
                            if pp and (pp.Position-r.Position).Magnitude<15 then
                                o:InputHoldBegin()
                                task.wait(0.1)
                                o:InputHoldEnd()
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ GUESS LIBRARY CODE ═══
task.spawn(function()
    while task.wait(2) do
        if C.GuessLibraryCode then
            pcall(function()
                local rem=RF and RF:FindFirstChild("LibraryCode")
                if rem then
                    for tries=1,5 do
                        local code=""
                        for i=1,5 do code=code..tostring(math.random(0,9)) end
                        rem:FireServer(code)
                        task.wait(0.5)
                    end
                end
            end)
        end
    end
end)

-- ═══ BRING DROPPED ITEMS ═══
task.spawn(function()
    while task.wait(1) do
        if C.BringDroppedItems then
            pcall(function()
                local ch=LP.Character
                local r=ch and ch:FindFirstChild("HumanoidRootPart")
                if r then
                    for _,o in ipairs(workspace:GetDescendants()) do
                        if o:IsA("Model") and o.Name:lower():find("drop") then
                            local p=getPart(o)
                            if p and (p.Position-r.Position).Magnitude<100 then
                                p.CFrame=CFrame.new(r.Position+Vector3.new(0,2,0))
                            end
                        end
                    end
                end
            end)
        end
    end
end)

print("[Burmalda v15.1] Part 4/14 — BYPASS + EXPLOITS loaded")
