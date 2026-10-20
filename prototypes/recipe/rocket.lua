data:extend({
  {
    -- 简易隔热瓦
    type = "recipe",
    name = "lars-heat-shield-tile",
    icons = angelsmods.functions.add_number_icon_layer({
    {
        icon = "__bobrevamp__/graphics/icons/heat-shield-tile.png",
        icon_size = 32,
    },
    }, 1, angelsmods.petrochem.number_tint),
    category = "crafting",
    energy_required = 40,
    ingredients = {
      { type = "item", name = "bob-silicon-nitride", amount = 20 },
      { type = "item", name = "steel-plate", amount = 10 },
    },
    results = { { type = "item", name = "lars-heat-shield-tile", amount = 1 } },
    order = "m[head-shield-tile]-a",
  },
  {
    -- 标准隔热瓦
    type = "recipe",
    name = "lars-heat-shield-tile-2",
    icons = angelsmods.functions.add_number_icon_layer({
    {
        icon = "__bobrevamp__/graphics/icons/heat-shield-tile.png",
        icon_size = 32,
    },
    }, 2, angelsmods.petrochem.number_tint),
    category = "angels-sintering-4",
    energy_required = 30,
    ingredients = {
      { type = "item", name = "bob-silicon-nitride", amount = 20 },
      { type = "item", name = "angels-plate-tungsten", amount = 10 },
    },
    results = { { type = "item", name = "lars-heat-shield-tile-2", amount = 2 } },
    order = "m[head-shield-tile]-b",
  },
  {
    -- 固体火箭燃料
    type = "recipe",
    name = "lars-solid-rocket-fuel",
    icons = angelsmods.functions.add_number_icon_layer({
      {
        icon = "__angelspetrochemgraphics__/graphics/icons/rocket-fuel.png",
        icon_size = 32,
      },
    }, 1, angelsmods.petrochem.number_tint),
    category = "chemistry",
    energy_required = 30,
    ingredients = {
      { type = "item", name = "angels-rocket-booster", amount = 10 },
      { type = "item", name = "angels-powder-aluminium", amount = 20 },
    },
    results = { { type = "item", name = "lars-solid-rocket-fuel", amount = 1 } },
    enabled = false,
    order = "hca",
  },
  {
    -- 燃油液氧火箭燃料
    type = "recipe",
    name = "lars-rocket-fuel-kerosene",
    icons = angelsmods.functions.add_number_icon_layer({
      {
        icon = "__angelspetrochemgraphics__/graphics/icons/rocket-fuel.png",
        icon_size = 32,
      },
    }, 3, angelsmods.petrochem.number_tint),
    category = "chemistry",
    energy_required = 10,
    ingredients = {
      { type = "fluid", name = "lars-kerosene", amount = 60 },
      { type = "fluid", name = "lars-liquid-oxygen", amount = 2 },
      { type = "item", name = "bob-cobalt-steel-alloy", amount = 2 },
    },
    results = { { type = "item", name = "rocket-fuel", amount = 1 } },
    enabled = false,
    order = "hcc",
  },
  {
    -- 液氢液氧火箭燃料
    type = "recipe",
    name = "lars-rocket-fuel-hydroxide",
    icons = angelsmods.functions.add_number_icon_layer({
      {
        icon = "__angelspetrochemgraphics__/graphics/icons/rocket-fuel.png",
        icon_size = 32,
      },
    }, 4, angelsmods.petrochem.number_tint),
    category = "lars-liquid-gas",
    energy_required = 5,
    ingredients = {
      { type = "fluid", name = "lars-liquid-hydrogen", amount = 10 },
      { type = "fluid", name = "lars-liquid-oxygen", amount = 10 },
      { type = "item", name = "bob-cobalt-steel-alloy", amount = 5 },
    },
    results = { { type = "item", name = "rocket-fuel", amount = 5 } },
    enabled = false,
    order = "hcd",
  },
  {
    -- 初级火箭组件
    type = "recipe",
    name = "lars-rocket-part-1",
    icons = angelsmods.functions.add_number_icon_layer({
      {
          icon = "__base__/graphics/icons/rocket-part.png",
          icon_size = 64,
      },
    }, 1, angelsmods.petrochem.number_tint),
    energy_required = 10,
    enabled = false,
    hide_from_player_crafting = true,
    auto_recycle = false,
    category = "lars-rocket-silo",
    ingredients =
    {
      { type = "item", name = "processing-unit", amount = 1 },
      { type = "item", name = "low-density-structure", amount = 1 },
      { type = "item", name = "lars-heat-shield-tile", amount = 10 },
      { type = "item", name = "bob-steel-pipe", amount = 10 },
      { type = "item", name = "lars-solid-rocket-fuel", amount = 10 },
    },
    results = {{ type = "item", name = "rocket-part", amount = 1}},
    allow_productivity = true
  },
  {
    -- 火箭组件2
    type = "recipe",
    name = "lars-rocket-part-2",
    icons = angelsmods.functions.add_number_icon_layer({
      {
          icon = "__base__/graphics/icons/rocket-part.png",
          icon_size = 64,
      },
    }, 2, angelsmods.petrochem.number_tint),
    energy_required = 4,
    enabled = false,
    hide_from_player_crafting = true,
    auto_recycle = false,
    category = "lars-rocket-silo-2",
    ingredients =
    {
      { type = "item", name = "bob-advanced-processing-unit", amount = 1 },
      { type = "item", name = "low-density-structure", amount = 1 },
      { type = "item", name = "lars-heat-shield-tile-2", amount = 10 },
      { type = "item", name = "bob-tungsten-pipe", amount = 10 },
      { type = "item", name = "rocket-fuel", amount = 10 },
    },
    results = {{ type = "item", name = "rocket-part", amount = 2}},
    allow_productivity = true
  },
})

