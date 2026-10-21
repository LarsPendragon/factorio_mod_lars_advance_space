local OV = angelsmods.functions.OV

angelsmods.functions.modify_barreling_recipes()
-- 禁用液体燃料
OV.remove_unlock("flammables", "bob-liquid-fuel")
--OV.remove_unlock("flammables", "bob-enriched-fuel")
OV.remove_unlock("bob-fluid-canister-processing", "bob-liquid-fuel-barrel")
OV.remove_unlock("bob-fluid-canister-processing", "empty-bob-liquid-fuel-barrel")
-- 禁用液氢液氧
OV.remove_unlock("bob-fluid-canister-processing", "lars-liquid-oxygen-barrel")
OV.remove_unlock("bob-fluid-canister-processing", "empty-lars-liquid-oxygen-barrel")
OV.remove_unlock("bob-fluid-canister-processing", "lars-liquid-hydrogen-barrel")
OV.remove_unlock("bob-fluid-canister-processing", "empty-lars-liquid-hydrogen-barrel")


-- 燃烧塔处理
angelsmods.functions.make_void("lars-kerosene", "chemical")
angelsmods.functions.make_void("lars-diesel-fuel", "chemical")
angelsmods.functions.make_void("lars-liquid-hydrogen", "chemical")

-- 火箭燃料不能用作载具燃料
data.raw.item["rocket-fuel"].fuel_value = nil
data.raw.item["rocket-fuel"].fuel_emissions_multiplier = nil
data.raw.item["rocket-fuel"].fuel_glow_color = nil
data.raw.item["rocket-fuel"].fuel_acceleration_multiplier = nil
data.raw.item["rocket-fuel"].fuel_top_speed_multiplier = nil

-- 修改需要液体燃料的配方
if data.raw.recipe["bob-rocket-body"] then
  data.raw.recipe["bob-rocket-body"].ingredients = {
    { type = "item", name = "advanced-circuit", amount = 1 },
    { type = "item", name = "bob-rocket-engine", amount = 1 },
    { type = "item", name = "bob-aluminium-plate", amount = 1 },
    { type = "fluid", name = "lars-diesel-fuel", amount = 10 },
  }
end
if data.raw.recipe["bob-fire-capsule"] then
  data.raw.recipe["bob-fire-capsule"].ingredients = {
    { type = "item", name = "electronic-circuit", amount = 3 },
    { type = "item", name = "steel-plate", amount = 3 },
    { type = "fluid", name = "lars-diesel-fuel", amount = 100 },
  }
end
if data.raw.recipe["bob-enriched-fuel"] then
  data.raw.recipe["bob-enriched-fuel"].ingredients = {
    { type = "fluid", name = "lars-diesel-fuel", amount = 100 },
  }
end

-- 核电相关科技平衡性优化
if data.raw.technology["kovarex-enrichment-process"] then
  data.raw.technology["kovarex-enrichment-process"].unit = {
    count = 600,
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack", 1 },
      { "chemical-science-pack", 1 },
      { "production-science-pack", 1},
      { "space-science-pack", 1},
    },
    time = 30,
  }
end
if data.raw.technology["angels-thorium-power"] then
  data.raw.technology["angels-thorium-power"].unit = {
    count = 1200,
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack", 1 },
      { "chemical-science-pack", 1 },
      { "production-science-pack", 1},
      { "utility-science-pack", 1},
      { "space-science-pack", 1},
    },
    time = 70,
  }
end
if data.raw.technology["angels-fusion-power-1"] then
  data.raw.technology["angels-fusion-power-1"].unit = {
    count = 3000,
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack", 1 },
      { "chemical-science-pack", 1 },
      { "production-science-pack", 1},
      { "utility-science-pack", 1},
      { "space-science-pack", 1},
    },
    time = 120,
  }
end
if data.raw.technology["bob-rtg"] then
  data.raw.technology["bob-rtg"].unit = {
    count = 200,
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack", 1 },
      { "chemical-science-pack", 1 },
      { "production-science-pack", 1},
      { "utility-science-pack", 1},
      { "space-science-pack", 1},
    },
    time = 30,
  }
end
if data.raw.technology["bob-heavy-spidertron"] then
  data.raw.technology["bob-heavy-spidertron"].unit = {
    count = 3000,
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack", 1 },
      { "military-science-pack", 1 },
      { "chemical-science-pack", 1 },
      { "production-science-pack", 1},
      { "utility-science-pack", 1},
      { "space-science-pack", 1},
      { "agricultural-science-pack", 1},
    },
    time = 45,
  }
end
if data.raw.technology["bob-robots-4"] then
  data.raw.technology["bob-robots-4"].unit = {
    count = 500,
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack", 1 },
      { "chemical-science-pack", 1 },
      { "bob-advanced-logistic-science-pack", 1},
      { "production-science-pack", 1},
      { "utility-science-pack", 1},
      { "space-science-pack", 1},
    },
    time = 45,
  }
end
