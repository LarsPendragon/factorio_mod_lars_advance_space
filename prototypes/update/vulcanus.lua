require("lars-utils")
local OV = angelsmods.functions.OV

-- 隐藏不需要的科技
utils.hide_technology("foundry") -- 火星的铸造机
utils.hide_technology("calcite-processing")-- 原方解石加工
utils.hide_technology("tungsten-carbide") -- 火星的碳化钨
utils.hide_technology("tungsten-steel") -- 火星的钨钢

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
    "big-mining-drill",
  }
end
if data.raw.recipe["metallurgic-science-pack"] then
  data.raw.recipe["metallurgic-science-pack"].ingredients = {
    {type = "item", name = "tungsten-plate", amount = 10},
    {type = "item", name = "tungsten-carbide", amount = 15},
    {type = "fluid", name = "lars-molten-raw-iron", amount = 200},
    {type = "fluid", name = "lars-molten-raw-copper", amount = 200},
  }
  data.raw.recipe["metallurgic-science-pack"].category = "lars-metallurgy"
end
