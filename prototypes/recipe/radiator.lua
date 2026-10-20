data:extend({
  {
    -- TFMG mod 中的散热片，用于测试
    type = "recipe",
    name = "lars-TFMG-radiator",
    icon = "__TFMG-thermal__/graphics/small-radiator/small-radiator-icon.png",
    icon_size = 64,
    category = "crafting",
    enabled = false,
    energy_required = 1,
    ingredients = {
      { type = "item", name = "steel-plate", amount = 1 },
    },
    results = { { type = "item", name = "lars-TFMG-radiator", amount = 1 } },
    order = "zzz",
  },
  {
    -- 太空散热片
    type = "recipe",
    name = "lars-space-radiator",
    icon = "__TFMG-thermal__/graphics/small-radiator/small-radiator-icon.png",
    icon_size = 64,
    category = "crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { type = "item", name = "copper-plate", amount = 10 },
      { type = "item", name = "bob-silicon-nitride", amount = 5 },
      { type = "item", name = "bob-glass", amount = 5 },
    },
    results = { { type = "item", name = "lars-space-radiator", amount = 1 } },
    order = "a",
  },
})

data:extend({
  -- 吸热配方
  {
    type = "recipe",
    name = "lars-TFMG-radiato-working",
    category = "radiator",
    icon = "__base__/graphics/icons/signal/signal-fire.png",
    energy_required = 100,
    enabled = false,
    hidden = true,
    ingredients = {},
    results = {},
  },
  {
    type = "recipe",
    name = "lars-radiato-working",
    category = "radiator",
    icon = "__base__/graphics/icons/signal/signal-fire.png",
    energy_required = 30,
    enabled = false,
    hidden = true,
    ingredients = {},
    results = {},
  },
})