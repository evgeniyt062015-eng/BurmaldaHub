-- BURMALDA v15 | Part 14/14 — LOADING + AUTO-LOADER
-- Экран загрузки с подсказками, определение места, автозапуск

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local P=_G.P
local HS=_G.HS

-- ═══ ЭКРАН ЗАГРУЗКИ ═══
local LoadGui=Instance.new("ScreenGui")
LoadGui.Name="BurmaldaLoading"
LoadGui.ResetOnSpawn=false
LoadGui.IgnoreGuiInset=true
LoadGui.DisplayOrder=999
LoadGui.Parent=LP:WaitForChild("PlayerGui")

local BG=Instance.new("Frame",LoadGui)
BG.Size=UDim2.new(1,0,1,0)
BG.BackgroundColor3=Color3.fromRGB(10,10,14)
BG.BorderSizePixel=0

-- Градиент
local grad=Instance.new("Frame",BG)
grad.Size=UDim2.new(1,0,1,0)
grad.BackgroundColor3=Color3.fromRGB(120,20,40)
grad.BackgroundTransparency=0.85
grad.BorderSizePixel=0

-- Лого
local Logo=Instance.new("ImageLabel",BG)
Logo.Size=UDim2.new(0,100,0,100)
Logo.Position=UDim2.new(0.5,-50,0.4,-150)
Logo.BackgroundTransparency=1
Logo.Image="rbxassetid://6031280882"
Logo.ImageColor3=Color3.fromRGB(180,30,30)
Logo.ScaleType=Enum.ScaleType.Fit

-- Заголовок
local Title=Instance.new("TextLabel",BG)
Title.Size=UDim2.new(1,0,0,50)
Title.Position=UDim2.new(0,0,0.4,-30)
Title.BackgroundTransparency=1
Title.Text="BURMALDA v15"
Title.TextColor3=Color3.fromRGB(240,240,245)
Title.Font=Enum.Font.GothamBlack
Title.TextSize=42

local Ver=Instance.new("TextLabel",BG)
Ver.Size=UDim2.new(1,0,0,20)
Ver.Position=UDim2.new(0,0,0.4,25)
Ver.BackgroundTransparency=1
Ver.Text="v15.0 FINAL | By KOTENOK7204"
Ver.TextColor3=Color3.fromRGB(180,30,30)
Ver.Font=Enum.Font.GothamBold
Ver.TextSize=14

-- Прогресс-бар
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

-- Процент
local Percent=Instance.new("TextLabel",BG)
Percent.Size=UDim2.new(1,0,0,18)
Percent.Position=UDim2.new(0,0,0.5,45)
Percent.BackgroundTransparency=1
Percent.Text="0%"
Percent.TextColor3=Color3.fromRGB(200,200,210)
Percent.Font=Enum.Font.GothamBold
Percent.TextSize=12

-- Статус
local Status=Instance.new("TextLabel",BG)
Status.Size=UDim2.new(1,0,0,24)
Status.Position=UDim2.new(0,0,0.5,70)
Status.BackgroundTransparency=1
Status.Text="Инициализация..."
Status.TextColor3=Color3.fromRGB(240,240,245)
Status.Font=Enum.Font.Gotham
Status.TextSize=14

-- ПОДСКАЗКА (что сейчас грузится)
local Hint=Instance.new("TextLabel",BG)
Hint.Size=UDim2.new(0,600,0,20)
Hint.Position=UDim2.new(0.5,-300,0.5,100)
Hint.BackgroundTransparency=1
Hint.Text=""
Hint.TextColor3=Color3.fromRGB(120,180,255)
Hint.Font=Enum.Font.GothamItalic
Hint.TextSize=11
Hint.TextWrapped=true

-- Место
local Info=Instance.new("TextLabel",BG)
Info.Size=UDim2.new(1,0,0,18)
Info.Position=UDim2.new(0,0,0.5,130)
Info.BackgroundTransparency=1
Info.Text=""
Info.TextColor3=Color3.fromRGB(150,150,160)
Info.Font=Enum.Font.Gotham
Info.TextSize=11

-- Кредит
local Credit=Instance.new("TextLabel",BG)
Credit.Size=UDim2.new(1,0,0,20)
Credit.Position=UDim2.new(0,0,1,-30)
Credit.BackgroundTransparency=1
Credit.Text="Tester: Kostya_2015KostyaKos | Discord в v20"
Credit.TextColor3=Color3.fromRGB(120,120,130)
Credit.Font=Enum.Font.Gotham
Credit.TextSize=10

