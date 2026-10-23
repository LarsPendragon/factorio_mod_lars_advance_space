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
      entity = "calcite" -- 临时解决方案
    }
  },
  {
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
      entity = "big-volcanic-rock"
    }
  }
})