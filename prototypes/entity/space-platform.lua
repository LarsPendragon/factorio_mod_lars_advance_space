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
})