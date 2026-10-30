data:extend({
  -- 铑处理
  {
    type = "technology",
    name = "lars-rhodite-process",
    icon = "__lars_advance_space__/graphics/icons/rhodium-catalyst.png",
    icon_size = 64,
    prerequisites = {
      "angels-metallurgy-5",
      "lars-space-ray-catch",
      "angels-gold-smelting-2",
      "angels-advanced-ore-refining-4",
      "angels-slag-processing-3",
    },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "lars-rhodite-ore-process",
      },
      {
        type = "unlock-recipe",
        recipe = "lars-rhodite-reduction-smelting",
      },
      {
        type = "unlock-recipe",
        recipe = "lars-rhodite-autocatalytic-processing",
      },
      {
        type = "unlock-recipe",
        recipe = "lars-rhodium-catalyst",
      },
    },
    unit = {
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1},
        { "utility-science-pack", 1},
        { "space-science-pack", 1},
      },
      time = 30,
    },
    order = "l-r",
  },
})