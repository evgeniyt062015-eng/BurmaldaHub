-- BURMALDA v15 | Part 11/14 — ADMIN (Fake Panel)
-- 40+ кнопок, всё FAKE кроме spawn, но выглядит реально

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local SS=_G.SS
local P=_G.P

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
    N("👑 [ADMIN] "..name..(extra and (" → "..extra) or ""))
end

-- ═══ УПРАВЛЕНИЕ ИГРОКАМИ ═══
_G.fakeKickAll=function()
    local count=#P:GetPlayers()-1
    _G.fakeAdminAction("Kick All", count.." players kicked")
end

_G.fakeBanPlayer=function(playerName)
    _G.fakeAdminAction("Ban Player", playerName or "selected")
end

_G.fakeBanAll=function()
    _G.fakeAdminAction("Ban All", (#P:GetPlayers()-1).." players banned")
end

_G.fakeFreezeAll=function()
    _G.fakeAdminAction("Freeze All", "Frozen")
end

_G.fakeUnfreezeAll=function()
    _G.fakeAdminAction("Unfreeze All", "Unfrozen")
end

_G.fakeGiveGodmodeAll=function()
    _G.fakeAdminAction("Give Godmode to All")
end

_G.fakeForceRespawnAll=function()
    _G.fakeAdminAction("Force Respawn All")
end

-- ═══ СЕРВЕР ═══
_G.fakeServerShutdown=function()
    _G.fakeAdminAction("Server Shutdown", "Starting countdown...")
    task.spawn(function()
        for i=10,1,-1 do
            N("⚠️ Server shutting down in "..i.."s")
            task.wait(1)
        end
        N("❌ [FAKE] Server would be shutdown")
    end)
end

_G.fakeRestartRun=function()
    _G.fakeAdminAction("Restart Run")
end

_G.fakeAnnounce=function(message)
    _G.fakeAdminAction("Announce", message or "...")
end

_G.fakeClearRoom=function()
    _G.fakeAdminAction("Clear Room")
end

_G.fakeDeleteAllEntities=function()
    _G.fakeAdminAction("Delete All Entities")
end

-- ═══ GIVE ITEMS (FAKE + визуал) ═══
_G.fakeGiveItem=function(itemName)
    _G.fakeAdminAction("Give Item", itemName)
    -- Визуальный шарик
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

_G.fakeGiveAllItems=function()
    local items={"Flashlight","Lockpick","Bandage","Vitamins","Crucifix","Lighter","Battery","Candle","Skeleton Key","Shears","Scanner","Compass","Lantern","Shakelight","Straplight","Bulklight"}
    for _,item in ipairs(items) do
        task.spawn(function()
            _G.fakeGiveItem(item)
            task.wait(0.15)
        end)
    end
end

-- ═══ SPAWN ENTITIES (РЕАЛЬНО работает) ═══
_G.adminSpawnRush=function() _G.spawnRush() _G.fakeAdminAction("Spawn Rush") end
_G.adminSpawnAmbush=function() _G.spawnAmbush() _G.fakeAdminAction("Spawn Ambush") end
_G.adminSpawnSeek=function() _G.spawnSeek() _G.fakeAdminAction("Spawn Seek") end
_G.adminSpawnFigure=function() _G.spawnFigure() _G.fakeAdminAction("Spawn Figure") end
_G.adminSpawnScreech=function() _G.spawnScreech() _G.fakeAdminAction("Spawn Screech") end
_G.adminSpawnEyes=function() _G.spawnEyes() _G.fakeAdminAction("Spawn Eyes") end
_G.adminSpawnHalt=function() _G.spawnHalt() _G.fakeAdminAction("Spawn Halt") end
_G.adminSpawnGrumble=function() _G.spawnGrumble() _G.fakeAdminAction("Spawn Grumble") end
_G.adminSpawnGiggle=function() _G.spawnGiggle() _G.fakeAdminAction("Spawn Giggle") end
_G.adminSpawnBlitz=function() _G.spawnBlitz() _G.fakeAdminAction("Spawn Blitz") end
_G.adminSpawnLookman=function() _G.spawnLookman() _G.fakeAdminAction("Spawn Lookman") end
_G.adminSpawnA60=function() _G.spawnA60() _G.fakeAdminAction("Spawn A-60") end
_G.adminSpawnA120=function() _G.spawnA120() _G.fakeAdminAction("Spawn A-120") end

_G.adminSpawnCustom=function(name)
    _G.spawnVisual(Color3.fromRGB(255,0,255),Vector3.new(5,5,5),Enum.PartType.Ball,name or "Custom")
    _G.fakeAdminAction("Spawn Custom", name)
end

-- ═══ SPAWN ITEMS ═══
_G.adminSpawnCoin=function() _G.spawnCoin() _G.fakeAdminAction("Spawn Coin") end
_G.adminSpawnKey=function() _G.spawnKey() _G.fakeAdminAction("Spawn Key") end
_G.adminSpawnFlashlight=function() _G.spawnFlashlight() _G.fakeAdminAction("Spawn Flashlight") end
_G.adminSpawnBandage=function() _G.spawnBandage() _G.fakeAdminAction("Spawn Bandage") end
_G.adminSpawnCrucifix=function() _G.spawnCrucifix() _G.fakeAdminAction("Spawn Crucifix") end

-- ═══ ОПАСНОЕ (FAKE) ═══
_G.fakeKillSelf=function()
    _G.fakeAdminAction("Kill Self")
    local ch=LP.Character
    local h=ch and ch:FindFirstChildOfClass("Humanoid")
    if h then h.Health=0 end
end

_G.fakeDeleteServer=function()
    _G.fakeAdminAction("Delete Server")
end

_G.fakeBanSelf=function()
    _G.fakeAdminAction("Ban Self")
end

_G.fakeCrashGame=function()
    _G.fakeAdminAction("Crash Game")
    task.spawn(function()
        N("⚠️ Crashing in 5...")
        for i=5,1,-1 do
            N(tostring(i))
            task.wait(1)
        end
        N("❌ [FAKE] Just kidding :)")
    end)
end

-- ═══ MISC ═══
_G.fakeGoldName=function()
    _G.fakeAdminAction("Gold Name")
    pcall(function()
        local ch=LP.Character
        if ch then
            local h=ch:FindFirstChild("Head")
            if h then
                local gui=h:FindFirstChildOfClass("BillboardGui")
                if not gui then
                    gui=Instance.new("BillboardGui",h)
                    gui.Size=UDim2.new(0,100,0,30)
                    gui.StudsOffset=Vector3.new(0,3,0)
                end
                local lbl=gui:FindFirstChildOfClass("TextLabel")
                if not lbl then
                    lbl=Instance.new("TextLabel",gui)
                    lbl.Size=UDim2.new(1,0,1,0)
                    lbl.BackgroundTransparency=1
                end
                lbl.Text=LP.Name
                lbl.TextColor3=Color3.fromRGB(255,215,0)
                lbl.TextStrokeColor3=Color3.fromRGB(0,0,0)
                lbl.TextStrokeTransparency=0
                lbl.Font=Enum.Font.GothamBold
                lbl.TextSize=14
            end
        end
    end)
end

_G.fakeRainbowName=function()
    _G.fakeAdminAction("Rainbow Name")
end

_G.fakeCustomChat=function(msg)
    _G.fakeAdminAction("Custom Chat", msg)
end

print("[Burmalda v15] Part 11/14 — ADMIN (Fake Panel) loaded")
