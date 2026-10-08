data:extend({
    {
      type = "recipe",
      name = "bob-basic-transport-belt-with-copper",
      energy_required = 2,
      ingredients = {
        { type = "item", name = "copper-plate", amount = 2 },
        { type = "item", name = "iron-gear-wheel", amount = 1 },
      },
      results = { { type = "item", name = "bob-basic-transport-belt", amount = 2 } },
    },
    
    -- 煤油
    {
        type = "fluid",
        name = "lars-kerosene",
        icons = angelsmods.functions.create_viscous_liquid_fluid_icon(nil, { { 230, 230, 127 }, { 255, 255, 230 } }),
        subgroup = "angels-petrochem-carbon-fluids",
        order = "daaa",
        default_temperature = 0,
        heat_capacity = "1.0kJ",
        base_color = { r = 0.9, g = 0.9, b = 0.5 },
        flow_color = { r = 1, g = 1, b = 0.9 },
        fuel_value = "300kJ",
        emissions_multiplier = 0.75,
        max_temperature = 200,
    },
    -- 柴油
    {
        type = "fluid",
        name = "lars-diesel-fuel",
        icons = angelsmods.functions.create_viscous_liquid_fluid_icon(nil, { { 190, 190, 107 }, { 255, 255, 230 } }),
        subgroup = "angels-petrochem-carbon-fluids",
        order = "daab",
        default_temperature = 0,
        heat_capacity = "1.0kJ",
        base_color = { r = 0.75, g = 0.75, b = 0.42 },
        flow_color = { r = 1, g = 1, b = 0.9 },
        fuel_value = "350kJ",
        emissions_multiplier = 1.5,
        max_temperature = 300,
    },
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
  }
)