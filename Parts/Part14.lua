-- BURMALDA v15.1 | Part 14/14 — LOADING + AUTO-LOADER
-- Экран загрузки, определение лобби/игры, автозапуск, MM2 уведомления

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local P=_G.P
local HS=_G.HS

-- ═══════════════════════════════════════════════
-- ЭКРАН ЗАГРУЗКИ
-- ═══════════════════════════════════════════════
local LoadGui=Instance.new("ScreenGui")
LoadGui.Name="BurmaldaLoading"
LoadGui.ResetOnSpawn=false
LoadGui.IgnoreGuiInset=true
LoadGui.DisplayOrder=1000
LoadGui.Parent=LP:WaitForChild("PlayerGui")

local BG=Instance.new("Frame",LoadGui)
BG.Size=UDim2.new(1,0,1,0)
BG.BackgroundColor3=Color3.fromRGB(10,10,14)
BG.BorderSizePixel=0

local grad=Instance.new("Frame",BG)
grad.Size=UDim2.new(1,0,1,0)
grad.BackgroundColor3=Color3.fromRGB(120,20,40)
grad.BackgroundTransparency=0.85
grad.BorderSizePixel=0

local Logo=Instance.new("ImageLabel",BG)
Logo.Size=UDim2.new(0,100,0,100)
Logo.Position=UDim2.new(0.5,-50,0.4,-150)
Logo.BackgroundTransparency=1
Logo.Image="rbxassetid://6031280882"
Logo.ImageColor3=Color3.fromRGB(180,30,30)
Logo.ScaleType=Enum.ScaleType.Fit

local Title=Instance.new("TextLabel",BG)
Title.Size=UDim2.new(1,0,0,50)
Title.Position=UDim2.new(0,0,0.4,-30)
Title.BackgroundTransparency=1
Title.Text="BURMALDA v15.1"
Title.TextColor3=Color3.fromRGB(240,240,245)
Title.Font=Enum.Font.GothamBlack
Title.TextSize=42

local Ver=Instance.new("TextLabel",BG)
Ver.Size=UDim2.new(1,0,0,20)
Ver.Position=UDim2.new(0,0,0.4,25)
Ver.BackgroundTransparency=1
Ver.Text="v15.1 FINAL | By KOTENOK7204"
Ver.TextColor3=Color3.fromRGB(180,30,30)
Ver.Font=Enum.Font.GothamBold
Ver.TextSize=14

local BarBG=Instance.new("Frame",BG)
BarBG.Size=UDim2.new(0,400,0,8)
BarBG.Position=UDim2.new(0.5,-200,0.5,30)
BarBG.BackgroundColor3=Color3.fromRGB(40,40,45)
BarBG.BorderSizePixel=0
local BarC=Instance.new("UICorner",BarBG)
BarC.CornerRadius=UDim.new(1,0)

local Bar=Instance.new("Frame",BarBG)
Bar.Size=UDim2.new(0,0,1,0)
Bar.BackgroundColor3=Color3.fromRGB(180,30,30)
Bar.BorderSizePixel=0
local BC=Instance.new("UICorner",Bar)
BC.CornerRadius=UDim.new(1,0)

local Percent=Instance.new("TextLabel",BG)
Percent.Size=UDim2.new(1,0,0,18)
Percent.Position=UDim2.new(0,0,0.5,45)
Percent.BackgroundTransparency=1
Percent.Text="0%"
Percent.TextColor3=Color3.fromRGB(200,200,210)
Percent.Font=Enum.Font.GothamBold
Percent.TextSize=12

local Status=Instance.new("TextLabel",BG)
Status.Size=UDim2.new(1,0,0,24)
Status.Position=UDim2.new(0,0,0.5,70)
Status.BackgroundTransparency=1
Status.Text="Инициализация..."
Status.TextColor3=Color3.fromRGB(240,240,245)
Status.Font=Enum.Font.Gotham
Status.TextSize=14

local Hint=Instance.new("TextLabel",BG)
Hint.Size=UDim2.new(0,600,0,20)
Hint.Position=UDim2.new(0.5,-300,0.5,100)
Hint.BackgroundTransparency=1
Hint.Text=""
Hint.TextColor3=Color3.fromRGB(120,180,255)
Hint.Font=Enum.Font.Gotham
Hint.TextSize=11
Hint.TextWrapped=true

