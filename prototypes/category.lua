-- ITEM SUBGROUP
data:extend({
    {
        type = "item-subgroup",
        name = "lars-fuel-refining",
        group = "angels-petrochem-refining",
        order = "z[lars-fuel-refining]",
    },
    {
        type = "item-subgroup",
        name = "space-radiator",
        group = "space",
        order = "ca"
    },
})

-- RECIPE CATEGORY
data:extend({
    {
        type = "recipe-category",
        name = "lars-liquid-gas"
    },
    {
        type = "recipe-category",
        name = "lars-air-process"
    },
        {
        type = "recipe-category",
        name = "lars-air-emission"
    },
    {
        type = "recipe-category",
        name = "lars-rocket-silo"
    },
    {
        type = "recipe-category",
        name = "lars-rocket-silo-2"
    },
    {
        type = "recipe-category",
        name = "radiator"
    },
})

-- 火箭发射井类别
table.insert(data.raw["rocket-silo"]["rocket-silo"].crafting_categories, "lars-rocket-silo")

-- 低温工厂添加新的类别
local cryo = data.raw["assembling-machine"]["cryogenic-plant"]
if cryo then
    table.insert(cryo.crafting_categories, "lars-liquid-gas")
else
    log("no machine cryogenic-plant")
end
