local AF = angelsmods.functions

data:extend({
  {
    -- 电磁线圈
    type = "item",
    name = "lars-magnetic-coil",
    icon = "__lars_advance_space__/graphics/icons/coil-3.png",
    icon_size = 64,
    group = "intermediate-products",
    subgroup = "bob-electronic-components",
    order = "d-a[magnetic-coil]",
    stack_size = 200,
    weight = "1kg",
  },
})