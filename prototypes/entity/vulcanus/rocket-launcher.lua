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
    fluid_boxes = {
      {
        production_type = "input",
        pipe_picture = particlelaboratory_pipe_pictures,
        pipe_covers = pipecoverspictures(),
        volume = 500,
        pipe_connections = {{ flow_direction="input", position = {0, 2.3}, direction = defines.direction.south }},
        --secondary_draw_orders = { north = -1 }
      },
    },
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
    -- 隐藏箱，用于存放发射器的发射载荷
    type = "logistic-container",
    name = "lars-rocket-payload-container-vulcanus",
    icon = "__base__/graphics/icons/steel-chest.png",
    flags = {"placeable-neutral", "not-on-map", "hide-alt-info"},
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{0, 0}, {0, 0}},
    hidden = true,
    inventory_size = 5,
    logistic_mode = "requester",
    picture = {
      filename = "__core__/graphics/empty.png",
      width = 1,
      height = 1,
    },
  },
  {
    -- 代理箱，用于处理机械臂交互
    type = "proxy-container",
    name = "lars-rocket-payload-container-vulcanus_proxy",
    icon = "__base__/graphics/icons/steel-chest.png",
    flags = {"placeable-neutral", "not-on-map", "hide-alt-info"},
    hidden = true,
    collision_box = {{-2.3, -2.3}, {2.3, 2.3}},
    selection_box = {{0, 0}, {0, 0}},
    picture = { filename = "__core__/graphics/empty.png", width = 1, height = 1 },
    draw_inventory_content = false,
  },
  {
    -- 发射器的发射特效（光束）
    type = "explosion",
    name = "lars-rocket-launcher-vulcanus-beam",
    subgroup = "ammo-effects",
    hidden = true,
    animations = {
      {
        filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/delivery-cannon/delivery-cannon-beam.png",
        frame_count = 6,
        height = 1,
        priority = "extra-high",
        width = 187
      }
    },
    beam = true,
    flags = { "not-on-map", "placeable-off-grid"},
    light = {
      color = {
        b = 0.8,
        g = 1,
        r = 0.9
      },
      intensity = 1,
      size = 20
    },
    rotate = true,
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = {
      {
        filename = "__base__/sound/fight/old/huge-explosion.ogg",
        volume = 1
      }
    },
  },
  {
    -- 发射器载荷降落
    type = "artillery-projectile",
    name = "lars-rocket-launcher-vulcanus-capsule-artillery-projectile",
    subgroup = "ammo-effects",
    hidden = true,
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-delivery-cannon-capsule.png",
    icon_size = 64,
    acceleration = 0,
    rotatable = false,
    picture = {
      filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/delivery-cannon/delivery-cannon-capsule.png",
      width = 58,
      height = 94,
      priority = "high",
      shift = { 0, 0 },
      scale = 0.25,
    },
    reveal_map = false,
    map_color = {r=0.3, g=0.6, b=0.1},
    chart_picture =
    {
      filename = "__base__/graphics/entity/artillery-projectile/artillery-shoot-map-visualization.png",
      flags = { "icon" },
      frame_count = 1,
      width = 64,
      height = 64,
      priority = "high",
      scale = 0.20,
      tint = {r=0.3, g=0.6, b=0.1},
    },
    flags = { "not-on-map", "placeable-off-grid"},
    light = { intensity = 0.2, size = 10},
    smoke = {
      {
        deviation = {
          0.15,
          0.15
        },
        frequency = 1,
        name = "smoke-fast",
        --name = "smoke-explosion-particle",
        --name = "soft-fire-smoke", -- lasts longer
        position = {0,0},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    },
  },
  {
    type = "projectile",
    name = "lars-rocket-launcher-vulcanus-capsule-shadow",
    subgroup = "ammo-effects",
    hidden = true,
    acceleration = 0,
    rotatable = false,
    animation = {
      draw_as_shadow = true,
      filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/delivery-cannon/delivery-cannon-capsule-shadow.png",
      frame_count = 1,
      width = 98,
      height = 50,
      line_length = 1,
      priority = "high",
      shift = { 0, 0 },
      scale = 0.5,
    },
    flags = { "not-on-map", "placeable-off-grid"},
  },
})