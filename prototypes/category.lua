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
    group = "space",
    order = "x-a[particle]"
  },
  {
    type = "item-subgroup",
    name = "lars-particle-machine",
    group = "space",
    order = "x-b[machine]"
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
  {
    type = "item-subgroup",
    name = "ammo-effects",
    group = "effects",
    order = "b-b"
  },
})

-- RECIPE CATEGORY
local recipe_categories = {
  "lars-liquid-gas", -- 空气液化相关
  "lars-air-process", -- 空气液化相关
  "lars-air-emission", -- 
  "lars-rocket-silo", -- 修改火箭配方
  "lars-rocket-silo-2", -- 修改火箭配方
  "lars-special-rocket", -- test
  "radiator", -- 太空散热
  "lars-metallurgy", -- 岩浆处理
  "lars-ray-receiver", -- 射线接收
  "lars-particle-process", -- 粒子物理
  "lars-particle-accelerator", -- 粒子加速器
  "delivery-cannon", -- test
}
for _, category in pairs(recipe_categories) do
  data:extend({{
    type = "recipe-category",
    name = category
  }})
end

-- 火箭发射井类别
table.insert(data.raw["rocket-silo"]["rocket-silo"].crafting_categories, "lars-rocket-silo")

-- 低温工厂添加新的类别
local cryo = data.raw["assembling-machine"]["cryogenic-plant"]
if cryo then
  table.insert(cryo.crafting_categories, "lars-liquid-gas")
else
  log("no machine cryogenic-plant")
end
