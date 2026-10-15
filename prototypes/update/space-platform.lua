local OV = angelsmods.functions.OV
require("utils")

-- 备注：太空预计的建造通路
-- 金属星岩 -> 铁质混合物 -> 铁锭+锰锭 -> 铁板
--                                   -> (+氧气)钢板
--      高级-> 铜制混合物 -> 铜锭+锡锭 -> 铜板/锡板
--
-- 碳质星岩 -> 粉碎煤 -> 焦炭 -> (+蒸汽)碳 -> (+硫磺、水)煤矿
--         -> 硫磺 -> (+煤矿、纯化水)炸药
--
-- 氧化星岩 -> 冰 -> 水 -> (+煤滤芯)纯化水 -> 氢气 -> (+碳、水)推进器燃料 (废气可由排气阀排出)
--                                       -> 氧气 -> (+铁板)推进器氧化剂 (废气可由排气阀排出)

-- 

-- 金属星岩粉碎
change_recipe_results("metallic-asteroid-crushing", {
  {type = "item", name = "angels-ore8-crushed", amount = 18}, -- 碎铁质混合物
  {type = "item", name = "angels-stone-crushed", amount = 6},
  {type = "item", name = "metallic-asteroid-chunk", amount = 1, probability = 0.2},
})
-- 碳质星岩粉碎
data.raw.recipe["carbonic-asteroid-crushing"].results = {
  {type = "item", name = "angels-coal-crushed", amount = 20}, -- 粉碎煤
  {type = "item", name = "sulfur", amount =3},
  {type = "item", name = "carbonic-asteroid-chunk", amount = 1, probability = 0.2},
}
-- 氧化星岩粉碎
data.raw.recipe["oxide-asteroid-crushing"].results = {
  {type = "item", name = "ice", amount = 10},
  {type = "item", name = "oxide-asteroid-chunk", amount = 1, probability = 0.2},
}

-- 高级金属星岩粉碎
data.raw.recipe["advanced-metallic-asteroid-crushing"].results = {
  {type = "item", name = "angels-ore8-crushed", amount = 12}, -- 碎铁质混合物
  {type = "item", name = "angels-ore9-crushed", amount = 6}, -- 碎铜质混合物
  {type = "item", name = "angels-ore9-crushed", amount = 6}, -- 碎铜质混合物
  {type = "item", name = "angels-stone-crushed", amount = 4},
  {type = "item", name = "metallic-asteroid-chunk", amount = 1, probability = 0.05},
}
-- 高级碳质星岩粉碎
data.raw.recipe["advanced-carbonic-asteroid-crushing"].results = {
  {type = "item", name = "angels-coal-crushed", amount = 16}, -- 粉碎煤
  {type = "item", name = "sulfur", amount = 4},
  {type = "item", name = "bob-lead-ore", amount = 4},
  {type = "item", name = "carbonic-asteroid-chunk", amount = 1, probability = 0.05},
}
-- 高级氧化星岩粉碎
data.raw.recipe["advanced-oxide-asteroid-crushing"].results = {
  {type = "item", name = "ice", amount = 8},
  {type = "item", name = "calcite", amount = 2},
  {type = "item", name = "oxide-asteroid-chunk", amount = 1, probability = 0.05},
}

-- 推进器燃料
change_recipe_ingredients("thruster-fuel", {
  {type = "item", name = "angels-solid-carbon", amount = 2},
  {type = "fluid", name = "angels-gas-hydrogen", amount = 20},
  {type = "fluid", name = "water", amount = 10},
})
change_recipe_ingredients("advanced-thruster-fuel", {
  {type = "item", name = "angels-solid-carbon", amount = 2},
  {type = "item", name = "calcite", amount = 1},
  {type = "fluid", name = "angels-gas-hydrogen", amount = 200},
  {type = "fluid", name = "water", amount = 100},
})
-- 推进器氧化剂
change_recipe_ingredients("thruster-oxidizer", {
  {type = "item", name = "iron-plate", amount = 2},
  {type = "fluid", name = "angels-gas-oxygen", amount = 10},
  {type = "fluid", name = "water", amount = 10},
})
change_recipe_ingredients("advanced-thruster-oxidizer", {
  {type = "item", name = "iron-plate", amount = 2},
  {type = "item", name = "calcite", amount = 1},
  {type = "fluid", name = "angels-gas-oxygen", amount = 100},
  {type = "fluid", name = "water", amount = 100},
})

-- 太空科技补充
OV.add_unlock("space_platform", "lars-emission-valve")



