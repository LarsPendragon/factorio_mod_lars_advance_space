data:extend({
    {
        type = "item-subgroup",
        name = "lars-fuel-refining",
        group = "angels-petrochem-refining",
        order = "z[lars-fuel-refining]",
    },
    {
        type = "recipe-category",
        name = "lars-liquid-gas"
    },
    {
        type = "recipe-category",
        name = "lars-air-process"
    }
})

-- 低温工厂添加新的类别
local cryo = data.raw["assembling-machine"]["cryogenic-plant"]
if cryo then
    table.insert(cryo.crafting_categories, "lars-liquid-gas")
else
    log("no machine cryogenic-plant")
end