-- ═══ ПОДСКАЗКИ ПО КАЖДОЙ ЧАСТИ ═══
local HINTS={
    [1]="Part 1 — CORE: Config, темы, уведомления",
    [2]="Part 2 — MAIN: Fly, Noclip, Speed (фикс телепорта)",
    [3]="Part 3 — TP + HIDE + AUTO: Auto Collect, Auto Coins, Auto Door",
    [4]="Part 4 — BYPASS: Rush, Ambush, Seek, Figure + Abysall",
    [5]="Part 5 — VISUAL: FOV, Chams, Wallhack (с выключением)",
    [6]="Part 6 — ESP: 22 монстра + объекты через Highlight",
    [7]="Part 7 — EXPLOITS: God Mode, Freeze, Time Stop",
    [8]="Part 8 — MUSIC + SOUND: плеер, предупреждения",
    [9]="Part 9 — STATS + PLAYERS: FPS, Ping, Follow",
    [10]="Part 10 — FUN: Snow, Aura, Fireworks, Ducks",
    [11]="Part 11 — ADMIN: Fake Panel, 40+ кнопок",
    [12]="Part 12 — FPS BOOSTER: Low Graphics, Remove Particles",
    [13]="Part 13 — GUI: 34 вкладки, кнопка B, Search",
}

local HINTS_STATIC={
    "💡 Совет: нажми B — открыть меню",
    "💡 Совет: Auto Seek Door — идёт к дверям сам",
    "💡 Совет: Bypass Rush — защита от Rush",
    "💡 Совет: ESP Doors — видно все двери",
    "💡 Совет: FPS Booster — убирает лаги",
    "💡 Совет: Fly — F для вкл/выкл",
    "💡 Совет: Admin — Fake Panel (визуал)",
    "💡 Совет: Spawn Rush — реально создаёт шар",
    "💡 Совет: Config в Settings — сохранение",
    "💡 Совет: Updates — проверка версии",
    "💡 Совет: Search в хедере — поиск функций",
    "💡 Совет: Notify Entities — уведомления о спавне",
}

local function setProgress(p, text, hint)
    p=math.clamp(p,0,1)
    Bar:TweenSize(UDim2.new(p,0,1,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
    Percent.Text=math.floor(p*100).."%"
    if text then Status.Text=text end
    if hint then Hint.Text=hint end
end

local function detectLocation()
    local inGame=false
    if _G.CR and _G.CR:FindFirstChildOfClass("Model") then
        inGame=true
    end
    local floor="Hotel"
    if _G.GD and _G.GD:FindFirstChild("Floor") then
        floor=_G.GD.Floor.Value
    end
    if inGame then
        Info.Text="📍 Место: В ИГРЕ | Этаж: "..floor
        return "game", floor
    else
        Info.Text="📍 Место: ЛОББИ (ожидание игры)"
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
            print("[Burmalda v15] Part "..i.." loaded")
        else
            warn("[Burmalda v15] Part "..i.." failed: "..tostring(err))
        end
        task.wait(0.15)
        
        -- Периодически меняем подсказку на статичную
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
    
    setProgress(0.25, "Загрузка скриптов...", "💡 Загружаем 12 частей...")
    task.wait(0.2)
    
    -- Загружаем Part2-13
    loadParts(2)
    
    setProgress(1, "BURMALDA v15 запущена!", "✅ Готово! Нажми B для открытия меню")
    task.wait(1.5)
    
    -- Плавно убираем экран
    local fadeTime=0.6
    local steps=15
    for i=1,steps do
        local p=i/steps
        BG.BackgroundTransparency=p
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
        task.wait(fadeTime/steps)
    end
    LoadGui:Destroy()
    
    -- Приветствие
    task.wait(0.3)
    N("✅ Burmalda v15 загружена!")
    task.wait(0.5)
    N("👑 Нажми B — открыть меню")
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
        N("📍 Новый этаж: "..newFloor)
    end
end)

-- Следим за сменой этажа
task.spawn(function()
    while task.wait(2) do
        if _G.GD and _G.GD:FindFirstChild("Floor") then
            local cur=_G.GD.Floor.Value
            if cur~=lastFloor then
                lastFloor=cur
                N("📍 Этаж изменился: "..cur)
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

print("[Burmalda v15] Part 14/14 — LOADING SCREEN + AUTO-LOADER loaded")
