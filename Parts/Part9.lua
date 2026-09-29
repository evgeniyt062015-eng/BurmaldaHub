-- BURMALDA v15 | Part 9/14 — MOVE + STATS + PLAYERS + FEATURES
-- Save/TP, Spectate, Follow, Server Hop, Stats, Player list, Features

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local UIS=_G.UIS
local RF=_G.RF
local P=_G.P

-- ═══ MOVE — SAVE / TP ═══
local savedPos=nil
_G.savePos=function()
    local ch=LP.Character
    if ch and ch:FindFirstChild("HumanoidRootPart") then
        savedPos=ch.HumanoidRootPart.CFrame
        N("Position saved")
    end
end
_G.tpToSave=function()
    if not savedPos then N("No saved position"); return end
    local ch=LP.Character
    if ch and ch:FindFirstChild("HumanoidRootPart") then
        ch.HumanoidRootPart.CFrame=savedPos
        N("TP to saved")
    end
end

-- ═══ SPECTATE PLAYER ═══
_G.spectatePlayer=function(t)
    local tg=t.Character
    if not tg then N("No character"); return end
    local h=tg:FindFirstChildWhichIsA("Humanoid")
    if h then
        workspace.CurrentCamera.CameraSubject=h
        N("Spectating "..t.Name)
    end
end

-- ═══ FOLLOW PLAYER ═══
local followTarget=nil
local followConn=nil

_G.setFollow=function(plr)
    if followConn then followConn:Disconnect(); followConn=nil end
    followTarget=plr
    if not plr then
        N("Follow stopped")
        return
    end
    N("Following "..plr.Name)
    followConn=Run.Heartbeat:Connect(function()
        if not followTarget or not C.FollowPlayer then return end
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
end

-- ═══ SERVER HOP ═══
_G.serverHop=function()
    pcall(function()
        local TS=game:GetService("TeleportService")
        local code=game.PlaceId
        local req=game:HttpGet("https://games.roblox.com/v1/games/"..code.."/servers/Public?sortOrder=Asc&limit=100")
        local servers=game:GetService("HttpService"):JSONDecode(req)
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
                if not LP.Parent then
                    game:GetService("TeleportService"):Teleport(game.PlaceId,LP)
                end
            end)
        end
    end
end)

-- ═══ STATS ═══
_G.resetStats=function()
    C.KnobCounter=0
    C.CoinsCounter=0
    C.DeathsCounter=0
    C.DoorsCounter=0
    C.SpeedrunTimer=0
    N("Stats reset")
end

-- Таймер
task.spawn(function()
    while task.wait(1) do
        if C.ShowTimer then
            C.SpeedrunTimer=C.SpeedrunTimer+1
        end
    end
end)

-- FPS / Ping / Memory Counter
local statsGui=Instance.new("ScreenGui")
statsGui.Name="BurmaldaStats"
statsGui.ResetOnSpawn=false
statsGui.Parent=LP:WaitForChild("PlayerGui")

local statsLabel=Instance.new("TextLabel",statsGui)
statsLabel.Size=UDim2.new(0,200,0,20)
statsLabel.Position=UDim2.new(0,10,0,30)
statsLabel.BackgroundTransparency=0.5
statsLabel.BackgroundColor3=Color3.fromRGB(20,20,25)
statsLabel.TextColor3=Color3.fromRGB(240,240,245)
statsLabel.Font=Enum.Font.GothamBold
statsLabel.TextSize=12
statsLabel.Text=""
statsLabel.TextXAlignment=Enum.TextXAlignment.Left
statsLabel.Visible=false

local statC=Instance.new("UICorner",statsLabel)
statC.CornerRadius=UDim.new(0,4)

local frames=0
local fps=0
Run.Heartbeat:Connect(function()
    frames=frames+1
end)
task.spawn(function()
    while task.wait(1) do
        fps=frames
        frames=0
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if C.ShowFPS or C.ShowPing then
            statsLabel.Visible=true
            local txt=""
            if C.ShowFPS then txt=txt.."FPS: "..fps.."  " end
            if C.ShowPing then
                local ping=LP:GetNetworkPing()*1000
                txt=txt.."Ping: "..math.floor(ping).."ms"
            end
            statsLabel.Text=txt
        else
            statsLabel.Visible=false
        end
    end
end)

-- ═══ CHAT SPAM ═══
_G.chatSpam=function(msg,count)
    pcall(function()
        local RS=_G.RS
        local Folder=RS:FindFirstChild("DefaultChatSystemEvents") or Instance.new("Folder")
        local Event=Folder:FindFirstChild("SayMessageRequest") or Instance.new("RemoteEvent")
        for i=1,(count or 5) do
            Event:FireServer(msg or "Burmalda v15 on top!","All")
        end
    end)
    N("Chat spam x"..(count or 5))
end

-- ═══ PLAYERS LIST (GUI — будет в Part13, тут API) ═══
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
            local n=o.Name:lower()
            if n:find("rush") or n:find("ambush") or n:find("seek")
            or n:find("figure") or n:find("screech") or n:find("halt")
            or n:find("grumble") or n:find("giggle") or n:find("blitz")
            or n:find("scribble") or n:find("dread") or n:find("surge") then
                table.insert(list,o)
            end
        end
    end
    return list
end

-- ═══ FEATURES ═══
-- Adaptive Speed — подстраивает скорость под опасность
task.spawn(function()
    while task.wait(0.5) do
        if C.AdaptiveSpeed then
            local ch=LP.Character
            local h=ch and ch:FindFirstChildOfClass("Humanoid")
            if h then
                local closest=math.huge
                local root=ch:FindFirstChild("HumanoidRootPart")
                if root then
                    for _,o in ipairs(workspace:GetDescendants()) do
                        if o:IsA("Model") then
                            local n=o.Name:lower()
                            if n:find("rush") or n:find("ambush") then
                                local p=o.PrimaryPart and o.PrimaryPart.Position
                                if p then
                                    local d=(p-root.Position).Magnitude
                                    if d<closest then closest=d end
                                end
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
        end
    end
end)

-- Predictive Hide — прятаться заранее
task.spawn(function()
    while task.wait(0.3) do
        if C.PredictiveHide then
            local ch=LP.Character
            local root=ch and ch:FindFirstChild("HumanoidRootPart")
            if root then
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") then
                        local n=o.Name:lower()
                        if (n=="rushmoving" or n=="ambushmoving") then
                            local p=o.PrimaryPart and o.PrimaryPart.Position
                            if p and (p-root.Position).Magnitude<150 then
                                if not _G.isInsideCloset() and _G.aH then
                                    pcall(_G.aH)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- Smart Path — умный путь к цели
task.spawn(function()
    while task.wait(1) do
        if C.SmartPath then
            -- Заглушка — просто идём к двери
            pcall(function()
                if _G.tpNearestItem then _G.tpNearestItem() end
            end)
        end
    end
end)

-- ═══ DISCORD RICH (заглушка) ═══
task.spawn(function()
    while task.wait(30) do
        if C.DiscordRich then
            -- Заглушка (в v20 сделаем нормально)
        end
    end
end)

print("[Burmalda v15] Part 9/14 — MOVE + STATS + PLAYERS + FEATURES loaded")
