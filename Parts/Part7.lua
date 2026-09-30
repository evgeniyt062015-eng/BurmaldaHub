-- BURMALDA v15.1 | Part 7/14 — EXPLOITS + FARM
-- Фиксы: уведомления с типами, больше имён, всё в pcall

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local RF=_G.RF
local P=_G.P
local CR=_G.CR

local function getR()
    local ok,res=pcall(function()
        local ch=LP and LP.Character
        if not ch then return nil end
        return ch:FindFirstChild("HumanoidRootPart")
    end)
    if ok then return res end
    return nil
end

-- ═══ FARM DEATHS ═══
local FarmDeathsConn=nil

_G.setFarmDeaths=function(s)
    if FarmDeathsConn then FarmDeathsConn:Disconnect(); FarmDeathsConn=nil end
    if not s then return end
    FarmDeathsConn=task.spawn(function()
        while C.AutoFarmDeaths do
            pcall(function()
                local ch=LP.Character
                if ch then
                    local h=ch:FindFirstChildOfClass("Humanoid")
                    if h then h.Health=0 end
                end
            end)
            task.wait(C.FarmDelay or 3)
            if C.AutoFarmDeaths and RF then
                pcall(function()
                    local pa=RF:FindFirstChild("PlayAgain")
                    if pa then pa:FireServer() end
                end)
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

-- ═══ KNOB FARM (FIX: больше имён) ═══
local KNOB_NAMES={"knob","valve","wheel","crank","dial","lever","switch","button","handle"}

task.spawn(function()
    while task.wait(0.4) do
        if C.KnobFarm then
            pcall(function()
                local r=getR()
                if not r then return end
                local pos=r.Position
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") or o:IsA("BasePart") then
                        local n=string.lower(tostring(o.Name))
                        local matched=false
                        for _,k in ipairs(KNOB_NAMES) do
                            if string.find(n,k,1,true) then matched=true; break end
                        end
                        if matched then
                            local p=o:IsA("BasePart") and o or (o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart",true))
                            if p and p.Position and (p.Position-pos).Magnitude<10 then
                                local prompt=o:FindFirstChildWhichIsA("ProximityPrompt",true)
                                if prompt and prompt.Enabled then
                                    pcall(function()
                                        prompt:InputHoldBegin()
                                        task.wait(0.05)
                                        prompt:InputHoldEnd()
                                    end)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ AUTO COMPLETE DAM SEEK ═══
task.spawn(function()
    while task.wait(1) do
        if C.AutoCompleteDamSeek then
            pcall(function()
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") then
                        local n=string.lower(o.Name)
                        if string.find(n,"dam",1,true) or string.find(n,"seek",1,true) then
                            for _,p in ipairs(o:GetDescendants()) do
                                if p:IsA("BasePart") then
                                    p.CanTouch=false
                                    p.CanCollide=false
                                end
                            end
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
                    if o:IsA("Model") then
                        local n=string.lower(o.Name)
                        if string.find(n,"cringle",1,true) then
                            for _,p in ipairs(o:GetDescendants()) do
                                if p:IsA("BasePart") then
                                    p.CanTouch=false
                                    p.CanCollide=false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══ AUTO ROOMS ═══
task.spawn(function()
    while task.wait(0.5) do
        if C.AutoRooms then
            pcall(function()
                local ch=LP.Character
                if not ch then return end
                local h=ch:FindFirstChildOfClass("Humanoid")
                local r=ch:FindFirstChild("HumanoidRootPart")
                if not h or not r then return end
                local gd=_G.GD
                local latest=0
                if gd and gd:FindFirstChild("LatestRoom") then
                    latest=gd.LatestRoom.Value or 0
                end
                local bestDoor,bestNum=nil,math.huge
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") and string.lower(o.Name)=="door" then
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
                    if dp and dp.Position then
                        local dir=(dp.Position-r.Position).Unit
                        h:Move(dir,false)
                        if (dp.Position-r.Position).Magnitude<5 then
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
            end)
        end
    end
end)

-- ═══ AUTO AIM ═══
task.spawn(function()
    while task.wait(0.1) do
        if C.AutoAim then
            pcall(function()
                local cam=workspace.CurrentCamera
                if not cam then return end
                local ch=LP.Character
                local r=ch and ch:FindFirstChild("HumanoidRootPart")
                if not r then return end
                local closest,target=nil,math.huge
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") then
                        local n=string.lower(o.Name)
                        local isEnt=string.find(n,"rush",1,true) or string.find(n,"ambush",1,true)
                            or string.find(n,"seek",1,true) or string.find(n,"figure",1,true)
                        if isEnt then
                            local p=o.PrimaryPart and o.PrimaryPart.Position
                            if p then
                                local d=(p-r.Position).Magnitude
                                if d<target then target=d closest=p end
                            end
                        end
                    end
                end
                if closest then
                    cam.CFrame=CFrame.new(cam.CFrame.Position,closest)
                end
            end)
        end
    end
end)

-- ═══ SERVER HOP ═══
_G.serverHop=function()
    pcall(function()
        local TS=game:GetService("TeleportService")
        local HS=game:GetService("HttpService")
        local code=game.PlaceId
        local req=game:HttpGet("https://games.roblox.com/v1/games/"..code.."/servers/Public?sortOrder=Asc&limit=100")
        local servers=HS:JSONDecode(req)
        if servers and servers.data and #servers.data>0 then
            for _,srv in ipairs(servers.data) do
                if srv.id~=game.JobId and srv.playing<srv.maxPlayers then
                    N("Burmalda","Server hop...","info")
                    TS:TeleportToPlaceInstance(code,srv.id,LP)
                    return
                end
            end
        end
        N("Burmalda","No servers found","warn")
    end)
end

-- ═══ AUTO REJOIN ═══
task.spawn(function()
    while task.wait(5) do
        if C.AutoRejoin then
            pcall(function()
                if not LP.Parent then
                    game:GetService("TeleportService"):Teleport(game.PlaceId,LP)
                end
            end)
        end
    end
end)

-- ═══ ANTI KICK ═══
local antiKickHooked=false
task.spawn(function()
    while task.wait(2) do
        if C.AntiKick and not antiKickHooked then
            antiKickHooked=true
            pcall(function()
                if getconnections then
                    for _,conn in ipairs(getconnections(LP.OnTeleport)) do
                        pcall(function() conn:Disable() end)
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
    N("Burmalda","Loadstring copied","success")
end

-- ═══ EXTRA FARM HELPERS ═══
-- Auto починка: если HP мало — восстановить (для Farm)
task.spawn(function()
    while task.wait(0.5) do
        if C.AutoFarmDeaths then
            pcall(function()
                local ch=LP.Character
                if ch then
                    local h=ch:FindFirstChildOfClass("Humanoid")
                    if h and h.Health>0 and h.Health<h.MaxHealth*0.5 then
                        -- Не лечим, даём умереть для Farm
                    end
                end
            end)
        end
    end
end)

print("[Burmalda v15.1] Part 7/14 — EXPLOITS + FARM loaded")
