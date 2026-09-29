-- BURMALDA v13 | Part 2/8 — MAIN + CHARACTER
-- Fly, Noclip, Speed, Inf Jump, GodMode, Revive, RemoveDelay

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

-- ═══ FLY ═══
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

-- ═══ INFINITE JUMPS ═══
local infJumpConn
_G.setInfJump=function(s)
    if infJumpConn then infJumpConn:Disconnect(); infJumpConn=nil end
    if not s then return end
    local ch=LP.Character; if not ch then return end
    local h=ch:FindFirstChildOfClass("Humanoid"); if not h then return end
    infJumpConn=h.StateChanged:Connect(function(o,n)
        if n==Enum.HumanoidStateType.Freefall and C.InfiniteJumps then
            task.wait(0.01)
            h:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end

LP.CharacterAdded:Connect(function()
    task.wait(1)
    if C.InfiniteJumps then _G.setInfJump(true) end
end)

-- ═══ SPEED / JUMP LOOP ═══
task.spawn(function()
    while task.wait(0.5) do
        local ch=LP.Character
        local h=ch and ch:FindFirstChildOfClass("Humanoid")
        if h then
            local sp=16
            if C.SpeedEnabled then sp=C.WalkSpeed+C.SpeedBoost end
            if C.Speed10x then sp=160 end
            if C.BunnyHop then sp=30 end
            h.WalkSpeed=sp
            h.JumpPower=C.JumpPower
            h.UseJumpPower=true
        end
        if ch then
            if C.EnableJump then pcall(function() ch:SetAttribute("CanJump",true) end) end
            if C.EnableSlide then pcall(function() ch:SetAttribute("CanSlide",true) end) end
        end
    end
end)

-- ═══ GOD MODE ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.GodMode then
            local ch=LP.Character
local h=ch and ch:FindFirstChildOfClass("Humanoid")
            if h and h.Health<h.MaxHealth then
                pcall(function() h.Health=h.MaxHealth end)
            end
        end
    end
end)

-- ═══ INFINITE REVIVE ═══
task.spawn(function()
    while task.wait(1) do
        if C.InfiniteRevive and RF then
            pcall(function()
                local r=RF:FindFirstChild("Revive")
                if r then r:FireServer() end
            end)
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

-- ═══ PROMPT LOOP (InstantPrompts, PromptClip, DoorReach) ═══
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

print("[Burmalda v13] Part 2/8 — MAIN + CHARACTER loaded")
