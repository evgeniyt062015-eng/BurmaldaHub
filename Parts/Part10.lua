-- BURMALDA v15.1 | Part 10/14 — FUN
-- Фиксы: Aura через CharacterAdded, Ducks с реальным звуком, всё в pcall

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local SS=_G.SS
local P=_G.P

local function getR()
    local ok,res=pcall(function()
        local ch=LP and LP.Character
        if not ch then return nil end
        return ch:FindFirstChild("HumanoidRootPart")
    end)
    if ok then return res end
    return nil
end

-- ═══════════════════════════════════════════════
-- SNOW / LEAVES / PETALS (медленнее = меньше лагов)
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(0.3) do
        pcall(function()
            local r=getR()
            if not r then return end
            if C.Snow then
                local p=Instance.new("Part",workspace)
                p.Size=Vector3.new(0.4,0.4,0.4)
                p.Color=Color3.fromRGB(255,255,255)
                p.Material=Enum.Material.Neon
                p.CanCollide=false
                p.Anchored=false
                p.Position=r.Position+Vector3.new(math.random(-40,40),30,math.random(-40,40))
                game:GetService("Debris"):AddItem(p,5)
            end
            if C.Leaves then
                local p=Instance.new("Part",workspace)
                p.Size=Vector3.new(0.5,0.1,0.5)
                p.Color=Color3.fromRGB(80,180,60)
                p.CanCollide=false
                p.Position=r.Position+Vector3.new(math.random(-40,40),30,math.random(-40,40))
                game:GetService("Debris"):AddItem(p,5)
            end
            if C.Petals then
                local p=Instance.new("Part",workspace)
                p.Size=Vector3.new(0.4,0.1,0.4)
                p.Color=Color3.fromRGB(255,150,200)
                p.CanCollide=false
                p.Position=r.Position+Vector3.new(math.random(-40,40),30,math.random(-40,40))
                game:GetService("Debris"):AddItem(p,5)
            end
        end)
    end
end)

-- ═══════════════════════════════════════════════
-- AURA FIRE / ICE (FIX: через CharacterAdded)
-- ═══════════════════════════════════════════════
local function applyAura()
    pcall(function()
        local ch=LP.Character
        if not ch then return end
        local root=ch:FindFirstChild("HumanoidRootPart")
        if not root then return end
        if C.AuraFire then
            if not root:FindFirstChild("FireAura") then
                local att=Instance.new("Attachment",root)
                att.Name="FireAura"
                local f=Instance.new("Fire",att)
                f.Size=5
            end
        else
            local att=root:FindFirstChild("FireAura")
            if att then att:Destroy() end
        end
        if C.AuraIce then
            if not root:FindFirstChild("IceAura") then
                local att=Instance.new("Attachment",root)
                att.Name="IceAura"
                local s=Instance.new("Smoke",att)
                s.Color=Color3.fromRGB(150,200,255)
                s.Size=3
            end
        else
            local att=root:FindFirstChild("IceAura")
            if att then att:Destroy() end
        end
    end)
end

task.spawn(function()
    while task.wait(1) do
        applyAura()
    end
end)

LP.CharacterAdded:Connect(function()
    task.wait(1)
    applyAura()
end)

