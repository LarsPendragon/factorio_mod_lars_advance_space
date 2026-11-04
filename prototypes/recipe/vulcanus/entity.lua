data:extend({
 {
  -- 岩浆精炼厂
    type = "recipe",
    name = "lars-foundry",
    categories = {"crafting-with-fluid"},
    surface_conditions =
    {
      {
        property = "pressure",
        min = 4000,
        max = 4000
      }
    },
    enabled = false,
    ingredients =
    {
      {type = "item", name = "advanced-circuit", amount = 20},
      {type = "item", name = "steel-plate", amount = 30},
      {type = "item", name = "lars-silver-coil", amount = 20},
      {type = "item", name = "lars-heat-shield-tile", amount = 5},
      {type = "fluid", name = "sulfuric-acid", amount = 60}
    },
    energy_required = 10,
    results = {{type="item", name="lars-foundry", amount=1}}
  },
  {
    -- 粒子实验室
    type = "recipe",
    name = "lars-particle-laboratory",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-gravimetrics-laboratory.png",
    icon_size = 64,
    subgroup = "lars-particle-machine",
    order = "a",
    categories = {"advanced-crafting"},
    energy_required = 16,
    enabled = false,
    ingredients = {
      {type = "item", name = "low-density-structure", amount = 40},
      {type = "item", name = "angels-plate-tungsten", amount = 150},
      {type = "item", name = "processing-unit", amount = 20},
      {type = "item", name = "lars-silver-coil", amount = 40},
      {type = "item", name = "lars-titanium-dioxide", amount = 100},
      {type = "item", name = "refined-concrete", amount = 200},
    },
    results = {
      {type = "item", name = "lars-particle-laboratory", amount = 1 },
    },
    always_show_products = true,
  },
  {
    -- 粒子加速器
    type = "recipe",
    name = "lars-particle-accelerator",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-particle-accelerator.png",
    icon_size = 64,
    subgroup = "lars-particle-machine",
    order = "b",
    categories = {"advanced-crafting"},
    energy_required = 16,
    enabled = false,
    ingredients = {
      {type = "item", name = "low-density-structure", amount = 100},
      {type = "item", name = "angels-plate-tungsten", amount = 120},
      {type = "item", name = "bob-nitinol-alloy", amount = 100},
      {type = "item", name = "bob-advanced-processing-unit", amount = 25},
      {type = "item", name = "lars-gold-coil", amount = 30},
      {type = "item", name = "refined-concrete", amount = 200},
    },
    results = {
      {type = "item", name = "lars-particle-accelerator", amount = 1 },
    },
    always_show_products = true,
  },
})