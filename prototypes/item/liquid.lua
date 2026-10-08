local AF = angelsmods.functions

data:extend({
    {
        -- 碱性废水
        type = "fluid",
        name = "lars-water-white-waste",
        icons = angelsmods.functions.create_viscous_liquid_fluid_icon(nil, { { 139, 137, 137 }, { 139, 121, 94 } }),
        subgroup = "angels-water-cleaning-fluid",
        order = "x",
        default_temperature = 0,
        heat_capacity = "0.1kJ",
        base_color = { r = 0.53, g = 0.53, b = 0.53 },
        flow_color = { r = 0.53, g = 0.53, b = 0.53 },
        max_temperature = 100,
    },
    {
        -- 液氧
        type = "fluid",
        name = "lars-liquid-oxygen",
        icons = angelsmods.functions.create_liquid_fluid_icon(
          { "__angelspetrochemgraphics__/graphics/icons/molecules/oxygen.png", 72 },
          "OOO"
        ),
        subgroup = "angels-petrochem-solids-fluids",
        order = "f(oxygen)",
        default_temperature = -183,
        heat_capacity = "0.1kJ",
        base_color = { r = 0, g = 1, b = 1 },
        flow_color = { r = 0, g = 1, b = 1 },
        max_temperature = -183,
    },
    {
        -- 液氢
        type = "fluid",
        name = "lars-liquid-hydroxide",
        icons = angelsmods.functions.create_liquid_fluid_icon(
          { "__angelspetrochemgraphics__/graphics/icons/molecules/hydrogen.png", 72 },
          "HHH"
        ),
        subgroup = "angels-petrochem-solids-fluids",
        order = "f(hydroxide)",
        default_temperature = -253,
        heat_capacity = "0.1kJ",
        base_color = { r = 0.93, g = 1, b = 1 },
        flow_color = { r = 0.93, g = 1, b = 1 },
        max_temperature = -253,
    },
    {
        -- 液氮
        type = "fluid",
        name = "lars-liquid-nitrogen",
        icons = angelsmods.functions.create_liquid_fluid_icon(
          { "__angelspetrochemgraphics__/graphics/icons/molecules/nitrogen.png", 72 },
          "NNN"
        ),
        subgroup = "angels-petrochem-solids-fluids",
        order = "f(nitrogen)",
        default_temperature = -197,
        heat_capacity = "0.1kJ",
        base_color = { r = 0.87, g = 1, b = 1 },
        flow_color = { r = 0.87, g = 1, b = 1 },
        max_temperature = -197,
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
  }
)