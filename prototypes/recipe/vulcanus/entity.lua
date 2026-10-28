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
})