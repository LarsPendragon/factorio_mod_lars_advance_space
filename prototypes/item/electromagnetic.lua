local AF = angelsmods.functions

data:extend({
  {
    -- 电磁线圈
    type = "item",
    name = "lars-magnetic-coil",
    icon = "__lars_advance_space__/graphics/icons/copper-coil.png",
    icon_size = 64,
    group = "intermediate-products",
    subgroup = "bob-electronic-components",
    order = "d-a[magnetic-coil]",
    stack_size = 200,
    weight = 2,
  },
  {
    -- 高强度磁线圈
    type = "item",
    name = "lars-silver-coil",
    icon = "__lars_advance_space__/graphics/icons/silver-coil.png",
    icon_size = 64,
    group = "intermediate-products",
    subgroup = "bob-electronic-components",
    order = "d-b[silver-coil]",
    stack_size = 200,
    weight = 2,
  },
  {
    -- 超级磁线圈
    type = "item",
    name = "lars-gold-coil",
    icon = "__lars_advance_space__/graphics/icons/gold-coil.png",
    icon_size = 64,
    group = "intermediate-products",
    subgroup = "bob-electronic-components",
    order = "d-c[gold-coil]",
    stack_size = 200,
    weight = 2,
  },
})