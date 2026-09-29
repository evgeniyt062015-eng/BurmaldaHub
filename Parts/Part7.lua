-- BURMALDA v15 | Part 7/14 — EXPLOITS + FARM
-- Knob Farm, Death Farm, Auto Complete, дополнительные exploits

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local RF=_G.RF
local P=_G.P
local CR=_G.CR

local function getR()
    local ch=LP.Character
    return ch and ch:FindFirstChild("HumanoidRootPart")
end

-- ═══ FARM DEATHS ═══
local FarmDeathsConn=nil
_G.setFarmDeaths=function(s)
    if FarmDeathsConn then FarmDeathsConn:Disconnect(); FarmDeathsConn=nil end
    if not s then return end
    FarmDeathsConn=task.spawn(function()
        while C.AutoFarmDeaths do
            local ch=LP.Character
            if ch then
                local h=ch:FindFirstChildOfClass("Humanoid")
                if h then pcall(function() h.Health=0 end) end
            end
            task.wait(C.FarmDelay)
            if RF and RF:FindFirstChild("PlayAgain") and C.AutoFarmDeaths then
                pcall(function() RF.PlayAgain:FireServer() end)
            end
        end
    end)
end

task.spawn(function()
    while task.wait(0.5) do
        if C.AutoFarmDeaths and not FarmDeathsConn then
            _G.setFarmDeaths(true)
        elseif not C.AutoFarmDeaths and FarmDeathsConn then
            _G.setFarmDeaths(false)
        end
    end
end)

-- ═══ KNOB FARM ═══
-- Ищет крутилки (knobs) и нажимает их автоматически
task.spawn(function()
    while task.wait(0.5) do
        if C.KnobFarm then
            pcall(function()
                local r=getR()
                if r then
                    for _,o in ipairs(workspace:GetDescendants()) do
                        if o:IsA("Model") and (o.Name:lower():find("knob") or o.Name:lower():find("valve") or o.Name:lower():find("wheel")) then
                            local p=o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true)
                            if p and (p.Position-r.Position).Magnitude<10 then
                                local prompt=o:FindFirstChildWhichIsA("ProximityPrompt",true)
                                if prompt and prompt.Enabled then
                                    prompt:InputHoldBegin()
                                    task.wait(0.05)
                                    prompt:InputHoldEnd()
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ COPY DEATH FARM LOADSTRING ═══
_G.copyDeathFarmLoadstring=function()
    local ls='loadstring(game:HttpGet("https://raw.githubusercontent.com/evgeniyt062015-eng/BurmaldaHub/main/Main.lua"))()'
    pcall(function()
        if setclipboard then setclipboard(ls) end
    end)
    N("Loadstring copied")
end

-- ═══ AUTO COMPLETE DAM SEEK ═══
task.spawn(function()
    while task.wait(1) do
        if C.AutoCompleteDamSeek then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") and o.Name:lower():find("dam") then
                        for _,p in ipairs(o:GetDescendants()) do
                            if p:IsA("BasePart") then p.CanTouch=false; p.CanCollide=false end
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ AUTO COMPLETE CRINGLE ═══
task.spawn(function()
    while task.wait(1) do
        if C.AutoCompleteCringle then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") and o.Name:lower():find("cringle") then
                        for _,p in ipairs(o:GetDescendants()) do
                            if p:IsA("BasePart") then p.CanTouch=false; p.CanCollide=false end
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ AUTO ROOMS (переход между комнатами) ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.AutoRooms then
            local ch=LP.Character
            if ch and ch:FindFirstChild("HumanoidRootPart") then
                local h=ch:FindFirstChildOfClass("Humanoid")
                local root=ch.HumanoidRootPart
                if h then
                    -- Идём к следующей двери
                    local latest=0
                    if _G.GD and _G.GD:FindFirstChild("LatestRoom") then
                        latest=_G.GD.LatestRoom.Value
                    end
                    local bestDoor,bestNum=nil,math.huge
                    for _,o in ipairs(workspace:GetDescendants()) do
                        if o:IsA("Model") and o.Name:lower()=="door" then
                            local op=o:GetAttribute("Open")
                            if op==false or op==nil then
                                local rn=tonumber(o.Parent and o.Parent.Name)
                                if rn and rn>=latest and rn<bestNum then
                                    bestNum=rn
                                    bestDoor=o
                                end
                            end
                        end
                    end
                    if bestDoor then
                        local dp=bestDoor.PrimaryPart or bestDoor:FindFirstChildWhichIsA("BasePart",true)
                        if dp then
                            local dir=(dp.Position-root.Position).Unit
                            h:Move(dir,false)
                            if (dp.Position-root.Position).Magnitude<5 then
                                for _,pr in ipairs(bestDoor:GetDescendants()) do
                                    if pr:IsA("ProximityPrompt") then
                                        pcall(function()
                                            pr:InputHoldBegin()
                                            task.wait(0.05)
                                            pr:InputHoldEnd()
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- ═══ ANTI KICK (защита от кика) ═══
task.spawn(function()
    while task.wait(2) do
        if C.AntiKick then
            pcall(function()
                LP.Kick:Connect(function()
                    -- Игнорируем попытку кика
                    task.wait()
                end)
            end)
        end
    end
end)

-- ═══ AUTO AIM (заглушка) ═══
task.spawn(function()
    while task.wait(0.1) do
        if C.AutoAim then
            local cam=workspace.CurrentCamera
            if cam then
                local closest,target=nil,math.huge
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") then
                        local n=o.Name:lower()
                        local isEnt=n:find("rush") or n:find("ambush") or n:find("seek") or n:find("figure")
                        if isEnt then
                            local p=o.PrimaryPart and o.PrimaryPart.Position
                            if p then
                                local pos=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                                if pos then
                                    local d=(p-pos.Position).Magnitude
                                    if d<target then target=d closest=p end
                                end
                            end
                        end
                    end
                end
                if closest then
                    cam.CFrame=CFrame.new(cam.CFrame.Position,closest)
                end
            end
        end
    end
end)

-- ═══ SERVER HOP ═══
_G.serverHop=function()
    pcall(function()
        local TS=game:GetService("TeleportService")
        local code=game.PlaceId
        local servers=game:GetService("HttpService"):JSONDecode(
            game:HttpGet("https://games.roblox.com/v1/games/"..code.."/servers/Public?sortOrder=Asc&limit=100")
        )
        if servers and servers.data and #servers.data>0 then
            for _,srv in ipairs(servers.data) do
                if srv.id~=game.JobId and srv.playing<srv.maxPlayers then
                    TS:TeleportToPlaceInstance(code,srv.id,LP)
                    return
                end
            end
        end
        N("No servers found")
    end)
end

-- ═══ AUTO REJOIN ═══
task.spawn(function()
    while task.wait(5) do
        if C.AutoRejoin then
            pcall(function()
                if LP.Parent==nil then
                    -- Переподключение
                    game:GetService("TeleportService"):Teleport(game.PlaceId,LP)
                end
            end)
        end
    end
end)

-- ═══ GOD RUSHER (повторно на всякий случай) ═══
task.spawn(function()
    while task.wait(0.3) do
        if C.GodRusher then
            local ch=LP.Character
            if ch then
                local h=ch:FindFirstChildOfClass("Humanoid")
                if h and h.Health<h.MaxHealth then h.Health=h.MaxHealth end
            end
        end
    end
end)

print("[Burmalda v15] Part 7/14 — EXPLOITS + FARM loaded")