local Info=Instance.new("TextLabel",BG)
Info.Size=UDim2.new(1,0,0,18)
Info.Position=UDim2.new(0,0,0.5,130)
Info.BackgroundTransparency=1
Info.Text=""
Info.TextColor3=Color3.fromRGB(150,150,160)
Info.Font=Enum.Font.Gotham
Info.TextSize=11

local Credit=Instance.new("TextLabel",BG)
Credit.Size=UDim2.new(1,0,0,20)
Credit.Position=UDim2.new(0,0,1,-30)
Credit.BackgroundTransparency=1
Credit.Text="Tester: Kostya_2015KostyaKos | Discord в v20"
Credit.TextColor3=Color3.fromRGB(120,120,130)
Credit.Font=Enum.Font.Gotham
Credit.TextSize=10

-- ═══ ПОДСКАЗКИ ═══
local HINTS={
    [2]="Part 2 — MAIN: Fly, Noclip, Speed (anti-slide)",
    [3]="Part 3 — TP + HIDE + AUTO: Auto Collect",
    [4]="Part 4 — BYPASS: Rush, Ambush, Seek, Figure",
    [5]="Part 5 — VISUAL: FOV, Chams, Wallhack",
    [6]="Part 6 — ESP: 22 монстра + объекты",
    [7]="Part 7 — EXPLOITS: God Mode, Freeze",
    [8]="Part 8 — MUSIC + SOUND",
    [9]="Part 9 — STATS + PLAYERS",
    [10]="Part 10 — FUN: Snow, Aura, Ducks",
    [11]="Part 11 — ADMIN: Fake Panel",
    [12]="Part 12 — FPS BOOSTER",
    [13]="Part 13 — GUI: 35 вкладок, кнопка B",
}

local HINTS_STATIC={
    "💡 Совет: нажми B — открыть меню",
    "💡 Совет: Auto Seek Door — идёт к дверям",
    "💡 Совет: Bypass Rush — защита от Rush",
    "💡 Совет: ESP Doors — видно все двери",
    "💡 Совет: FPS Booster — убирает лаги",
    "💡 Совет: Fly — F для вкл/выкл",
    "💡 Совет: Search в хедере — поиск",
    "💡 Совет: Config в Settings",
    "💡 Совет: Notifications — настройки",
    "💡 Совет: Notify Entities — о спавне",
}

