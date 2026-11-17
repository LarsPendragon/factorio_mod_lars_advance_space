local silo_offset_px = -37
local mechanical_large_inventory_move = {
  filename = "__base__/sound/item/mechanical-large-inventory-move.ogg",
  volume = 0.7,
  aggregation = {max_count = 1, remove = true},
}
local mechanical_large_inventory_pickup = {
  filename = "__base__/sound/item/mechanical-large-inventory-pickup.ogg",
  volume = 0.8,
  aggregation = {max_count = 1, remove = true},
}

data:extend({
  {
    type = "item",
    name = "lars-rocket-launcher-vulcanus",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-delivery-cannon.png",
    icon_size = 64,
    subgroup = "space-interactors",
    order = "a[rocket-silo]-d",
    inventory_move_sound = mechanical_large_inventory_move,
    pick_sound = mechanical_large_inventory_pickup,
    drop_sound = mechanical_large_inventory_move,
    place_result = "lars-rocket-launcher-vulcanus",
    weight = 10 * tons,
    stack_size = 1
  },
  {
    type = "assembling-machine",
    name = "lars-rocket-launcher-vulcanus",
    minable = {
      mining_time = 0.5,
      result = "lars-rocket-launcher-vulcanus",
    },
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-delivery-cannon.png",
    icon_size = 64,
    subgroup = "space-interactors",
    order = "a[rocket-silo]-d",
    max_health = 1500,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    fixed_recipe = "lars-rocket-part-vulcanus",
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{-2.3, -2.3}, {2.3, 2.3}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box_vertical_extension = 5,
    se_allow_in_space = true,
    resistances =
    {
      { type = "explosion", percent = 99 },
      { type = "impact", percent = 99 },
      { type = "fire", percent = 99 },
    },
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.5},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.5},
    impact_category = "metal-large",
    working_sound = {
      apparent_volume = 1.5,
      idle_sound = {
        filename = "__base__/sound/idle1.ogg",
        volume = 0.6
      },
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        }
      }
    },
    collision_mask = {
      layers = {
        water_tile = true,
        item = true,
        object = true,
        player = true,
      },
    },
    graphics_set = {
      animation =
      {
        layers =
        {
          {
            filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/delivery-cannon/delivery-cannon.png",
            frame_count = 1,
            line_length = 1,
            width = 320,
            height = 640,
            shift = {0,-2.5},
            scale = 0.5,
          },
          {
            draw_as_shadow = true,
            filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/delivery-cannon/delivery-cannon-shadow.png",
            shift = { 1.25, 1/32 },
            width = 470,
            height = 306,
            scale = 0.5,
          }
        }
      },
    },
    crafting_categories = {"delivery-cannon", "lars-special-rocket"},
    crafting_speed = 1,
    energy_source =
    {
      type = "void",
    },
    energy_usage = "100kW",
  },
  {
    type = "container",
    name = "lars-rocket-payload-container-vulcanus",
    icon = "__base__/graphics/icons/steel-chest.png",
    flags = {"placeable-neutral", "not-on-map"},
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{0, 0}, {0, 0}},
    inventory_size = 5,
    picture = {
      filename = "__core__/graphics/empty.png",
      width = 1,
      height = 1,
    },
  },
})