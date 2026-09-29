-- BURMALDA v14 | Part 7/8 — FARM + FUN + SPAWN + ADMIN (Fake)
-- AutoFarm, Snow, Aura, Spawn, Fake Admin Panel

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local RF=_G.RF
local P=_G.P
local SS=_G.SS

local function getR()
    local ch=LP.Character
    return ch and ch:FindFirstChild("HumanoidRootPart")
end

-- ═══ AUTO COLLECT ═══
task.spawn(function()
    while task.wait(0.25) do
        if C.AutoCollect then
            local ch=LP.Character
            local r=getR()
            if r then
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") or o:IsA("BasePart") then
                        if P:GetPlayerFromCharacter(o) then continue end
                        if ch and ch:IsAncestorOf(o) then continue end
                        local n=o.Name:lower()
                        if n:find("crucifix") or n:find("lockpick") or n:find("bandage")
                        or n:find("flashlight") or n:find("lighter") or n:find("battery")
                        or n:find("vitamin") or n:find("candle") or n:find("skeleton")
                        or n:find("lantern") or n:find("shears") or n:find("scanner")
                        or n:find("coin") or n:find("gold") or n:find("key") then
                            local p=o:IsA("BasePart") and o or (o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true))
                            if p and (p.Position-r.Position).Magnitude<20 then
                                pcall(function() r.CFrame=CFrame.new(p.Position+Vector3.new(0,2,0)) end)
                                task.wait(0.05)
                                local prompt=o:FindFirstChildWhichIsA("ProximityPrompt",true)
                                    or (p.Parent and p.Parent:FindFirstChildWhichIsA("ProximityPrompt",true))
                                if prompt and prompt.Enabled then
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

-- ═══ AUTO COINS ═══
task.spawn(function()
    while task.wait(0.25) do
        if C.AutoCoins then
            local r=getR()
            if r then
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("BasePart") then
                        local n=o.Name:lower()
                        if n:find("coin") or n:find("gold") then
                            if (o.Position-r.Position).Magnitude<15 then
                                pcall(function() r.CFrame=CFrame.new(o.Position+Vector3.new(0,2,0)) end)
                                task.wait(0.05)
                                local prompt=o:FindFirstChildWhichIsA("ProximityPrompt",true)
                                    or (o.Parent and o.Parent:FindFirstChildWhichIsA("ProximityPrompt",true))
                                if prompt and prompt.Enabled then
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

-- ═══ AUTO DOOR ═══
task.spawn(function()
    while task.wait(0.25) do
        if C.AutoDoor then
            local r=getR()
            if r then
                local pos=r.Position
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("ProximityPrompt") and o.Enabled then
                        local a=(o.ActionText or ""):lower()
                        if a:find("open") or a:find("door") then
                            local par=o.Parent
                            local pp=par and (par:IsA("BasePart") and par or par:FindFirstChildWhichIsA("BasePart",true))
                            if pp and (pp.Position-pos).Magnitude<5 then
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

-- ═══ AUTO INTERACT ═══
task.spawn(function()
    while task.wait(0.25) do
        if C.AutoInteract then
            local r=getR()
            if r then
                local pos=r.Position
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("ProximityPrompt") and o.Enabled then
                        local par=o.Parent
                        local pp=par and (par:IsA("BasePart") and par or par:FindFirstChildWhichIsA("BasePart",true))
                        if pp and (pp.Position-pos).Magnitude<8 then
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
end)

-- ═══ AUTO CLOSET ═══
task.spawn(function()
    while task.wait(0.25) do
        if C.AutoCloset then
            local r=getR()
            if r then
                local pos=r.Position
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("ProximityPrompt") and o.Enabled then
                        local par=o.Parent
                        if par then
                            local n=(par.Name..(o.ActionText or "")..(o.ObjectText or "")):lower()
                            if n:find("closet") or n:find("hiding") then
                                local pp=par:IsA("BasePart") and par or par:FindFirstChildWhichIsA("BasePart",true)
                                if pp and (pp.Position-pos).Magnitude<10 then
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
    end
end)

-- ═══ AUTO BREAKER ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.AutoBreaker and RF then
            local r=getR()
            if r then
                local rooms=workspace:FindFirstChild("CurrentRooms")
                if rooms then
                    local b=rooms:FindFirstChild("ElevatorBreaker",true)
                    if b and b:IsA("Model") then
                        local bp=b.PrimaryPart or b:FindFirstChildWhichIsA("BasePart",true)
                        if bp and (bp.Position-r.Position).Magnitude<15 then
                            local eb=RF:FindFirstChild("EBF")
                            if eb then pcall(function() eb:FireServer() end) end
                        end
                    end
                end
            end
        end
    end
end)

-- ═══ AUTO FARM ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.AutoFarm or C.AutoFarmDeaths then
            if C.AutoPlayAgain and RF and RF:FindFirstChild("PlayAgain") then
                pcall(function() RF.PlayAgain:FireServer() end)
            end
        end
    end
end)

