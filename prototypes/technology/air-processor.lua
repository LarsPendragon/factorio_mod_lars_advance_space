data:extend({
    -- 高压空气
    {
      type = "technology",
      name = "lars-air-processor",
      icons = angelsmods.functions.add_number_icon_layer({
        {
          icon = "__angelspetrochemgraphics__/graphics/icons/air-filter.png",
          icon_size = 32,
        },
      }, 4, angelsmods.petrochem.number_tint),
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
})