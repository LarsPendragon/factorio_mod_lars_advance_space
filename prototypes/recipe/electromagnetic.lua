local AF = angelsmods.functions

data:extend({
  -- 电磁线圈
  {
    type = "recipe",
    name = "lars-magnetic-coil",
    category = "crafting",
    group = "intermediate-products",
    subgroup = "bob-electronic-components",
    energy_required = 2,
    enabled = false,
    hide_from_signal_gui = true,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 1 },
      { type = "item", name = "copper-cable", amount = 3 },
    },
    results = {
      { type = "item", name = "lars-magnetic-coil", amount = 2 },
    },
    always_show_products = true,
    icon = "__lars_advance_space__/graphics/icons/coil-3.png",
    icon_size = 64,
    order = "d-a[magnetic-coil]",
  },
})