local function setProgress(p, text, hint)
    p=math.clamp(p,0,1)
    Bar:TweenSize(UDim2.new(p,0,1,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
    Percent.Text=math.floor(p*100).."%"
    if text then Status.Text=text end
    if hint then Hint.Text=hint end
end

-- ═══ ОПРЕДЕЛЕНИЕ МЕСТА ═══
local function detectLocation()
    local inGame=false
    
    -- Проверка 1: комнаты
    if _G.CR then
        for _,child in ipairs(_G.CR:GetChildren()) do
            if child:IsA("Model") then
                inGame=true
                break
            end
        end
    end
    
    -- Проверка 2: LatestRoom > 0
    if not inGame then
        local gd=_G.GD
        if gd and gd:FindFirstChild("LatestRoom") then
            local lr=gd.LatestRoom.Value
            if lr and tonumber(lr) and tonumber(lr)>0 then
                inGame=true
            end
        end
    end
    
    -- Проверка 3: рядом есть Door
    if not inGame then
        local ch=LP and LP.Character
        if ch then
            local r=ch:FindFirstChild("HumanoidRootPart")
            if r then
                for _,o in ipairs(workspace:GetDescendants()) do
                    if o:IsA("Model") and string.lower(o.Name)=="door" then
                        local p=o:GetPivot().Position
                        if p and (p-r.Position).Magnitude<50 then
                            inGame=true
                            break
                        end
                    end
                end
            end
        end
    end
    
    local floor="Hotel"
    if _G.GD and _G.GD:FindFirstChild("Floor") then
        floor=_G.GD.Floor.Value
    end
    
    if inGame then
        Info.Text="📍 Место: В ИГРЕ | Этаж: "..floor
        return "game", floor
    else
        Info.Text="📍 Место: ЛОББИ — зайдите в лифт и начните игру"
        return "lobby", floor
    end
end

-- ═══ ЗАГРУЗКА ЧАСТЕЙ ═══
local function loadParts(startFrom)
    local base="https://raw.githubusercontent.com/evgeniyt062015-eng/BurmaldaHub/main/Parts/"
    local total=13
    local start=startFrom or 2
    
    for i=start,total do
        setProgress((i-start+1)/(total-start+1), "Загрузка Part "..i.."/"..total.."...", HINTS[i] or "")
        local ok,err=pcall(function()
            loadstring(game:HttpGet(base.."Part"..i..".lua?t="..tick()))()
        end)
        if ok then
            print("[Burmalda v15.1] Part "..i.." loaded")
        else
            warn("[Burmalda v15.1] Part "..i.." failed: "..tostring(err))
            if _G.N then
                _G.N("Ошибка","Part"..i.." не загружен","error")
            end
        end
        task.wait(0.15)
        
        if i%3==0 then
            Hint.Text=HINTS_STATIC[math.random(1,#HINTS_STATIC)]
            task.wait(0.3)
        end
    end
end

-- ═══ ОСНОВНОЙ ЦИКЛ ═══
task.spawn(function()
    setProgress(0.05, "Проверка executor...", "💡 Проверяем поддержку функций...")
    task.wait(0.4)
    
    setProgress(0.15, "Определение места...", "💡 Ищем лобби или игру...")
    local loc, floor = detectLocation()
    task.wait(0.5)
    
    -- Сообщение лобби/игра
    if loc=="lobby" then
        setProgress(0.20, "ЛОББИ — зайдите в лифт и начните игру", "💡 HOST GAME → выберите этаж")
        Hint.TextColor3=Color3.fromRGB(255,200,50)
        task.wait(1.5)
        N("🎮 ВЫ В ЛОББИ","Зайдите в лифт и начните игру","warn")
        task.wait(1)
        N("💡 Подсказка","HOST GAME → выберите этаж","info")
        task.wait(1.5)
    else
        setProgress(0.20, "ВЫ В ИГРЕ | Этаж: "..floor, "💡 Загружаем функции для "..floor)
        Hint.TextColor3=Color3.fromRGB(80,220,120)
        task.wait(1)
        N("✅ ВЫ В ИГРЕ","Этаж: "..floor,"success")
        task.wait(0.5)
    end
    
    setProgress(0.25, "Загрузка скриптов...", "💡 Загружаем 12 частей...")
    task.wait(0.2)
    
    loadParts(2)
    
    setProgress(1, "BURMALDA v15.1 запущена!", "✅ Готово! Нажми B для открытия меню")
    task.wait(1.5)
    
    -- Плавное исчезновение
    local steps=15
    for i=1,steps do
        local p=i/steps
        BG.BackgroundTransparency=p
        grad.BackgroundTransparency=0.85+p*0.15
        Logo.ImageTransparency=p
        Title.TextTransparency=p
        Ver.TextTransparency=p
        BarBG.BackgroundTransparency=p
        Bar.BackgroundTransparency=p
        Percent.TextTransparency=p
        Status.TextTransparency=p
        Hint.TextTransparency=p
        Info.TextTransparency=p
        Credit.TextTransparency=p
        task.wait(0.6/steps)
    end
    LoadGui:Destroy()
    
    task.wait(0.3)
    N("🔥 Burmalda v15.1","Загружено успешно!","success")
    task.wait(0.5)
    N("👑 Меню","Нажми B — открыть меню","info")
end)

-- ═══ АВТО-ПЕРЕЗАПУСК ПРИ ТЕЛЕПОРТЕ ═══
local AUTO_RELOAD=true
local lastFloor=_G.gF()
local lastChar=LP.Character

LP.CharacterAdded:Connect(function(newChar)
    if not AUTO_RELOAD then return end
    if lastChar==newChar then return end
    lastChar=newChar
    task.wait(3)
    local newFloor=_G.gF()
    if newFloor~=lastFloor then
        lastFloor=newFloor
        N("📍 Этаж","Новый: "..newFloor,"info")
    end
end)

task.spawn(function()
    while task.wait(2) do
        if _G.GD and _G.GD:FindFirstChild("Floor") then
            local cur=_G.GD.Floor.Value
            if cur~=lastFloor then
                lastFloor=cur
                N("📍 Этаж","Изменился: "..cur,"info")
            end
        end
    end
end)

-- ═══ QUEUE_ON_TELEPORT ═══
pcall(function()
    if queue_on_teleport then
        queue_on_teleport([[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/evgeniyt062015-eng/BurmaldaHub/main/Main.lua?t="..tick()))()
        ]])
    end
end)

print("[Burmalda v15.1] Part 14/14 — LOADING + AUTO-LOADER loaded")
