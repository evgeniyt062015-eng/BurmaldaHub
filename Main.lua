-- BURMALDA v15.1 FINAL | KOTENOK7204 | Tester: Kostya_2015KostyaKos
-- Загрузчик с защитой от повторного запуска

-- ═══ GUARD: ОЧИСТКА ПЕРЕД ПОВТОРНЫМ ЗАПУСКОМ ═══
if _G.BURMALDA_LOADED then
    pcall(function()
        local pg=game.Players.LocalPlayer:WaitForChild("PlayerGui")
        for _,name in ipairs({"BurmaldaFS","BurmaldaV15GUI","BurmaldaLoading","BurmaldaNotifs","BurmaldaStats","BurmaldaFPS","BurmaldaTracker","BurmaldaCross","BurmaldaHit","BurmaldaDanger","BurmaldaTestResult","BurmaldaTracers"}) do
            local g=pg:FindFirstChild(name)
            if g then g:Destroy() end
        end
        for _,name in ipairs({"BurmaldaPlatforms","BurmaldaSpawned","BurmaldaFakeEntities","BurmaldaDmg","BurmaldaPath","BurmaldaBox"}) do
            local o=workspace:FindFirstChild(name)
            if o then o:Destroy() end
        end
    end)
    _G.BURMALDA_LOADED=false
    task.wait(0.5)
end
_G.BURMALDA_LOADED=true

-- ═══ ЗАГРУЗКА ═══
local base="https://raw.githubusercontent.com/evgeniyt062015-eng/BurmaldaHub/main/Parts/"

-- 1. CORE
local ok1,err1=pcall(function()
    loadstring(game:HttpGet(base.."Part1.lua?t="..tick()))()
end)
if not ok1 then warn("[Burmalda v15.1] Part1 failed: "..tostring(err1)) end

-- 2. LOADING
local ok14,err14=pcall(function()
    loadstring(game:HttpGet(base.."Part14.lua?t="..tick()))()
end)
if not ok14 then
    warn("[Burmalda v15.1] Part14 failed: "..tostring(err14))
    for i=2,13 do
        pcall(function()
            loadstring(game:HttpGet(base.."Part"..i..".lua?t="..tick()))()
        end)
    end
end

print("[Burmalda v15.1] Main loader finished.")
