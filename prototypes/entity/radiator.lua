-- NEED TFMG-thermal MOD FOR HEAT PROCESS

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

-- TFMG 散热片偏移
local pixel = 1/32
local radiator_shift_n = {0,-2+pixel*1}
local radiator_shift_e = {2-pixel*1,0}
local radiator_shift_s = {0,2-pixel*1}
local radiator_shift_w = {-2+pixel*1,0}
local radiator_shift_n2 = {0,-4+pixel*16}
local radiator_shift_e2 = {4-pixel*16,0}
local radiator_shift_s2 = {0,4-pixel*16}
local radiator_shift_w2 = {-4+pixel*16,0}

data:extend({
  {
    -- TFMG mod 中的散热片，用于测试
    type = "item",
    name = "lars-TFMG-radiator",
    icon = "__TFMG-thermal__/graphics/small-radiator/small-radiator-icon.png",
    icon_size = 64,
    subgroup = "space-radiator",
    order = "zzz",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "lars-TFMG-radiator",
    stack_size = 10,
    weight = 20 * kg,
  },
  {
    -- TFMG mod 中的散热片，用于测试
    type = "assembling-machine",
    name = "lars-TFMG-radiator",
    icon = "__TFMG-thermal__/graphics/small-radiator/small-radiator-icon.png",
    icon_size = 64,
    flags = {"placeable-neutral","player-creation","filter-directions"},
    hidden = true,
    minable = {mining_time = 0.2, result = "lars-TFMG-radiator"},
    max_health = 250,
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = small_radiator_connector,
    collision_box = {{-0.4, -4.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -4.5}, {0.5, 0.5}},
    tile_height = 1,
    tile_width = 1,
    tile_buildability_rules =
    {
      {area = {{-0.4, -4.4}, {0.4, 0.4}}, required_tiles = {layers = {empty_space = true}}, remove_on_collision = true},
      {area = {{-0.4, 0.6}, {0.4, 0.9}}, required_tiles = {layers = {ground_tile = true}}, colliding_tiles = {layers = {empty_space = true}}, remove_on_collision = true},
    },
    surface_conditions = {{property = "gravity",min = 0,max = 0}},
    collision_mask = {layers={is_object = true, is_lower_object = true, transport_belt = true, platform = true}},
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/nuclear-reactor-1.ogg", volume = 0.45, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    damaged_trigger_effect = hit_effects.entity(),
    graphics_set = { animation = {
      north = { layers = {
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-1.png",size = 384, scale = 0.5,shift = radiator_shift_n},
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-shadow-1.png",size = 384, scale = 0.5,draw_as_shadow = true,shift = radiator_shift_n},
        }},
      east = { layers = {
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-2.png",size = 384, scale = 0.5,shift = radiator_shift_e},
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-shadow-2.png",size = 384, scale = 0.5,draw_as_shadow = true,shift = radiator_shift_e},
        }},
      south = { layers = {
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-3.png",size = 384, scale = 0.5,shift = radiator_shift_s},
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-shadow-3.png",size = 384, scale = 0.5,draw_as_shadow = true,shift = radiator_shift_s},
        }},
      west = { layers = {
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-4.png",size = 384, scale = 0.5,shift = radiator_shift_w},
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-shadow-4.png",size = 384, scale = 0.5,draw_as_shadow = true,shift = radiator_shift_w},
        }},
      },
      working_visualisations = {{
        fadeout = true,
        effect = "uranium-glow",
        light = {intensity = 2, size = 4.5, shift = {0, 0}, color = {1, 0.2, 0.2}},
        north_animation = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-working-1.png",size = 384, scale = 0.5,blend_mode = "additive",draw_as_glow = true,tint = {0.4,0.4,0.4}, shift = radiator_shift_n},
        east_animation = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-working-2.png",size = 384, scale = 0.5,blend_mode = "additive",draw_as_glow = true,tint = {0.4,0.4,0.4}, shift = radiator_shift_e},
        south_animation = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-working-3.png",size = 384, scale = 0.5,blend_mode = "additive",draw_as_glow = true,tint = {0.4,0.4,0.4}, shift = radiator_shift_s},
        west_animation = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-working-4.png",size = 384, scale = 0.5,blend_mode = "additive",draw_as_glow = true,tint = {0.4,0.4,0.4}, shift = radiator_shift_w},
      }}
    },
    crafting_categories = {"radiator"},
    fixed_recipe = "lars-TFMG-radiato-working",
    crafting_speed = 1,
    energy_source =
    {
      type = "heat",
      max_temperature = 1000, --this has to be a big number or a thermal system could lock up and be unable to cool down
      min_working_temperature = 15,
      default_temperature = 15,
      specific_heat = "1MJ",--radiator graphics get weird if they have more specific heat than the heat pipe they are connected to.
      max_transfer = "1GW",
      connections =
      {--north connection is not real and cannot hurt me.
        {
          position = {0, 0},
          direction = defines.direction.south
        },
      },
      heat_picture = {
        north = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-heat-1.png",size = 384, scale = 0.5,blend_mode = "additive",draw_as_glow = true,tint = {0.5,0.5,0.5}, shift = radiator_shift_n},
        east = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-heat-2.png",size = 384, scale = 0.5,blend_mode = "additive",draw_as_glow = true,tint = {0.5,0.5,0.5}, shift = radiator_shift_e},
        south = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-heat-3.png",size = 384, scale = 0.5,blend_mode = "additive",draw_as_glow = true,tint = {0.5,0.5,0.5}, shift = radiator_shift_s},
        west = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-heat-4.png",size = 384, scale = 0.5,blend_mode = "additive",draw_as_glow = true,tint = {0.5,0.5,0.5}, shift = radiator_shift_w},
      }
    },
    energy_usage = "2MW",--change this to fit the balance of your mod.
    placeable_position_visualization =
    {
      filename = "__core__/graphics/cursor-boxes-32x32.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      scale = 0.5,
      x = 3*64
    },
  },
})

