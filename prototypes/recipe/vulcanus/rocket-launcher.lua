data:extend({
  {
    -- 光帆燃料
    type = "recipe",
    name = "lars-light-sail-fuel",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-methane-gas.png",
    icon_size = 64,
    energy_required = 1,
    --enabled = false,
    --hide_from_player_crafting = true,
    auto_recycle = false,
    categories = {"lars-particle-process"},
    ingredients =
    {
      { type = "item", name = "bob-steel-pipe", amount = 1 },
      { type = "item", name = "bob-silicon-nitride", amount = 1 },
      { type = "fluid", name = "lars-photon", amount = 50 },
    },
    results = {{ type = "fluid", name = "lars-light-sail-fuel", amount = 200}},
    allow_productivity = false,
  },
  {
    -- 火箭组件，光帆用
    type = "recipe",
    name = "lars-rocket-part-vulcanus",
    icon = "__base__/graphics/icons/rocket-part.png",
    icon_size = 64,
    energy_required = 2,
    enabled = false,
    hide_from_player_crafting = true,
    auto_recycle = false,
    categories = {"lars-special-rocket"},
    ingredients =
    {
      { type = "fluid", name = "lars-light-sail-fuel", amount = 100 },
    },
    results = {{ type = "item", name = "lars-launch-token", amount = 1}},
    allow_productivity = false,
  },
  {
    -- 光帆发射器
    type = "recipe",
    name = "lars-rocket-launcher-vulcanus",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-rocket-launch-pad.png",
    icon_size = 64,
    energy_required = 40,
    enabled = false,
    auto_recycle = false,
    categories = {"crafting"},
    ingredients =
    {
      { type = "item", name = "angels-plate-tungsten", amount = 200},
      { type = "item", name = "processing-unit", amount = 80},
      { type = "item", name = "lars-gold-coil", amount = 50},
      { type = "item", name = "bob-glass", amount = 100},
      { type = "item", name = "bob-laser-turret-3", amount = 8},
    },
    results = {{ type = "item", name = "lars-rocket-launcher-vulcanus", amount = 1}},
    --allow_productivity = true
  },
})