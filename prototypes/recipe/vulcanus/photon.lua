local AF = angelsmods.functions

data:extend({
  {
    -- 二氧化钛制取
    type = "recipe",
    name = "lars-titanium-dioxide",
    icon = "__angelssmeltinggraphics__/graphics/icons/plate-chrome.png",
    icon_size = 32,
    categories = {"angels-chemical-smelting-2"},
    subgroup = "angels-titanium",
    order = "e-b",
    energy_required = 6,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "angels-catalysator-green", amount = 3 },
      { type = "fluid", name = "angels-liquid-titanium-tetrachloride", amount = 120 },
      { type = "fluid", name = "angels-gas-oxygen", amount = 60 },
    },
    results = {
      { type = "item", name = "lars-titanium-dioxide", amount = 24 },
    },
    always_show_products = true,
  },
  {
    -- 光子捕获
    type = "recipe",
    name = "lars-photon-catch",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-starfield-sparse.png",
    icon_size = 64,
    categories = {"lars-ray-receiver"},
    subgroup = "lars-particle",
    order = "c[photon]-a",
    energy_required = 2,
    enabled = false,
    auto_recycle = false,
    surface_conditions = {{property = "solar-power", min = 400}},
    ingredients = {},
    results = {
      { type = "fluid", name = "lars-photon", amount = 50 },
    },
    always_show_products = true,
  },
  {
    -- 光子催化剂
    type = "recipe",
    name = "lars-photon-catalysator",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-material-2.png",
    icon_size = 64,
    categories = {"lars-particle-process"},
    subgroup = "lars-particle",
    order = "c[photon]-b",
    energy_required = 2,
    enabled = false,
    auto_recycle = false,
    --surface_conditions = {{property = "pressure", min = 0, max = 0}},
    ingredients = {
      { type = "item", name = "barrel", amount = 1 },
      { type = "item", name = "lars-titanium-dioxide", amount = 8 },
      { type = "fluid", name = "lars-photon", amount = 40 },
    },
    results = {
      { type = "item", name = "lars-photon-catalysator", amount = 4 },
    },
    always_show_products = true,
  },
  {
    -- 硅酸钇光容器
    type = "recipe",
    name = "lars-yttrium-silicate",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-observation-frame.png",
    icon_size = 64,
    categories = {"lars-metallurgy"},
    subgroup = "lars-particle",
    order = "c[photon]-c",
    energy_required = 6,
    enabled = false,
    auto_recycle = false,
    --surface_conditions = {{property = "pressure", min = 0, max = 0}},
    ingredients = {
      { type = "item", name = "lars-photon-catalysator", amount = 2 },
      { type = "item", name = "angels-ingot-silicon", amount = 2 },
      { type = "fluid", name = "lava", amount = 200 },
    },
    results = {
      { type = "item", name = "lars-yttrium-silicate", amount = 1 },
    },
    always_show_products = true,
  },
  {
    -- 光存储
    type = "recipe",
    name = "lars-photon-storage",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-observation-frame-infrared.png",
    icon_size = 64,
    categories = {"lars-particle-process"},
    subgroup = "lars-particle",
    order = "c[photon]-d",
    energy_required = 2,
    enabled = false,
    auto_recycle = false,
    --surface_conditions = {{property = "pressure", min = 0, max = 0}},
    ingredients = {
      { type = "item", name = "lars-yttrium-silicate", amount = 1 },
      { type = "fluid", name = "lars-photon", amount = 50 },
    },
    results = {
      { type = "item", name = "lars-yttrium-silicate-full", amount = 1 },
    },
    always_show_products = true,
  },
  {
    -- 光提取
    type = "recipe",
    name = "lars-photon-extract",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-observation-frame.png",
    icon_size = 64,
    categories = {"lars-particle-process"},
    subgroup = "lars-particle",
    order = "c[photon]-e",
    energy_required = 2,
    enabled = false,
    auto_recycle = false,
    --surface_conditions = {{property = "pressure", min = 0, max = 0}},
    ingredients = {
      { type = "item", name = "lars-yttrium-silicate-full", amount = 1 },
    },
    results = {
      { type = "fluid", name = "lars-photon", amount = 50 },
      { type = "item", name = "lars-yttrium-silicate", amount = 1 },
    },
    always_show_products = true,
  },
  {
    -- 光电基板
    type = "recipe",
    name = "lars-photoelectric-plate",
    icon = "__lars_advance_space__/graphics/from-other-mods/space-exploration/icon-naquium-processor.png",
    icon_size = 64,
    categories = {"crafting"},
    subgroup = "lars-particle",
    order = "c[electron]-b",
    energy_required = 2,
    enabled = false,
    --auto_recycle = false,
    --surface_conditions = {{property = "pressure", min = 0, max = 0}},
    ingredients = {
      { type = "item", name = "angels-solid-sodium", amount = 2 },
      { type = "item", name = "steel-plate", amount = 4 },
    },
    results = {
      { type = "item", name = "lars-photoelectric-plate", amount = 1 },
    },
    always_show_products = true,
  },
  {
    -- 光电效应
    type = "recipe",
    name = "lars-photoelectric-effect",
    icons = AF.add_icon_layer(
      AF.get_object_icons("lars-electron"),
      AF.get_object_icons("lars-photoelectric-plate"),
      { -10, -10 },
      0.4375
    ),
    categories = {"lars-particle-process"},
    subgroup = "lars-particle",
    order = "c[electron]-c",
    energy_required = 5,
    enabled = false,
    auto_recycle = false,
    --surface_conditions = {{property = "pressure", min = 0, max = 0}},
    ingredients = {
      { type = "item", name = "lars-photoelectric-plate", amount = 1 },
      { type = "fluid", name = "lars-photon", amount = 50 },
    },
    results = {
      { type = "item", name = "lars-photoelectric-plate", amount = 1, independent_probability=0.9 },
      { type = "fluid", name = "lars-electron", amount = 10 },
    },
    always_show_products = true,
  },
  {
    -- 电子加速
    type = "recipe",
    name = "lars-electron-speedup",
    icon = "__lars_advance_space__/graphics/icons/high-energy-photon.png",
    icon_size = 128,
    categories = {"lars-particle-accelerator"},
    subgroup = "lars-particle",
    order = "c[electron]-d",
    energy_required = 20,
    enabled = false,
    auto_recycle = false,
    --surface_conditions = {{property = "pressure", min = 0, max = 0}},
    ingredients = {
      { type = "fluid", name = "lars-electron", amount = 50 },
    },
    results = {
      { type = "fluid", name = "lars-electron", amount_min = 0, amount_max = 10 },
      { type = "fluid", name = "lars-high-energy-photon", amount = 20 },
    },
    always_show_products = true,
  },
})