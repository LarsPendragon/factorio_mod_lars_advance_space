data:extend({
    -- 高压空气
    {
      type = "technology",
      name = "lars-air-processor",
      icons = angelsmods.functions.create_gas_tech_icon(
        { { 170, 170, 215 }, { 140, 140, 160 }, { 110, 110, 135 } }
      ),
      icon_size = 128,
      prerequisites = {
        "angels-nitrogen-processing-3",
        "angels-slag-processing-2",
        "angels-invar-smelting-1",
      },
      effects = {
        {
          type = "unlock-recipe",
          recipe = "lars-air-process",
        },
        {
          type = "unlock-recipe",
          recipe = "lars-purify-compressed-air",
        },
      },
      unit = {
        count = 100,
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack", 1 },
          { "chemical-science-pack", 1 },
          { "production-science-pack", 1},
        },
        time = 25,
      },
      order = "l-a",
    },

    -- 低温空气处理
    {
      type = "technology",
      name = "lars-cooling-air",
      icons = angelsmods.functions.create_gas_tech_icon(
        { { 150, 150, 215 }, { 120, 120, 160 }, { 100, 100, 135 } }
      ),
      icon_size = 128,
      prerequisites = {
        "lars-air-processor",
        "angels-coolant-1",
        "angels-pressure-tanks",
      },
      effects = {
        {
          type = "unlock-recipe",
          recipe = "lars-cooling-compressed-air",
        },
        {
          type = "unlock-recipe",
          recipe = "lars-cooling-compressed-air-2",
        },
        {
          type = "unlock-recipe",
          recipe = "lars-compressed-air-depress",
        },
        {
          type = "unlock-recipe",
          recipe = "lars-compressed-air-depress-2",
        },
      },
      unit = {
        count = 120,
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack", 1 },
          { "chemical-science-pack", 1 },
          { "production-science-pack", 1},
        },
        time = 25,
      },
      order = "l-a",
    },
})