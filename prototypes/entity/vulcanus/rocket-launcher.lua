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
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-rocket-launch-pad.png",
    icon_size = 64,
    subgroup = "space-interactors",
    order = "a[rocket-silo]-c",
    inventory_move_sound = mechanical_large_inventory_move,
    pick_sound = mechanical_large_inventory_pickup,
    drop_sound = mechanical_large_inventory_move,
    place_result = "lars-rocket-launcher-vulcanus",
    weight = 10 * tons,
    stack_size = 1
  },
  {
    type = "rocket-silo",
    name = "lars-rocket-launcher-vulcanus",
    subgroup = "space-interactors",
    rocket_entity = "lars-cargo-rocket",
    fixed_recipe = "lars-rocket-part-vulcanus",
    order = "a[rocket-silo]-c",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-rocket-launch-pad.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "lars-rocket-launcher-vulcanus"},
    selectable_in_game = true,
    selection_box = {{-4.65, -4.65}, {4.65, 4.65}},
    collision_box = {{-4.65, -4.65}, {4.65, 4.65}},
    collision_mask = {layers={}},
    crafting_categories = {"lars-special-rocket"},
    rocket_parts_required = 1,
    lift_weight = 50 * kg,
    launch_to_space_platforms = true,
    to_be_inserted_to_rocket_inventory_size = 2,
    logistic_trash_inventory_size = 2,
    surface_conditions = {{property = "solar-power", min = 400}},
    crafting_speed = 2.5,
    rocket_result_inventory_size = 0,
    show_recipe_icon = false,
    --module_slots = 2,
    max_health = 3000,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    hole_clipping_box = { {-2.75, -1.15 + silo_offset_px/32}, {2.75, 2.25 + silo_offset_px/32} },
    rocket_quick_relaunch_start_offset = -0.625,
    cargo_station_parameters =
    {
      hatch_definitions = {
          {
            hatch_graphics = nil,
            offset = {0, 0},
            pod_shadow_offset = {0, 0}; --flush with ground
            cargo_unit_entity_to_spawn = nil, --silo defines the lift pod
            receiving_cargo_units = {}
          }
       },
    },
    fluid_boxes = {
      {
        volume = 100,
        pipe_covers = pipecoverspictures(),
        filter = "lars-photon",
        production_type = "input",
        pipe_connections =
        {
          { flow_direction = "input", position = { 0, -4.6}, direction = defines.direction.north },
        },
      },
      {
        volume = 100,
        pipe_covers = pipecoverspictures(),
        production_type = "output",
        pipe_connections =
        {
          { flow_direction = "output", position = { 0, 4.6}, direction = defines.direction.south },
        },
      },
    },
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 60
      }
    },

    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
    },
    active_energy_usage = "1750kW",
    energy_usage = "250kW",
    idle_energy_usage = "100kW",
    lamp_energy_usage = "0kW",

    times_to_blink = 3,
    light_blinking_speed = 1 / (3 * 60),
    door_opening_speed = 1,
    silo_fade_out_start_distance = 9, --8,
    silo_fade_out_end_distance = 16, --15,
    rocket_rising_delay = 1,
    launch_wait_time = 1,

    base_engine_light =
    {
      intensity = 1,
      size = 25,
      shift = {0, 1.5 + silo_offset_px/32}
    },


    shadow_sprite = 
    {
      filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/00-rocket-silo-shadow.png",
      priority = "medium",
      width = 410,
      height = 510,
      draw_as_shadow = true,
      slice = 2,
      shift = util.by_pixel(174, 36),
      scale = 0.5
    },

    hole_sprite =
    {
      filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/01-rocket-silo-hole.png",
      width = 400,
      height = 270,
      shift = util.by_pixel(-5, 16 + silo_offset_px),
      scale = 0.5
    },
    hole_light_sprite =
    {
      filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/01-rocket-silo-hole-light.png",
      width = 400,
      height = 270,
      shift = util.by_pixel(-5, 16 + silo_offset_px),
      tint = {1,1,1,0},
      scale = 0.5
    },

    rocket_shadow_overlay_sprite =
    {
      filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/03-rocket-over-shadow-over-rocket.png",
      width = 426,
      height = 288,
      shift = util.by_pixel(-2, 21 + silo_offset_px),
      scale = 0.5
    },
    rocket_glow_overlay_sprite =
    {
      filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/03-rocket-over-glow.png",
      blend_mode = "additive",
      width = 434,
      height = 446,
      shift = util.by_pixel(-3, 36 + silo_offset_px),
      scale = 0.5
    },


    door_back_sprite =
    {
      filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/04-door-back.png",
      width = 312,
      height = 286,
      shift = util.by_pixel(28.5, 4 + silo_offset_px),
      scale = 0.5
    },
    door_back_open_offset = {1.8, -1.8 * 0.43299225},
    door_front_sprite =
    {
      filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/05-door-front.png",
      width = 332,
      height = 300,
      shift = util.by_pixel(-34.5, 24.5 + silo_offset_px),
      scale = 0.5
    },
    door_front_open_offset = {-1.8, 1.8 * 0.43299225},

    base_day_sprite =
    {
      filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/06-rocket-silo.png",
      width = 704,
      height = 736,
      shift = util.by_pixel(0, -8),
      scale = 0.5
    },


    red_lights_back_sprites =
    {
      layers =
      {
        {
          filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {1.34375, 0.28125-1.375 + silo_offset_px/32},
          scale = 0.5
        },
        {
          filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {2.3125, 0.9375-1.375 + silo_offset_px/32},
          scale = 0.5
        },
        {
          filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {2.65625, 1.90625-1.375 + silo_offset_px/32},
          scale = 0.5
        },
        {
          filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-2.65625, 1.90625-1.375 + silo_offset_px/32},
          scale = 0.5
        },
        {
          filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-2.3125, 0.9375-1.375 + silo_offset_px/32},
          scale = 0.5
        },
        {
          filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-1.34375, 0.28125-1.375 + silo_offset_px/32},
          scale = 0.5
        },
        {
          filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {0, 0-1.375 + silo_offset_px/32},
          scale = 0.5
        }
      }
    },

    red_lights_front_sprites =
    {
      layers =
      {
        {
          filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {2.3125, 2.8125-1.375 + silo_offset_px/32},
          scale = 0.5
        },
        {
          filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {1.34375, 3.40625-1.375 + silo_offset_px/32},
          scale = 0.5
        },
        {
          filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {0, 3.75-1.375 + silo_offset_px/32},
          scale = 0.5
        },
        {
          filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {0, 3.75-1.375 + silo_offset_px/32},
          scale = 0.5
        },
        {
          filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-2.3125, 2.8125-1.375 + silo_offset_px/32},
          scale = 0.5
        }
      }
    },
    satellite_animation =
    {
      filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/15-rocket-silo-turbine.png",
      priority = "medium",
      width = 392/4,
      height = 288/8,
      frame_count = 4,
      line_length = 4,
      animation_speed = 0.4,
      shift = util.by_pixel(-114, -4),
      scale = 0.5
    },

    arm_01_back_animation =
    {
      filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/08-rocket-silo-arms-back.png",
      priority = "medium",
      width = 128,
      height = 150,
      frame_count = 32,
      line_length = 32,
      animation_speed = 0.3,
      shift = util.by_pixel(-53.5, -84 + silo_offset_px),
      scale = 0.5
    },

    arm_02_right_animation =
    {
      filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/08-rocket-silo-arms-right.png",
      priority = "medium",
      width = 182,
      height = 188,
      frame_count = 32,
      line_length = 32,
      animation_speed = 0.3,
      shift = util.by_pixel(101, -38 + silo_offset_px),
      scale = 0.5
    },

    arm_03_front_animation =
    {
      filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/13-rocket-silo-arms-front.png",
      priority = "medium",
      width = 126,
      height = 228,
      frame_count = 32,
      line_length = 32,
      animation_speed = 0.3,
      shift = util.by_pixel(-50.5, 15.5 + silo_offset_px),
      scale = 0.5
    },

    base_front_sprite =
    {
      filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/rocket-launch-pad/14-rocket-silo-front.png",
      width = 704,
      height = 448,
      shift = util.by_pixel(0, 64),
      scale = 0.5
    },

    alarm_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/silo-alarm.ogg",
            volume = 1.0
          }
        }
      }
    },
    clamps_on_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/silo-clamps-on.ogg",
            volume = 1.0
          }
        }
      }
    },
    clamps_off_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/silo-clamps-off.ogg",
            volume = 1.0
          }
        }
      }
    },
    doors_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/silo-doors.ogg",
            volume = 1.0
          }
        }
      }
    },
    raise_rocket_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/silo-raise-rocket.ogg",
            volume = 1.0
          }
        }
      }
    }
  },
})