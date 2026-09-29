-- BURMALDA v15 | Part 12/14 — FPS BOOSTER
-- Low Graphics, Remove Particles/Lights/Decals/Shadows/Fog/Distant, Counters

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local Lighting=_G.Lighting
local SS=_G.SS

-- ═══ LOW GRAPHICS ═══
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

-- ═══ REMOVE PARTICLES ═══
task.spawn(function()
    while task.wait(2) do
        if C.RemoveParticles then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("ParticleEmitter") or o:IsA("Fire") or o:IsA("Smoke") 
                    or o:IsA("Sparkles") or o:IsA("Trail") or o:IsA("Beam") then
                        o.Enabled=false
                    end
                end
            end)
        end
    end
end)

-- ═══ REMOVE LIGHTS ═══
task.spawn(function()
    while task.wait(2) do
        if C.RemoveLights then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("PointLight") or o:IsA("SpotLight") or o:IsA("SurfaceLight") then
                        o.Enabled=false
                    end
                end
            end)
        end
    end
end)

-- ═══ REMOVE DECALS ═══
task.spawn(function()
    while task.wait(2) do
        if C.RemoveDecals then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Decal") or o:IsA("Texture") then
                        o.Transparency=1
                    end
                end
            end)
        end
    end
end)

-- ═══ REMOVE SHADOWS ═══
task.spawn(function()
    while task.wait(2) do
        if C.RemoveShadows then
            pcall(function()
                Lighting.GlobalShadows=false
                Lighting.ShadowSoftness=0
            end)
        end
    end
end)

-- ═══ REMOVE DISTANT ═══
task.spawn(function()
    while task.wait(3) do
        if C.RemoveDistant then
            pcall(function()
                local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                if not r then return end
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("BasePart") and not o.Anchored then
                        local d=(o.Position-r.Position).Magnitude
                        if d>200 then
                            pcall(function() o.LocalTransparencyModifier=1 end)
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ REMOVE INVISIBLE ═══
task.spawn(function()
    while task.wait(3) do
        if C.RemoveInvisible then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("BasePart") and o.Transparency==1 and o.CanCollide==false then
                        pcall(function() o:Destroy() end)
                    end
                end
            end)
        end
    end
end)

-- ═══ REMOVE ANIMATIONS ═══
task.spawn(function()
    while task.wait(3) do
        if C.RemoveAnimations then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("AnimationController") or o:IsA("Animator") then
                        for _,track in ipairs(o:GetPlayingAnimationTracks()) do
                            track:Stop()
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ FPS COUNTER ═══
local fpsGui=Instance.new("ScreenGui")
fpsGui.Name="BurmaldaFPS"
fpsGui.ResetOnSpawn=false
fpsGui.DisplayOrder=200
fpsGui.Parent=LP:WaitForChild("PlayerGui")

local fpsLabel=Instance.new("TextLabel",fpsGui)
fpsLabel.Size=UDim2.new(0,180,0,20)
fpsLabel.Position=UDim2.new(0,10,0,10)
fpsLabel.BackgroundTransparency=0.5
fpsLabel.BackgroundColor3=Color3.fromRGB(20,20,25)
fpsLabel.TextColor3=Color3.fromRGB(80,220,120)
fpsLabel.Font=Enum.Font.GothamBold
fpsLabel.TextSize=11
fpsLabel.TextXAlignment=Enum.TextXAlignment.Left
fpsLabel.Text=""
fpsLabel.Visible=false

local fpsC=Instance.new("UICorner",fpsLabel)
fpsC.CornerRadius=UDim.new(0,4)

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
        if C.ShowFPS or C.ShowPing then
            fpsLabel.Visible=true
            local txt=""
            if C.ShowFPS then
                local color="🟢"
                if fps<30 then color="🔴" elseif fps<50 then color="🟡" end
                txt=txt..color.." FPS: "..fps.."  "
            end
            if C.ShowPing then
                local ping=LP:GetNetworkPing()*1000
                local pcolor="🟢"
                if ping>200 then pcolor="🔴" elseif ping>100 then pcolor="🟡" end
                txt=txt..pcolor.." Ping: "..math.floor(ping).."ms"
            end
            fpsLabel.Text=txt
        else
            fpsLabel.Visible=false
        end
    end
end)

-- ═══ ВРЕМЕННАЯ МЕТРИКА (что удалено) ═══
local removedCount=0

-- Счётчик удалённых объектов
task.spawn(function()
    while task.wait(5) do
        if C.FPSBooster then
            -- Проверяем что удалено
            local count=0
            for _,o in ipairs(workspace:GetDescendants()) do
                if o:IsA("ParticleEmitter") and not o.Enabled then count=count+1 end
                if o:IsA("PointLight") and not o.Enabled then count=count+1 end
            end
            removedCount=count
        end
    end
end)

-- ═══ ЕДИНЫЙ FPS BOOSTER ═══
task.spawn(function()
    while task.wait(2) do
        if C.FPSBooster then
            -- Включаем все под-тумблеры
            if not C.LowGraphics then C.LowGraphics=true end
            if not C.RemoveParticles then C.RemoveParticles=true end
            if not C.RemoveLights then C.RemoveLights=true end
            if not C.RemoveDecals then C.RemoveDecals=true end
            if not C.RemoveShadows then C.RemoveShadows=true end
            if not C.RemoveInvisible then C.RemoveInvisible=true end
        end
    end
end)

-- ═══ LOW DETAIL MODEL ═══
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

print("[Burmalda v15] Part 12/14 — FPS BOOSTER loaded")
