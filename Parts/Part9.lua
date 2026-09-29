-- BURMALDA v14 | Part 9/9 — LOADING SCREEN + AUTO-LOADER
-- Экран загрузки, определение лобби/игры, авто-перезапуск при телепорте

local C=_G.C
local T=_G.T
local N=_G.N
local LP=_G.LP
local Run=_G.Run
local P=_G.P
local HS=_G.HS
local CR=_G.CR

-- ═══ ЗАГРУЗОЧНЫЙ ЭКРАН ═══
local LoadGui=Instance.new("ScreenGui")
LoadGui.Name="BurmaldaLoading"
LoadGui.ResetOnSpawn=false
LoadGui.IgnoreGuiInset=true
LoadGui.DisplayOrder=999
LoadGui.Parent=LP:WaitForChild("PlayerGui")

-- Фон
local BG=Instance.new("Frame",LoadGui)
BG.Size=UDim2.new(1,0,1,0)
BG.BackgroundColor3=Color3.fromRGB(10,10,14)
BG.BorderSizePixel=0

-- Градиент сверху
local TopGrad=Instance.new("Frame",BG)
TopGrad.Size=UDim2.new(1,0,0.3,0)
TopGrad.BackgroundColor3=Color3.fromRGB(120,20,40)
TopGrad.BackgroundTransparency=0.7
TopGrad.BorderSizePixel=0

-- Лого (щит)
local Logo=Instance.new("ImageLabel",BG)
Logo.Size=UDim2.new(0,120,0,120)
Logo.Position=UDim2.new(0.5,-60,0.5,-180)
Logo.BackgroundTransparency=1
Logo.Image="rbxassetid://6031280882"
Logo.ImageColor3=Color3.fromRGB(180,30,30)
Logo.ScaleType=Enum.ScaleType.Fit

-- Заголовок
local Title=Instance.new("TextLabel",BG)
Title.Size=UDim2.new(1,0,0,50)
Title.Position=UDim2.new(0,0,0.5,-40)
Title.BackgroundTransparency=1
Title.Text="BURMALDA"
Title.TextColor3=Color3.fromRGB(240,240,245)
Title.Font=Enum.Font.GothamBlack
Title.TextSize=48
Title.TextScaled=false

local Ver=Instance.new("TextLabel",BG)
Ver.Size=UDim2.new(1,0,0,30)
Ver.Position=UDim2.new(0,0,0.5,20)
Ver.BackgroundTransparency=1
Ver.Text="v14 FINAL"
Ver.TextColor3=Color3.fromRGB(180,30,30)
Ver.Font=Enum.Font.GothamBold
Ver.TextSize=18

-- Прогресс-бар
local BarBG=Instance.new("Frame",BG)
BarBG.Size=UDim2.new(0,400,0,8)
BarBG.Position=UDim2.new(0.5,-200,0.5,80)
BarBG.BackgroundColor3=Color3.fromRGB(40,40,45)
BarBG.BorderSizePixel=0
local BarBGc=Instance.new("UICorner",BarBG)
BarBGc.CornerRadius=UDim.new(1,0)

local Bar=Instance.new("Frame",BarBG)
Bar.Size=UDim2.new(0,0,1,0)
Bar.BackgroundColor3=Color3.fromRGB(180,30,30)
Bar.BorderSizePixel=0
local Barc=Instance.new("UICorner",Bar)
Barc.CornerRadius=UDim.new(1,0)

-- Статус
local Status=Instance.new("TextLabel",BG)
Status.Size=UDim2.new(1,0,0,24)
Status.Position=UDim2.new(0,0,0.5,110)
Status.BackgroundTransparency=1
Status.Text="Инициализация..."
Status.TextColor3=Color3.fromRGB(200,200,210)
Status.Font=Enum.Font.Gotham
Status.TextSize=14

-- Инфо (пол/лобби)
local Info=Instance.new("TextLabel",BG)
Info.Size=UDim2.new(1,0,0,20)
Info.Position=UDim2.new(0,0,0.5,140)
Info.BackgroundTransparency=1
Info.Text=""
Info.TextColor3=Color3.fromRGB(150,150,160)
Info.Font=Enum.Font.Gotham
Info.TextSize=12

-- Подпись
local Credit=Instance.new("TextLabel",BG)
Credit.Size=UDim2.new(1,0,0,20)
Credit.Position=UDim2.new(0,0,1,-30)
Credit.BackgroundTransparency=1
Credit.Text="By KOTENOK7204 | Tester: Kostya_2015KostyaKos"
Credit.TextColor3=Color3.fromRGB(120,120,130)
Credit.Font=Enum.Font.Gotham
Credit.TextSize=11

