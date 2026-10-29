data:extend({
  {
    -- 排气阀
    type = "recipe",
    name = "lars-emission-valve",
    icon = "__angelspetrochemgraphics__/graphics/icons/valve-inspector.png",
    icon_size = 32,
    energy_required = 2,
    enabled = false,
    categories = {"crafting"},
    subgroup = "space-platform",
    ingredients = {
      { type = "item", name = "iron-plate", amount = 10 },
    },
    results = { { type = "item", name = "lars-emission-valve", amount = 1 } },
    order = "d[emission]",
  },
  {
    -- 太空氢气排放
    type = "recipe",
    name = "lars-hydrogen-emission",
    icons = angelsmods.functions.create_gas_fluid_icon(
      { "__angelspetrochemgraphics__/graphics/icons/molecules/hydrogen.png", 72 },
      "HHH"
    ),
    categories = {"lars-air-emission"},
    energy_required = 1,
    enabled = false,
    subgroup = "space-processing",
    ingredients = {
      { type = "fluid", name = "angels-gas-hydrogen", amount = 100 },
    },
    results = {},
    order = "e[hydrogen]",
  },
  {
    -- 太空氧气排放
    type = "recipe",
    name = "lars-oxygen-emission",
    icons = angelsmods.functions.create_gas_fluid_icon(
      { "__angelspetrochemgraphics__/graphics/icons/molecules/oxygen.png", 72 },
      "OOO"
    ),
    categories = {"lars-air-emission"},
    energy_required = 1,
    enabled = false,
    subgroup = "space-processing",
    ingredients = {
      { type = "fluid", name = "angels-gas-oxygen", amount = 100 },
    },
    results = {},
    order = "e[oxygen]",
  },
  {
    -- 射线接收器
    type = "recipe",
    name = "lars-space-ray-receiver",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-telescope-radio.png",
    icon_size = 64,
    categories = {"crafting"},
    energy_required = 1,
    enabled = false,
    subgroup = "lars-particle",
    order = "a[space-ray-receiver]-a",
    ingredients = {
      {type = "item", name = "bob-radar-3", amount = 2},
      {type = "item", name = "low-density-structure", amount = 50},
      {type = "item", name = "bob-titanium-plate", amount = 150},
      {type = "item", name = "processing-unit", amount = 50},
      {type = "item", name = "lars-silver-coil", amount = 20},
      {type = "item", name = "bob-glass", amount = 50},
      {type = "item", name = "bob-silicon-wafer", amount = 200},
    },
    results = {
      { type = "item", name = "lars-space-ray-receiver", amount = 1 },
    },
  },
  {
    -- 宇宙射线捕获
    type = "recipe",
    name = "lars-space-ray-catch",
    icon = "__lars_advance_space__/graphics/icons/universe-ray.png",
    icon_size = 128,
    categories = {"lars-ray-receiver"},
    energy_required = 1,
    enabled = false,
    subgroup = "lars-particle",
    order = "b[space-ray]-a",
    surface_conditions = {{property = "pressure", min = 0, max = 0}},
    ingredients = {},
    results = {
      { type = "fluid", name = "lars-universe-ray", amount = 100 },
    },
  },
})