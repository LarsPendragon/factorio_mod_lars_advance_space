local AF = angelsmods.functions

data:extend({
  {
    -- 纯化高压空气
    type = "fluid",
    name = "lars-purify-compressed-air",
    icons = angelsmods.functions.create_gas_fluid_icon(
      nil,
      { { 170, 170, 215 }, { 140, 140, 160 }, { 110, 110, 135 } }
    ),
    subgroup = "angels-water-cleaning-fluid",
    order = "x",
    default_temperature = 0,
    gas_temperature = 0,
    heat_capacity = "0.1kJ",
    base_color = { r = 170 / 255, g = 170 / 255, b = 215 / 255 },
    flow_color = { r = 170 / 255, g = 170 / 255, b = 215 / 255 },
    max_temperature = 100,
    min_temperature = 0,
  },
  {
    -- 低温高压空气
    type = "fluid",
    name = "lars-cooled-compressed-air",
    icons = angelsmods.functions.create_gas_fluid_icon(
      nil,
      { { 150, 150, 215 }, { 120, 120, 160 }, { 100, 100, 135 } }
    ),
    subgroup = "angels-water-cleaning-fluid",
    order = "xa",
    default_temperature = -120,
    gas_temperature = -120,
    heat_capacity = "0.1kJ",
    base_color = { r = 150 / 255, g = 150 / 255, b = 215 / 255 },
    flow_color = { r = 150 / 255, g = 150 / 255, b = 215 / 255 },
    max_temperature = -40,
    min_temperature = -120,
  },
})