-- ═══ ФУНКЦИИ ОБНОВЛЕНИЯ ═══
local function setProgress(p, text)
    p=math.clamp(p,0,1)
    Bar:TweenSize(UDim2.new(p,0,1,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
    if text then Status.Text=text end
end

local function detectLocation()
    -- Проверяем лобби или игру
    local inGame=false
    if CR and CR:FindFirstChildOfClass("Model") then
        inGame=true
    end
    local floor="Hotel"
    if _G.GD and _G.GD:FindFirstChild("Floor") then
        floor=_G.GD.Floor.Value
    end
    if inGame then
        Info.Text="Место: В ИГРЕ | Этаж: "..floor
        return "game", floor
    else
        Info.Text="Место: ЛОББИ (ожидание игры...)"
        return "lobby", floor
    end
end

-- ═══ ЗАГРУЗКА ═══
local function loadParts()
    local base="https://raw.githubusercontent.com/evgeniyt062015-eng/BurmaldaHub/main/Parts/"
    local total=8
    
    for i=1,total do
        setProgress((i-1)/total, "Загрузка Part "..i.."/"..total.."...")
        local ok,err=pcall(function()
            loadstring(game:HttpGet(base.."Part"..i..".lua?t="..tick()))()
        end)
        if ok then
            print("[Burmalda v14] Part "..i.." loaded")
        else
            warn("[Burmalda v14] Part "..i.." failed: "..tostring(err))
        end
        task.wait(0.1)
    end
    
    setProgress(1, "Готово!")
end

-- ═══ ОСНОВНОЙ ЦИКЛ ═══
task.spawn(function()
    setProgress(0.05, "Проверка executor...")
    task.wait(0.3)
    
    setProgress(0.15, "Определение места...")
    local loc,floor=detectLocation()
    task.wait(0.4)
    
    setProgress(0.25, "Загрузка скриптов...")
    task.wait(0.2)
    
    loadParts()
    
    task.wait(0.5)
    setProgress(1, "BURMALDA v14 запущена!")
    
    -- Ждём 1.5 сек и прячем
    task.wait(1.5)
    
    -- Плавно убираем
    for i=0,1,0.05 do
        BG.BackgroundTransparency=i
        TopGrad.BackgroundTransparency=0.7+i*0.3
        Logo.ImageTransparency=i
        Title.TextTransparency=i
        Ver.TextTransparency=i
        BarBG.BackgroundTransparency=i
        Bar.BackgroundTransparency=i
        Status.TextTransparency=i
        Info.TextTransparency=i
        Credit.TextTransparency=i
        task.wait(0.02)
    end
    LoadGui:Destroy()
    
    -- Приветствие
    task.wait(0.3)
    _G.N("Burmalda v14 загружена!")
end)

-- ═══ АВТО-ПЕРЕЗАПУСК ПРИ ТЕЛЕПОРТЕ (как в Abysall) ═══
local AUTO_RELOAD=true
local lastFloor=_G.gF()
local lastChar=LP.Character

-- Следим за сменой персонажа (новая игра / респавн)
LP.CharacterAdded:Connect(function(newChar)
    if not AUTO_RELOAD then return end
    if lastChar==newChar then return end
    lastChar=newChar
    
    task.wait(3)  -- ждём загрузки новой сцены
    local newFloor=_G.gF()
    if newFloor~=lastFloor then
        lastFloor=newFloor
        _G.N("Переход на этаж: "..newFloor)
        -- При следующем респавне Part8 сам загрузится заново
        -- (не перезагружаем, чтобы не было цикла)
    end
end)

-- Следим за сменой этажа (телепорт между этажами)
task.spawn(function()
    while task.wait(2) do
        if _G.GD and _G.GD:FindFirstChild("Floor") then
            local cur=_G.GD.Floor.Value
            if cur~=lastFloor then
                lastFloor=cur
                _G.N("Новый этаж: "..cur)
            end
        end
    end
end)

-- ═══ QUEUE_ON_TELEPORT (если поддерживается) ═══
pcall(function()
    if queue_on_teleport then
        queue_on_teleport([[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/evgeniyt062015-eng/BurmaldaHub/main/Main.lua?t="..tick()))()
        ]])
    end
end)

print("[Burmalda v14] Part 9/9 — LOADING SCREEN + AUTO-LOADER loaded")