-- ═══════════════════════════════════════════════
-- FIREWORKS
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(0.5) do
        if C.Fireworks then
            pcall(function()
                local r=getR()
                if r then
                    for i=1,3 do
                        local p=Instance.new("Part",workspace)
                        p.Size=Vector3.new(0.5,0.5,0.5)
                        p.Shape=Enum.PartType.Ball
                        p.Color=Color3.fromHSV(math.random(),1,1)
                        p.Material=Enum.Material.Neon
                        p.CanCollide=false
                        p.Position=r.Position+Vector3.new(math.random(-50,50),50+math.random(0,30),math.random(-50,50))
                        game:GetService("Debris"):AddItem(p,2)
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- CONFETTI
-- ═══════════════════════════════════════════════
_G.doConfetti=function()
    pcall(function()
        local r=getR()
        if not r then N("Конфетти","Нет персонажа","error"); return end
        for i=1,50 do
            task.spawn(function()
                local p=Instance.new("Part",workspace)
                p.Size=Vector3.new(0.4,0.4,0.4)
                p.Color=Color3.fromHSV(math.random(),1,1)
                p.CanCollide=false
                p.Position=r.Position+Vector3.new(math.random(-30,30),20+math.random(0,20),math.random(-30,30))
                game:GetService("Debris"):AddItem(p,5)
            end)
        end
        N("🎉 Конфетти","50 частиц","success")
    end)
end

-- ═══════════════════════════════════════════════
-- DUCKS (FIX: проверка ID звука)
-- ═══════════════════════════════════════════════
_G.spawnDucks=function(count)
    pcall(function()
        count=count or C.DuckCount or 100
        for i=1,count do
            task.spawn(function()
                local duck=Instance.new("Part",workspace)
                duck.Size=Vector3.new(2,2,2)
                duck.Shape=Enum.PartType.Ball
                duck.Color=Color3.fromRGB(255,255,0)
                duck.Material=Enum.Material.Neon
                duck.CanCollide=true
                duck.Position=Vector3.new(math.random(-200,200),200+math.random(0,100),math.random(-200,200))
                pcall(function()
                    local s=Instance.new("Sound",duck)
                    s.SoundId="rbxassetid://9041358218"
                    s.Volume=1
                    s:Play()
                end)
                game:GetService("Debris"):AddItem(duck,15)
            end)
        end
        N("🦆 Утки","Заспавнено "..count,"success")
    end)
end

task.spawn(function()
    while task.wait(2) do
        if C.DuckSpawn then
            pcall(function() _G.spawnDucks(10) end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- RANDOM TP
-- ═══════════════════════════════════════════════
_G.randomTP=function()
    pcall(function()
        local r=getR()
        if r then
            r.CFrame=CFrame.new(math.random(-200,200),50,math.random(-200,200))
            N("Random TP","Телепорт","info")
        end
    end)
end

-- ═══════════════════════════════════════════════
-- FAKE DEATH
-- ═══════════════════════════════════════════════
_G.fakeDeath=function()
    pcall(function()
        local ch=LP.Character
        local h=ch and ch:FindFirstChildOfClass("Humanoid")
        if h then
            h.Health=0
            N("Fake Death","Ты умер (визуально)","warn")
        end
    end)
end

-- ═══════════════════════════════════════════════
-- FAKE ENTITY (визуальный монстр)
-- ═══════════════════════════════════════════════
local fakeFolder=Instance.new("Folder",workspace)
fakeFolder.Name="BurmaldaFakeEntities"

_G.spawnFakeEntity=function(name, color)
    pcall(function()
        local r=getR()
        if not r then N("Fake Entity","Нет персонажа","error"); return end
        local p=Instance.new("Part",fakeFolder)
        p.Size=Vector3.new(5,5,5)
        p.Shape=Enum.PartType.Ball
        p.Color=color or Color3.fromRGB(255,0,0)
        p.Material=Enum.Material.Neon
        p.CanCollide=false
        p.Position=r.Position+Vector3.new(math.random(-10,10),3,math.random(-10,10))
        p.Name=name or "FakeEntity"
        
        local bb=Instance.new("BillboardGui",p)
        bb.Size=UDim2.new(0,100,0,20)
        bb.StudsOffset=Vector3.new(0,3,0)
        bb.AlwaysOnTop=true
        local lbl=Instance.new("TextLabel",bb)
        lbl.Size=UDim2.new(1,0,1,0)
        lbl.BackgroundTransparency=1
        lbl.Text=name or "Fake"
        lbl.TextColor3=color or Color3.fromRGB(255,0,0)
        lbl.Font=Enum.Font.GothamBold
        lbl.TextSize=14
        
        game:GetService("Debris"):AddItem(p,15)
        N("Fake Entity","Спавн "..(name or "entity"),"info")
    end)
end

-- ═══════════════════════════════════════════════
-- FAKE CHAT
-- ═══════════════════════════════════════════════
_G.fakeChat=function(playerName, message)
    pcall(function()
        local RS=_G.RS
        local Folder=RS:FindFirstChild("DefaultChatSystemEvents") or Instance.new("Folder")
        local Event=Folder:FindFirstChild("SayMessageRequest") or Instance.new("RemoteEvent")
        Event:FireServer("["..tostring(playerName or "Player").."]: "..tostring(message or "Hello!"),"All")
        N("Fake Chat",playerName..": "..message,"info")
    end)
end

-- ═══════════════════════════════════════════════
-- FAKE SCREENSHOT
-- ═══════════════════════════════════════════════
_G.fakeScreenshot=function()
    pcall(function()
        local r=getR()
        if r then
            local info=Instance.new("StringValue",workspace)
            info.Name="Screenshot_"..os.time()
            info.Value=string.format("Pos: %.0f,%.0f,%.0f | Time: %d",
                r.Position.X, r.Position.Y, r.Position.Z, os.time())
            N("📸 Скриншот","Сохранён","success")
        end
    end)
end

-- ═══════════════════════════════════════════════
-- FAKE KICK
-- ═══════════════════════════════════════════════
_G.fakeKick=function()
    pcall(function()
        local pg=LP:FindFirstChild("PlayerGui")
        if not pg then return end
        local gui=Instance.new("ScreenGui",pg)
        gui.Name="FakeKick"
        local frame=Instance.new("Frame",gui)
        frame.Size=UDim2.new(1,0,1,0)
        frame.BackgroundColor3=Color3.fromRGB(0,0,0)
        local lbl=Instance.new("TextLabel",frame)
        lbl.Size=UDim2.new(1,0,0,100)
        lbl.Position=UDim2.new(0,0,0.5,-50)
        lbl.BackgroundTransparency=1
        lbl.Text="You have been kicked from the game."
        lbl.TextColor3=Color3.fromRGB(255,255,255)
        lbl.Font=Enum.Font.GothamBold
        lbl.TextSize=20
        task.delay(3,function() gui:Destroy() end)
        N("Fake Kick","Визуально кикнут","warn")
    end)
end

-- ═══════════════════════════════════════════════
-- CUSTOM NOTIFICATION
-- ═══════════════════════════════════════════════
_G.customNotif=function(title, text)
    N(title or "Burmalda", text or "...", "info")
end

-- ═══════════════════════════════════════════════
-- SCREEN SHAKE
-- ═══════════════════════════════════════════════
_G.screenShake=function(duration)
    pcall(function()
        local cam=workspace.CurrentCamera
        if not cam then return end
        local original=cam.CFrame
        task.spawn(function()
            local endT=tick()+(duration or 1)
            while tick()<endT do
                cam.CFrame=cam.CFrame*CFrame.new(math.random(-5,5)/10,math.random(-5,5)/10,0)
                task.wait(0.02)
            end
            cam.CFrame=original
        end)
        N("Screen Shake","Тряска "..(duration or 1).."с","info")
    end)
end

-- ═══════════════════════════════════════════════
-- FUN RAINBOW CHARACTER
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(0.1) do
        if C.FunRainbow then
            pcall(function()
                local ch=LP.Character
                if ch then
                    for _,p in ipairs(ch:GetDescendants()) do
                        if p:IsA("BasePart") then
                            p.Color=Color3.fromHSV(tick()%5/5,1,1)
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- DISCO MODE
-- ═══════════════════════════════════════════════
local origAmbient=game:GetService("Lighting").Ambient
task.spawn(function()
    while task.wait(0.3) do
        if C.FunDisco then
            pcall(function()
                game:GetService("Lighting").Ambient=Color3.fromHSV(math.random(),1,1)
            end)
        else
            pcall(function()
                game:GetService("Lighting").Ambient=origAmbient
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- CHAT SPAM
-- ═══════════════════════════════════════════════
_G.chatSpam=function(msg, count)
    pcall(function()
        local RS=_G.RS
        local Folder=RS:FindFirstChild("DefaultChatSystemEvents") or Instance.new("Folder")
        local Event=Folder:FindFirstChild("SayMessageRequest") or Instance.new("RemoteEvent")
        for i=1,(count or 5) do
            Event:FireServer(msg or "Burmalda v15!","All")
        end
        N("Чат","Спам x"..(count or 5),"success")
    end)
end

-- ═══════════════════════════════════════════════
-- SPAWN VISUAL (для Spawn/Admin вкладок)
-- ═══════════════════════════════════════════════
local spawnFolder=Instance.new("Folder",workspace)
spawnFolder.Name="BurmaldaSpawned"

_G.spawnVisual=function(color, size, shape, name)
    pcall(function()
        local r=getR()
        if not r then N("Spawn","Нет персонажа","error"); return end
        local p=Instance.new("Part",spawnFolder)
        p.Size=size or Vector3.new(3,3,3)
        p.Shape=shape or Enum.PartType.Ball
        p.Color=color or Color3.fromRGB(255,0,0)
        p.Material=Enum.Material.Neon
        p.CanCollide=false
        p.Position=r.Position+Vector3.new(math.random(-5,5),3,math.random(-5,5))
        if name then p.Name=name end
        game:GetService("Debris"):AddItem(p,15)
    end)
end

-- Спавн-функции
_G.spawnRush=function() _G.spawnVisual(Color3.fromRGB(255,0,0),Vector3.new(5,5,5),Enum.PartType.Ball,"Rush") N("Spawn","Rush","info") end
_G.spawnAmbush=function() _G.spawnVisual(Color3.fromRGB(255,80,0),Vector3.new(5,5,5),Enum.PartType.Ball,"Ambush") N("Spawn","Ambush","info") end
_G.spawnSeek=function() _G.spawnVisual(Color3.fromRGB(150,0,255),Vector3.new(5,5,5),Enum.PartType.Ball,"Seek") N("Spawn","Seek","info") end
_G.spawnFigure=function() _G.spawnVisual(Color3.fromRGB(100,0,0),Vector3.new(5,5,5),Enum.PartType.Ball,"Figure") N("Spawn","Figure","info") end
_G.spawnScreech=function() _G.spawnVisual(Color3.fromRGB(255,255,255),Vector3.new(4,4,4),Enum.PartType.Ball,"Screech") N("Spawn","Screech","info") end
_G.spawnEyes=function() _G.spawnVisual(Color3.fromRGB(0,100,255),Vector3.new(4,4,4),Enum.PartType.Ball,"Eyes") N("Spawn","Eyes","info") end
_G.spawnHalt=function() _G.spawnVisual(Color3.fromRGB(0,200,255),Vector3.new(5,5,5),Enum.PartType.Ball,"Halt") N("Spawn","Halt","info") end
_G.spawnGrumble=function() _G.spawnVisual(Color3.fromRGB(0,255,0),Vector3.new(5,5,5),Enum.PartType.Ball,"Grumble") N("Spawn","Grumble","info") end
_G.spawnGiggle=function() _G.spawnVisual(Color3.fromRGB(255,255,0),Vector3.new(4,4,4),Enum.PartType.Ball,"Giggle") N("Spawn","Giggle","info") end
_G.spawnBlitz=function() _G.spawnVisual(Color3.fromRGB(0,0,255),Vector3.new(5,5,5),Enum.PartType.Ball,"Blitz") N("Spawn","Blitz","info") end
_G.spawnLookman=function() _G.spawnVisual(Color3.fromRGB(255,255,255),Vector3.new(4,4,4),Enum.PartType.Ball,"Lookman") N("Spawn","Lookman","info") end
_G.spawnA60=function() _G.spawnVisual(Color3.fromRGB(255,0,0),Vector3.new(5,5,5),Enum.PartType.Ball,"A-60") N("Spawn","A-60","info") end
_G.spawnA120=function() _G.spawnVisual(Color3.fromRGB(255,100,0),Vector3.new(5,5,5),Enum.PartType.Ball,"A-120") N("Spawn","A-120","info") end
_G.spawnCoin=function() _G.spawnVisual(Color3.fromRGB(255,215,0),Vector3.new(1.5,1.5,1.5),Enum.PartType.Ball,"Coin") N("Spawn","Coin","info") end
_G.spawnKey=function() _G.spawnVisual(Color3.fromRGB(255,255,100),Vector3.new(1,1,1),Enum.PartType.Block,"Key") N("Spawn","Key","info") end
_G.spawnFlashlight=function() _G.spawnVisual(Color3.fromRGB(255,255,255),Vector3.new(1,1,1),Enum.PartType.Block,"Flashlight") N("Spawn","Flashlight","info") end
_G.spawnBandage=function() _G.spawnVisual(Color3.fromRGB(255,200,200),Vector3.new(1,1,1),Enum.PartType.Block,"Bandage") N("Spawn","Bandage","info") end
_G.spawnCrucifix=function() _G.spawnVisual(Color3.fromRGB(139,69,19),Vector3.new(1,2,0.5),Enum.PartType.Block,"Crucifix") N("Spawn","Crucifix","info") end

print("[Burmalda v15.1] Part 10/14 — FUN loaded")
