-- BURMALDA v13 FINAL | KOTENOK7204 | Tester: Kostya_2015KostyaKos
-- Загрузчик 8 частей

local base="https://raw.githubusercontent.com/evgeniyt062015-eng/BurmaldaHub/main/Parts/"
for i=1,8 do
    local ok,err=pcall(function()
        loadstring(game:HttpGet(base.."Part"..i..".lua?t="..tick()))()
    end)
    if not ok then
        warn("[Burmalda v13] Part"..i.." failed: "..tostring(err))
    end
end
print("[Burmalda v13] All 8 parts loaded. Press B to open menu.")
