-- SPACE
data:extend({
  {
    -- 铑金矿湿法处理
    type = "recipe",
    name = "lars-rhodite-ore-process",
    categories = {"angels-ore-refining-t3"},
    subgroup = "lars-rhodium",
    order = "a",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "lars-rhodite-ore", amount = 10 },
      { type = "fluid", name = "angels-liquid-nitric-acid", amount = 20 },
      { type = "fluid", name = "angels-liquid-hydrochloric-acid", amount = 20 },
    },
    results = {
      { type = "item", name = "lars-rhodite-chunk", amount = 10 },
      { type = "fluid", name = "angels-water-red-waste", amount = 20 },
      { type = "fluid", name = "angels-water-green-waste", amount = 20 },
    },
    always_show_products = true,
    icons = {
      {
        icon = "__angelsrefininggraphics__/graphics/icons/angels-ore4/angels-ore4-chunk.png",
        icon_size = 32,
      },
      {
        icon = "__angelsrefininggraphics__/graphics/icons/angels-ore4/angels-ore4-chunk.png",
        icon_size = 32,
        tint = {255, 250, 205, 120},
      },
    },
    crafting_machine_tint = angelsmods.functions.get_recipe_tints({
      "angels-liquid-nitric-acid",
      "angels-liquid-hydrochloric-acid",
    }),
  },
  {
    -- 铑金矿还原冶炼
    type = "recipe",
    name = "lars-rhodite-reduction-smelting",
    categories = {"angels-chemical-smelting-3"},
    subgroup = "lars-rhodium",
    order = "b",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "lars-rhodite-chunk", amount = 10 },
      { type = "item", name = "angels-quartz-crucible", amount = 1 },
      { type = "fluid", name = "angels-gas-hydrogen", amount = 20 },
    },
    results = {
      { type = "item", name = "lars-rhodium-powder", amount = 12 },
      { type = "item", name = "angels-powder-gold", amount = 1 },
      { type = "item", name = "angels-quartz-crucible", amount = 1 },
    },
    always_show_products = true,
    icons = {
      {
        icon = "__angelssmeltinggraphics__/graphics/icons/powder-silica.png",
        icon_size = 64,
      },
      {
        icon = "__angelssmeltinggraphics__/graphics/icons/powder-silica.png",
        icon_size = 64,
        tint = {255, 250, 205, 120},
      },
    },
  },
  {
    -- 自催化铑处理
    type = "recipe",
    name = "lars-rhodite-autocatalytic-processing",
    categories = {"angels-chemical-smelting-3"},
    subgroup = "lars-rhodium",
    order = "c",
    energy_required = 4,
    enabled = false,
    surface_conditions = {{property = "pressure", min = 0, max = 0}},
    ingredients = {
      { type = "item", name = "lars-rhodite-ore", amount = 12 },
      { type = "item", name = "lars-rhodium-catalyst", amount = 1 },
      { type = "fluid", name = "angels-gas-hydrogen", amount = 20 },
    },
    results = {
      { type = "item", name = "lars-rhodium-powder", amount = 12 },
      { type = "item", name = "angels-powder-gold", amount = 2 },
    },
    always_show_products = true,
    icons = {
      {
        icon = "__angelssmeltinggraphics__/graphics/icons/powder-silica.png",
        icon_size = 64,
      },
      {
        icon = "__angelssmeltinggraphics__/graphics/icons/powder-silica.png",
        icon_size = 64,
        tint = {255, 250, 205, 120},
      },
    },
  },
  {
    -- 铑催化剂
    type = "recipe",
    name = "lars-rhodium-catalyst",
    icon = "__lars_advance_space__/graphics/icons/rhodium-catalyst.png",
    categories = {"angels-crystallizing-2"},
    subgroup = "lars-rhodium",
    order = "d",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "lars-rhodium-powder", amount = 6 },
      { type = "item", name = "angels-powder-gold", amount = 1 },
      { type = "fluid", name = "angels-slag-slurry", amount = 20 },
    },
    results = {
      { type = "item", name = "lars-rhodium-catalyst", amount = 2 },
    },
    always_show_products = true,
  },
})