-- ═══ FARM DEATHS ═══
task.spawn(function()
    while task.wait(1) do
        if C.AutoFarmDeaths then
            local ch=LP.Character
            if ch then
                local h=ch:FindFirstChildOfClass("Humanoid")
                if h then pcall(function() h.Health=0 end) end
            end
            task.wait(C.FarmDelay)
            if RF and RF:FindFirstChild("PlayAgain") then
                pcall(function() RF.PlayAgain:FireServer() end)
            end
        end
    end
end)

-- ═══ FUN: SNOW / LEAVES / PETALS ═══
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local ch=LP.Character
            local root=ch and ch:FindFirstChild("HumanoidRootPart")
            if not root then return end
            if C.Snow then
                local p=Instance.new("Part",workspace)
                p.Size=Vector3.new(0.5,0.5,0.5)
                p.Color=Color3.fromRGB(255,255,255)
                p.CanCollide=false
                p.Position=root.Position+Vector3.new(math.random(-40,40),30,math.random(-40,40))
                game:GetService("Debris"):AddItem(p,5)
            end
            if C.Leaves then
                local p=Instance.new("Part",workspace)
                p.Size=Vector3.new(0.5,0.5,0.5)
                p.Color=Color3.fromRGB(80,180,60)
                p.CanCollide=false
                p.Position=root.Position+Vector3.new(math.random(-40,40),30,math.random(-40,40))
                game:GetService("Debris"):AddItem(p,5)
            end
            if C.Petals then
                local p=Instance.new("Part",workspace)
                p.Size=Vector3.new(0.5,0.5,0.5)
                p.Color=Color3.fromRGB(255,150,200)
                p.CanCollide=false
                p.Position=root.Position+Vector3.new(math.random(-40,40),30,math.random(-40,40))
                game:GetService("Debris"):AddItem(p,5)
            end
        end)
    end
end)

-- ═══ AURA ═══
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local ch=LP.Character
            if not ch then return end
            local root=ch:FindFirstChild("HumanoidRootPart")
            if not root then return end
            if C.AuraFire and not root:FindFirstChild("FireAura") then
                local att=Instance.new("Attachment",root)
                att.Name="FireAura"
                local f=Instance.new("Fire",att)
                f.Size=5
            end
            if C.AuraIce and not root:FindFirstChild("IceAura") then
                local att=Instance.new("Attachment",root)
                att.Name="IceAura"
                local s=Instance.new("Smoke",att)
                s.Color=Color3.fromRGB(150,200,255)
            end
        end)
    end
end)

-- ═══ CONFETTI ═══
_G.doConfetti=function()
    for i=1,50 do
        task.spawn(function()
            local ch=LP.Character
            if not ch or not ch:FindFirstChild("HumanoidRootPart") then return end
            local p=Instance.new("Part",workspace)
            p.Size=Vector3.new(0.5,0.5,0.5)
            p.Color=Color3.fromHSV(math.random(),1,1)
            p.CanCollide=false
            p.Position=ch.HumanoidRootPart.Position+Vector3.new(math.random(-30,30),20+math.random(0,20),math.random(-30,30))
            game:GetService("Debris"):AddItem(p,5)
        end)
    end
