-- BURMALDA v15 | Part 8/14 — MUSIC + SOUND + AUDIO
-- Music Player, Notify Sound, Warnings, TTS, Audio Removal

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local SS=_G.SS
local RF=_G.RF
local P=_G.P

-- ═══ MUSIC PLAYER ═══
local musicSound=nil

_G.playMusic=function(id)
    if musicSound then pcall(function() musicSound:Destroy() end) end
    if id=="" or not id then N("No Music ID"); return end
    pcall(function()
        musicSound=Instance.new("Sound",SS)
        musicSound.SoundId="rbxassetid://"..tostring(id)
        musicSound.Volume=C.MusicVolume
        musicSound.Looped=true
        musicSound:Play()
        C.MusicId=id
        C.MusicPlaying=true
        N("Playing music")
    end)
end

_G.stopMusic=function()
    if musicSound then
        pcall(function() musicSound:Stop(); musicSound:Destroy() end)
    end
    musicSound=nil
    C.MusicPlaying=false
    N("Music stopped")
end

-- Автопроверка состояния
task.spawn(function()
    while task.wait(1) do
        if C.MusicPlaying and musicSound then
            if not musicSound.IsPlaying then
                C.MusicPlaying=false
            end
        end
    end
end)

-- ═══ SOUND WARNINGS (Rush / Ambush / Seek / Halt) ═══
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
        -- Rush
        if C.RushWarning then
            local found=false
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Model") and (o.Name=="RushMoving" or o.Name=="RushNew") then
                    found=true; break
                end
            end
            if found and not warnedRush then
                warnedRush=true
                playWarnSound("8784885431")
                N("⚠️ Rush spawned!")
            elseif not found then warnedRush=false end
        end
        -- Ambush
        if C.AmbushWarning then
            local found=false
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Model") and (o.Name=="AmbushMoving" or o.Name=="AmbushNew") then
                    found=true; break
                end
            end
            if found and not warnedAmbush then
                warnedAmbush=true
                playWarnSound("8784885431")
                N("⚠️ Ambush spawned!")
            elseif not found then warnedAmbush=false end
        end
        -- Seek
        if C.SeekWarning then
            local found=false
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Model") and o.Name=="Seek" then
                    found=true; break
                end
            end
            if found and not warnedSeek then
                warnedSeek=true
                playWarnSound("8784885431")
                N("⚠️ Seek spawned!")
            elseif not found then warnedSeek=false end
        end
        -- Halt
        if C.HaltWarning then
            local found=false
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Model") and (o.Name=="Halt" or o.Name=="HaltMoving") then
                    found=true; break
                end
            end
            if found and not warnedHalt then
                warnedHalt=true
                playWarnSound("8784885431")
                N("⚠️ Halt spawned!")
            elseif not found then warnedHalt=false end
        end
    end
end)

-- ═══ NOTIFY ITEMS (уведомление при появлении редких предметов) ═══
local notifiedItems={}
task.spawn(function()
    while task.wait(2) do
        if C.NotifyItems then
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Model") or o:IsA("BasePart") then
                    local n=o.Name:lower()
                    if n:find("crucifix") or n:find("skeleton") or n:find("candle") or n:find("lantern") then
                        if not notifiedItems[o] then
                            notifiedItems[o]=true
                            N("Item found: "..o.Name)
                            o.Destroying:Connect(function()
                                notifiedItems[o]=nil
                            end)
                        end
                    end
                end
            end
        end
    end
end)

-- ═══ NOTIFY LIBRARY CODE ═══
task.spawn(function()
    while task.wait(3) do
        if C.NotifyLibraryCode then
            pcall(function()
                local ch=LP.Character
                if ch then
                    for _,item in ipairs(ch:GetChildren()) do
                        if item.Name:find("LibraryHintPaper") then
                            N("Library code found!")
                            break
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ NOTIFY OXYGEN LEVEL ═══
task.spawn(function()
    while task.wait(2) do
        if C.NotifyOxygenLevel then
            pcall(function()
                local ch=LP.Character
                if ch then
                    for _,o in ipairs(ch:GetDescendants()) do
                        if o:IsA("NumberValue") and o.Name:lower():find("oxygen") then
                            N("Oxygen: "..math.floor(o.Value).."%")
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ NOTIFY HASTE TIME ═══
task.spawn(function()
    while task.wait(5) do
        if C.NotifyHasteTime then
            pcall(function()
                local gd=_G.GD
                if gd then
                    local hr=gd:FindFirstChild("HasteTime") or gd:FindFirstChild("DigitalTimer")
                    if hr then
                        N("Haste: "..tostring(hr.Value))
                    end
                end
            end)
        end
    end
end)

-- ═══ AUDIO REMOVAL ═══
local audioBlacklist={}

task.spawn(function()
    while task.wait(2) do
        pcall(function()
            for _,o in ipairs(game:GetDescendants()) do
                if o:IsA("Sound") then
                    local n=o.Name:lower()
                    
                    if C.RemoveFootstepSounds and (n:find("footstep") or n:find("step")) then
                        pcall(function() o.Volume=0 end)
                    end
                    if C.RemoveJamminMusic and (n:find("jammin") or n:find("music")) then
                        pcall(function() o.Volume=0 end)
                    end
                    if C.RemoveInteractingSounds and (n:find("interact") or n:find("prompt")) then
                        pcall(function() o.Volume=0 end)
                    end
                end
            end
        end)
    end
end)

-- ═══ DISABLE SOUND (для FPS Booster) ═══
task.spawn(function()
    while task.wait(2) do
        if C.DisableSound then
            pcall(function() SS.Volume=0 end)
        else
            pcall(function() SS.Volume=1 end)
        end
    end
end)

print("[Burmalda v15] Part 8/14 — MUSIC + SOUND + AUDIO loaded")
