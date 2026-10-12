local AF = angelsmods.functions

data:extend({
  {
    -- 简易隔热瓦
    type = "item",
    name = "lars-heat-shield-tile",
    icons = angelsmods.functions.add_number_icon_layer({
      {
        icon = "__bobrevamp__/graphics/icons/heat-shield-tile.png",
        icon_size = 32,
      },
    }, 1, angelsmods.petrochem.number_tint),
    subgroup = "intermediate-product",
    order = "m[heat-shield-tile]",
    stack_size = 100,
    drop_sound = {
      filename = "__base__/sound/item/metal-large-inventory-move.ogg",
      volume = 0.7,
    },
    inventory_move_sound = {
      filename = "__base__/sound/item/metal-large-inventory-move.ogg",
      volume = 0.7,
    },
    pick_sound = {
      filename = "__base__/sound/item/metal-large-inventory-pickup.ogg",
      volume = 0.7,
    },
    weight = 20000,
  },
  {
    -- 标准隔热瓦
    type = "item",
    name = "lars-heat-shield-tile-2",
    icons = angelsmods.functions.add_number_icon_layer({
      {
        icon = "__bobrevamp__/graphics/icons/heat-shield-tile.png",
        icon_size = 32,
      },
    }, 2, angelsmods.petrochem.number_tint),
    subgroup = "intermediate-product",
    order = "m[heat-shield-tile-2]",
    stack_size = 100,
    drop_sound = {
      filename = "__base__/sound/item/metal-large-inventory-move.ogg",
      volume = 0.7,
    },
    inventory_move_sound = {
      filename = "__base__/sound/item/metal-large-inventory-move.ogg",
      volume = 0.7,
    },
    pick_sound = {
      filename = "__base__/sound/item/metal-large-inventory-pickup.ogg",
      volume = 0.7,
    },
    weight = 20000,
  },
  {
    -- 固体火箭燃料
    type = "item",
    name = "lars-solid-rocket-fuel",
    icons = angelsmods.functions.add_number_icon_layer({
    {
        icon = "__angelspetrochemgraphics__/graphics/icons/rocket-fuel.png",
        icon_size = 32,
    },
    }, 1, angelsmods.petrochem.number_tint),
    category = "chemistry",
    group = "angels-petrochem-refining",
    subgroup = "angels-petrochem-fuel",
    order = "b[lars-solid-rocket-fuel]-c1",
    stack_size = 20,
    weight = 25000,
  },
})