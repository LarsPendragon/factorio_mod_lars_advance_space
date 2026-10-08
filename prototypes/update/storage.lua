local OV = angelsmods.functions.OV

-- 更改储液罐属性
local storage_tank = data.raw["storage-tank"]["storage-tank"]
local tank1 = data.raw["storage-tank"]["angels-storage-tank-1"]
if tank1 then
    tank1.surface_conditions = { { property = "pressure", min = 1000, max = 1000 } }
    storage_tank.surface_conditions = { { property = "pressure", min = 1000, max = 2500 } }
end

local tank2 = data.raw["storage-tank"]["angels-storage-tank-3"]
if tank2 then
    tank2.surface_conditions = { { property = "pressure", min = 1000, max = 1000 } }
    tank2.fluid_box.volume = 15000
end

local tank3 = data.raw["storage-tank"]["bob-storage-tank-all-corners"]
if tank3 then
    tank3.surface_conditions = { { property = "pressure", min = 950, max = 2500 } }
    storage_tank.surface_conditions = { { property = "pressure", min = 1000, max = 2500 } }
end

local tank4 = data.raw["storage-tank"]["bob-storage-tank-2"]
if tank4 then
    tank4.surface_conditions = { { property = "pressure", min = 300, max = 2500 } }
end

local tank5 = data.raw["storage-tank"]["bob-small-inline-storage-tank"]
if tank5 then
    tank5.surface_conditions = { { property = "pressure", min = 1000, max = 1000 } }
end

local tank6 = data.raw["storage-tank"]["bob-small-storage-tank"]
if tank6 then
    tank6.surface_conditions = { { property = "pressure", min = 1000, max = 1000 } }
end

local tank7 = data.raw["storage-tank"]["bob-storage-tank-all-corners-2"]
if tank7 then
    tank7.surface_conditions = { { property = "pressure", min = 300, max = 2500 } }
end

local tank8 = data.raw["storage-tank"]["angels-pressure-tank-1"]
if tank8 then
    tank8.fluid_box.volume = 5000
    tank8.surface_conditions = { { property = "pressure", min = 0, max = 2000 } }
end

-- 删除不必要的储液罐
OV.remove_unlock("angels-oil-processing", "angels-storage-tank-2")

-- 更改配方和效果
if data.raw.recipe["angels-pressure-tank-1"] then
    data.raw.recipe["angels-pressure-tank-1"].ingredients = {
        { type = "item", name = "pipe", amount = 100 },
        { type = "item", name = "steel-plate", amount = 50 },
        { type = "item", name = "bob-titanium-plate", amount = 100 },
    }
end

if data.raw.technology["angels-pressure-tanks"] then
    data.raw.technology["angels-pressure-tanks"].prerequisites = {
        "fluid-handling",
        "bob-titanium-processing"
    }
    data.raw.technology["angels-pressure-tanks"].unit = {
        count = 100,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1}
        },
        time = 20
    }
end
