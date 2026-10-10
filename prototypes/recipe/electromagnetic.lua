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
    icon = "__lars_advance_space__/graphics/icons/copper-coil.png",
    icon_size = 64,
    order = "d-a[magnetic-coil]",
  },
  -- 高强度磁线圈
  {
    type = "recipe",
    name = "lars-silver-coil",
    category = "crafting",
    group = "intermediate-products",
    subgroup = "bob-electronic-components",
    energy_required = 2,
    enabled = false,
    hide_from_signal_gui = true,
    ingredients = {
      { type = "item", name = "steel-plate", amount = 2 },
      { type = "item", name = "angels-wire-silver", amount = 5 },
    },
    results = {
      { type = "item", name = "lars-silver-coil", amount = 2 },
    },
    always_show_products = true,
    icon = "__lars_advance_space__/graphics/icons/silver-coil.png",
    icon_size = 64,
    order = "d-b[silver-coil]",
  },
  -- 超级磁线圈
  {
    type = "recipe",
    name = "lars-gold-coil",
    category = "crafting",
    group = "intermediate-products",
    subgroup = "bob-electronic-components",
    energy_required = 2,
    enabled = false,
    hide_from_signal_gui = true,
    ingredients = {
      { type = "item", name = "bob-nitinol-alloy", amount = 3 },
      { type = "item", name = "bob-gilded-copper-cable", amount = 7 },
    },
    results = {
      { type = "item", name = "lars-gold-coil", amount = 2 },
    },
    always_show_products = true,
    icon = "__lars_advance_space__/graphics/icons/gold-coil.png",
    icon_size = 64,
    order = "d-c[gold-coil]",
  },
})