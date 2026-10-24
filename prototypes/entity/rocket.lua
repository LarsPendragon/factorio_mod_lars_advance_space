local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")
require("__space-age__/prototypes/entity/cargo-hatch")
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
local sounds = require("__base__/prototypes/entity/sounds")

function planet_upper_hatch(hatch_offset, slice_offset, travel_offset, sky_slice_offset, hatch_illumination_index)
  return
  {
    hatch_graphics = nil,
    offset = hatch_offset,
    slice_height = slice_offset or 1,
    sky_slice_height = sky_slice_offset or -1,
    travel_height = travel_offset or 1,
    pod_shadow_offset = {2, 2.5};
    illumination_graphic_index = hatch_illumination_index,
    cargo_unit_entity_to_spawn = nil,
    receiving_cargo_units = {"cargo-pod"}
  }
end

data.extend({
  {
    type = "item",
    name = "lars-rocket-silo-2",
    icons = angelsmods.functions.add_number_icon_layer({
      {
        icon = "__base__/graphics/icons/rocket-silo.png",
        icon_size = 64,
      },
    }, 2, angelsmods.petrochem.number_tint),
    subgroup = "space-interactors",
    order = "a[rocket-silo]-b",
    inventory_move_sound = mechanical_large_inventory_move,
    pick_sound = mechanical_large_inventory_pickup,
    drop_sound = mechanical_large_inventory_move,
    place_result = "lars-rocket-silo-2",
    weight = 10 * tons,
    stack_size = 1
  },
  {
    type = "rocket-silo",
    name = "lars-rocket-silo-2",
    icon = "__base__/graphics/icons/rocket-silo.png",
    flags = {"placeable-player", "player-creation"},
    fast_transfer_modules_into_module_slots_only = true,
    crafting_categories = {"rocket-building", "lars-rocket-silo-2"},
    fast_replaceable_group = "rocket-silo",
    rocket_quick_relaunch_start_offset = -0.625,
    cargo_station_parameters =
    {
      is_input_station = false,
      is_output_station = true,
      hatch_definitions = { silo_cargo_hatch({0, 0}) },
      prefer_packed_cargo_units = true,
    },
    crafting_speed = 1.5,
    icon_draw_specification = {shift = {0, 2}},
    module_slots = 4,
    icons_positioning =
    {
      {inventory_index = defines.inventory.crafter_modules, shift = {0, 3.3}}
    },
    show_recipe_icon = false,
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    minable = {mining_time = 1, result = "lars-rocket-silo-2"},
    max_health = 6000,
    corpse = "rocket-silo-remnants",
    dying_explosion = "rocket-silo-explosion",
    collision_box = {{-4.20, -4.20}, {4.20, 4.20}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    damaged_trigger_effect = {
      type = "create-entity",
      entity_name = "spark-explosion",
      offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
      offsets = {{0, 1}},
      damage_type_filters = "fire"
    },

    hole_clipping_box = { {-2.75, -1.15}, {2.75, 2.25} },
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
    impact_category = "metal-large",
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-input"
    },
    energy_usage = "500kW", --energy usage used when crafting the rocket
    lamp_energy_usage = "10kW",
    active_energy_usage = "5000kW",
    rocket_entity = "rocket-silo-rocket",
    times_to_blink = 3,
    light_blinking_speed = 1 / (3 * 60),
    door_opening_speed = 1 / (4.25 * 60),

    base_engine_light =
    {
      intensity = 1,
      size = 25,
      shift = {0, 1.5}
    },

    shadow_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/00-rocket-silo-shadow.png",
      priority = "medium",
      width = 612,
      height = 578,
      draw_as_shadow = true,
      dice = 2,
      shift = util.by_pixel(7, 2),
      scale = 0.5
    },

    hole_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/01-rocket-silo-hole.png",
      width = 400,
      height = 270,
      shift = util.by_pixel(-5, 16),
      scale = 0.5
    },

    hole_light_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/01-rocket-silo-hole-light.png",
      width = 400,
      height = 270,
      shift = util.by_pixel(-5, 16),
      tint = {1,1,1,0},
      scale = 0.5
    },

    rocket_shadow_overlay_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/03-rocket-over-shadow-over-rocket.png",
      width = 426,
      height = 288,
      shift = util.by_pixel(-2, 21),
      scale = 0.5
    },
    rocket_glow_overlay_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/03-rocket-over-glow.png",
      blend_mode = "additive",
      width = 434,
      height = 446,
      shift = util.by_pixel(-3, 36),
      scale = 0.5
    },

    door_back_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/04-door-back.png",
      width = 312,
      height = 286,
      tint = {1,0,0,0.3},
      shift = util.by_pixel(37, 12),
      scale = 0.5
    },
    door_back_open_offset = {1.8, -1.8 * 0.43299225},
    door_front_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/05-door-front.png",
      width = 332,
      height = 300,
      tint = {1,0,0,0.5},
      shift = util.by_pixel(-28, 33),
      scale = 0.5
    },
    door_front_open_offset = {-1.8, 1.8 * 0.43299225},

    base_day_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/06-rocket-silo.png",
      dice_y = 3,
      width = 608,
      height = 596,
      shift = util.by_pixel(3, -1),
      scale = 0.5
    },

    red_lights_back_sprites =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {1.34375, 0.28125-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {2.3125, 0.9375-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {2.65625, 1.90625-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-2.65625, 1.90625-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-2.3125, 0.9375-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-1.34375, 0.28125-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {0, 0-1.375},
          scale = 0.5
        }
      }
    },

    red_lights_front_sprites =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {2.3125, 2.8125-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {1.34375, 3.40625-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {0, 3.75-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {0, 3.75-1.375},
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/rocket-silo/07-red-lights-back/red-light.png",
          width = 32,
          height = 32,
          shift = {-2.3125, 2.8125-1.375},
          scale = 0.5
        }
      }
    },
    satellite_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/15-rocket-silo-turbine.png",
      priority = "medium",
      width = 54,
      height = 88,
      frame_count = 32,
      line_length = 8,
      animation_speed = 0.4,
      shift = util.by_pixel(-99.5, 111.5),
      scale = 0.5
    },

    arm_01_back_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/08-rocket-silo-arms-back.png",
      priority = "medium",
      width = 128,
      height = 150,
      frame_count = 32,
      line_length = 32,
      animation_speed = 0.3,
      shift = util.by_pixel(-53, -84),
      scale = 0.5
    },

    arm_02_right_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/08-rocket-silo-arms-right.png",
      priority = "medium",
      width = 182,
      height = 188,
      frame_count = 32,
      line_length = 32,
      animation_speed = 0.3,
      shift = util.by_pixel(101, -38),
      scale = 0.5
    },

    arm_03_front_animation =
    {
      filename = "__base__/graphics/entity/rocket-silo/13-rocket-silo-arms-front.png",
      priority = "medium",
      width = 126,
      height = 228,
      frame_count = 32,
      line_length = 32,
      animation_speed = 0.3,
      shift = util.by_pixel(-51, 16),
      scale = 0.5
    },

    base_front_sprite =
    {
      filename = "__base__/graphics/entity/rocket-silo/14-rocket-silo-front.png",
      width = 580,
      height = 262,
      shift = util.by_pixel(-1, 78),
      scale = 0.5
    },
    silo_fade_out_start_distance = 8,
    silo_fade_out_end_distance = 15,

    alarm_sound = "__base__/sound/silo-alarm.ogg",
    quick_alarm_sound = {filename = "__base__/sound/silo-alarm-short.ogg", volume = 1.0, aggregation = {max_count = 2, remove = true, count_already_playing = true}},
    clamps_on_sound = {filename = "__base__/sound/silo-clamps-on.ogg", volume = 1.0, aggregation = {max_count = 1, remove = false, count_already_playing = true}},
    clamps_off_sound = {filename = "__base__/sound/silo-clamps-off.ogg", volume = 0.8, aggregation = {max_count = 1, remove = false, count_already_playing = true}},
    doors_sound = {filename = "__base__/sound/silo-doors.ogg", volume = 0.8, aggregation = {max_count = 3, remove = true, count_already_playing = true}},
    raise_rocket_sound = {filename = "__base__/sound/silo-raise-rocket.ogg", volume = 1.0, aggregation = {max_count = 2, remove = true, count_already_playing = true}},
    open_sound = {filename = "__base__/sound/open-close/silo-open.ogg", volume = 0.7},
    close_sound = {filename = "__base__/sound/open-close/silo-close.ogg", volume = 0.7},
    working_sound =
    {
      sound =
        {
          filename = "__base__/sound/rocket-silo-working-1.ogg",
          volume = 0.8,
          aggregation = {max_count = 3, remove = true, count_already_playing = true}
        },
      fade_in_ticks = 10,
      fade_out_ticks = 15
    },
    default_launched_signal = {type = "virtual", name = "signal-R"},
    
    -- space age new params
    launch_to_space_platforms = true,
    to_be_inserted_to_rocket_inventory_size = 20,
    logistic_trash_inventory_size = 20,
    surface_conditions = {{property = "pressure", min = 10}},
    rocket_parts_required = 50,
    heating_energy = "300kW",
  },



  -- 物流接驳站2
  {
    type = "item",
    name = "lars-cargo-landing-pad-2",
    icons = angelsmods.functions.add_number_icon_layer({
      {
        icon = "__base__/graphics/icons/cargo-landing-pad.png",
        icon_size = 64,
      },
    }, 2, angelsmods.petrochem.number_tint),
    subgroup = "space-interactors",
    order = "c[cargo-landing-pad]-b",
    inventory_move_sound = mechanical_large_inventory_move,
    pick_sound = mechanical_large_inventory_pickup,
    drop_sound = mechanical_large_inventory_move,
    place_result = "lars-cargo-landing-pad-2",
    stack_size = 1,
    weight = 1 * tons
  },
  {
    type = "cargo-landing-pad",
    name = "lars-cargo-landing-pad-2",
    icon = "__base__/graphics/icons/cargo-landing-pad.png",
    flags = {"placeable-player", "player-creation", "no-automated-item-insertion", "hide-alt-info"},
    collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
    selection_box = {{-4, -4}, {4, 4}},
    build_grid_size = 2,
    max_health = 1500,
    corpse = "cargo-landing-pad-remnants",
    dying_explosion = "rocket-silo-explosion",
    minable = {mining_time = 1, result = "lars-cargo-landing-pad-2"},
    fast_replaceable_group = "cargo-landing-pad",
    inventory_size = 80,
    trash_inventory_size = 30,
    surface_conditions ={{ property = "gravity", min = 1}},
    radar_range = 10,
    radar_visualisation_color = {0.059, 0.092, 0.235, 0.275},
    open_sound = {filename =  "__base__/sound/open-close/mechanical-large-open.ogg", volume = 0.5},
    close_sound = {filename = "__base__/sound/open-close/mechanical-large-close.ogg", volume = 0.5},
    graphics_set =
    {
        water_reflection =
        {
          pictures =
          {
            filename = "__base__/graphics/entity/cargo-hubs/hubs/planet-hub-reflections.png",
            priority = "extra-high",
            width = 64,
            height = 32,
            shift = util.by_pixel(0, 160),
            variation_count = 1,
            scale = 4
          },
          rotate = false,
          orientation_to_variation = false
        },

      connections = require("__base__.graphics.entity.cargo-hubs.connections.planet-connections"),
      picture =
      {
        {
          render_layer = "lower-object-above-shadow",
          layers =
          {
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-0-A",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-0-B",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-0-C",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-0-D",
            {
              scale = 0.5,
              shift = {0, -1}
            })
          }
        },
        {
          render_layer = "lower-object-overlay",
          layers =
          {
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-1-A",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-1-B",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-1-C",
            {
              scale = 0.5,
              shift = {0, -1}
            })
          }
        },
        {
          render_layer = "object-under",
          layers =
          {
          util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-2",
            {
              scale = 0.5,
              shift = {0, -1}
            })
          }
        },
        {
          render_layer = "object",
          layers =
          {
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-3",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-shadow",
            {
              scale = 0.5,
              shift = {8, 0},
              draw_as_shadow = true
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-emission-A",
            {
              scale = 0.5,
              shift = {0, -1},
              draw_as_glow = true,
              blend_mode = "additive"
            }),
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-emission-C",
            {
              scale = 0.5,
              shift = {0, -1},
              draw_as_glow = true,
              blend_mode = "additive"
            }),
          }
        },
        {
          render_layer = "above-inserters",
          layers =
          {
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/planet-upper-hatch-occluder",
            {
              scale = 0.5,
              shift = {0, -1}
            })
          }
        }
      },
      animation =
      {
        layers =
          {
            util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-turbine",
            {
              frame_count = 32,
              repeat_count = 1,
              scale = 0.5,
              shift = {0, -0.5},
              tint = {1, 0, 0, 0.3},
              animation_speed = 0.5
            })
          }
      }
    },
    robot_door =
    {
      location_offset = {-2.1, -2.8},
      opened_duration = 7,
      animation = util.sprite_load("__base__/graphics/entity/cargo-hubs/hubs/planet-hub-drone-hatch",
                  {
                    frame_count = 7,
                    scale = 0.5,
                    shift = {0, -0.5},
                  }),
      animation_sound = sounds.logistics_chest_open,
    },
    cargo_station_parameters =
    {
      is_input_station = true,
      is_output_station = false,
      hatch_definitions =
      {
        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),
      },
      giga_hatch_definitions =
      {
        planet_upper_giga_hatch({0,1,2})
      }
    },
    --circuit_wire_max_distance = default_circuit_wire_max_distance,
    --circuit_connector = circuit_connector_definitions["cargo-landing-pad"],
    default_empty_slots_signal = { type = "virtual", name = "signal-E" },
  },



  -- 扩展接驳站2型
  {
    type = "item",
    name = "lars-cargo-bay-2",
    icons = angelsmods.functions.add_number_icon_layer({
      {
        icon = "__space-age__/graphics/icons/cargo-bay.png",
        icon_size = 64,
      },
    }, 2, angelsmods.petrochem.number_tint),
    subgroup = "space-platform",
    order = "c[cargo-bay]-b",
    inventory_move_sound = mechanical_large_inventory_move,
    pick_sound = mechanical_large_inventory_pickup,
    drop_sound = mechanical_large_inventory_move,
    place_result = "lars-cargo-bay-2",
    stack_size = 10,
    weight = 100 * kg
  },
  {
    type = "cargo-bay",
    name = "lars-cargo-bay-2",
    flags = {"placeable-player", "player-creation"},
    icon = "__space-age__/graphics/icons/cargo-bay.png",
    corpse = "cargo-bay-remnants",
    dying_explosion = "electric-furnace-explosion",
    collision_box = {{-1.9, -1.9}, {1.9, 1.9}},
    selection_box = {{-2, -2}, {2, 2}},
    max_health = 1500,
    minable = {mining_time = 1, result = "lars-cargo-bay-2"},
    fast_replaceable_group = "cargo-bay",
    inventory_size_bonus = 50,
    hatch_definitions =
    {
      shared_bay_hatch({-0.32, -1.5}, procession_graphic_catalogue_types.hatch_emission_bay)
    },
    graphics_set =
    {
      water_reflection =
      {
        pictures =
        {
          filename = "__space-age__/graphics/entity/cargo-hubs/bays/planet-bay-reflections.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          shift = util.by_pixel(0, 100),
          variation_count = 1,
          scale = 4
        },
        rotate = false,
        orientation_to_variation = false
      },
      connections = require("__base__.graphics.entity.cargo-hubs.connections.planet-connections"),
      picture =
      {
        {
          render_layer = "lower-object-above-shadow",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/shared-cargo-bay-0",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
          }
        },
        {
          render_layer = "object",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/planet-cargo-bay-3",
            {
              scale = 0.5,
              tint = {1, 0, 0, 0.2},
              shift = {0, -1}
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/shared-cargo-bay-shadow",
            {
              scale = 0.5,
              shift = {3, 0.5},
              draw_as_shadow = true
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/shared-cargo-bay-emission",
            {
              scale = 0.5,
              shift = {0, -1},
              draw_as_glow = true,
              blend_mode = "additive"
            })
          }
        },
        {
          render_layer = "cargo-hatch",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/planet-cargo-bay-occluder",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
          }
        }
      }
    },
    platform_graphics_set =
    {
      connections = require("__space-age__.graphics.entity.cargo-hubs.connections.platform-connections"),
      picture =
      {
        {
          render_layer = "lower-object-above-shadow",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/shared-cargo-bay-0",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
          }
        },
        {
          render_layer = "object",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/platform-cargo-bay-3",
            {
              scale = 0.5,
              tint = {1, 0, 0, 0.2},
              shift = {0, -1}
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/shared-cargo-bay-shadow",
            {
              scale = 0.5,
              shift = {3, 0.5},
              draw_as_shadow = true
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/shared-cargo-bay-emission",
            {
              scale = 0.5,
              shift = {0, -1},
              draw_as_glow = true,
              blend_mode = "additive"
            })
          }
        },
        {
          render_layer = "cargo-hatch",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-cargo-bay-occluder",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
          }
        }
      }
    }
  },
})