local AF = angelsmods.functions

data:extend({
    -- 煤油分馏
    {
      type = "recipe",
      name = "lars-refining-kerosene",
      category = "oil-processing",
      subgroup = "lars-fuel-refining",
      energy_required = 5,
      enabled = false,
      hide_from_signal_gui = true,
      ingredients = {
        { type = "fluid", name = "angels-liquid-fuel-oil", amount = 100 },
        { type = "fluid", name = "angels-gas-hydrogen", amount = 20 },
        { type = "item", name = "angels-solid-sodium-hydroxide", amount = 1},
      },
      results = {
        { type = "fluid", name = "lars-kerosene", amount = 20 },
        { type = "fluid", name = "lars-diesel-fuel", amount = 60 },
        { type = "fluid", name = "lars-water-white-waste", amount = 30 },
      },
      always_show_products = true,
      icons = angelsmods.functions.create_viscous_liquid_fluid_icon(nil, { { 230, 230, 127 }, { 255, 255, 230 } }),
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({
        "lars-kerosene",
        "angels-liquid-fuel-oil",
      }),
      order = "g[lars-refining-kerosene]",
    },

    -- 碱性废水纯化
    {
      type = "recipe",
      name = "lars-white-waste-water-purification",
      category = "angels-water-treatment",
      subgroup = "angels-water-cleaning",
      energy_required = 2,
      enabled = false,
      ingredients = {
        { type = "fluid", name = "lars-water-white-waste", amount = 200 },
      },
      results = {
        { type = "fluid", name = "angels-water-mineralized", amount = 50 },
        { type = "fluid", name = "angels-water-purified", amount = 130 },
        { type = "item", name = "angels-solid-sodium-hydroxide", amount = 1 },
      },
      always_show_products = true,
      icons = angelsmods.functions.create_viscous_liquid_fluid_icon(nil, { { 139, 137, 137 }, { 139, 121, 94 } }),
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({
        "angels-water-mineralized",
        "lars-white-waste-water-purification",
        "angels-water-purified",
      }),
      order = "g[lars-white-waste-water-purification]",
    },

    -- 低温工厂高效液氢液氧
    {
      type = "recipe",
      name = "lars-liquid-oxygen-hydroxide",
      category = "lars-liquid-gas",
      --subgroup = "angels-water-cleaning",
      energy_required = 10,
      enabled = false,
      ingredients = {
        { type = "fluid", name = "water", amount = 900 },
      },
      results = {
        { type = "fluid", name = "lars-liquid-oxygen", amount = 8 },
        { type = "fluid", name = "lars-liquid-hydroxide", amount = 1 },
        { type = "item", name = "angels-slag", amount = 9 },
      },
      always_show_products = true,
      icons = angelsmods.functions.create_viscous_liquid_fluid_icon(nil, { { 0, 255, 255 }, { 0, 255, 255 } }),
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({
        "lars-liquid-oxygen",
        "lars-liquid-hydroxide",
      }),
      order = "a[oxygen]",
    },

})