data:extend({
    -- 煤油分馏
    {
      type = "technology",
      name = "lars-refining-kerosene",
      icons = angelsmods.functions.create_viscous_liquid_fluid_icon(nil, { { 230, 230, 127 }, { 255, 255, 230 } }),
      icon_size = 128,
      prerequisites = {
        "angels-gas-synthesis",
      },
      effects = {
        {
          type = "unlock-recipe",
          recipe = "lars-refining-kerosene",
        },
        {
          type = "unlock-recipe",
          recipe = "lars-white-waste-water-purification",
        },
      },
      unit = {
        count = 75,
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack", 1 },
          { "chemical-science-pack", 1 },
        },
        time = 25,
      },
      order = "c-a-a",
    },

    -- 低温液氢液氧分离
    {
      type = "technology",
      name = "lars-liquid-oxygen-hydroxide",
      icons = angelsmods.functions.create_viscous_liquid_fluid_icon(nil, { { 0, 255, 255 }, { 0, 255, 255 } }),
      icon_size = 128,
      prerequisites = {
        "cryogenic-science-pack",
      },
      effects = {
        {
          type = "unlock-recipe",
          recipe = "lars-liquid-oxygen-hydroxide",
        },
      },
      unit = {
        count = 1000,
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"utility-science-pack", 1},
          {"cryogenic-science-pack", 1},
        },
        time = 45,
      },
    },
  }
)