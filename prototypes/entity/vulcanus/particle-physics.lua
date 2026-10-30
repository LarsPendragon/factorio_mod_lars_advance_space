
local particlelaboratory_pipe_pictures = {
  north = {
    filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/gravimetrics-laboratory/pipe-top.png",
    width = 128,
    height = 128,
    priority = "extra-high",
    shift = util.by_pixel(0, 32),
    scale = 0.5,
  },
  east = {
    filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/gravimetrics-laboratory/pipe-right.png",
    width = 46,
    height = 68,
    priority = "extra-high",
    shift = util.by_pixel(-27, 1),
    scale = 0.5,
  },
  south = {
    filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/gravimetrics-laboratory/pipe-bottom.png",
    width = 70,
    height = 44,
    priority = "extra-high",
    shift = util.by_pixel(3, -27),
    scale = 0.5,
  },
  west = {
    filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/gravimetrics-laboratory/pipe-left.png",
    width = 46,
    height = 74,
    priority = "extra-high",
    shift = util.by_pixel(27, 3),
    scale = 0.5,
  }
}

data:extend({
  -- 粒子实验室
  {
    type = "item",
    name = "lars-particle-laboratory",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-gravimetrics-laboratory.png",
    icon_size = 64,
    subgroup = "lars-particle",
    order = "d[particle-laboratory]-a",
    place_result = "lars-particle-laboratory",
    stack_size = 10,
  },
  {
    type = "assembling-machine",
    name = "lars-particle-laboratory",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-gravimetrics-laboratory.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 1, result = "lars-particle-laboratory"},
    max_health = 1000,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{-2.3, -2.3}, {2.3, 2.3}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box_vertical_extension = 1,
    circuit_connector = circuit_connector_definitions.create_vector
    (
      universal_connector_template,
      {
        { variation = 24, main_offset = util.by_pixel(-69.375, -4), shadow_offset = util.by_pixel(-69.375, -4), show_shadow = true },
        { variation = 24, main_offset = util.by_pixel(-69.375, -4), shadow_offset = util.by_pixel(-69.375, -4), show_shadow = true },
        { variation = 24, main_offset = util.by_pixel(-69.375, -4), shadow_offset = util.by_pixel(-69.375, -4), show_shadow = true },
        { variation = 24, main_offset = util.by_pixel(-69.375, -4), shadow_offset = util.by_pixel(-69.375, -4), show_shadow = true },
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
          pipe_picture = particlelaboratory_pipe_pictures,
          pipe_covers = pipecoverspictures(),
          volume = 200,
          pipe_connections = {{ flow_direction="input", position = {0, -2}, direction = defines.direction.north }},
          secondary_draw_orders = { north = -1 }
      },
      {
          production_type = "output",
          pipe_picture = particlelaboratory_pipe_pictures,
          pipe_covers = pipecoverspictures(),
          volume = 200,
          pipe_connections = {{ flow_direction="output", position = {0, 2}, direction = defines.direction.south }},
          secondary_draw_orders = { north = -1 }
      },
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
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
          filename = "__lars_advance_space__/sound/from-other-mods/space-exploration/gravimetrics-facility-working-sound.ogg",
          volume = 0.5
        },
      }
    },
    collision_mask = {
      layers = {
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
            filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/gravimetrics-laboratory/gravimetrics-laboratory.png",
            priority = "high",
            width = 3360/10,
            height = 2304/6,
            frame_count = 60,
            line_length = 10,
            shift = util.by_pixel(0, -11),
            animation_speed = 1,
            scale = 0.5,
          },
          {
            draw_as_shadow = true,
            filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/gravimetrics-laboratory/gravimetrics-laboratory-shadow.png",
            priority = "high",
            width = 4480/10,
            height = 1500/6,
            frame_count = 30,
            line_length = 10,
            repeat_count = 2,
            shift = util.by_pixel(26, 24),
            animation_speed = 1,
            scale = 0.5,
          },
        },
      },
      default_recipe_tint =
      {
        -- differentiation between primary and secondary is for the recipes that can alternate
        primary = {r = 81.0/255.0, g = 0.0, b = 252.0/255.0, a = 1.000}, -- purple tint that matches the building colors
        secondary = {r = 81.0/255.0, g = 0.0, b = 252.0/255.0, a = 1.000}, -- purple tint that matches the building colors
      },
      status_colors =
      {
        working = {r = 0.0, g = 1.0, b = 0.0, a = 1.0}, -- green
        full_output = {r = 1.0, g = 1.0, b = 0.0, a = 1.0}, -- yellow
        idle = {r = 1.0, g = 0.0, b = 0.0, a = 1.0}, -- red
      },
      working_visualisations =
      {
        {
          effect = "uranium-glow", -- changes alpha based on energy source light intensity
          light = {intensity = 0.5, size = 8, shift = {0.0, 0.0}, color = {r = 100/255, g = 48/255, b = 1}}
        },
        {
          apply_recipe_tint = "primary",
          animation =
          {
            filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/gravimetrics-laboratory/gravimetrics-laboratory-tint.png",
            width = 3360/10,
            height = 2304/6,
            frame_count = 60,
            line_length = 10,
            shift = util.by_pixel(0, -11),
            animation_speed = 1,
            scale = 0.5,
            blend_mode = "additive",
          }
        },
        {
          apply_recipe_tint = "secondary",
          animation =
          {
            filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/gravimetrics-laboratory/gravimetrics-laboratory-tint-2.png",
            width = 112,
            height = 112,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(68, 45),
            animation_speed = 1,
            scale = 0.5,
            blend_mode = "additive",
          }
        },
        {
          always_draw = true,
          apply_tint = "status",
          animation =
          {
            filename = "__lars_advance_space__/graphics/from-other-mods/space-exploration/entity/gravimetrics-laboratory/gravimetrics-laboratory-working.png",
            width = 24,
            height = 24,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(57, 34),
            animation_speed = 1,
            scale = 0.5,
            blend_mode = "additive",
          }
        }
      },
    },
    crafting_categories = {"lars-particle-process"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 10 },
    },
    energy_usage = "3000kW",
    module_slots = 4,
    allowed_effects = {"consumption", "speed"},
  },
})