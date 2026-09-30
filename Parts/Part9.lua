-- BURMALDA v15.1 | Part 9/14 — MOVE + STATS + PLAYERS + FEATURES
-- Фиксы: follow связан с GUI, FPS/Ping корректные, уведомления с типами

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local RF=_G.RF
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
-- SAVE / TP TO SAVE
-- ═══════════════════════════════════════════════
local savedPos=nil

_G.savePos=function()
    pcall(function()
        local r=getR()
        if r then
            savedPos=r.CFrame
            N("Позиция","Сохранено","success")
        else
            N("Позиция","Нет персонажа","error")
        end
    end)
end

_G.tpToSave=function()
    pcall(function()
        if not savedPos then
            N("Позиция","Нет сохранения","warn")
            return
        end
        local r=getR()
        if r then
            r.CFrame=savedPos
            N("Позиция","ТП к сохранению","success")
        end
    end)
end

-- ═══════════════════════════════════════════════
-- SPECTATE PLAYER
-- ═══════════════════════════════════════════════
_G.spectatePlayer=function(t)
    pcall(function()
        if not t then
            -- Возврат к себе
            local ch=LP.Character
            local h=ch and ch:FindFirstChildOfClass("Humanoid")
            if h then
                workspace.CurrentCamera.CameraSubject=h
                N("Камера","Возврат к себе","info")
            end
            return
        end
        local tg=t.Character
        if not tg then N("Камера","Нет персонажа","error"); return end
        local h=tg:FindFirstChildWhichIsA("Humanoid")
        if h then
            workspace.CurrentCamera.CameraSubject=h
            N("Камера","Наблюдаем за "..tostring(t.Name),"info")
        end
    end)
end

-- ═══════════════════════════════════════════════
-- FOLLOW PLAYER (FIX: связь с GUI через C.FollowPlayer)
-- ═══════════════════════════════════════════════
local followTarget=nil
local followConn=nil

_G.setFollow=function(plr)
    if followConn then followConn:Disconnect(); followConn=nil end
    followTarget=plr
    if not plr then
        N("Follow","Остановлено","info")
        return
    end
    N("Follow","Следуем за "..tostring(plr.Name),"success")
    followConn=Run.Heartbeat:Connect(function()
        if not followTarget then return end
        if not C.FollowPlayer then return end
        pcall(function()
            local myCh=LP.Character
            local tg=followTarget.Character
            if myCh and tg then
                local myRoot=myCh:FindFirstChild("HumanoidRootPart")
                local tgRoot=tg:FindFirstChild("HumanoidRootPart")
                if myRoot and tgRoot then
                    myRoot.CFrame=CFrame.new(tgRoot.Position+Vector3.new(0,3,0))
                end
            end
        end)
    end)
end

_G.getFollowTarget=function() return followTarget end

-- Авто-отключение при OFF тумблера
task.spawn(function()
    while task.wait(0.5) do
        if not C.FollowPlayer and followConn then
            _G.setFollow(nil)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- SERVER HOP
-- ═══════════════════════════════════════════════
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
                    N("Сервер","Переход...","info")
                    TS:TeleportToPlaceInstance(code,srv.id,LP)
                    return
                end
            end
        end
        N("Сервер","Не найдено","warn")
    end)
end

-- ═══════════════════════════════════════════════
-- AUTO REJOIN
-- ═══════════════════════════════════════════════
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

-- ═══════════════════════════════════════════════
-- STATS — таймер
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(1) do
        if C.ShowTimer then
            C.SpeedrunTimer=(C.SpeedrunTimer or 0)+1
        end
    end
end)

_G.resetStats=function()
    C.KnobCounter=0
    C.CoinsCounter=0
    C.DeathsCounter=0
    C.DoorsCounter=0
    C.SpeedrunTimer=0
    N("Статистика","Сброшено","info")
end

-- ═══════════════════════════════════════════════
-- FPS / PING COUNTER (FIX: точные значения)
-- ═══════════════════════════════════════════════
local statsGui=Instance.new("ScreenGui")
statsGui.Name="BurmaldaStats"
statsGui.ResetOnSpawn=false
statsGui.DisplayOrder=150
statsGui.Parent=LP:WaitForChild("PlayerGui")

local statsFrame=Instance.new("Frame",statsGui)
statsFrame.Size=UDim2.new(0,200,0,44)
statsFrame.Position=UDim2.new(0,10,0,10)
statsFrame.BackgroundColor3=Color3.fromRGB(20,20,25)
statsFrame.BackgroundTransparency=0.3
statsFrame.BorderSizePixel=0
statsFrame.Visible=false

local sfc=Instance.new("UICorner",statsFrame)
sfc.CornerRadius=UDim.new(0,6)

local sfs=Instance.new("UIStroke",statsFrame)
sfs.Color=Color3.fromRGB(180,30,30)
sfs.Thickness=1.5

