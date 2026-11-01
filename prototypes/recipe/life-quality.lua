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
  {
    -- 变质物1
    type = "recipe",
    name = "lars-spoilage-recycle-seed",
    categories = {"angels-seed-extractor"},
    subgroup = "angels-farming-gardens",
    energy_required = 2,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "spoilage", amount = 5 },
    },
    results = {
      { type = "item", name = "spoilage", amount_min = 3, amount_max = 5 },
      { type = "item", name = "angels-temperate-1-seed", amount = 1, always_fresh = true, independent_probability=0.004},
      { type = "item", name = "angels-temperate-2-seed", amount = 1, always_fresh = true, independent_probability=0.004},
      { type = "item", name = "angels-temperate-3-seed", amount = 1, always_fresh = true, independent_probability=0.004},
      { type = "item", name = "angels-temperate-4-seed", amount = 1, always_fresh = true, independent_probability=0.004},
      { type = "item", name = "angels-temperate-5-seed", amount = 1, always_fresh = true, independent_probability=0.004},
      { type = "item", name = "angels-swamp-1-seed", amount = 1, always_fresh = true, independent_probability=0.004},
      { type = "item", name = "angels-swamp-2-seed", amount = 1, always_fresh = true, independent_probability=0.004},
      { type = "item", name = "angels-swamp-3-seed", amount = 1, always_fresh = true, independent_probability=0.004},
      { type = "item", name = "angels-swamp-4-seed", amount = 1, always_fresh = true, independent_probability=0.004},
      { type = "item", name = "angels-swamp-5-seed", amount = 1, always_fresh = true, independent_probability=0.004},
      { type = "item", name = "angels-desert-1-seed", amount = 1, always_fresh = true, independent_probability=0.004},
      { type = "item", name = "angels-desert-2-seed", amount = 1, always_fresh = true, independent_probability=0.004},
      { type = "item", name = "angels-desert-3-seed", amount = 1, always_fresh = true, independent_probability=0.004},
      { type = "item", name = "angels-desert-4-seed", amount = 1, always_fresh = true, independent_probability=0.004},
      { type = "item", name = "angels-desert-5-seed", amount = 1, always_fresh = true, independent_probability=0.004},
      { type = "item", name = "angels-token-bio", amount = 1, always_fresh = true, independent_probability=0.04},
    },
    always_show_products = true,
    icon = "__space-age__/graphics/icons/spoilage.png",
    icon_size = 64,
    order = "s-a[seed]",
  },
})