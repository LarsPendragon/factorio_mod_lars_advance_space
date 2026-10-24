-- VULCANUS
data:extend({
  {
    -- 火成岩切割
    type = "recipe",
    name = "lars-igneous-rock-cut",
    icon = "__lars_advance_space__/graphics/icons/igneous-rock.png",
    icon_size = 128,
    categories = {"advanced-crafting"},
    subgroup = "lars-vulcanus-ores",
    order = "a",
    energy_required = 0.5,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-igneous-rock", amount = 1 },
    },
    results = {
      { type = "item", name = "lars-granite", amount = 1, shared_probability = {min = 0, max = 0.5} },
      { type = "item", name = "lars-syenite", amount = 1, shared_probability = {min = 0.5, max = 0.75} },
      { type = "item", name = "lars-andesite", amount = 1, shared_probability = {min = 0.75, max = 1} },
    },
    always_show_products = true,
  },
  {
    -- 基础花岗岩转化岩浆
    type = "recipe",
    name = "lars-granite-lava-process",
    icon = "__space-age__/graphics/icons/fluid/molten-iron.png",
    icon_size = 64,
    categories = {"lars-metallurgy"},
    subgroup = "lars-vulcanus-ores",
    order = "b-a[granite]",
    energy_required = 8,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-granite", amount = 1 },
      { type = "fluid", name = "lava", amount = 500 },
    },
    results = {
      { type = "item", name = "stone", amount = 10},
      { type = "fluid", name = "lars-molten-raw-iron", amount = 300 },
    },
    always_show_products = true,
  },
  {
    -- 基础正长岩转化岩浆
    type = "recipe",
    name = "lars-syenite-lava-process",
    icon = "__space-age__/graphics/icons/fluid/molten-copper.png",
    icon_size = 64,
    categories = {"lars-metallurgy"},
    subgroup = "lars-vulcanus-ores",
    order = "b-b[syenite]",
    energy_required = 8,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-syenite", amount = 1 },
      { type = "fluid", name = "lava", amount = 500 },
    },
    results = {
      { type = "item", name = "stone", amount = 10},
      { type = "fluid", name = "lars-molten-raw-copper", amount = 300 },
    },
    always_show_products = true,
  },
  {
    -- 基础安山石转化岩浆
    type = "recipe",
    name = "lars-andesite-lava-process",
    icon = "__space-age__/graphics/icons/foundry.png",
    icon_size = 64,
    categories = {"lars-metallurgy"},
    subgroup = "lars-vulcanus-ores",
    order = "b-c[andesite]",
    energy_required = 8,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-andesite", amount = 1 },
      { type = "fluid", name = "lava", amount = 500 },
    },
    results = {
      { type = "item", name = "stone", amount = 20},
      { type = "fluid", name = "steam", amount = 100, temperature = 465 },
      { type = "fluid", name = "angels-gas-compressed-air", amount = 100},
    },
    always_show_products = true,
  },
  {
    -- 粗铁铸造
    type = "recipe",
    name = "lars-molten-raw-iron-casting",
    icon = "__space-age__/graphics/icons/casting-iron.png",
    icon_size = 64,
    categories = {"angels-casting"},
    subgroup = "lars-vulcanus-ores",
    order = "c-a[raw-iron]",
    energy_required = 4,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "fluid", name = "lars-molten-raw-iron", amount = 100 },
    },
    results = {
      { type = "item", name = "iron-plate", amount = 4},
      { type = "item", name = "angels-slag", amount = 6},
    },
    always_show_products = true,
  },
  {
    -- 粗铁炼钢
    type = "recipe",
    name = "lars-molten-raw-iron-casting-steel",
    icon = "__space-age__/graphics/icons/casting-steel.png",
    icon_size = 64,
    categories = {"angels-casting"},
    subgroup = "lars-vulcanus-ores",
    order = "c-b[raw-iron-steel]",
    energy_required = 4,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "fluid", name = "angels-gas-oxygen", amount = 40 },
      { type = "fluid", name = "lars-molten-raw-iron", amount = 200 },
    },
    results = {
      { type = "item", name = "steel-plate", amount = 2},
      { type = "item", name = "angels-slag", amount = 6},
    },
    always_show_products = true,
  },
  {
    -- 粗铜铸造
    type = "recipe",
    name = "lars-molten-raw-copper-casting",
    icon = "__space-age__/graphics/icons/casting-copper.png",
    icon_size = 64,
    categories = {"angels-casting"},
    subgroup = "lars-vulcanus-ores",
    order = "c-c[raw-copper]",
    energy_required = 4,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "fluid", name = "lars-molten-raw-copper", amount = 100 },
    },
    results = {
      { type = "item", name = "copper-plate", amount = 4},
      { type = "item", name = "angels-slag", amount = 6},
    },
    always_show_products = true,
  },
})