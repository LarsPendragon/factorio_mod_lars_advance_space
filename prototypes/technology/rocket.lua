data:extend({
  {
    -- 热屏蔽研究1
    type = "technology",
    name = "lars-heat-shield-1",
    icon = "__bobrevamp__/graphics/icons/technology/heat-shield.png",
    icon_size = 128,
    order = "k",
    prerequisites = {
      "bob-ceramics",
    },
    unit = {
      count = 100,
      time = 30,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "lars-heat-shield-tile",
      },
    },
  },
  {
    -- 热屏蔽研究2
    type = "technology",
    name = "lars-heat-shield-2",
    icon = "__bobrevamp__/graphics/icons/technology/heat-shield.png",
    icon_size = 128,
    order = "k",
    prerequisites = {
      "lars-heat-shield-1",
      "angels-powder-metallurgy-4",
      "bob-tungsten-processing",
    },
    unit = {
      count = 300,
      time = 30,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
      },
    },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "lars-heat-shield-tile-2",
      },
    },
  },
  {
    -- 固体火箭燃料
    type = "technology",
    name = "lars-solid-rocket-fuel",
    icon = "__angelspetrochemgraphics__/graphics/icons/rocket-fuel.png",
    icon_size = 96,
    order = "r",
    prerequisites = {
      "angels-rocket-booster-1",
      "angels-aluminium-smelting-2",
    },
    unit = {
      count = 75,
      time = 15,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "lars-solid-rocket-fuel",
      },
    },
  },
  {
    -- 煤油液氧火箭燃料
    type = "technology",
    name = "lars-rocket-fuel-kerosene",
    icon = "__angelspetrochemgraphics__/graphics/icons/rocket-fuel.png",
    icon_size = 96,
    order = "r",
    prerequisites = {
      "rocket-fuel",
      "lars-cooling-air",
    },
    unit = {
      count = 300,
      time = 20,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
    },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "lars-rocket-fuel-kerosene",
      },
    },
  },
  {
    -- 火箭发射井2
    type = "technology",
    name = "lars-rocket-silo-2",
    icon = "__base__/graphics/technology/rocket-silo.png",
    icon_size = 256,
    order = "k",
    prerequisites = {
      "rocket-silo",
      "lars-heat-shield-2",
      "bob-advanced-processing-unit",
      "angels-stone-smelting-3",
      "angels-cobalt-steel-smelting-1",
      "rocket-fuel",
      "space-science-pack",
    },
    unit = {
      count = 1000,
      time = 60,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "space-science-pack", 1 },
      },
    },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "lars-rocket-silo-2",
      },
      {
        type = "unlock-recipe",
        recipe = "lars-rocket-part-2",
      },
      {
        type = "unlock-recipe",
        recipe = "lars-cargo-landing-pad-2",
      },
      {
        type = "unlock-recipe",
        recipe = "lars-cargo-bay-2",
      },
    },
  },
})