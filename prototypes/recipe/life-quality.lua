data:extend({
  {
    -- 铜制传送带
    type = "recipe",
    name = "bob-basic-transport-belt-with-copper",
    energy_required = 2,
    ingredients = {
      { type = "item", name = "copper-plate", amount = 2 },
      { type = "item", name = "iron-gear-wheel", amount = 1 },
    },
    results = { { type = "item", name = "bob-basic-transport-belt", amount = 2 } },
  },
  {
    -- 铝粉
    type = "recipe",
    name = "lars-powder-aluminium",
    categories = {"angels-powderizing-1"},
    subgroup = "angels-aluminium",
    energy_required = 0.5,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "angels-ingot-aluminium", amount = 1 },
    },
    results = {
      { type = "item", name = "angels-powder-aluminium", amount = 1 },
    },
    order = "h[powder-aluminium]",
  },
})