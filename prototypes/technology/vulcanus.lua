data:extend({
  {
    -- 火成岩处理
    type = "technology",
    name = "lars-igneous-rock-processing",
    icon = "__lars_advance_space__/graphics/icons/igneous-rock.png",
    icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "lars-igneous-rock-cut",
      },
    },
    prerequisites = {"planet-discovery-vulcanus"},
    research_trigger =
    {
      type = "mine-entity",
      entities = {"calcite"} -- 临时解决方案
    }
  },
  {
    -- 岩浆处理
    type = "technology",
    name = "lars-foundry",
    icon = "__space-age__/graphics/technology/foundry.png",
    icon_size = 256,
    effects = {
      {type = "unlock-recipe", recipe = "lars-foundry"},
      {type = "unlock-recipe", recipe = "lars-granite-lava-process"},
      {type = "unlock-recipe", recipe = "lars-syenite-lava-process"},
      {type = "unlock-recipe", recipe = "lars-andesite-lava-process"},
      {type = "unlock-recipe", recipe = "lars-molten-raw-iron-casting"},
      {type = "unlock-recipe", recipe = "lars-molten-raw-iron-casting-steel"},
      {type = "unlock-recipe", recipe = "lars-molten-raw-copper-casting"},
      {type = "unlock-recipe", recipe = "steam-condensation"},
    },
    prerequisites = {"planet-discovery-vulcanus"},
    research_trigger =
    {
      type = "mine-entity",
      entities = {"big-volcanic-rock"},
    }
  },
  {
    -- 岩浆冷却
    type = "technology",
    name = "lars-lava-cooling",
    icon_size = 256,
    icon = "__lars_advance_space__/graphics/technology/lava-cooling.png",
    effects = {
      {type = "unlock-recipe", recipe = "lars-lava-cooling"},
    },
    prerequisites = {
      "lars-rock-crush",
      "metallurgic-science-pack",
    },
    unit = {
      count = 500,
      time = 30,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "space-science-pack", 1 },
        { "metallurgic-science-pack", 1 },
      },
    },
  },
  {
    -- 岩石转化
    type = "technology",
    name = "lars-rock-change",
    icon = "__space-age__/graphics/technology/foundry.png",
    icon_size = 256,
    effects = {
      {type = "unlock-recipe", recipe = "lars-metamorphic-rock-generate"},
      {type = "unlock-recipe", recipe = "lars-sedimentary-rock-generate"},
      {type = "unlock-recipe", recipe = "lars-metamorphic-rock-cut"},
      {type = "unlock-recipe", recipe = "lars-sedimentary-rock-cut"},
    },
    prerequisites = {
      "lars-foundry",
      "lars-igneous-rock-processing",
    },
    unit = {
      count = 350,
      time = 30,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "space-science-pack", 1 },
      },
    },
  },
  {
    -- 岩石破碎
    type = "technology",
    name = "lars-rock-crush",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/icons/metamorphic-rock.png",
    effects = {
      {type = "unlock-recipe", recipe = "lars-granite-crush"},
      {type = "unlock-recipe", recipe = "lars-syenite-crush"},
      {type = "unlock-recipe", recipe = "lars-andesite-crush"},
      {type = "unlock-recipe", recipe = "lars-calcite-crush"},
    },
    prerequisites = {
      "lars-rock-change",
    },
    unit = {
      count = 350,
      time = 30,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "space-science-pack", 1 },
      },
    },
  },
  {
    -- 高效岩浆催化1
    type = "technology",
    name = "lars-lava-catalyze-1",
    icon_size = 256,
    icon = "__lars_advance_space__/graphics/technology/lava-catalyze.png",
    effects = {
      {type = "unlock-recipe", recipe = "lars-granite-catalyze-casting"},
      {type = "unlock-recipe", recipe = "lars-granite-oxygen-catalyze-casting"},
      {type = "unlock-recipe", recipe = "lars-syenite-catalyze-casting"},
      {type = "unlock-recipe", recipe = "lars-andesite-catalyze-casting"},
    },
    prerequisites = {
      "lars-foundry",
      "lars-igneous-rock-processing",
    },
    unit = {
      count = 500,
      time = 30,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "space-science-pack", 1 },
      },
    },
  },
  {
    -- 高效岩浆催化2
    type = "technology",
    name = "lars-lava-catalyze-2",
    icon_size = 256,
    icon = "__lars_advance_space__/graphics/technology/lava-catalyze.png",
    effects = {
      {type = "unlock-recipe", recipe = "lars-calcite-catalyze-casting"},
      {type = "unlock-recipe", recipe = "lars-slate-catalyze-casting"},
      {type = "unlock-recipe", recipe = "lars-schist-catalyze-casting"},
      {type = "unlock-recipe", recipe = "lars-sandstone-catalyze-casting"},
      {type = "unlock-recipe", recipe = "lars-shale-oil"},
    },
    prerequisites = {
      "lars-lava-catalyze-1",
      "lars-rock-change",
    },
    unit = {
      count = 500,
      time = 40,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "space-science-pack", 1 },
      },
    },
  },
  {
    -- 光催化
    type = "technology",
    name = "lars-photon-catalysator",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/technology-gravimetrics-laboratory.png",
    effects = {
      {type = "unlock-recipe", recipe = "lars-photon-catch"},
      {type = "unlock-recipe", recipe = "lars-particle-laboratory"},
      {type = "unlock-recipe", recipe = "lars-photon-catalysator"},
    },
    prerequisites = {
      "lars-space-ray-catch",
      "planet-discovery-vulcanus",
    },
    unit = {
      count = 600,
      time = 30,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "space-science-pack", 1 },
      },
    },
  },
  {
    -- 光子存储
    type = "technology",
    name = "lars-photon-storage",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/technology-observation-frame-infrared.png",
    effects = {
      {type = "unlock-recipe", recipe = "lars-yttrium-silicate"},
      {type = "unlock-recipe", recipe = "lars-photon-storage"},
      {type = "unlock-recipe", recipe = "lars-photon-extract"},
    },
    prerequisites = {
      "lars-lava-catalyze-2",
      "angels-silicon-smelting-3",
      "lars-photon-catalysator",
      "metallurgic-science-pack",
    },
    unit = {
      count = 1000,
      time = 40,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "space-science-pack", 1 },
        { "metallurgic-science-pack", 1 },
      },
    },
  },
})