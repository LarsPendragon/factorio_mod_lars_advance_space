local radio_animation_speed = 0.2

data:extend({
  -- 太空排放阀
  {
    type = "item",
    name = "lars-emission-valve",
    icon = "__angelspetrochemgraphics__/graphics/icons/valve-inspector.png",
    icon_size = 32,
    subgroup = "angels-fluid-control",
    order = "a[valve]-x[emission]",
    place_result = "lars-emission-valve",
    stack_size = 10,
  },
  {
    type = "assembling-machine",
    name = "lars-emission-valve",
    icon = "__angelspetrochemgraphics__/graphics/icons/valve-inspector.png",
    icon_size = 32,
    flags = { "placeable-player", "player-creation" },
    minable = { mining_time = 0.5, result = "lars-emission-valve" },
    max_health = 300,
    corpse = "small-remnants",
    two_direction_only = false,
    collision_box = { { -0.29, -0.29 }, { 0.29, 0.29 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    surface_conditions = {{property = "pressure", min = 0, max = 0}},
    crafting_categories = { "lars-air-emission" },
    crafting_speed = 1,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 0},
    },
    energy_usage = "1kW",
    fluid_boxes = {
      {
        production_type = "input",
        --pipe_picture = angelsmods.petrochem.electrolyserpictures(),
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.north, position = { 0, -0 } } },
      },
    },
    window_bounding_box = { { -0.125, 0.6875 }, { 0.1875, 1.1875 } },
    graphics_set = { animation = {
      north = { layers = {
        -- Base
        {
          filename = "__reskins-angels__/graphics/entity/petrochem/valve/valve-base.png",
          priority = "high",
          x = 0,
          width = 128,
          height = 128,
          scale = 0.5,
        },
        -- Mask
        {
          filename = "__reskins-angels__/graphics/entity/petrochem/valve/valve-mask.png",
          priority = "high",
          x = 0,
          width = 128,
          height = 128,
          tint = {47, 79, 79, 255},
          scale = 0.5,
        },
      }},
      east = { layers = {
        -- Base
        {
          filename = "__reskins-angels__/graphics/entity/petrochem/valve/valve-base.png",
          priority = "high",
          x = 128,
          width = 128,
          height = 128,
          scale = 0.5,
        },
        -- Mask
        {
          filename = "__reskins-angels__/graphics/entity/petrochem/valve/valve-mask.png",
          priority = "high",
          x = 128,
          width = 128,
          height = 128,
          tint = {47, 79, 79, 255},
          scale = 0.5,
        },
      }},
      south = { layers = {
        -- Base
        {
          filename = "__reskins-angels__/graphics/entity/petrochem/valve/valve-base.png",
          priority = "high",
          x = 256,
          width = 128,
          height = 128,
          scale = 0.5,
        },
        -- Mask
        {
          filename = "__reskins-angels__/graphics/entity/petrochem/valve/valve-mask.png",
          priority = "high",
          x = 256,
          width = 128,
          height = 128,
          tint = {47, 79, 79, 255},
          scale = 0.5,
        },
      }},
      west = { layers = {
        -- Base
        {
          filename = "__reskins-angels__/graphics/entity/petrochem/valve/valve-base.png",
          priority = "high",
          x = 384,
          width = 128,
          height = 128,
          scale = 0.5,
        },
        -- Mask
        {
          filename = "__reskins-angels__/graphics/entity/petrochem/valve/valve-mask.png",
          priority = "high",
          x = 384,
          width = 128,
          height = 128,
          tint = {47, 79, 79, 255},
          scale = 0.5,
        },
      }},
    }},
    impact_category = "metal",
    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    circuit_connector = circuit_connector_definitions["offshore-pump"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
  },

  -- 射线接收器
  {
    type = "item",
    name = "lars-space-ray-receiver",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-telescope-radio.png",
    icon_size = 64,
    subgroup = "space-platform",
    order = "r-a[ray-receiver]",
    place_result = "lars-space-ray-receiver",
    stack_size = 5,
  },
  {
    type = "assembling-machine",
    name = "lars-space-ray-receiver",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-telescope-radio.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 1, "lars-space-ray-receiver"},
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{-4.3, -4.3}, {4.3, 4.3}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    drawing_box_vertical_extension = 2,
    circuit_connector = circuit_connector_definitions.create_vector
    (
      universal_connector_template,
      {
        { variation = 18, main_offset = {3.3, 4}, shadow_offset = {3.3, 4}, show_shadow = true },
        { variation = 18, main_offset = {3.3, 4}, shadow_offset = {3.3, 4}, show_shadow = true },
        { variation = 18, main_offset = {3.3, 4}, shadow_offset = {3.3, 4}, show_shadow = true },
        { variation = 18, main_offset = {3.3, 4}, shadow_offset = {3.3, 4}, show_shadow = true },
      }
    ),
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    resistances =
    {
      {
        type = "impact",
        percent = 10
      }
    },
    fluid_boxes = {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {{ flow_direction="input", position = {0, -4}, direction = defines.direction.north }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {{ flow_direction="output", position = {0, 4}, direction = defines.direction.south }},
        secondary_draw_orders = { north = -1 }
      },
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
            filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/telescope-radio/telescope-radio.png",
            priority = "high",
            width = 4688/8,
            height = 5440/8,
            frame_count = 64,
            line_length = 8,
            shift = util.by_pixel(1, -26),
            animation_speed = radio_animation_speed,
            scale = 0.5,
          },
          {
            draw_as_shadow = true,
            filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/telescope-radio/telescope-radio-shadow.png",
            priority = "high",
            width = 5440/8,
            height = 4800/8,
            frame_count = 64,
            line_length = 8,
            shift = util.by_pixel(25, 19),
            animation_speed = radio_animation_speed,
            scale = 0.5,
          },
        },
      },
      working_visualisations =
      {
        {
          effect = "uranium-glow", -- changes alpha based on energy source light intensity
          light = {intensity = 0.5, size = 8, shift = {0.0, 0.0}, color = {r = 1, g = 0.5, b = 0.5}}
        },
      },
    },
    crafting_categories = {"lars-ray-receiver"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 2 },
    },
    energy_usage = "1250kW",
    module_slots = 5,
    allowed_effects = {"consumption", "speed"},
  },
})