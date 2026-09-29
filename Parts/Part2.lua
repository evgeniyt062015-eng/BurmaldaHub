-- BURMALDA v15 | Part 2/14 — MAIN + CHARACTER
-- Fly, Noclip, Speed (FIX), InfJump (FIX), GodMode (FIX), BunnyHop

local C=_G.C
local T=_G.T
local N=_G.N
local TTS=_G.TTS
local LP=_G.LP
local Run=_G.Run
local UIS=_G.UIS
local VU=_G.VU
local RF=_G.RF
local P=_G.P

-- ═══ FLY (работающий) ═══
local FBV,FBG,FC
_G.setFly=function(s)
    local ch=LP.Character; if not ch then return end
    local hum=ch:FindFirstChildOfClass("Humanoid")
    local root=ch:FindFirstChild("HumanoidRootPart")
    if not root or not hum then return end
    if FBV then FBV:Destroy(); FBV=nil end
    if FBG then FBG:Destroy(); FBG=nil end
    if FC then FC:Disconnect(); FC=nil end
    if not s then hum.PlatformStand=false; return end
    FBV=Instance.new("BodyVelocity",root)
    FBV.MaxForce=Vector3.new(9e9,9e9,9e9)
    FBV.Velocity=Vector3.zero
    FBV.P=1250
    FBG=Instance.new("BodyGyro",root)
    FBG.MaxTorque=Vector3.new(9e9,9e9,9e9)
    FBG.P=1000; FBG.D=50
    FBG.CFrame=root.CFrame
    hum.PlatformStand=true
    FC=Run.RenderStepped:Connect(function()
        if not C.Fly then return end
        local c=LP.Character; if not c then return end
        local h=c:FindFirstChildOfClass("Humanoid")
        local r=c:FindFirstChild("HumanoidRootPart")
        if not r or not h then return end
        local cam=workspace.CurrentCamera
        local lookFlat=Vector3.new(cam.CFrame.LookVector.X,0,cam.CFrame.LookVector.Z)
        local flatFrame=CFrame.new(cam.CFrame.Position,cam.CFrame.Position+lookFlat)
        local dir=h.MoveDirection
        local v=(cam.CFrame*CFrame.new(flatFrame:VectorToObjectSpace(dir))).Position-cam.CFrame.Position
        if v.Magnitude>0 then v=v.Unit end
        local vert=0
        if UIS:IsKeyDown(Enum.KeyCode.Space) then vert=1
        elseif UIS:IsKeyDown(Enum.KeyCode.LeftShift) then vert=-1 end
        FBV.Velocity=v*C.FlySpeed+Vector3.new(0,vert*C.FlySpeed*0.5,0)
        FBG.CFrame=CFrame.new(r.Position,r.Position+lookFlat)
    end)
end

LP.CharacterAdded:Connect(function()
    task.wait(1)
    if C.Fly then _G.setFly(false); task.wait(0.1); _G.setFly(true) end
end)

-- ═══ NOCLIP ═══
local NC
_G.setNC=function(s)
    if NC then NC:Disconnect(); NC=nil end
    if not s then return end
    NC=Run.Stepped:Connect(function()
        local ch=LP.Character
        if ch then
            for _,p in ipairs(ch:GetDescendants()) do
                if p:IsA("BasePart") and p.CanCollide then p.CanCollide=false end
            end
        end
    end)
end

