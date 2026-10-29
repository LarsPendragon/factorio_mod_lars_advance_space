local AF = angelsmods.functions

data:extend({
  {
    -- 宇宙射线
    type = "fluid",
    name = "lars-universe-ray",
    icon = "__lars_advance_space__/graphics/icons/universe-ray.png",
    icon_size = 128,
    subgroup = "lars-particle",
    order = "a[space]-a",
    default_temperature = 0,
    heat_capacity = "1.0kJ",
    base_color = { r = 0.95, g = 0.95, b = 0.95 },
    flow_color = { r = 1, g = 1, b = 1 },
    max_temperature = 0,
    auto_barrel = false,
  },
})
