require("lars-utils")
local OV = angelsmods.functions.OV

-- 隐藏不需要的科技
lars_utils.hide_technology("foundry") -- 火星的铸造机
lars_utils.hide_technology("calcite-processing")-- 原方解石加工
lars_utils.hide_technology("tungsten-carbide") -- 火星的碳化钨
lars_utils.hide_technology("tungsten-steel") -- 火星的钨钢

-- 大型采矿机修改
if data.raw.technology["big-mining-drill"] then
  data.raw.technology["big-mining-drill"].prerequisites = {
    "lars-foundry",
    "lars-igneous-rock-processing",
  }
  data.raw.technology["big-mining-drill"].research_trigger ={
    type = "craft-item",
    item = "lars-foundry"
  }
end
change_recipe_ingredients("big-mining-drill", {
  {type = "item", name = "burner-mining-drill", amount = 4},
  {type = "item", name = "low-density-structure", amount = 5},
  {type = "item", name = "lars-silver-coil", amount = 8},
  {type = "item", name = "advanced-circuit", amount = 10},
  {type = "fluid", name = "lars-molten-raw-iron", amount = 200},
})

-- 橙瓶科技修改
if data.raw.technology["metallurgic-science-pack"] then
  data.raw.technology["metallurgic-science-pack"].prerequisites = {
    "lars-foundry",
    "big-mining-drill",
    "lars-photon-catalysator",
  }
  data.raw.technology["metallurgic-science-pack"].research_trigger ={
    type = "craft-item",
    item = "lars-photon-catalysator"
  }
end
if data.raw.recipe["metallurgic-science-pack"] then
  data.raw.recipe["metallurgic-science-pack"].ingredients = {
    {type = "item", name = "tungsten-plate", amount = 10},
    {type = "item", name = "tungsten-carbide", amount = 15},
    {type = "item", name = "lars-photon-catalysator", amount = 1},
    {type = "fluid", name = "lars-molten-raw-iron", amount = 200},
    {type = "fluid", name = "lars-molten-raw-copper", amount = 200},
  }
  data.raw.recipe["metallurgic-science-pack"].results = {
    {type = "item", name = "metallurgic-science-pack", amount = 4},
  }
  data.raw.recipe["metallurgic-science-pack"].categories = {"lars-metallurgy"}
end

-- 方解石修改
change_recipe_ingredients("acid-neutralisation", {
  {type = "item", name = "lars-calcite", amount = 1},
  {type = "fluid", name = "sulfuric-acid", amount = 100},
})
change_recipe_results("acid-neutralisation", {
  {type = "item", name = "angels-solid-calcium-sulfate", amount = 5},
  {type = "fluid", name = "steam", amount = 1000, temperature = 500},
})
change_recipe_ingredients("cliff-explosives", {
  {type = "item", name = "lars-metamorphic-rock", amount = 1},
  {type = "item", name = "lars-sedimentary-rock", amount = 1},
  {type = "item", name = "grenade", amount = 1},
  {type = "item", name = "explosives", amount = 10},
})
change_recipe_ingredients("artillery-shell", {
  {type = "item", name = "lars-igneous-rock", amount = 1},
  {type = "item", name = "explosive-cannon-shell", amount = 3},
  {type = "item", name = "tungsten-plate", amount = 4},
  {type = "item", name = "explosives", amount = 8},
})

-- 悬崖炸药科技修改
if data.raw.technology["cliff-explosives"] then
  data.raw.technology["cliff-explosives"].prerequisites = {
    "explosives",
    "military-science-pack",
    "lars-rock-change",
  }
  data.raw.technology["cliff-explosives"].unit = {
    count = 500,
    time = 30,
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack", 1 },
      { "military-science-pack", 1 },
      { "chemical-science-pack", 1 },
      { "space-science-pack", 1 },
    },
  }
end

-- 钛补充
OV.add_unlock("angels-titanium-smelting-1", "lars-titanium-dioxide")