data:extend({
  {
    -- TFMG mod 中的散热片，用于测试
    type = "item",
    name = "lars-space-radiator",
    icon = "__TFMG-thermal__/graphics/small-radiator/small-radiator-icon.png",
    icon_size = 64,
    subgroup = "space-radiator",
    order = "a",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "lars-space-radiator",
    stack_size = 10,
    weight = 50 * kg,
  },
  {
    -- TFMG mod 中的散热片，用于测试
    type = "assembling-machine",
    name = "lars-space-radiator",
    icon = "__TFMG-thermal__/graphics/small-radiator/small-radiator-icon.png",
    icon_size = 64,
    flags = {"placeable-neutral","player-creation","filter-directions"},
    hidden = true,
    minable = {mining_time = 0.5, result = "lars-space-radiator"},
    max_health = 250,
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = small_radiator_connector,
    collision_box = {{-0.8, -8.8}, {0.8, 0.8}},
    selection_box = {{-1, -9}, {1, 1.6}},
    tile_height = 1,
    tile_width = 1,
    tile_buildability_rules =
    {
      {area = {{-0.8, -8.8}, {0.8, 0.8}}, required_tiles = {layers = {empty_space = true}}, remove_on_collision = true},
      {area = {{-0.8, 1.2}, {0.8, 1.8}}, required_tiles = {layers = {ground_tile = true}}, colliding_tiles = {layers = {empty_space = true}}, remove_on_collision = true},
    },
    surface_conditions = {{property = "gravity",min = 0,max = 0}},
    collision_mask = {layers={is_object = true, is_lower_object = true, transport_belt = true, platform = true}},
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/nuclear-reactor-1.ogg", volume = 0.45, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    damaged_trigger_effect = hit_effects.entity(),
    graphics_set = { animation = {
      north = { layers = {
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-1.png",size = 384, scale = 1, shift = radiator_shift_n2},
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-shadow-1.png",size = 384, scale = 1, draw_as_shadow = true,shift = radiator_shift_n2},
        }},
      east = { layers = {
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-2.png",size = 384, scale = 1, shift = radiator_shift_e2},
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-shadow-2.png",size = 384, scale = 1, draw_as_shadow = true,shift = radiator_shift_e2},
        }},
      south = { layers = {
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-3.png",size = 384, scale = 1, shift = radiator_shift_s2},
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-shadow-3.png",size = 384, scale = 1, draw_as_shadow = true,shift = radiator_shift_s2},
        }},
      west = { layers = {
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-4.png",size = 384, scale = 1, shift = radiator_shift_w2},
        {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-shadow-4.png",size = 384, scale = 1, draw_as_shadow = true,shift = radiator_shift_w2},
        }},
      },
      working_visualisations = {{
        fadeout = true,
        effect = "uranium-glow",
        light = {intensity = 2, size = 4.5, shift = {0, 0}, color = {1, 0.2, 0.2}},
        north_animation = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-working-1.png",size = 384, scale = 1, blend_mode = "additive",draw_as_glow = true,tint = {0.4,0.4,0.4}, shift = radiator_shift_n2},
        east_animation = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-working-2.png",size = 384, scale = 1, blend_mode = "additive",draw_as_glow = true,tint = {0.4,0.4,0.4}, shift = radiator_shift_e2},
        south_animation = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-working-3.png",size = 384, scale = 1, blend_mode = "additive",draw_as_glow = true,tint = {0.4,0.4,0.4}, shift = radiator_shift_s2},
        west_animation = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-working-4.png",size = 384, scale = 1, blend_mode = "additive",draw_as_glow = true,tint = {0.4,0.4,0.4}, shift = radiator_shift_w2},
      }}
    },
    crafting_categories = {"radiator"},
    fixed_recipe = "lars-radiato-working",
    crafting_speed = 1,
    energy_source =
    {
      type = "heat",
      max_temperature = 1500,
      min_working_temperature = 100,
      default_temperature = 0,
      specific_heat = "1MJ",
      max_transfer = "250kW",
      connections =
      {
        {
          position = {0, 1},
          direction = defines.direction.south
        },
      },
      heat_picture = {
        north = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-heat-1.png",size = 384, scale = 0.5,blend_mode = "additive",draw_as_glow = true,tint = {0.5,0.5,0.5}, shift = radiator_shift_n2},
        east = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-heat-2.png",size = 384, scale = 0.5,blend_mode = "additive",draw_as_glow = true,tint = {0.5,0.5,0.5}, shift = radiator_shift_e2},
        south = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-heat-3.png",size = 384, scale = 0.5,blend_mode = "additive",draw_as_glow = true,tint = {0.5,0.5,0.5}, shift = radiator_shift_s2},
        west = {filename = "__TFMG-thermal__/graphics/small-radiator/small-radiator-heat-4.png",size = 384, scale = 0.5,blend_mode = "additive",draw_as_glow = true,tint = {0.5,0.5,0.5}, shift = radiator_shift_w2},
      }
    },
    energy_usage = "250kW",
    placeable_position_visualization =
    {
      filename = "__core__/graphics/cursor-boxes-32x32.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      scale = 1,
      x = 3*64
    },
  },
})
