local AF = angelsmods.functions

data:extend({
  -- 制造空气处理器
  {
    type = "recipe",
    name = "lars-air-process",
    category = "crafting",
    --subgroup = "lars-air-process",
    energy_required = 8,
    enabled = false,
    hide_from_signal_gui = true,
    ingredients = {
      { type = "item", name = "advanced-circuit", amount = 30 },
      { type = "item", name = "bob-invar-alloy", amount = 40 },
      { type = "item", name = "bob-storage-tank-2", amount = 1 },
      { type = "item", name = "angels-air-filter-2", amount = 1},
    },
    results = {
      { type = "item", name = "lars-air-processor", amount = 1},
    },
    always_show_products = true,
    icons = angelsmods.functions.add_number_icon_layer({
        {
          icon = "__angelspetrochemgraphics__/graphics/icons/air-filter.png",
          icon_size = 32,
        },
      }, 0, angelsmods.petrochem.number_tint),
    order = "b[lars-air-processor]-a",
  },

  -- 纯化高压空气
  {
    type = "recipe",
    name = "lars-purify-compressed-air",
    category = "lars-air-process",
    group = "angels-petrochem-refining",
    subgroup = "angels-petrochem-nitrogen",
    energy_required = 8,
    enabled = false,
    hide_from_signal_gui = true,
    ingredients = {
      { type = "fluid", name = "angels-gas-compressed-air", amount = 500 },
      { type = "item", name = "angels-filter-ceramic", amount = 1},
    },
    results = {
      { type = "fluid", name = "lars-purify-compressed-air", amount = 50, temperature = 30 },
      { type = "item", name = "angels-filter-ceramic-used", amount = 1},
    },
    always_show_products = true,
    icons = angelsmods.functions.create_gas_recipe_icon(
      nil,
      { { 170, 170, 215 }, { 140, 140, 160 }, { 110, 110, 135 } }
    ),
    order = "e[air]-a",
  },

  -- 冷却高压空气
  {
    type = "recipe",
    name = "lars-cooling-compressed-air",
    category = "angels-cooling",
    group = "angels-petrochem-refining",
    subgroup = "angels-petrochem-nitrogen",
    energy_required = 8,
    enabled = false,
    hide_from_signal_gui = true,
    ingredients = {
      { type = "fluid", name = "lars-purify-compressed-air", amount = 50, minimum_temperature = 26 },
      { type = "fluid", name = "angels-liquid-coolant", amount = 100 },
    },
    results = {
      { type = "fluid", name = "lars-cooled-compressed-air", amount = 50, temperature = -40 },
      { type = "fluid", name = "angels-liquid-coolant-used", amount = 100, temperature = 25 },
    },
    always_show_products = true,
    icons = angelsmods.functions.create_gas_recipe_icon(
      nil,
      { { 150, 150, 215 }, { 120, 120, 160 }, { 100, 100, 135 } },
      {"__angelssmeltinggraphics__/graphics/icons/liquid-coolant.png"}
    ),
    order = "e[air]-b",
  },

  -- 冷却高压空气(高效)
  {
    type = "recipe",
    name = "lars-cooling-compressed-air-2",
    category = "angels-cooling",
    group = "angels-petrochem-refining",
    subgroup = "angels-petrochem-nitrogen",
    energy_required = 1,
    enabled = false,
    hide_from_signal_gui = true,
    ingredients = {
      { type = "fluid", name = "lars-purify-compressed-air", amount = 50 },
      { type = "fluid", name = "lars-liquid-nitrogen", amount = 1 },
    },
    results = {
      { type = "fluid", name = "lars-cooled-compressed-air", amount = 50, temperature = -120 },
    },
    always_show_products = true,
    icons = angelsmods.functions.create_gas_recipe_icon(
      nil,
      { { 150, 150, 215 }, { 120, 120, 160 }, { 100, 100, 135 } },
      {"lars-liquid-nitrogen"}
    ),
    order = "e[air]-c",
  },

  -- 减压制液氮液氧
  {
    type = "recipe",
    name = "lars-compressed-air-depress",
    category = "lars-air-process",
    group = "angels-petrochem-refining",
    subgroup = "angels-petrochem-nitrogen",
    energy_required = 32,
    enabled = false,
    hide_from_signal_gui = true,
    ingredients = {
      { type = "fluid", name = "lars-cooled-compressed-air", amount = 200 },
    },
    results = {
      { type = "fluid", name = "lars-liquid-oxygen", amount = 1 },
      { type = "fluid", name = "lars-liquid-nitrogen", amount = 4 },
    },
    always_show_products = true,
    icons = angelsmods.functions.create_gas_recipe_icon(
      {"lars-liquid-nitrogen", "lars-liquid-oxygen"},
      { { 150, 150, 215 }, { 120, 120, 160 }, { 100, 100, 135 } }
    ),
    order = "e[air]-d",
  },

  -- 减压制液氮液氧（高效）
  {
    type = "recipe",
    name = "lars-compressed-air-depress-2",
    category = "lars-air-process",
    group = "angels-petrochem-refining",
    subgroup = "angels-petrochem-nitrogen",
    energy_required = 16,
    enabled = false,
    hide_from_signal_gui = true,
    ingredients = {
      { type = "fluid", name = "lars-cooled-compressed-air", amount = 200, maximum_temperature = -120 },
    },
    results = {
      { type = "fluid", name = "lars-liquid-oxygen", amount = 1 },
      { type = "fluid", name = "lars-liquid-nitrogen", amount = 4 },
    },
    always_show_products = true,
    icons = angelsmods.functions.create_gas_recipe_icon(
      {"lars-liquid-nitrogen", "lars-liquid-oxygen"},
      { { 150, 150, 215 }, { 120, 120, 160 }, { 100, 100, 135 } },
      {"lars-liquid-nitrogen"}
    ),
    order = "e[air]-e",
  },

  -- 液氮制氮气
  {
    type = "recipe",
    name = "lars-liquid-nitrogen-gas",
    icons = angelsmods.functions.create_gas_fluid_icon(
      { "__angelspetrochemgraphics__/graphics/icons/molecules/nitrogen.png", 64 },
      "NNN"
    ),
    category = "chemistry",
    subgroup = "lars-liquid",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "fluid", name = "lars-liquid-nitrogen", amount = 1 },
    },
    results = {
      { type = "fluid", name = "angels-gas-nitrogen", amount = 150 },
    },
    always_show_products = true,
    crafting_machine_tint = angelsmods.functions.get_recipe_tints({
      "lars-liquid-nitrogen",
      "angels-gas-nitrogen",
    }),
    order = "b[nitrogen]",
  },

  -- 液氧制氧气
  {
    type = "recipe",
    name = "lars-liquid-oxygen-gas",
    icons = angelsmods.functions.create_gas_fluid_icon(
      { "__angelspetrochemgraphics__/graphics/icons/molecules/oxygen.png", 72 },
      "OOO"
    ),
    category = "chemistry",
    subgroup = "lars-liquid",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "fluid", name = "lars-liquid-oxygen", amount = 1 },
    },
    results = {
      { type = "fluid", name = "angels-gas-oxygen", amount = 150 },
    },
    always_show_products = true,
    crafting_machine_tint = angelsmods.functions.get_recipe_tints({
      "lars-liquid-oxygen",
      "angels-gas-oxygen",
    }),
    order = "b[oxygen]",
  },

  -- 液氢制氢气
  {
    type = "recipe",
    name = "lars-liquid-hydrogen-gas",
    icons = angelsmods.functions.create_gas_fluid_icon(
      { "__angelspetrochemgraphics__/graphics/icons/molecules/hydrogen.png", 72 },
      "HHH"
    ),
    category = "chemistry",
    subgroup = "lars-liquid",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "fluid", name = "lars-liquid-hydrogen", amount = 1 },
    },
    results = {
      { type = "fluid", name = "angels-gas-hydrogen", amount = 150 },
    },
    always_show_products = true,
    crafting_machine_tint = angelsmods.functions.get_recipe_tints({
      "lars-liquid-hydrogen",
      "angels-gas-hydrogen",
    }),
    order = "b[hydrogen]",
  },
})