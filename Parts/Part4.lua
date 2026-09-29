-- BURMALDA v13 | Part 4/8 — BYPASS + EXPLOITS
-- 16 Bypass + GodMode, Revive, TimeStop, Dodge, Freeze

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local RF=_G.RF
local P=_G.P

-- ═══ BYPASS LOOP (Rush, Ambush, Seek, Figure, Grumble, Drones) ═══
task.spawn(function()
    while task.wait(0.3) do
        pcall(function()
            if C.BypassRush then
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o.Name:lower():find("rush") and (o:IsA("Model") or o:IsA("BasePart")) then
                        for _,p in ipairs(o:GetDescendants()) do
                            if p:IsA("BasePart") then p.CanTouch=false; p.CanCollide=false end
                        end
                    end
                end
            end
            if C.BypassAmbush then
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o.Name:lower():find("ambush") and (o:IsA("Model") or o:IsA("BasePart")) then
                        for _,p in ipairs(o:GetDescendants()) do
                            if p:IsA("BasePart") then p.CanTouch=false; p.CanCollide=false end
                        end
                    end
                end
            end
            if C.BypassSeek then
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o.Name:lower():find("seek") and (o:IsA("Model") or o:IsA("BasePart")) then
                        for _,p in ipairs(o:GetDescendants()) do
                            if p:IsA("BasePart") then p.CanTouch=false end
                        end
                    end
                end
            end
            if C.BypassFigure then
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o.Name:lower():find("figure") and (o:IsA("Model") or o:IsA("BasePart")) then
                        for _,p in ipairs(o:GetDescendants()) do
                            if p:IsA("BasePart") then p.CanTouch=false; p.CanCollide=false end
                        end
                    end
                end
            end
            if C.BypassGrumble then
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o.Name:lower():find("grumble") and (o:IsA("Model") or o:IsA("BasePart")) then
                        for _,p in ipairs(o:GetDescendants()) do
                            if p:IsA("BasePart") then p.CanTouch=false end
                        end
                    end
                end
            end
            if C.BypassDrones then
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o.Name:lower():find("drones") and (o:IsA("Model") or o:IsA("BasePart")) then
                        for _,p in ipairs(o:GetDescendants()) do
                            if p:IsA("BasePart") then p.CanTouch=false end
                        end
                    end
                end
            end
        end)
    end
end)

-- ═══ UNIVERSAL BYPASS ═══
local function byT(names,state)
    for _,o in ipairs(workspace:GetDescendants()) do
        if o:IsA("Model") then
            local n=o.Name:lower()
            for _,t in ipairs(names) do
                if n==t:lower() or n:find(t:lower(),1,true) then
                    for _,p in ipairs(o:GetDescendants()) do
                        if p:IsA("BasePart") then
                            pcall(function() p.CanTouch=not state end)
                        end
                    end
                end
            end
        end
    end
end

task.spawn(function()
    while task.wait(C.BypassDelay) do
        pcall(function()
            if C.BypassEyes or C.BypassLookman then
                local m=RF and RF:FindFirstChild("MotorReplication")
                if m then m:FireServer(-(600+math.random(0,100))) end
            end
            if C.BypassSnare then byT({"Snare"},true) end
            if C.BypassKillbricks then byT({"Lava"},true) end
if C.BypassBanana then byT({"BananaPeel"},true) end
            if C.BypassSeekingWall then byT({"ScaryWall"},true) end
            if C.BypassDupe then byT({"DoorFake","FakeDoor"},true) end
            if C.BypassVacuum then byT({"SideroomSpace"},true) end
            if C.BypassGloombatEggs then byT({"Gloombat"},true) end
            if C.BypassSeekObstructions then byT({"SeekFloodline"},true) end
            if C.BypassJeff then byT({"JeffTheKiller"},true) end
            if C.AntiRansom then byT({"Ransom"},true) end
            if C.AntiClosetTrash then byT({"ClosetTrash"},true) end
        end)
    end
end)

-- ═══ ANTI-SCRIBBLES (hookmetamethod) ═══
local AntiScribbles_OldNamecall,AntiScribbles_IsHooked=false,false

local function HookAntiScribbles()
    if AntiScribbles_IsHooked then return end
    pcall(function()
        AntiScribbles_OldNamecall=hookmetamethod(game,"__namecall",function(self,...)
            local method=getnamecallmethod()
            if method=="FireServer" or method=="InvokeServer" then
                if tostring(self):lower():find("scribble") then return nil end
            end
            return AntiScribbles_OldNamecall(self,...)
        end)
        AntiScribbles_IsHooked=true
    end)
end

task.spawn(function()
    while task.wait(1) do
        if C.BypassGiggleArc then HookAntiScribbles() end
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
                        if o.Name:lower():find("figure") and o:IsA("Model") then
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

-- ═══ ENTITY FREEZE ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.EntityFreeze then
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Model") then
                    local n=o.Name:lower()
                    if n:find("rush") or n:find("ambush") or n:find("seek")
                    or n:find("figure") or n:find("screech") or n:find("halt")
                    or n:find("grumble") or n:find("giggle") then
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
            pcall(function()
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
            end)
        end
    end
end)

-- ═══ SLOW MOTION ═══
task.spawn(function()
    while task.wait(0.1) do
        if C.SlowMotion then
            pcall(function() workspace.Gravity=50 end)
        else
            pcall(function() workspace.Gravity=196.2 end)
        end
    end
end)

-- ═══ GOD RUSHER ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.GodRusher then
            local ch=LP.Character
            if ch then
                local h=ch:FindFirstChildOfClass("Humanoid")
                if h then h.Health=h.MaxHealth end
            end
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
                        local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true)
                        if p then
                            local d=(p.Position-pos).Magnitude
                            if (n:find("rush") or n:find("ambush")) and d<80 then
                                if not _G.isInsideCloset() then pcall(_G.aH) end
                                break
                            end
                            if n:find("seek") and d<50 then
                                if _G.isInsideCloset() and RF and RF:FindFirstChild("CamLock") then
                                    pcall(function() RF.CamLock:FireServer() end)
                                end
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
                    pcall(function()
                        if tool:IsA("Tool") and tool.Parent~=ch then
                            tool.Parent=ch
                        end
                    end)
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

print("[Burmalda v13] Part 4/8 — BYPASS + EXPLOITS loaded")
