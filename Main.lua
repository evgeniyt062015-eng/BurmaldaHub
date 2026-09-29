-- BURMALDA v15 FINAL | KOTENOK7204 | Tester: Kostya_2015KostyaKos
-- Загрузчик: Part1 (CORE) + Part14 (LOADING), Part14 грузит Part2-13

local base="https://raw.githubusercontent.com/evgeniyt062015-eng/BurmaldaHub/main/Parts/"

-- ═══ 1. CORE (Part1) ═══
local ok1,err1=pcall(function()
    loadstring(game:HttpGet(base.."Part1.lua?t="..tick()))()
end)
if not ok1 then
    warn("[Burmalda v15] Part1 (CORE) failed: "..tostring(err1))
end

-- ═══ 2. LOADING (Part14) — грузит Part2-13 ═══
local ok14,err14=pcall(function()
    loadstring(game:HttpGet(base.."Part14.lua?t="..tick()))()
end)
if not ok14 then
    warn("[Burmalda v15] Part14 (LOADING) failed: "..tostring(err14))
    
    -- Fallback: если Part14 упал — грузим Part2-13 напрямую
    warn("[Burmalda v15] Fallback: loading Part2-13 directly")
    for i=2,13 do
        local ok,err=pcall(function()
            loadstring(game:HttpGet(base.."Part"..i..".lua?t="..tick()))()
        end)
        if not ok then
            warn("[Burmalda v15] Part"..i.." failed: "..tostring(err))
        end
    end
end

print("[Burmalda v15] Main loader finished.")
