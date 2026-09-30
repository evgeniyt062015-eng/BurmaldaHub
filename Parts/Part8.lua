-- BURMALDA v15.1 | Part 8/14 — MUSIC + SOUND + AUDIO
-- Фиксы: tostring для ID, проверка звуков, больше имён монстров

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local SS=_G.SS
local RF=_G.RF
local P=_G.P

-- ═══════════════════════════════════════════════
-- MUSIC PLAYER
-- ═══════════════════════════════════════════════
local musicSound=nil

_G.playMusic=function(id)
    if musicSound then pcall(function() musicSound:Destroy() end) end
    musicSound=nil
    if id=="" or id==nil then
        N("Музыка","ID пустой","warn")
        return
    end
    -- FIX: tostring для ID
    local idStr=tostring(id)
    -- Убираем rbxassetid:// если есть
    idStr=idStr:gsub("rbxassetid://",""):gsub("rbxassetid:",""):gsub("%D","")
    if idStr=="" then
        N("Музыка","Неверный ID","error")
        return
    end
    pcall(function()
        musicSound=Instance.new("Sound",SS)
        musicSound.SoundId="rbxassetid://"..idStr
        musicSound.Volume=C.MusicVolume or 0.5
        musicSound.Looped=true
        musicSound:Play()
        C.MusicId=id
        C.MusicPlaying=true
        N("Музыка","Играет: "..idStr,"success")
    end)
end

_G.stopMusic=function()
    if musicSound then
        pcall(function()
            musicSound:Stop()
            musicSound:Destroy()
        end)
    end
    musicSound=nil
    C.MusicPlaying=false
    N("Музыка","Остановлено","info")
end

-- Автопроверка
task.spawn(function()
    while task.wait(1) do
        if C.MusicPlaying and musicSound then
            if not musicSound.IsPlaying then
                C.MusicPlaying=false
            end
        end
    end
end)

-- ═══════════════════════════════════════════════
-- SOUND WARNINGS (Rush / Ambush / Seek / Halt)
-- FIX: больше имён
-- ═══════════════════════════════════════════════
local warnedRush=false
local warnedAmbush=false
local warnedSeek=false
local warnedHalt=false

local function playWarnSound(id)
    pcall(function()
        local s=Instance.new("Sound",SS)
        s.SoundId="rbxassetid://"..id
        s.Volume=1
        s:Play()
        task.delay(2,function() s:Destroy() end)
    end)
end

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            -- RUSH
            if C.RushWarning then
                local found=false
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") then
                        local n=string.lower(o.Name)
                        if n=="rushmoving" or n=="rushnew" or n=="rush" then
                            found=true
                            break
                        end
                    end
                end
                if found and not warnedRush then
                    warnedRush=true
                    playWarnSound("8784885431")
                    N("⚠️ Rush!","Найди шкаф!","error")
                elseif not found then
                    warnedRush=false
                end
            end
            
            -- AMBUSH
            if C.AmbushWarning then
                local found=false
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") then
                        local n=string.lower(o.Name)
                        if n=="ambushmoving" or n=="ambushnew" or n=="ambush" then
                            found=true
                            break
                        end
                    end
                end
                if found and not warnedAmbush then
                    warnedAmbush=true
                    playWarnSound("8784885431")
                    N("⚠️ Ambush!","Он вернётся!","error")
                elseif not found then
                    warnedAmbush=false
                end
            end
            
            -- SEEK
            if C.SeekWarning then
                local found=false
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") then
                        local n=string.lower(o.Name)
                        if n=="seek" or n=="seekmoving" then
                            found=true
                            break
                        end
                    end
                end
                if found and not warnedSeek then
                    warnedSeek=true
                    playWarnSound("8784885431")
                    N("⚠️ Seek!","Беги!","error")
                elseif not found then
                    warnedSeek=false
                end
            end
            
            -- HALT
            if C.HaltWarning then
                local found=false
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") then
                        local n=string.lower(o.Name)
                        if n=="halt" or n=="haltmoving" then
                            found=true
                            break
                        end
                    end
                end
                if found and not warnedHalt then
                    warnedHalt=true
                    playWarnSound("8784885431")
                    N("⚠️ Halt!","Отвернись!","error")
                elseif not found then
                    warnedHalt=false
                end
            end
        end)
    end
end)

-- ═══════════════════════════════════════════════
-- NOTIFY ITEMS (редкие предметы)
-- ═══════════════════════════════════════════════
local RARE_ITEMS={"crucifix","skeleton","candle","lantern","scanner","compass"}
local notifiedItems={}

