-- BURMALDA v14 | Part 4/8 — BYPASS + EXPLOITS
-- 18 Bypass + GodMode, Revive, TimeStop, Dodge, Freeze

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local RF=_G.RF
local P=_G.P

-- ═══ HELPERS ═══
local function getPart(o)
    if o:IsA("BasePart") then return o end
    if o.PrimaryPart then return o.PrimaryPart end
    return o:FindFirstChildWhichIsA("BasePart",true)
end

local function getAllParts(model)
    return model:GetDescendants()
end

-- ═══ BYPASS CORE — по имени модели ═══
local function bypassModel(namePattern, disableTouch, disableCollide)
    for _,o in ipairs(workspace:GetDescendants()) do
        if o:IsA("Model") or o:IsA("BasePart") then
            local n=o.Name:lower()
            if n:find(namePattern,1,true) then
                for _,p in ipairs(o:GetDescendants()) do
                    if p:IsA("BasePart") then
                        if disableTouch then pcall(function() p.CanTouch=false end) end
                        if disableCollide then pcall(function() p.CanCollide=false end) end
                    end
                end
            end
        end
    end
end

-- ═══ BYPASS LOOP ═══
task.spawn(function()
    while task.wait(0.3) do
        pcall(function()
            if C.BypassRush then bypassModel("rush",true,true) end
            if C.BypassAmbush then bypassModel("ambush",true,true) end
            if C.BypassSeek then bypassModel("seek",true,false) end
            if C.BypassFigure then bypassModel("figure",true,true) end
            if C.BypassGrumble then bypassModel("grumble",true,false) end
            if C.BypassDrones then bypassModel("drones",true,false) end
            if C.BypassScreech then bypassModel("screech",true,false) end
            if C.BypassHalt then bypassModel("halt",true,false) end
            if C.BypassSnare then bypassModel("snare",true,false) end
            if C.BypassKillbricks then bypassModel("lava",true,false) end
            if C.BypassSeekingWall then bypassModel("scarywall",true,true) end
            if C.BypassBanana then bypassModel("bananapeel",true,false) end
            if C.BypassDupe then bypassModel("fakedoor",true,false) end
            if C.BypassVacuum then bypassModel("sideroomspace",true,true) end
            if C.BypassGloombatEggs then bypassModel("gloombat",true,false) end
            if C.BypassSeekObstructions then bypassModel("seekfloodline",true,false) end
            if C.BypassJeff then bypassModel("jeffthekiller",true,true) end
            if C.AntiRansom then bypassModel("ransom",true,false) end
            if C.AntiClosetTrash then bypassModel("closettrah",true,false) end
        end)
    end
end)

-- ═══ BYPASS EYES / LOOKMAN ═══
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

-- ═══ ENTITY FREEZE ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.EntityFreeze then
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Model") then
                    local n=o.Name:lower()
                    if n:find("rush") or n:find("ambush") or n:find("seek")
                    or n:find("figure") or n:find("screech") or n:find("halt")
                    or n:find("grumble") or n:find("giggle") or n:find("blitz") then
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
local origGrav=workspace.Gravity
task.spawn(function()
    while task.wait(0.2) do
        if C.SlowMotion then
            if workspace.Gravity~=50 then workspace.Gravity=50 end
        else
            if workspace.Gravity~=196.2 then workspace.Gravity=196.2 end
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
                if h and h.Health<h.MaxHealth then h.Health=h.MaxHealth end
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
                        local p=getPart(o)
                        if p then
                            local d=(p.Position-pos).Magnitude
                            if (n:find("rush") or n:find("ambush")) and d<80 then
                                if not _G.isInsideCloset() and _G.aH then pcall(_G.aH) end
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

print("[Burmalda v14] Part 4/8 — BYPASS + EXPLOITS loaded")
