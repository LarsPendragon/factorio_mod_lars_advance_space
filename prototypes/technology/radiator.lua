data:extend({
  -- 太空散热片
  {
    type = "technology",
    name = "lars-radiator",
    icon = "__TFMG-thermal__/graphics/small-radiator/small-radiator-icon.png",
    icon_size = 64,
    prerequisites = {
      "rocket-silo",
      "angels-glass-smelting-1",
      "bob-heat-exchanger-2",
    },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "lars-space-radiator",
      },
    },
    unit = {
      count = 75,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 30,
    },
    order = "r",
  },
})