task.spawn(function()
    while task.wait(2) do
        if C.NotifyItems then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") or o:IsA("BasePart") then
                        local n=string.lower(tostring(o.Name))
                        for _,rare in ipairs(RARE_ITEMS) do
                            if string.find(n,rare,1,true) then
                                if not notifiedItems[o] then
                                    notifiedItems[o]=true
                                    N("💎 Найден предмет",o.Name,"success")
                                end
                                break
                            end
                        end
                    end
                end
                -- Очистка мёртвых
                for obj,_ in pairs(notifiedItems) do
                    if not obj or not obj.Parent then
                        notifiedItems[obj]=nil
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- NOTIFY LIBRARY CODE
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(3) do
        if C.NotifyLibraryCode then
            pcall(function()
                local ch=LP.Character
                if ch then
                    for _,item in ipairs(ch:GetChildren()) do
                        local n=string.lower(tostring(item.Name))
                        if string.find(n,"libraryhint",1,true) or string.find(n,"libraryhintpaper",1,true) then
                            N("📚 Library Code","Бумага найдена!","info")
                            break
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- NOTIFY OXYGEN LEVEL
-- ═══════════════════════════════════════════════
local lastOxygen=100

task.spawn(function()
    while task.wait(2) do
        if C.NotifyOxygenLevel then
            pcall(function()
                local ch=LP.Character
                if ch then
                    for _,o in ipairs(ch:GetDescendants()) do
                        if o:IsA("NumberValue") then
                            local n=string.lower(o.Name)
                            if string.find(n,"oxygen",1,true) then
                                local val=math.floor(o.Value)
                                if math.abs(val-lastOxygen)>=10 then
                                    lastOxygen=val
                                    N("💨 Oxygen",val.."%","info")
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- NOTIFY HASTE TIME
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(5) do
        if C.NotifyHasteTime then
            pcall(function()
                local gd=_G.GD
                if gd then
                    local hr=gd:FindFirstChild("HasteTime") or gd:FindFirstChild("DigitalTimer")
                    if hr then
                        N("⏱️ Haste",tostring(hr.Value),"info")
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- AUDIO REMOVAL (удаление звуков)
-- ═══════════════════════════════════════════════
local audioConn
_G.setAudioRemoval=function(on)
    if audioConn then audioConn:Disconnect(); audioConn=nil end
    if not on then
        -- Восстанавливаем громкость
        pcall(function()
            for _,o in ipairs(game:GetDescendants()) do
                if o:IsA("Sound") then
                    if o:GetAttribute("BurmaldaMuted") then
                        o.Volume=o:GetAttribute("BurmaldaOldVol") or 1
                        o:SetAttribute("BurmaldaMuted",nil)
                    end
                end
            end
        end)
        return
    end
    audioConn=Run.Heartbeat:Connect(function()
        pcall(function()
            for _,o in ipairs(game:GetDescendants()) do
                if o:IsA("Sound") then
                    local n=string.lower(o.Name)
                    local shouldMute=false
                    if C.RemoveFootstepSounds and (string.find(n,"footstep",1,true) or string.find(n,"step",1,true)) then shouldMute=true end
                    if C.RemoveJamminMusic and (string.find(n,"jammin",1,true) or string.find(n,"music",1,true)) then shouldMute=true end
                    if C.RemoveInteractingSounds and (string.find(n,"interact",1,true) or string.find(n,"prompt",1,true)) then shouldMute=true end
                    if shouldMute then
                        if not o:GetAttribute("BurmaldaMuted") then
                            o:SetAttribute("BurmaldaOldVol",o.Volume)
                            o:SetAttribute("BurmaldaMuted",true)
                        end
                        o.Volume=0
                    end
                end
            end
        end)
    end)
end

-- Автоподключение
task.spawn(function()
    while task.wait(1) do
        if C.RemoveFootstepSounds or C.RemoveJamminMusic or C.RemoveInteractingSounds then
            if not audioConn then _G.setAudioRemoval(true) end
        elseif audioConn then
            _G.setAudioRemoval(false)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- DISABLE SOUND (для FPS Booster)
-- ═══════════════════════════════════════════════
local origVolume=SS.Volume
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            if C.DisableSound then
                SS.Volume=0
            else
                if SS.Volume~=origVolume then SS.Volume=origVolume end
            end
        end)
    end
end)

-- ═══════════════════════════════════════════════
-- PRESETS (5 музыкальных пресетов)
-- ═══════════════════════════════════════════════
_G.MUSIC_PRESETS={
    ["Phonk"]="1835246723",
    ["Ambient"]="1838404504",
    ["Epic"]="1837872354",
    ["Doors Theme"]="1836901758",
    ["Horror"]="1836035534"
}

_G.playPreset=function(name)
    local id=_G.MUSIC_PRESETS[name]
    if id then
        _G.playMusic(id)
    else
        N("Музыка","Пресет не найден","warn")
    end
end

print("[Burmalda v15.1] Part 8/14 — MUSIC + SOUND + AUDIO loaded")
