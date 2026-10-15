data:extend({
  {
    -- 排气阀
    type = "recipe",
    name = "lars-emission-valve",
    icon = "__angelspetrochemgraphics__/graphics/icons/valve-inspector.png",
    icon_size = 32,
    energy_required = 2,
    enabled = false,
    category = "crafting",
    subgroup = "space-platform",
    ingredients = {
      { type = "item", name = "iron-plate", amount = 10 },
    },
    results = { { type = "item", name = "lars-emission-valve", amount = 1 } },
    order = "d[emission]-a",
  },
  {
    -- 太空氢气排放
    type = "recipe",
    name = "lars-hydrogen-emission",
    icons = angelsmods.functions.create_gas_fluid_icon(
      { "__angelspetrochemgraphics__/graphics/icons/molecules/hydrogen.png", 72 },
      "HHH"
    ),
    category = "lars-air-emission",
    energy_required = 1,
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
    category = "lars-air-emission",
    energy_required = 1,
    subgroup = "space-processing",
    ingredients = {
      { type = "fluid", name = "angels-gas-oxygen", amount = 100 },
    },
    results = {},
    order = "e[oxygen]",
  },
})