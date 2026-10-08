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
        }, 4, angelsmods.petrochem.number_tint),
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
        { type = "fluid", name = "lars-purify-compressed-air", amount = 50 },
        { type = "item", name = "angels-filter-ceramic-used", amount = 1},
      },
      always_show_products = true,
      icons = angelsmods.functions.create_viscous_liquid_fluid_icon(nil, { { 230, 230, 127 }, { 255, 255, 230 } }),
      order = "b[air]-a",
    },
})