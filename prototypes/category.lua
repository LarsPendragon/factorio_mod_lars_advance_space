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
  {
    type = "item-subgroup",
    name = "lars-rhodium",
    group = "angels-smelting",
    order = "r[rhodium]"
  },
  {
    type = "item-subgroup",
    name = "lars-liquid",
    group = "fluids",
    order = "b-a"
  },
  {
    type = "item-subgroup",
    name = "lars-particle",
    group = "fluids",
    order = "b-b"
  },
  {
    type = "item-subgroup",
    name = "lars-vulcanus-rocks",
    group = "bob-resource-products",
    order = "h-a[rock]"
  },
  {
    type = "item-subgroup",
    name = "lars-vulcanus-rock-recipe",
    group = "bob-resource-products",
    order = "h-b[rock-recipe]-a"
  },
  {
    type = "item-subgroup",
    name = "lars-vulcanus-rock-crush",
    group = "bob-resource-products",
    order = "h-b[rock-recipe]-b"
  },
  {
    type = "item-subgroup",
    name = "lars-vulcanus-lava-casting-raw",
    group = "bob-resource-products",
    order = "h-c[lava-casting-raw]"
  },
    {
    type = "item-subgroup",
    name = "lars-vulcanus-lava-casting",
    group = "bob-resource-products",
    order = "h-d[lava-casting]"
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
  {
    type = "recipe-category",
    name = "lars-metallurgy"
  },
  {
    type = "recipe-category",
    name = "lars-ray-receiver"
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
