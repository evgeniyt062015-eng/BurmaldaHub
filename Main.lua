-- BURMALDA v14 FINAL | KOTENOK7204 | Tester: Kostya_2015KostyaKos
-- Загрузчик 9 частей

-- Сначала загружаем Part1 (ядро) без экрана
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/evgeniyt062015-eng/BurmaldaHub/main/Parts/Part1.lua?t="..tick()))()
end)

-- Потом Part9 (экран загрузки) — он сам загрузит Part2-8
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/evgeniyt062015-eng/BurmaldaHub/main/Parts/Part9.lua?t="..tick()))()
end)

print("[Burmalda v14] Main loader done.")
