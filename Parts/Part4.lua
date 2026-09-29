-- BURMALDA v15 | Part 4/14 — BYPASS + EXPLOITS
-- 18 базовых + Abysall + Anticheat + GodMode, Freeze, TimeStop

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local RF=_G.RF
local P=_G.P

local function getPart(o)
    if o:IsA("BasePart") then return o end
    if o.PrimaryPart then return o.PrimaryPart end
    return o:FindFirstChildWhichIsA("BasePart",true)
end

-- ═══ ТОЧНЫЕ ИМЕНА МОДЕЛЕЙ ═══
local BYPASS_MODELS={
    {flag="BypassRush",   names={"RushMoving","RushNew","Rush"}},
    {flag="BypassAmbush", names={"AmbushMoving","AmbushNew","Ambush"}},
    {flag="BypassSeek",   names={"Seek","SeekMoving"}},
    {flag="BypassFigure", names={"FigureRig","Figure","FigureRagdoll"}},
    {flag="BypassScreech",names={"Screech"}},
    {flag="BypassHalt",   names={"Halt","HaltMoving"}},
    {flag="BypassGrumble",names={"Grumble","GrumbleRig"}},
    {flag="BypassDrones", names={"DronesStampede","Drones"}},
    {flag="BypassJeff",   names={"JeffTheKiller"}},
    {flag="BypassGiggle", names={"GiggleCeiling","Giggle"}},
    {flag="BypassSnare",  names={"Snare"}},
    {flag="BypassBanana", names={"BananaPeel"}},
    {flag="BypassDupe",   names={"DoorFake","FakeDoor"}},
    {flag="BypassVacuum", names={"SideroomSpace"}},
    {flag="BypassKillbricks",names={"Lava","Killbrick"}},
    {flag="BypassSeekingWall",names={"ScaryWall"}},
    {flag="BypassSeekObstructions",names={"SeekFloodline","SeekObstruction"}},
    {flag="BypassGloombatEggs",names={"GloombatEgg","GloombatSwarm"}},
    {flag="BypassGiggleArc",names={"Scribbles"}},
    {flag="BypassAlma",   names={"Alma"}},
    {flag="BypassElectricWater",names={"ElectricWater","Water"}},
    {flag="BypassEyes",   names={"Eyes","EyesEntity"}},
    {flag="BypassLookman",names={"Lookman","BackdoorLookman"}},
    {flag="RemoveScreech",names={"Screech"}},
    {flag="RemoveHalt",   names={"Halt"}},
    {flag="RemoveA90",    names={"A90","A-90"}},
    {flag="RemoveDread",  names={"Dread"}},
    {flag="RemoveSurge",  names={"Surge"}},
    {flag="AntiRansom",   names={"Ransom"}},
    {flag="AntiClosetTrash",names={"ClosetTrash"}},
    {flag="AntiNoise",    names={"Noise","NoiseModel"}},
}

-- ═══ BYPASS LOOP ═══
task.spawn(function()
    while task.wait(0.5) do
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

-- ═══ REMOVE PAINTINGS / SKELETON DOOR ═══
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

-- ═══ FIGURE INVISIBLE ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.FigureInvisible then
            local ch=LP.Character
            if ch then
                local isCrouch=false
                if ch:GetAttribute("Crouching") then isCrouch=true end
                local h=ch:FindFirstChildOfClass("Humanoid")
                if h and h.WalkSpeed<10 then isCrouch=true end
                if not isCrouch then
                    for _,o in ipairs(workspace:GetDescendants()) do
                        if o:IsA("Model") and o.Name:lower():find("figure") then
                            for _,p in ipairs(o:GetDescendants()) do
                                if p:IsA("BasePart") then
                                    p.CanTouch=false; p.CanCollide=false; p.Transparency=0.5
                                end
                            end
                            local fh=o:FindFirstChildWhichIsA("Humanoid")
                            if fh then fh.WalkSpeed=0; fh.JumpPower=0 end
                        end
                    end
                end
            end
        end
    end
end)

-- ═══ GOD MODE LOOP (в Character уже есть, тут дублируем) ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.GodMode then
            local ch=LP.Character
            local h=ch and ch:FindFirstChildOfClass("Humanoid")
            if h and h.Health<h.MaxHealth then
                h.Health=h.MaxHealth
            end
        end
    end
end)

-- ═══ GOD RUSHER ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.GodRusher then
            local ch=LP.Character
            if ch then
                local h=ch:FindFirstChildOfClass("Humanoid")
                if h then h.Health=h.MaxHealth end
            end
        end
    end
end)

