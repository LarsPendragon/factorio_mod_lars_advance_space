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
    -- 复杂浇筑1
    type = "technology",
    name = "lars-complicated-casting-1",
    icon_size = 256,
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/technology-pyroflux-smelting.png",
    effects = {
      {type = "unlock-recipe", recipe = "lars-low-density-structure-casting"},
      {type = "unlock-recipe", recipe = "lars-heat-shield-tile-casting-1"},
      {type = "unlock-recipe", recipe = "lars-iron-gear-wheel-casting"},
      {type = "unlock-recipe", recipe = "lars-bob-steel-gear-wheel-casting"},
      {type = "unlock-recipe", recipe = "lars-bob-brass-gear-wheel-casting"},
      {type = "unlock-recipe", recipe = "lars-bob-titanium-gear-wheel-casting"},
      {type = "unlock-recipe", recipe = "lars-bob-steel-bearing-casting"},
      {type = "unlock-recipe", recipe = "lars-bob-brass-bearing-casting"},
      {type = "unlock-recipe", recipe = "lars-bob-titanium-bearing-casting"},
      {type = "unlock-recipe", recipe = "lars-magnetic-coil-casting"},
      {type = "unlock-recipe", recipe = "lars-silver-coil-casting"},
    },
    prerequisites = {
      "metallurgic-science-pack",
    },
    unit = {
      count = 600,
      time = 30,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "space-science-pack", 1 },
        { "metallurgic-science-pack", 1 },
      },
    },
  },
  {
    -- 复杂浇筑2
    type = "technology",
    name = "lars-complicated-casting-2",
    icon_size = 256,
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/technology-pyroflux-smelting.png",
    effects = {
      {type = "unlock-recipe", recipe = "lars-bob-nitinol-gear-wheel-casting"},
      {type = "unlock-recipe", recipe = "lars-bob-nitinol-bearing-casting"},
      {type = "unlock-recipe", recipe = "lars-gold-coil-casting"},
    },
    prerequisites = {
      "lars-complicated-casting-1",
      "bob-nitinol-processing",
    },
    unit = {
      count = 750,
      time = 30,
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
  {
    -- 高效岩浆催化3
    type = "technology",
    name = "lars-lava-catalyze-3",
    icon_size = 256,
    icon = "__lars_advance_space__/graphics/technology/lava-catalyze.png",
    effects = {
      {type = "unlock-recipe", recipe = "lars-granite-catalyze-crystallize"},
      {type = "unlock-recipe", recipe = "lars-syenite-catalyze-crystallize"},
      {type = "unlock-recipe", recipe = "lars-andesite-catalyze-crystallize"},
      {type = "unlock-recipe", recipe = "lars-slate-catalyze-crystallize"},
      {type = "unlock-recipe", recipe = "lars-schist-catalyze-crystallize"},
      {type = "unlock-recipe", recipe = "lars-sandstone-catalyze-crystallize"},
    },
    prerequisites = {
      "lars-lava-catalyze-2",
      "metallurgic-science-pack",
    },
    unit = {
      count = 750,
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
      count = 500,
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
  {
    -- 光电效应
    type = "technology",
    name = "lars-photoelectric-effect",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/technology-naquium-processor.png",
    effects = {
      {type = "unlock-recipe", recipe = "lars-photoelectric-plate"},
      {type = "unlock-recipe", recipe = "lars-photoelectric-effect"},
    },
    prerequisites = {
      "metallurgic-science-pack",
      "bob-nitinol-processing",
    },
    unit = {
      count = 300,
      time = 30,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "metallurgic-science-pack", 1 },
      },
    },
  },
  {
    -- 粒子加速器
    type = "technology",
    name = "lars-particle-accelerator",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/technology-particle-accelerator.png",
    effects = {
      {type = "unlock-recipe", recipe = "lars-particle-accelerator"},
      {type = "unlock-recipe", recipe = "lars-electron-speedup"},
    },
    prerequisites = {
      "lars-photoelectric-effect",
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
    -- 光催化熔炼1
    type = "technology",
    name = "lars-photon-catalysator-casting-1",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/technology-material-2.png",
    effects = {
      {type = "unlock-recipe", recipe = "lars-solder-mix-casting-1"},
      {type = "unlock-recipe", recipe = "lars-solder-mix-casting-2"},
      {type = "unlock-recipe", recipe = "lars-bronze-mix-casting-1"},
      {type = "unlock-recipe", recipe = "lars-bronze-mix-casting-2"},
      {type = "unlock-recipe", recipe = "lars-brass-mix-casting-1"},
      {type = "unlock-recipe", recipe = "lars-invar-mix-casting-1"},
    },
    prerequisites = {
      "lars-lava-catalyze-3",
      "lars-photon-catalysator",
      "angels-solder-smelting-2",
      "angels-bronze-smelting-2",
      "angels-brass-smelting-1",
      "angels-invar-smelting-1",
    },
    unit = {
      count = 750,
      time = 30,
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
  {
    -- 光催化熔炼2
    type = "technology",
    name = "lars-photon-catalysator-casting-2",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/technology-material-2.png",
    effects = {
      {type = "unlock-recipe", recipe = "lars-solder-mix-casting-3"},
      {type = "unlock-recipe", recipe = "lars-bronze-mix-casting-3"},
      {type = "unlock-recipe", recipe = "lars-brass-mix-casting-2"},
      {type = "unlock-recipe", recipe = "lars-brass-mix-casting-3"},
      {type = "unlock-recipe", recipe = "lars-gunmetal-mix-casting-1"},
      {type = "unlock-recipe", recipe = "lars-cobalt-steel-mix-casting-1"},
    },
    prerequisites = {
      "lars-photon-catalysator-casting-1",
      "angels-solder-smelting-3",
      "angels-bronze-smelting-3",
      "angels-brass-smelting-2",
      "angels-gunmetal-smelting-1",
      "angels-cobalt-smelting-1",
    },
    unit = {
      count = 1000,
      time = 30,
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
  {
    -- 光催化熔炼3
    type = "technology",
    name = "lars-photon-catalysator-casting-3",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/technology-material-2.png",
    effects = {
      {type = "unlock-recipe", recipe = "lars-brass-mix-casting-3"},
      {type = "unlock-recipe", recipe = "lars-nitinol-mix-casting-1"},
    },
    prerequisites = {
      "lars-photon-catalysator-casting-2",
      "angels-bronze-smelting-3",
      "angels-nitinol-smelting-1",
    },
    unit = {
      count = 1250,
      time = 30,
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
  {
    -- 钨熔炼
    type = "technology",
    name = "lars-molten-tungsten",
    icon = "__angelssmeltinggraphics__/graphics/technology/casting-tungsten-tech.png",
    icon_size = 256,
    effects = {
      {type = "unlock-recipe", recipe = "lars-liquid-molten-tungsten"},
      {type = "unlock-recipe", recipe = "lars-tungsten-plate-casting-1"},
      {type = "unlock-recipe", recipe = "lars-tungsten-carbide-casting"},
      {type = "unlock-recipe", recipe = "lars-copper-tungsten-alloy-casting"},
      {type = "unlock-recipe", recipe = "lars-heat-shield-tile-casting-2"},
      {type = "unlock-recipe", recipe = "lars-bob-tungsten-gear-wheel-casting"},
    },
    prerequisites = {
      "lars-complicated-casting-2",
      "lars-particle-accelerator",
    },
    unit = {
      count = 1000,
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
})