-- ═══ INFINITE JUMPS (ФИКС через UIS.JumpRequest) ═══
local InfJumpConn
_G.setInfJump=function(s)
    if InfJumpConn then InfJumpConn:Disconnect(); InfJumpConn=nil end
    if not s then return end
    InfJumpConn=UIS.JumpRequest:Connect(function()
        if not C.InfiniteJumps then return end
        local ch=LP.Character
        local h=ch and ch:FindFirstChildOfClass("Humanoid")
        if h then
            h:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end

LP.CharacterAdded:Connect(function()
    task.wait(1)
    if C.InfiniteJumps then _G.setInfJump(true) end
end)

-- ═══ SPEED (ФИКС через GetPropertyChangedSignal) ═══
local SpeedConn
_G.setSpeed=function(s)
    if SpeedConn then SpeedConn:Disconnect(); SpeedConn=nil end
    if not s then
        local ch=LP.Character
        local h=ch and ch:FindFirstChildOfClass("Humanoid")
        if h then h.WalkSpeed=16 end
        return
    end
    local function applySpeed()
        local ch=LP.Character
        local h=ch and ch:FindFirstChildOfClass("Humanoid")
        if not h then return end
        local sp=16
        if C.SpeedEnabled then sp=C.WalkSpeed+C.SpeedBoost end
        if C.Speed10x then sp=160 end
        if C.BunnyHop then sp=30 end
        if h.WalkSpeed~=sp then h.WalkSpeed=sp end
    end
    applySpeed()
    SpeedConn=Run.Heartbeat:Connect(function()
        if not C.SpeedEnabled and not C.Speed10x and not C.BunnyHop then return end
        applySpeed()
    end)
end

-- ═══ JUMP POWER ═══
_G.setJump=function(s)
    if not s then return end
    local ch=LP.Character
    local h=ch and ch:FindFirstChildOfClass("Humanoid")
    if h then
        h.JumpPower=C.JumpPower
        h.UseJumpPower=true
    end
end

-- ═══ ENABLE JUMP / SLIDE ═══
task.spawn(function()
    while task.wait(0.3) do
        local ch=LP.Character
        if ch then
            if C.EnableJump then pcall(function() ch:SetAttribute("CanJump",true) end) end
            if C.EnableSlide then pcall(function() ch:SetAttribute("CanSlide",true) end) end
        end
    end
end)

-- ═══ GOD MODE (ФИКС через HealthChanged) ═══
local GodConn
_G.setGodMode=function(s)
    if GodConn then GodConn:Disconnect(); GodConn=nil end
    if not s then return end
    local function hookGod()
        local ch=LP.Character
        local h=ch and ch:FindFirstChildOfClass("Humanoid")
        if not h then return end
        if GodConn then GodConn:Disconnect() end
        GodConn=h.HealthChanged:Connect(function(newHp)
            if not C.GodMode then return end
            if newHp<h.MaxHealth then
                h.Health=h.MaxHealth
            end
        end)
    end
    hookGod()
    LP.CharacterAdded:Connect(function()
        task.wait(1)
        if C.GodMode then hookGod() end
    end)
end

-- ═══ BUNNY HOP ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.BunnyHop then
            local ch=LP.Character
            local h=ch and ch:FindFirstChildOfClass("Humanoid")
            if h and h.MoveDirection.Magnitude>0 then
                pcall(function()
                    h:ChangeState(Enum.HumanoidStateType.Jumping)
                end)
            end
        end
    end
end)

-- ═══ REMOVE CLOSET DELAY ═══
task.spawn(function()
    while task.wait(1) do
        if C.RemoveClosetDelay then
            pcall(function()
                local ch=LP.Character
                if ch then
                    for _,o in ipairs(ch:GetDescendants()) do
                        if o:IsA("NumberValue") and o.Name:lower():find("delay") then
                            o.Value=0
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ REMOVE ACCELERATION ═══
task.spawn(function()
    while task.wait(1) do
        if C.RemoveAccel then
            pcall(function()
                local ch=LP.Character
                if ch then
                    for _,p in ipairs(ch:GetDescendants()) do
                        if p:IsA("BasePart") then
                            p.CustomPhysicalProperties=PhysicalProperties.new(0.7,0.3,0.5,1,1)
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ PROMPTS (InstantPrompts, PromptClip, DoorReach) ═══
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("ProximityPrompt") then
                    if C.InstantPrompts then o.HoldDuration=0 end
                    if C.PromptClip then o.RequiresLineOfSight=false end
                    if C.DoorReach then
                        o.MaxActivationDistance=math.max(o.MaxActivationDistance or 5,15)*C.PromptReach
                    end
                end
            end
        end)
    end
end)

-- ═══ ANTI-AFK ═══
LP.Idled:Connect(function()
    if C.DisableIdleKick then
        pcall(function()
            VU:CaptureController()
            VU:ClickButton2(Vector2.new())
        end)
    end
end)

task.spawn(function()
    while task.wait(60) do
        if C.AntiAFK then
            pcall(function()
                VU:CaptureController()
                VU:ClickButton2(Vector2.new())
            end)
        end
    end
end)

print("[Burmalda v15] Part 2/14 — MAIN + CHARACTER loaded")
