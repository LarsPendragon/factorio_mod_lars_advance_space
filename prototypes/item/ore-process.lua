local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    -- 铑金矿
    type = "item",
    name = "lars-rhodite-ore",
    icon = "__angelsrefininggraphics__/graphics/icons/ore-bauxite.png",
    icon_size = 32,
    subgroup = "lars-rhodium",
    order = "a",
    stack_size = 100,
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    weight = 10 * kg,
  },
  {
    -- 铑金矿泥
    type = "item",
    name = "lars-rhodite-chunk",
    icons = {
      {
        icon = "__angelsrefininggraphics__/graphics/icons/angels-ore4/angels-ore4-chunk.png",
        icon_size = 32,
      },
      {
        icon = "__angelsrefininggraphics__/graphics/icons/angels-ore4/angels-ore4-chunk.png",
        icon_size = 32,
        tint = {255, 250, 205, 120},
      },
    },
    subgroup = "lars-rhodium",
    order = "b",
    stack_size = 100,
    weight = 20 * kg,
  },
  {
    -- 铑粉
    type = "item",
    name = "lars-rhodium-powder",
    icons = {
      {
        icon = "__angelssmeltinggraphics__/graphics/icons/powder-silica.png",
        icon_size = 64,
      },
      {
        icon = "__angelssmeltinggraphics__/graphics/icons/powder-silica.png",
        icon_size = 64,
        tint = {255, 250, 205, 120},
      },
    },
    subgroup = "lars-rhodium",
    order = "c",
    stack_size = 100,
    weight = 10 * kg,
  },
  {
    -- 铑催化剂
    type = "item",
    name = "lars-rhodium-catalyst",
    icon = "__lars_advance_space__/graphics/icons/rhodium-catalyst.png",
    icon_size = 64,
    subgroup = "lars-rhodium",
    order = "d",
    stack_size = 100,
    weight = 50 * kg,
  },
})