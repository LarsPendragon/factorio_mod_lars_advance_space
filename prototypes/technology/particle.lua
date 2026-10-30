data:extend({
  -- 宇宙射线捕获
  {
    type = "technology",
    name = "lars-space-ray-catch",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/technology-telescope-radio.png",
    icon_size = 128,
    prerequisites = {
      "bob-radar-3",
      "space-platform-thruster",
    },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "lars-space-ray-receiver",
      },
      {
        type = "unlock-recipe",
        recipe = "lars-space-ray-catch",
      },
    },
    unit = {
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "space-science-pack", 1 },
      },
      time = 30,
    },
    order = "ray",
  },

  -- 宇宙射线弹药转化
  {
    type = "technology",
    name = "lars-space-ray-ammo-change",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/technology-telescope-radio.png",
    icon_size = 128,
    prerequisites = {
      "lars-space-ray-catch",
      "bob-bullets",
    },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "lars-space-ray-magazine-change-1",
      },
      {
        type = "unlock-recipe",
        recipe = "lars-space-ray-magazine-change-2",
      },
    },
    unit = {
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "military-science-pack", 1 },
        { "space-science-pack", 1 },
      },
      time = 30,
    },
    order = "ray",
  },
})