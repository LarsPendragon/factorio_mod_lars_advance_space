data:extend({
  {
    -- TFMG mod 中的散热片，用于测试
    type = "recipe",
    name = "lars-TFMG-radiator",
    icon = "__TFMG-thermal__/graphics/small-radiator/small-radiator-icon.png",
    icon_size = 64,
    category = "crafting",
    enabled = nil,
    energy_required = 1,
    ingredients = {
      { type = "item", name = "steel-plate", amount = 1 },
    },
    results = { { type = "item", name = "lars-TFMG-radiator", amount = 1 } },
    order = "zzz",
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
})