local fpsLbl=Instance.new("TextLabel",statsFrame)
fpsLbl.Size=UDim2.new(1,-10,0,20)
fpsLbl.Position=UDim2.new(0,5,0,3)
fpsLbl.BackgroundTransparency=1
fpsLbl.Text="FPS: --"
fpsLbl.TextColor3=Color3.fromRGB(80,220,120)
fpsLbl.Font=Enum.Font.GothamBold
fpsLbl.TextSize=12
fpsLbl.TextXAlignment=Enum.TextXAlignment.Left

local pingLbl=Instance.new("TextLabel",statsFrame)
pingLbl.Size=UDim2.new(1,-10,0,18)
pingLbl.Position=UDim2.new(0,5,0,22)
pingLbl.BackgroundTransparency=1
pingLbl.Text="Ping: --"
pingLbl.TextColor3=Color3.fromRGB(150,200,255)
pingLbl.Font=Enum.Font.Gotham
pingLbl.TextSize=11
pingLbl.TextXAlignment=Enum.TextXAlignment.Left

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
                statsFrame.Visible=true
                if C.ShowFPS then
                    local icon="🟢"
                    if fps<30 then icon="🔴" elseif fps<50 then icon="🟡" end
                    fpsLbl.Text=icon.." FPS: "..fps
                else
                    fpsLbl.Text=""
                end
                if C.ShowPing then
                    local ping=math.floor((LP:GetNetworkPing() or 0)*1000)
                    local icon="🟢"
                    if ping>200 then icon="🔴" elseif ping>100 then icon="🟡" end
                    pingLbl.Text=icon.." Ping: "..ping.." ms"
                else
                    pingLbl.Text=""
                end
            else
                statsFrame.Visible=false
            end
        end)
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
-- PLAYERS LIST
-- ═══════════════════════════════════════════════
_G.getAllPlayers=function()
    local list={}
    for _,plr in ipairs(P:GetPlayers()) do
        if plr~=LP then
            table.insert(list,plr)
        end
    end
    return list
end

_G.getAllEntities=function()
    local list={}
    for _,o in ipairs(workspace:GetDescendants()) do
        if o:IsA("Model") then
            local n=string.lower(o.Name)
            if string.find(n,"rush",1,true) or string.find(n,"ambush",1,true)
            or string.find(n,"seek",1,true) or string.find(n,"figure",1,true)
            or string.find(n,"screech",1,true) or string.find(n,"halt",1,true)
            or string.find(n,"grumble",1,true) or string.find(n,"giggle",1,true)
            or string.find(n,"blitz",1,true) or string.find(n,"scribble",1,true) then
                table.insert(list,o)
            end
        end
    end
    return list
end

-- ═══════════════════════════════════════════════
-- FEATURES — Adaptive Speed
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(0.5) do
        if C.AdaptiveSpeed then
            pcall(function()
                local ch=LP.Character
                local h=ch and ch:FindFirstChildOfClass("Humanoid")
                local r=ch and ch:FindFirstChild("HumanoidRootPart")
                if h and r then
                    local closest=math.huge
                    for _,o in ipairs(workspace:GetDescendants()) do
                        if o:IsA("Model") then
                            local n=string.lower(o.Name)
                            if string.find(n,"rushmoving",1,true) or string.find(n,"ambushmoving",1,true) then
                                local p=o.PrimaryPart and o.PrimaryPart.Position
                                if p then
                                    local d=(p-r.Position).Magnitude
                                    if d<closest then closest=d end
                                end
                            end
                        end
                    end
                    if closest<50 then
                        h.WalkSpeed=40
                    elseif closest<100 then
                        h.WalkSpeed=25
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- FEATURES — Predictive Hide
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(0.3) do
        if C.PredictiveHide then
            pcall(function()
                local ch=LP.Character
                local r=ch and ch:FindFirstChild("HumanoidRootPart")
                if r then
                    for _,o in ipairs(workspace:GetDescendants()) do
                        if o:IsA("Model") then
                            local n=string.lower(o.Name)
                            if n=="rushmoving" or n=="ambushmoving" then
                                local p=o.PrimaryPart and o.PrimaryPart.Position
                                if p and (p-r.Position).Magnitude<150 then
                                    if not _G.isInsideCloset() and _G.aH then
                                        pcall(_G.aH)
                                    end
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
-- FEATURES — Smart Path
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(1) do
        if C.SmartPath then
            pcall(function()
                -- Идём к ближайшей двери через AutoSeekDoor
                if _G.tpNearestItem then
                    -- ничего не делаем, оставляем логику AutoSeekDoor
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
-- DISCORD RICH (заглушка на v15)
-- ═══════════════════════════════════════════════
task.spawn(function()
    while task.wait(30) do
        if C.DiscordRich then
            -- Заглушка, в v20 сделаем нормально
        end
    end
end)

print("[Burmalda v15.1] Part 9/14 — MOVE + STATS + PLAYERS + FEATURES loaded")