-- ═══ ENTITY FREEZE ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.EntityFreeze then
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Model") then
                    local n=o.Name:lower()
                    if n:find("rush") or n:find("ambush") or n:find("seek")
                    or n:find("figure") or n:find("screech") or n:find("halt")
                    or n:find("grumble") or n:find("giggle") or n:find("blitz")
                    or n:find("scribble") or n:find("dread") or n:find("surge") then
                        local h=o:FindFirstChildWhichIsA("Humanoid")
                        if h then pcall(function() h.WalkSpeed=0; h.JumpPower=0 end) end
                        for _,p in ipairs(o:GetDescendants()) do
                            if p:IsA("BasePart") then pcall(function() p.Anchored=true end) end
                        end
                    end
                end
            end
        end
    end
end)

-- ═══ TIME STOP ═══
task.spawn(function()
    while task.wait(0.1) do
        if C.TimeStop then
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Model") then
                    local n=o.Name:lower()
                    if n:find("rush") or n:find("ambush") or n:find("seek")
                    or n:find("figure") or n:find("screech") then
                        local h=o:FindFirstChildWhichIsA("Humanoid")
                        if h then h.WalkSpeed=0; h.JumpPower=0 end
                    end
                end
            end
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
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart") then
                local pos=ch.HumanoidRootPart.Position
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") then
                        local n=o.Name:lower()
                        local p=getPart(o)
                        if p then
                            local d=(p.Position-pos).Magnitude
                            if (n:find("rush") or n:find("ambush")) and d<80 then
                                if not _G.isInsideCloset() and _G.aH then pcall(_G.aH) end
                                break
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- ═══ INFINITE ITEMS ═══
task.spawn(function()
    while task.wait(2) do
        if C.InfiniteItems then
            local ch=LP.Character
            if ch then
                for _,tool in ipairs(LP.Backpack:GetChildren()) do
                    if tool:IsA("Tool") then
                        pcall(function() tool.Parent=ch end)
                    end
                end
            end
        end
    end
end)

-- ═══ MAX STATS ═══
task.spawn(function()
    while task.wait(1) do
        if C.MaxStats then
            local ch=LP.Character
            if ch then
                local h=ch:FindFirstChildOfClass("Humanoid")
                if h then
                    h.MaxHealth=math.huge
                    h.Health=math.huge
                end
            end
        end
    end
end)

-- ═══ INVISIBLE (в Visual есть, тут страховка) ═══
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

-- ═══ ANTICHEAT BYPASS (заглушка) ═══
task.spawn(function()
    while task.wait(5) do
        if C.AnticheatBypass then
            pcall(function()
                -- Приглушаем защиту (если есть)
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
            local ch=LP.Character
            local h=ch and ch:FindFirstChildOfClass("Humanoid")
            if h then
                local sp=h.WalkSpeed
                if sp<50 then h.WalkSpeed=sp+2 end
            end
        end
    end
end)

-- ═══ AUTO HEARTBEAT MINIGAME (Figure) ═══
task.spawn(function()
    while task.wait(0.1) do
        if C.AutoHeartbeatMinigame then
            pcall(function()
                local pg=LP:FindFirstChild("PlayerGui")
                if pg then
                    for _,o in ipairs(pg:GetDescendants()) do
                        if o:IsA("TextButton") or o:IsA("ImageButton") then
                            local n=o.Name:lower()
                            if n:find("heart") or n:find("beat") then
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
                for _,anchor in ipairs(_G.CR:GetDescendants()) do
                    if anchor.Name=="MinesAnchor" then
                        local prompt=anchor:FindFirstChildWhichIsA("ProximityPrompt",true)
                        if prompt and prompt.Enabled then
                            local pp=getPart(prompt.Parent)
                            local ch=LP.Character
                            local r=ch and ch:FindFirstChild("HumanoidRootPart")
                            if pp and r and (pp.Position-r.Position).Magnitude<20 then
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
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("ProximityPrompt") and o.Enabled and o.Parent then
                        local n=(o.Parent.Name..(o.ActionText or "")):lower()
                        if n:find("padlock") or n:find("lock") then
                            local pp=getPart(o.Parent)
                            local ch=LP.Character
                            local r=ch and ch:FindFirstChild("HumanoidRootPart")
                            if pp and r and (pp.Position-r.Position).Magnitude<15 then
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
                for tries=1,5 do
                    local code=""
                    for i=1,5 do code=code..tostring(math.random(0,9)) end
                    local rem=RF and RF:FindFirstChild("LibraryCode")
                    if rem then
                        pcall(function() rem:FireServer(code) end)
                    end
                    task.wait(0.5)
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

print("[Burmalda v15] Part 4/14 — BYPASS + EXPLOITS loaded")
