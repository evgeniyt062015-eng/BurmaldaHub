-- BURMALDA v15.1 | Part 12/14 — FPS BOOSTER
-- Фиксы: Enabled=false вместо Destroy, сохранение оригинала, FPS/Ping корректные

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local Lighting=_G.Lighting
local SS=_G.SS

-- ═══════════════════════════════════════════════
-- LOW GRAPHICS
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(2) do
        if C.LowGraphics then
            pcall(function()
                settings().Rendering.QualityLevel=1
            end)
            pcall(function()
                settings().Rendering.MeshPartDetailLevel=Enum.MeshPartDetailLevel.Level01
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- REMOVE PARTICLES (FIX: Enabled=false)
-- ═══════════════════════════════════════════════
local particleConn
_G.setRemoveParticles=function(on)
    if particleConn then particleConn:Disconnect(); particleConn=nil end
    if not on then
        -- Восстанавливаем
        pcall(function()
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("ParticleEmitter") or o:IsA("Fire") or o:IsA("Smoke")
                or o:IsA("Sparkles") or o:IsA("Trail") or o:IsA("Beam") then
                    if o:GetAttribute("BurmaldaMuted") then
                        o.Enabled=o:GetAttribute("BurmaldaOldEnabled")~=false
                        o:SetAttribute("BurmaldaMuted",nil)
                    end
                end
            end
        end)
        return
    end
    particleConn=Run.Heartbeat:Connect(function()
        if not C.RemoveParticles then return end
        pcall(function()
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("ParticleEmitter") or o:IsA("Fire") or o:IsA("Smoke")
                or o:IsA("Sparkles") or o:IsA("Trail") or o:IsA("Beam") then
                    if not o:GetAttribute("BurmaldaMuted") then
                        o:SetAttribute("BurmaldaOldEnabled",o.Enabled)
                        o:SetAttribute("BurmaldaMuted",true)
                    end
                    o.Enabled=false
                end
            end
        end)
    end)
end

task.spawn(function()
    while task.wait(1) do
        if C.RemoveParticles and not particleConn then
            _G.setRemoveParticles(true)
        elseif not C.RemoveParticles and particleConn then
            _G.setRemoveParticles(false)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- REMOVE LIGHTS (FIX: Enabled=false)
-- ═══════════════════════════════════════════════
local lightConn
_G.setRemoveLights=function(on)
    if lightConn then lightConn:Disconnect(); lightConn=nil end
    if not on then
        pcall(function()
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("PointLight") or o:IsA("SpotLight") or o:IsA("SurfaceLight") then
                    if o:GetAttribute("BurmaldaMuted") then
                        o.Enabled=o:GetAttribute("BurmaldaOldEnabled")~=false
                        o:SetAttribute("BurmaldaMuted",nil)
                    end
                end
            end
        end)
        return
    end
    lightConn=Run.Heartbeat:Connect(function()
        if not C.RemoveLights then return end
        pcall(function()
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("PointLight") or o:IsA("SpotLight") or o:IsA("SurfaceLight") then
                    if not o:GetAttribute("BurmaldaMuted") then
                        o:SetAttribute("BurmaldaOldEnabled",o.Enabled)
                        o:SetAttribute("BurmaldaMuted",true)
                    end
                    o.Enabled=false
                end
            end
        end)
    end)
end

task.spawn(function()
    while task.wait(1) do
        if C.RemoveLights and not lightConn then
            _G.setRemoveLights(true)
        elseif not C.RemoveLights and lightConn then
            _G.setRemoveLights(false)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- REMOVE DECALS
-- ═══════════════════════════════════════════════
local decalConn
_G.setRemoveDecals=function(on)
    if decalConn then decalConn:Disconnect(); decalConn=nil end
    if not on then
        pcall(function()
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Decal") or o:IsA("Texture") then
                    if o:GetAttribute("BurmaldaMuted") then
                        o.Transparency=o:GetAttribute("BurmaldaOldTrans") or 0
                        o:SetAttribute("BurmaldaMuted",nil)
                    end
                end
            end
        end)
        return
    end
    decalConn=Run.Heartbeat:Connect(function()
        if not C.RemoveDecals then return end
        pcall(function()
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("Decal") or o:IsA("Texture") then
                    if not o:GetAttribute("BurmaldaMuted") then
                        o:SetAttribute("BurmaldaOldTrans",o.Transparency)
                        o:SetAttribute("BurmaldaMuted",true)
                    end
                    o.Transparency=1
                end
            end
        end)
    end)
end

task.spawn(function()
    while task.wait(1) do
        if C.RemoveDecals and not decalConn then
            _G.setRemoveDecals(true)
        elseif not C.RemoveDecals and decalConn then
            _G.setRemoveDecals(false)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- REMOVE SHADOWS (FIX: сохраняем оригинал)
-- ═══════════════════════════════════════════════
local origGlobalShadows=Lighting.GlobalShadows
local origShadowSoftness=Lighting.ShadowSoftness

task.spawn(function()
    while task.wait(2) do
        pcall(function()
            if C.RemoveShadows then
                Lighting.GlobalShadows=false
                Lighting.ShadowSoftness=0
            else
                Lighting.GlobalShadows=origGlobalShadows
                Lighting.ShadowSoftness=origShadowSoftness
            end
        end)
    end
end)

-- ═══════════════════════════════════════════════
-- REMOVE DISTANT (объекты > 200 studs)
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(3) do
        if C.RemoveDistant then
            pcall(function()
                local ch=LP.Character
                local r=ch and ch:FindFirstChild("HumanoidRootPart")
                if not r then return end
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("BasePart") and not o.Anchored and not o:GetAttribute("BurmaldaDistant") then
                        local d=(o.Position-r.Position).Magnitude
                        if d>200 then
                            o:SetAttribute("BurmaldaDistant",true)
                            o.LocalTransparencyModifier=1
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- REMOVE INVISIBLE
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(3) do
        if C.RemoveInvisible then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("BasePart") and o.Transparency==1 and o.CanCollide==false then
                        o:Destroy()
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- REMOVE ANIMATIONS
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(3) do
        if C.RemoveAnimations then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("AnimationController") then
                        pcall(function()
                            for _,track in ipairs(o:GetPlayingAnimationTracks()) do
                                track:Stop()
                            end
                        end)
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- LOW DETAIL (материалы → SmoothPlastic)
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(3) do
        if C.FPSBooster then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("BasePart") then
                        if o.Material~=Enum.Material.Plastic and o.Material~=Enum.Material.SmoothPlastic then
                            o.Material=Enum.Material.SmoothPlastic
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- DISABLE SOUND
-- ═══════════════════════════════════════════════
local origVol=SS.Volume
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            if C.DisableSound then
                SS.Volume=0
            else
                if SS.Volume~=origVol then SS.Volume=origVol end
            end
        end)
    end
end)

-- ═══════════════════════════════════════════════
-- FPS / PING COUNTER
-- ═══════════════════════════════════════════════
local fpsGui=Instance.new("ScreenGui")
fpsGui.Name="BurmaldaFPS"
fpsGui.ResetOnSpawn=false
fpsGui.DisplayOrder=150
fpsGui.Parent=LP:WaitForChild("PlayerGui")

local fpsFrame=Instance.new("Frame",fpsGui)
fpsFrame.Size=UDim2.new(0,190,0,44)
fpsFrame.Position=UDim2.new(0,10,0,10)
fpsFrame.BackgroundColor3=Color3.fromRGB(20,20,25)
fpsFrame.BackgroundTransparency=0.3
fpsFrame.BorderSizePixel=0
fpsFrame.Visible=false

local ffc=Instance.new("UICorner",fpsFrame)
ffc.CornerRadius=UDim.new(0,6)

local ffs=Instance.new("UIStroke",fpsFrame)
ffs.Color=Color3.fromRGB(180,30,30)
ffs.Thickness=1.5

local fpsText=Instance.new("TextLabel",fpsFrame)
fpsText.Size=UDim2.new(1,-10,0,20)
fpsText.Position=UDim2.new(0,5,0,3)
fpsText.BackgroundTransparency=1
fpsText.Text="FPS: --"
fpsText.TextColor3=Color3.fromRGB(80,220,120)
fpsText.Font=Enum.Font.GothamBold
fpsText.TextSize=12
fpsText.TextXAlignment=Enum.TextXAlignment.Left

local pingText=Instance.new("TextLabel",fpsFrame)
pingText.Size=UDim2.new(1,-10,0,18)
pingText.Position=UDim2.new(0,5,0,22)
pingText.BackgroundTransparency=1
pingText.Text="Ping: --"
pingText.TextColor3=Color3.fromRGB(150,200,255)
pingText.Font=Enum.Font.Gotham
pingText.TextSize=11
pingText.TextXAlignment=Enum.TextXAlignment.Left

-- FPS через Heartbeat
local frames=0
local fps=0
local lastUpdate=tick()
Run.Heartbeat:Connect(function()
    frames=frames+1
    if tick()-lastUpdate>=1 then
        fps=frames
        frames=0
        lastUpdate=tick()
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if C.ShowFPS or C.ShowPing then
                fpsFrame.Visible=true
                if C.ShowFPS then
                    local icon="🟢"
                    if fps<30 then icon="🔴" elseif fps<50 then icon="🟡" end
                    fpsText.Text=icon.." FPS: "..fps
                else
                    fpsText.Text=""
                end
                if C.ShowPing then
                    local ping=math.floor((LP:GetNetworkPing() or 0)*1000)
                    local icon="🟢"
                    if ping>200 then icon="🔴" elseif ping>100 then icon="🟡" end
                    pingText.Text=icon.." Ping: "..ping.." ms"
                else
                    pingText.Text=""
                end
            else
                fpsFrame.Visible=false
            end
        end)
    end
end)

-- ═══════════════════════════════════════════════
-- FPS BOOSTER MAIN (включает всё)
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(1) do
        if C.FPSBooster then
            if not C.LowGraphics then C.LowGraphics=true end
            if not C.RemoveParticles then C.RemoveParticles=true end
            if not C.RemoveLights then C.RemoveLights=true end
            if not C.RemoveDecals then C.RemoveDecals=true end
            if not C.RemoveShadows then C.RemoveShadows=true end
            if not C.RemoveInvisible then C.RemoveInvisible=true end
        end
    end
end)

-- ═══════════════════════════════════════════════
-- MEMORY CLEANUP
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(10) do
        if C.FPSBooster then
            pcall(function()
                -- Удаляем Burmalda мусор
                local platFolder=workspace:FindFirstChild("BurmaldaPlatforms")
                if platFolder then
                    for _,o in ipairs(platFolder:GetChildren()) do
                        if tick()-o:GetAttribute("BurmaldaCreated")>5 then
                            o:Destroy()
                        end
                    end
                end
            end)
        end
    end
end)

print("[Burmalda v15.1] Part 12/14 — FPS BOOSTER loaded")
