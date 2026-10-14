local OV = angelsmods.functions.OV

-- 铝粉
if data.raw.recipe["angels-powder-aluminium"] then
  OV.add_unlock("angels-aluminium-smelting-2", "lars-powder-aluminium")
end

-- 隐藏不需要的科技
if data.raw.technology["bob-heat-shield"] then -- bob隔热瓦
  data.raw.technology["bob-heat-shield"].hidden = true
  data.raw.technology["bob-heat-shield"].visible_when_disabled = false
  data.raw.technology["bob-heat-shield"].effects = {}
end

-- 隔热瓦图标更改
if mods["reskins-bobs"] then
  data.raw.item["lars-heat-shield-tile-2"].icons = angelsmods.functions.add_number_icon_layer({
    {
      icon = "__reskins-bobs__/graphics/icons/revamp/bob-heat-shield-tile.png",
      icon_size = 64,
    },
  }, 2, angelsmods.petrochem.number_tint)
  data.raw.recipe["lars-heat-shield-tile-2"].icons = angelsmods.functions.add_number_icon_layer({
    {
      icon = "__reskins-bobs__/graphics/icons/revamp/bob-heat-shield-tile.png",
      icon_size = 64,
    },
  }, 2, angelsmods.petrochem.number_tint)
  data.raw.technology["lars-heat-shield-2"].icons = angelsmods.functions.add_number_icon_layer({
    {
      icon = "__reskins-bobs__/graphics/icons/revamp/bob-heat-shield-tile.png",
      icon_size = 64,
    },
  }, 2, angelsmods.petrochem.number_tint)
end

-- 更改火箭发射井前置科技
data.raw.technology["rocket-silo"].prerequisites = {
  "logistic-robotics",
  "lars-heat-shield-1",
  "low-density-structure",
  "lars-solid-rocket-fuel",
  "angels-invar-smelting-1",
}
data.raw.recipe["rocket-silo"].ingredients = {
  { type = "item", name = "electric-engine-unit", amount = 100 },
  { type = "item", name = "low-density-structure", amount = 50 },
  { type = "item", name = "lars-heat-shield-tile", amount = 100 },
  { type = "item", name = "processing-unit", amount = 50 },
  { type = "item", name = "bob-steel-pipe", amount = 50 },
  { type = "item", name = "concrete", amount = 200 },
  { type = "item", name = "bob-invar-alloy", amount = 200 },
}
OV.add_unlock("rocket-silo", "lars-rocket-part-1")
OV.remove_unlock("rocket-silo", "rocket-part")

-- 修改火箭发射井配方目录
data.raw["rocket-silo"]["rocket-silo"].fixed_recipe = nil
data.raw["rocket-silo"]["rocket-silo"].rocket_parts_required = 100

-- 修改火箭组件
OV.remove_unlock("rocket-silo", "rocket-part")
OV.add_unlock("rocket-silo", "lars-rocket-part-1")

-- 修改火箭物流配方和容量
data.raw.recipe["cargo-landing-pad"].ingredients = {
  { type = "item", name = "electric-engine-unit", amount = 40 },
  { type = "item", name = "lars-heat-shield-tile", amount = 100 },
  { type = "item", name = "processing-unit", amount = 10 },
  { type = "item", name = "concrete", amount = 200 },
  { type = "item", name = "bob-invar-alloy", amount = 25 },
}
data.raw["cargo-landing-pad"]["cargo-landing-pad"].inventory_size = 20

-- 火箭燃料相关
data.raw.recipe["rocket-fuel"].icons = angelsmods.functions.add_number_icon_layer({
  {
    icon = "__angelspetrochemgraphics__/graphics/icons/rocket-fuel.png",
    icon_size = 32,
  },
}, 2, angelsmods.petrochem.number_tint)
data.raw.recipe["rocket-fuel"].order = "hcb"

-- 修改物流接驳站相关
--data.raw["cargo-landing-pad"]["cargo-landing-pad"].fast_replaceable_group = "cargo-landing-pad"
--data.raw["cargo-bay"]["cargo-bay"].fast_replaceable_group = "cargo-bay"

-- 测试用
OV.add_unlock("rocket-silo", "lars-TFMG-radiator")