end

-- ═══ FIREWORKS ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.FunFire then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart") then
                for i=1,3 do
                    local p=Instance.new("Part",workspace)
                    p.Size=Vector3.new(0.5,0.5,0.5)
                    p.Color=Color3.fromHSV(math.random(),1,1)
                    p.Material=Enum.Material.Neon
                    p.CanCollide=false
                    p.Position=ch.HumanoidRootPart.Position+Vector3.new(math.random(-50,50),50+math.random(0,30),math.random(-50,50))
                    game:GetService("Debris"):AddItem(p,2)
                end
            end
        end
    end
end)

-- ═══ RANDOM TP ═══
_G.randomTP=function()
    local ch=LP.Character
    if ch and ch:FindFirstChild("HumanoidRootPart") then
        ch.HumanoidRootPart.CFrame=CFrame.new(math.random(-200,200),50,math.random(-200,200))
        N("Random TP")
    end
end

-- ═══ FAKE DEATH ═══
_G.fakeDeath=function()
    local ch=LP.Character
    local h=ch and ch:FindFirstChildOfClass("Humanoid")
    if h then h.Health=0 end
end

-- ═══ SPAWN VISUAL ═══
local spawnFolder=Instance.new("Folder",workspace)
spawnFolder.Name="BurmaldaSpawned"

_G.spawnVisual=function(color,size,shape)
    local ch=LP.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart") then return end
    local p=Instance.new("Part",spawnFolder)
    p.Size=size or Vector3.new(2,2,2)
    p.Shape=shape or Enum.PartType.Block
    p.Color=color or Color3.fromRGB(255,0,0)
    p.Position=ch.HumanoidRootPart.Position+Vector3.new(math.random(-5,5),3,math.random(-5,5))
    p.CanCollide=false
    p.Material=Enum.Material.Neon
    game:GetService("Debris"):AddItem(p,15)
end

_G.spawnRush=function() _G.spawnVisual(Color3.fromRGB(255,0,0),Vector3.new(5,5,5),Enum.PartType.Ball) end
_G.spawnAmbush=function() _G.spawnVisual(Color3.fromRGB(255,80,0),Vector3.new(5,5,5),Enum.PartType.Ball) end
_G.spawnSeek=function() _G.spawnVisual(Color3.fromRGB(150,0,255),Vector3.new(5,5,5),Enum.PartType.Ball) end
_G.spawnFigure=function() _G.spawnVisual(Color3.fromRGB(100,0,0),Vector3.new(5,5,5),Enum.PartType.Ball) end
_G.spawnCoin=function() _G.spawnVisual(Color3.fromRGB(255,215,0),Vector3.new(1.5,1.5,1.5),Enum.PartType.Ball) end
_G.spawnKey=function() _G.spawnVisual(Color3.fromRGB(255,255,100),Vector3.new(1,1,1),Enum.PartType.Block) end

-- ═══ FAKE ADMIN ACTIONS ═══
_G.fakeAdminAction=function(name, target)
    pcall(function()
        local s=Instance.new("Sound",SS)
        s.SoundId="rbxassetid://8784885431"
        s.Volume=0.8
        s:Play()
        task.delay(2,function() s:Destroy() end)
    end)
    N("[FAKE] "..name..(target and (" -> "..target) or ""))
end

_G.fakeAdminGiveItem=function(itemName)
    _G.fakeAdminAction("Give Item", itemName)
    pcall(function()
        local ch=LP.Character
        if ch and ch:FindFirstChild("HumanoidRootPart") then
            local p=Instance.new("Part",workspace)
            p.Size=Vector3.new(1,1,1)
            p.Shape=Enum.PartType.Ball
            p.Color=Color3.fromRGB(0,255,255)
            p.Material=Enum.Material.Neon
            p.CanCollide=false
            p.Position=ch.HumanoidRootPart.Position+Vector3.new(0,3,0)
            game:GetService("Debris"):AddItem(p,3)
        end
    end)
end

print("[Burmalda v14] Part 7/8 — FARM + FUN + SPAWN + ADMIN loaded")