data.extend({
  {
    -- 火箭发射井2
    type = "recipe",
    name = "lars-rocket-silo-2",
    icons = angelsmods.functions.add_number_icon_layer({
    {
        icon = "__base__/graphics/technology/rocket-silo.png",
        icon_size = 256,
    },
    }, 2, angelsmods.petrochem.number_tint),
    energy_required = 30,
    enabled = false,
    auto_recycle = false,
    subgroup = "space-interactors",
    category = "crafting",
    ingredients =
    {
      { type = "item", name = "electric-engine-unit", amount = 100 },
      { type = "item", name = "low-density-structure", amount = 50 },
      { type = "item", name = "lars-heat-shield-tile-2", amount = 100 },
      { type = "item", name = "bob-advanced-processing-unit", amount = 50 },
      { type = "item", name = "bob-titanium-pipe", amount = 50 },
      { type = "item", name = "refined-concrete", amount = 200 },
      { type = "item", name = "bob-cobalt-steel-alloy", amount = 200 },
    },
    results = {{ type = "item", name = "lars-rocket-silo-2", amount = 1}},
    allow_productivity = true,
    order = "a[rocket-silo]-b",
  },
  {
    -- 物流接驳站2
    type = "recipe",
    name = "lars-cargo-landing-pad-2",
    enabled = false,
    auto_recycle = false,
    subgroup = "space-interactors",
    category = "crafting",
    ingredients =
    {
      { type = "item", name = "cargo-landing-pad", amount = 1 },
      { type = "item", name = "lars-heat-shield-tile-2", amount = 100 },
      { type = "item", name = "bob-advanced-processing-unit", amount = 10 },
      { type = "item", name = "refined-concrete", amount = 200 },
      { type = "item", name = "bob-cobalt-steel-alloy", amount = 50 },
    },
    energy_required = 30,
    results = {{type="item", name="lars-cargo-landing-pad-2", amount=1}},
    allow_productivity = true,
    order = "c[cargo-landing-pad]-b",
  },
  {
    -- 扩展接驳站2
    type = "recipe",
    name = "lars-cargo-bay-2",
    enabled = false,
    auto_recycle = false,
    subgroup = "space-platform",
    category = "crafting",
    ingredients =
    {
      { type = "item", name = "cargo-bay", amount = 2 },
      { type = "item", name = "bob-advanced-processing-unit", amount = 5 },
      { type = "item", name = "bob-cobalt-steel-alloy", amount = 20 },
    },
    energy_required = 15,
    results = {{type="item", name="lars-cargo-bay-2", amount=1}},
    allow_productivity = true,
    order = "c[cargo-bay]-b",
  },
})