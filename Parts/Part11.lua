-- BURMALDA v15.1 | Part 11/14 — ADMIN (Fake Panel)
-- 40+ кнопок, всё FAKE кроме spawn, уведомления с типами, всё в pcall

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

local function playFakeSound()
    pcall(function()
        local s=Instance.new("Sound",SS)
        s.SoundId="rbxassetid://8784885431"
        s.Volume=0.8
        s:Play()
        task.delay(2,function() s:Destroy() end)
    end)
end

-- ═══ ОСНОВНАЯ FAKE ФУНКЦИЯ ═══
_G.fakeAdminAction=function(name, extra)
    playFakeSound()
    N("👑 [ADMIN] "..tostring(name), tostring(extra or "Выполнено"), "warn")
end

-- ═══════════════════════════════════════════════
-- УПРАВЛЕНИЕ ИГРОКАМИ
-- ═══════════════════════════════════════════════
_G.fakeKickAll=function()
    local count=#P:GetPlayers()-1
    _G.fakeAdminAction("Kick All", "Кикнуто: "..count)
end

_G.fakeBanPlayer=function(playerName)
    _G.fakeAdminAction("Ban Player", tostring(playerName or "selected"))
end

_G.fakeBanAll=function()
    _G.fakeAdminAction("Ban All", "Забанено: "..(#P:GetPlayers()-1))
end

_G.fakeFreezeAll=function()
    _G.fakeAdminAction("Freeze All", "Заморожены")
end

_G.fakeUnfreezeAll=function()
    _G.fakeAdminAction("Unfreeze All", "Разморожены")
end

_G.fakeGiveGodmodeAll=function()
    _G.fakeAdminAction("Give Godmode All", "Выдан")
end

_G.fakeForceRespawnAll=function()
    _G.fakeAdminAction("Force Respawn All", "Возрождены")
end

-- ═══════════════════════════════════════════════
-- СЕРВЕР
-- ═══════════════════════════════════════════════
_G.fakeServerShutdown=function()
    _G.fakeAdminAction("Server Shutdown", "Начинаем отсчёт...")
    task.spawn(function()
        for i=10,1,-1 do
            N("⚠️ Сервер","Отключение через "..i.."с","error")
            task.wait(1)
        end
        N("❌ [FAKE]","Сервер бы выключился","error")
    end)
end

_G.fakeRestartRun=function()
    _G.fakeAdminAction("Restart Run", "Перезапуск")
end

_G.fakeAnnounce=function(message)
    _G.fakeAdminAction("Announce", tostring(message or "..."))
end

_G.fakeClearRoom=function()
    _G.fakeAdminAction("Clear Room", "Комната очищена")
end

_G.fakeDeleteAllEntities=function()
    _G.fakeAdminAction("Delete All Entities", "Удалены")
end

-- ═══════════════════════════════════════════════
-- GIVE ITEMS (FAKE + визуал)
-- ═══════════════════════════════════════════════
_G.fakeGiveItem=function(itemName)
    _G.fakeAdminAction("Give Item", tostring(itemName))
    pcall(function()
        local r=getR()
        if r then
            local p=Instance.new("Part",workspace)
            p.Size=Vector3.new(1,1,1)
            p.Shape=Enum.PartType.Ball
            p.Color=Color3.fromRGB(0,255,255)
            p.Material=Enum.Material.Neon
            p.CanCollide=false
            p.Position=r.Position+Vector3.new(0,3,0)
            game:GetService("Debris"):AddItem(p,3)
        end
    end)
end

_G.fakeGiveAllItems=function()
    local items={"Flashlight","Lockpick","Bandage","Vitamins","Crucifix","Lighter","Battery","Candle","Skeleton Key","Shears","Scanner","Compass","Lantern","Shakelight","Straplight","Bulklight"}
    for i,item in ipairs(items) do
        task.spawn(function()
            task.wait(i*0.15)
            _G.fakeGiveItem(item)
        end)
    end
end

-- ═══════════════════════════════════════════════
-- SPAWN ENTITIES (РЕАЛЬНО работает)
-- ═══════════════════════════════════════════════
local function safeSpawn(fn, name)
    if type(fn)=="function" then
        pcall(fn)
        _G.fakeAdminAction("Spawn "..name)
    else
        N("Spawn", name.." недоступен","error")
    end
end

_G.adminSpawnRush=function() safeSpawn(_G.spawnRush,"Rush") end
_G.adminSpawnAmbush=function() safeSpawn(_G.spawnAmbush,"Ambush") end
_G.adminSpawnSeek=function() safeSpawn(_G.spawnSeek,"Seek") end
_G.adminSpawnFigure=function() safeSpawn(_G.spawnFigure,"Figure") end
_G.adminSpawnScreech=function() safeSpawn(_G.spawnScreech,"Screech") end
_G.adminSpawnEyes=function() safeSpawn(_G.spawnEyes,"Eyes") end
_G.adminSpawnHalt=function() safeSpawn(_G.spawnHalt,"Halt") end
_G.adminSpawnGrumble=function() safeSpawn(_G.spawnGrumble,"Grumble") end
_G.adminSpawnGiggle=function() safeSpawn(_G.spawnGiggle,"Giggle") end
_G.adminSpawnBlitz=function() safeSpawn(_G.spawnBlitz,"Blitz") end
_G.adminSpawnLookman=function() safeSpawn(_G.spawnLookman,"Lookman") end
_G.adminSpawnA60=function() safeSpawn(_G.spawnA60,"A-60") end
_G.adminSpawnA120=function() safeSpawn(_G.spawnA120,"A-120") end

_G.adminSpawnCustom=function(name)
    pcall(function()
        if _G.spawnVisual then
            _G.spawnVisual(Color3.fromRGB(255,0,255),Vector3.new(5,5,5),Enum.PartType.Ball,name or "Custom")
        end
        _G.fakeAdminAction("Spawn Custom", name)
    end)
end

-- ═══════════════════════════════════════════════
-- SPAWN ITEMS
-- ═══════════════════════════════════════════════
_G.adminSpawnCoin=function() safeSpawn(_G.spawnCoin,"Coin") end
_G.adminSpawnKey=function() safeSpawn(_G.spawnKey,"Key") end
_G.adminSpawnFlashlight=function() safeSpawn(_G.spawnFlashlight,"Flashlight") end
_G.adminSpawnBandage=function() safeSpawn(_G.spawnBandage,"Bandage") end
_G.adminSpawnCrucifix=function() safeSpawn(_G.spawnCrucifix,"Crucifix") end

-- ═══════════════════════════════════════════════
-- ОПАСНОЕ (FAKE)
-- ═══════════════════════════════════════════════
_G.fakeKillSelf=function()
    _G.fakeAdminAction("Kill Self")
    pcall(function()
        local ch=LP.Character
        local h=ch and ch:FindFirstChildOfClass("Humanoid")
        if h then h.Health=0 end
    end)
end

_G.fakeDeleteServer=function()
    _G.fakeAdminAction("Delete Server", "Сервер удалён")
end

_G.fakeBanSelf=function()
    _G.fakeAdminAction("Ban Self", "Ты бы был забанен")
end

_G.fakeCrashGame=function()
    _G.fakeAdminAction("Crash Game", "Начинаем...")
    task.spawn(function()
        N("⚠️ Crash","5...","error")
        for i=5,1,-1 do
            N("⚠️ Crash",tostring(i),"error")
            task.wait(1)
        end
        N("❌ [FAKE]","Just kidding :)","warn")
    end)
end

-- ═══════════════════════════════════════════════
-- MISC — Gold Name
-- ═══════════════════════════════════════════════
_G.fakeGoldName=function()
    _G.fakeAdminAction("Gold Name")
    pcall(function()
        local ch=LP.Character
        if ch then
            local head=ch:FindFirstChild("Head")
            if head then
                local gui=head:FindFirstChild("BurmaldaName")
                if not gui then
                    gui=Instance.new("BillboardGui",head)
                    gui.Name="BurmaldaName"
                    gui.Size=UDim2.new(0,100,0,30)
                    gui.StudsOffset=Vector3.new(0,3,0)
                    gui.AlwaysOnTop=true
                end
                local lbl=gui:FindFirstChildOfClass("TextLabel")
                if not lbl then
                    lbl=Instance.new("TextLabel",gui)
                    lbl.Size=UDim2.new(1,0,1,0)
                    lbl.BackgroundTransparency=1
                    lbl.Font=Enum.Font.GothamBold
                    lbl.TextSize=14
                end
                lbl.Text=LP.Name
                lbl.TextColor3=Color3.fromRGB(255,215,0)
                lbl.TextStrokeColor3=Color3.fromRGB(0,0,0)
                lbl.TextStrokeTransparency=0
            end
        end
    end)
end

_G.fakeRainbowName=function()
    _G.fakeAdminAction("Rainbow Name")
    task.spawn(function()
        for i=1,30 do
            pcall(function()
                local ch=LP.Character
                if ch then
                    local head=ch:FindFirstChild("Head")
                    if head then
                        local gui=head:FindFirstChild("BurmaldaName")
                        if gui then
                            local lbl=gui:FindFirstChildOfClass("TextLabel")
                            if lbl then
                                lbl.TextColor3=Color3.fromHSV(i/30,1,1)
                            end
                        end
                    end
                end
            end)
            task.wait(0.1)
        end
    end)
end

-- ═══════════════════════════════════════════════
-- GIVE ALL ITEMS для adminGiveAllItems
-- ═══════════════════════════════════════════════
_G.adminGiveAllItems=function()
    _G.fakeGiveAllItems()
end

-- ═══════════════════════════════════════════════
-- ADMIN PANEL — открытие (заглушка)
-- ═══════════════════════════════════════════════
_G.openAdminPanel=function()
    N("👑 Admin Panel","Открыта вкладка Admin","success")
end

-- ═══════════════════════════════════════════════
-- FAKE FEATURES
-- ═══════════════════════════════════════════════
_G.fakeFly=function()
    _G.fakeAdminAction("Force Fly")
    pcall(function()
        local ch=LP.Character
        local h=ch and ch:FindFirstChildOfClass("Humanoid")
        local r=ch and ch:FindFirstChild("HumanoidRootPart")
        if h and r then
            h.PlatformStand=true
            local bv=Instance.new("BodyVelocity",r)
            bv.MaxForce=Vector3.new(9e9,9e9,9e9)
            bv.Velocity=Vector3.new(0,50,0)
            task.delay(0.5,function() bv:Destroy(); h.PlatformStand=false end)
        end
    end)
end

_G.fakeTeleportToPlayer=function(t)
    if not t then
        N("TP","Игрок не выбран","warn")
        return
    end
    pcall(function()
        local r=getR()
        local tg=t.Character
        local tr=tg and tg:FindFirstChild("HumanoidRootPart")
        if r and tr then
            r.CFrame=tr.CFrame+Vector3.new(0,3,0)
            _G.fakeAdminAction("TP to "..tostring(t.Name))
        end
    end)
end

_G.fakeExplode=function()
    _G.fakeAdminAction("Explosion", "Визуально")
    pcall(function()
        local r=getR()
        if r then
            local exp=Instance.new("Explosion",workspace)
            exp.Position=r.Position
            exp.BlastRadius=0
            exp.BlastPressure=0
        end
    end)
end

print("[Burmalda v15.1] Part 11/14 — ADMIN (Fake Panel) loaded")
