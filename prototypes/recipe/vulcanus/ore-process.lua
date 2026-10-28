-- VULCANUS 基础
-- 火成岩：原始矿物 -> 花岗岩 -> 铁 + 锡
--                 -> 安山岩 -> 铜 + 铝
--                 -> 正长石 -> 铅 + 银
-- 变质岩：火成岩 + 岩浆 + 压缩空气 -> 方解石 -> 蒸汽
--                               -> 板岩 -> 钛 + 铂
--                               -> 片岩 -> 镍 + 金
-- 沉积岩：火成岩 + 岩浆 + 水 -> 方解石 -> 蒸汽
--                          -> 砂岩 -> 锰 + 锌
--                          -> 页岩 -> 原油 + 天然气 + 

require("lars-utils")

data:extend({
  {
    -- 火成岩切割
    type = "recipe",
    name = "lars-igneous-rock-cut",
    icon = "__lars_advance_space__/graphics/icons/igneous-rock.png",
    icon_size = 128,
    categories = {"advanced-crafting"},
    subgroup = "lars-vulcanus-rock-recipe",
    order = "a-a[igneous-rock]",
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
    -- 形成变质岩
    type = "recipe",
    name = "lars-metamorphic-rock-generate",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/icons/metamorphic-rock.png",
    categories = {"lars-metallurgy"},
    subgroup = "lars-vulcanus-rock-recipe",
    order = "c[metamorphic-rock]",
    energy_required = 1,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-igneous-rock", amount = 1 },
      { type = "fluid", name = "lava", amount = 100 },
      { type = "fluid", name = "angels-gas-compressed-air", amount = 50 },
    },
    results = {
      { type = "item", name = "lars-metamorphic-rock", amount = 5},
    },
    always_show_products = true,
  },
  {
    -- 变质岩切割
    type = "recipe",
    name = "lars-metamorphic-rock-cut",
    icon = "__lars_advance_space__/graphics/icons/metamorphic-rock.png",
    icon_size = 128,
    categories = {"advanced-crafting"},
    subgroup = "lars-vulcanus-rock-recipe",
    order = "a-b[metemorphic-rock]",
    energy_required = 0.5,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-metamorphic-rock", amount = 1 },
    },
    results = {
      { type = "item", name = "lars-calcite", amount = 1, shared_probability = {min = 0, max = 0.5} },
      { type = "item", name = "lars-slate", amount = 1, shared_probability = {min = 0.5, max = 0.75} },
      { type = "item", name = "lars-schist", amount = 1, shared_probability = {min = 0.75, max = 1} },
    },
    always_show_products = true,
  },
  {
    -- 形成沉积岩
    type = "recipe",
    name = "lars-sedimentary-rock-generate",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/icons/sedimentary-rock.png",
    categories = {"lars-metallurgy"},
    subgroup = "lars-vulcanus-rock-recipe",
    order = "d[sedimentary-rock]",
    energy_required = 1,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-igneous-rock", amount = 1 },
      { type = "fluid", name = "lava", amount = 100 },
      { type = "fluid", name = "steam", amount = 100 },
    },
    results = {
      { type = "item", name = "lars-sedimentary-rock", amount = 5},
    },
    always_show_products = true,
  },
  {
    -- 沉积岩切割
    type = "recipe",
    name = "lars-sedimentary-rock-cut",
    icon = "__lars_advance_space__/graphics/icons/sedimentary-rock.png",
    icon_size = 128,
    categories = {"advanced-crafting"},
    subgroup = "lars-vulcanus-rock-recipe",
    order = "a-b[metemorphic-rock]",
    energy_required = 0.5,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-metamorphic-rock", amount = 1 },
    },
    results = {
      { type = "item", name = "lars-calcite", amount = 1, shared_probability = {min = 0, max = 0.5} },
      { type = "item", name = "lars-sandstone", amount = 1, shared_probability = {min = 0.5, max = 0.75} },
      { type = "item", name = "lars-shale", amount = 1, shared_probability = {min = 0.75, max = 1} },
    },
    always_show_products = true,
  },
  {
    -- 岩浆冷却
    type = "recipe",
    name = "lars-lava-cooling",
    icon_size = 256,
    icon = "__lars_advance_space__/graphics/technology/lava-cooling.png",
    categories = {"lars-metallurgy"},
    subgroup = "lars-vulcanus-rock-recipe",
    order = "e",
    energy_required = 2,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "fluid", name = "lava", amount = 200 },
      { type = "fluid", name = "angels-liquid-coolant", amount = 100 },
    },
    results = {
      { type = "item", name = "lars-igneous-rock", amount = 10 },
      { type = "fluid", name = "angels-liquid-coolant-used", amount = 100, temperature = 300 },
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
    subgroup = "lars-vulcanus-rock-recipe",
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
    subgroup = "lars-vulcanus-rock-recipe",
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
    subgroup = "lars-vulcanus-rock-recipe",
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
    subgroup = "lars-vulcanus-lava-casting-raw",
    order = "a[raw-iron]",
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
    subgroup = "lars-vulcanus-lava-casting-raw",
    order = "b[raw-iron-steel]",
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
    subgroup = "lars-vulcanus-lava-casting-raw",
    order = "c[raw-copper]",
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

-- 岩石破碎
data:extend({
  {
    -- 花岗岩破碎
    type = "recipe",
    name = "lars-granite-crush",
    icons = utils.combine_icons(
      {
        icon = "__lars_advance_space__/graphics/icons/granite.png",
        icon_size = 128,
        scale = 0.25,
      },
      {
        {icon = "__angelsrefininggraphics__/graphics/icons/slag.png", icon_size = 32, pos=BADGE_LeftBottom},
        {icon = "__angelsrefininggraphics__/graphics/icons/stone-crushed.png", icon_size = 32, pos=BADGE_RightBottom},
      }
    ),
    categories = {"angels-ore-refining-t1"},
    subgroup = "lars-vulcanus-rock-crush",
    order = "a[granite]",
    energy_required = 1,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-granite", amount = 1 },
    },
    results = {
      { type = "item", name = "angels-stone-crushed", amount = 20},
      { type = "item", name = "angels-slag", amount = 4},
      { type = "item", name = "iron-ore", amount = 1, independent_probability=0.02},
      { type = "item", name = "bob-tin-ore", amount = 1, independent_probability=0.01},
    },
    always_show_products = true,
  },
  {
    -- 正长石破碎
    type = "recipe",
    name = "lars-syenite-crush",
    icons = utils.combine_icons(
      {
        icon = "__lars_advance_space__/graphics/icons/syenite.png",
        icon_size = 128,
        scale = 0.25,
      },
      {
        {icon = "__angelsrefininggraphics__/graphics/icons/slag.png", icon_size = 32, pos=BADGE_LeftBottom},
        {icon = "__angelsrefininggraphics__/graphics/icons/stone-crushed.png", icon_size = 32, pos=BADGE_RightBottom},
      }
    ),
    categories = {"angels-ore-refining-t1"},
    subgroup = "lars-vulcanus-rock-crush",
    order = "b[syenite]",
    energy_required = 1,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-syenite", amount = 1 },
    },
    results = {
      { type = "item", name = "angels-stone-crushed", amount = 20},
      { type = "item", name = "angels-slag", amount = 4},
      { type = "item", name = "bob-lead-ore", amount = 1, independent_probability=0.02},
      { type = "item", name = "bob-silver-ore", amount = 1, independent_probability=0.01},
    },
    always_show_products = true,
  },
  {
    -- 安山石破碎
    type = "recipe",
    name = "lars-andesite-crush",
    icons = utils.combine_icons(
      {
        icon = "__lars_advance_space__/graphics/icons/andesite.png",
        icon_size = 128,
        scale = 0.25,
      },
      {
        {icon = "__angelsrefininggraphics__/graphics/icons/slag.png", icon_size = 32, pos=BADGE_LeftBottom},
        {icon = "__angelsrefininggraphics__/graphics/icons/stone-crushed.png", icon_size = 32, pos=BADGE_RightBottom},
      }
    ),
    categories = {"angels-ore-refining-t1"},
    subgroup = "lars-vulcanus-rock-crush",
    order = "c[andesite]",
    energy_required = 1,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-andesite", amount = 1 },
    },
    results = {
      { type = "item", name = "angels-stone-crushed", amount = 20},
      { type = "item", name = "angels-slag", amount = 4},
      { type = "item", name = "copper-ore", amount = 1, independent_probability=0.02},
      { type = "item", name = "bob-bauxite-ore", amount = 1, independent_probability=0.01},
    },
    always_show_products = true,
  },
  {
    -- 方解石破碎
    type = "recipe",
    name = "lars-calcite-crush",
    icons = utils.combine_icons(
      {
        icon = "__space-age__/graphics/icons/calcite.png",
        icon_size = 64,
        scale = 0.5,
      },
      {
        {icon = "__angelsrefininggraphics__/graphics/icons/ore-fluorite.png", icon_size = 32, pos=BADGE_LeftBottom},
        {icon = "__angelsrefininggraphics__/graphics/icons/stone-crushed.png", icon_size = 32, pos=BADGE_RightBottom},
      }
    ),
    categories = {"angels-ore-refining-t1"},
    subgroup = "lars-vulcanus-rock-crush",
    order = "d[calcite]",
    energy_required = 1,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-calcite", amount = 1 },
    },
    results = {
      { type = "item", name = "angels-stone-crushed", amount = 20},
      { type = "item", name = "angels-fluorite-ore", amount = 4},
      { type = "item", name = "angels-manganese-ore", amount = 1, independent_probability=0.02},
      { type = "item", name = "angels-chrome-ore", amount = 1, independent_probability=0.01},
    },
    always_show_products = true,
  },
})

-- 岩浆精炼熔融矿物
data:extend({
  {
    -- 岩浆的花岗岩催化
    type = "recipe",
    name = "lars-granite-catalyze-casting",
    icons = utils.combine_icons(
      {
        icon = "__angelssmeltinggraphics__/graphics/icons/molten-iron.png",
        icon_size = 64,
      },
      {
        {icon = "__space-age__/graphics/icons/fluid/lava.png", icon_size = 64, pos=BADGE_LeftTop},
        {icon = "__lars_advance_space__/graphics/icons/granite.png", icon_size = 128, pos=BADGE_RightTop},
      }
    ),
    categories = {"lars-metallurgy"},
    subgroup = "lars-vulcanus-lava-casting",
    order = "a[granite]-a",
    energy_required = 3,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-granite", amount = 1 },
      { type = "item", name = "angels-catalysator-brown", amount = 1 },
      { type = "fluid", name = "lava", amount = 600 },
    },
    results = {
      { type = "item", name = "angels-geode-blue", amount = 10},
      { type = "fluid", name = "angels-liquid-molten-iron", amount = 300 },
      { type = "fluid", name = "angels-liquid-molten-tin", amount = 150 },
    },
    always_show_products = true,
  },
  {
    -- 岩浆的花岗岩与氧气催化
    type = "recipe",
    name = "lars-granite-oxygen-catalyze-casting",
    icons = utils.combine_icons(
      {
        icon = "__angelssmeltinggraphics__/graphics/icons/molten-steel.png",
        icon_size = 64,
      },
      {
        {icon = "__space-age__/graphics/icons/fluid/lava.png", icon_size = 64, pos=BADGE_LeftTop},
        {icon = "__lars_advance_space__/graphics/icons/granite.png", icon_size = 128, pos=BADGE_RightTop},
      }
    ),
    categories = {"lars-metallurgy"},
    subgroup = "lars-vulcanus-lava-casting",
    order = "a[granite]-b",
    energy_required = 3,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-granite", amount = 1 },
      { type = "item", name = "angels-catalysator-brown", amount = 1 },
      { type = "fluid", name = "lava", amount = 600 },
      { type = "fluid", name = "angels-gas-oxygen", amount = 150 },
    },
    results = {
      { type = "item", name = "angels-geode-blue", amount = 10},
      { type = "fluid", name = "angels-liquid-molten-steel", amount = 150 },
    },
    always_show_products = true,
  },
  {
    -- 岩浆的正长石催化
    type = "recipe",
    name = "lars-syenite-catalyze-casting",
    icons = utils.combine_icons(
      {
        icon = "__angelssmeltinggraphics__/graphics/icons/molten-lead.png",
        icon_size = 64,
      },
      {
        {icon = "__space-age__/graphics/icons/fluid/lava.png", icon_size = 64, pos=BADGE_LeftTop},
        {icon = "__lars_advance_space__/graphics/icons/syenite.png", icon_size = 128, pos=BADGE_RightTop},
      }
    ),
    categories = {"lars-metallurgy"},
    subgroup = "lars-vulcanus-lava-casting",
    order = "b[syenite]-a",
    energy_required = 3,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-syenite", amount = 1 },
      { type = "item", name = "angels-catalysator-brown", amount = 1 },
      { type = "fluid", name = "lava", amount = 600 },
    },
    results = {
      { type = "item", name = "angels-geode-cyan", amount = 10},
      { type = "fluid", name = "angels-liquid-molten-lead", amount = 300 },
      { type = "fluid", name = "angels-liquid-molten-silver", amount = 150 },
    },
    always_show_products = true,
  },
  {
    -- 岩浆的安山石催化
    type = "recipe",
    name = "lars-andesite-catalyze-casting",
    icons = utils.combine_icons(
      {
        icon = "__angelssmeltinggraphics__/graphics/icons/molten-copper.png",
        icon_size = 64,
      },
      {
        {icon = "__space-age__/graphics/icons/fluid/lava.png", icon_size = 64, pos=BADGE_LeftTop},
        {icon = "__lars_advance_space__/graphics/icons/andesite.png", icon_size = 128, pos=BADGE_RightTop},
      }
    ),
    categories = {"lars-metallurgy"},
    subgroup = "lars-vulcanus-lava-casting",
    order = "c[andesite]-a",
    energy_required = 3,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-andesite", amount = 1 },
      { type = "item", name = "angels-catalysator-brown", amount = 1 },
      { type = "fluid", name = "lava", amount = 600 },
    },
    results = {
      { type = "item", name = "angels-geode-yellow", amount = 10},
      { type = "fluid", name = "angels-liquid-molten-copper", amount = 300 },
      { type = "fluid", name = "angels-liquid-molten-aluminium", amount = 150 },
    },
    always_show_products = true,
  },
  {
    -- 岩浆的方解石催化
    type = "recipe",
    name = "lars-calcite-catalyze-casting",
    icons = utils.combine_icons(
      {
        icon = "__angelssmeltinggraphics__/graphics/icons/molten-copper.png",
        icon_size = 64,
      },
      {
        {icon = "__space-age__/graphics/icons/fluid/lava.png", icon_size = 64, pos=BADGE_LeftTop},
        {icon = "__space-age__/graphics/icons/calcite.png", icon_size = 64, pos=BADGE_RightTop},
      }
    ),
    categories = {"lars-metallurgy"},
    subgroup = "lars-vulcanus-lava-casting",
    order = "d[calcite]-a",
    energy_required = 2,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-calcite", amount = 1 },
      { type = "item", name = "angels-catalysator-brown", amount = 1 },
      { type = "fluid", name = "lava", amount = 1200 },
    },
    results = {
      { type = "item", name = "bob-quartz", amount = 25},
      { type = "fluid", name = "angels-liquid-molten-silicon", amount = 500 },
      { type = "fluid", name = "angels-gas-compressed-air", amount = 1000 },
    },
    always_show_products = true,
  },
  {
    -- 岩浆的板岩催化
    type = "recipe",
    name = "lars-slate-catalyze-casting",
    icons = utils.combine_icons(
      {
        icon = "__angelssmeltinggraphics__/graphics/icons/molten-copper.png",
        icon_size = 64,
      },
      {
        {icon = "__space-age__/graphics/icons/fluid/lava.png", icon_size = 64, pos=BADGE_LeftTop},
        {icon = "__lars_advance_space__/graphics/icons/slate.png", icon_size = 128, pos=BADGE_RightTop},
      }
    ),
    categories = {"lars-metallurgy"},
    subgroup = "lars-vulcanus-lava-casting",
    order = "e[slate]-a",
    energy_required = 4,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-slate", amount = 1 },
      { type = "item", name = "angels-catalysator-orange", amount = 1 },
      { type = "fluid", name = "lava", amount = 600 },
    },
    results = {
      { type = "item", name = "angels-geode-lightgreen", amount = 10},
      { type = "fluid", name = "angels-liquid-molten-titanium", amount = 300 },
      { type = "fluid", name = "angels-liquid-molten-platinum", amount = 150 },
    },
    always_show_products = true,
  },
  {
    -- 岩浆的片岩催化
    type = "recipe",
    name = "lars-schist-catalyze-casting",
    icons = utils.combine_icons(
      {
        icon = "__angelssmeltinggraphics__/graphics/icons/molten-copper.png",
        icon_size = 64,
      },
      {
        {icon = "__space-age__/graphics/icons/fluid/lava.png", icon_size = 64, pos=BADGE_LeftTop},
        {icon = "__lars_advance_space__/graphics/icons/schist.png", icon_size = 128, pos=BADGE_RightTop},
      }
    ),
    categories = {"lars-metallurgy"},
    subgroup = "lars-vulcanus-lava-casting",
    order = "f[schist]-a",
    energy_required = 4,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-schist", amount = 1 },
      { type = "item", name = "angels-catalysator-orange", amount = 1 },
      { type = "fluid", name = "lava", amount = 600 },
    },
    results = {
      { type = "item", name = "angels-geode-red", amount = 10},
      { type = "fluid", name = "angels-liquid-molten-nickel", amount = 300 },
      { type = "fluid", name = "angels-liquid-molten-gold", amount = 150 },
    },
    always_show_products = true,
  },
  {
    -- 岩浆的砂岩催化
    type = "recipe",
    name = "lars-sandstone-catalyze-casting",
    icons = utils.combine_icons(
      {
        icon = "__angelssmeltinggraphics__/graphics/icons/molten-copper.png",
        icon_size = 64,
      },
      {
        {icon = "__space-age__/graphics/icons/fluid/lava.png", icon_size = 64, pos=BADGE_LeftTop},
        {icon = "__lars_advance_space__/graphics/icons/sandstone.png", icon_size = 64, pos=BADGE_RightTop},
      }
    ),
    categories = {"lars-metallurgy"},
    subgroup = "lars-vulcanus-lava-casting",
    order = "g[sandstone]-a",
    energy_required = 4,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-sandstone", amount = 1 },
      { type = "item", name = "angels-catalysator-orange", amount = 1 },
      { type = "fluid", name = "lava", amount = 600 },
    },
    results = {
      { type = "item", name = "angels-geode-purple", amount = 10},
      { type = "fluid", name = "angels-liquid-molten-zinc", amount = 300 },
      { type = "fluid", name = "angels-liquid-molten-glass", amount = 150 },
    },
    always_show_products = true,
  },
  {
    -- 页岩油提取
    type = "recipe",
    name = "lars-shale-oil",
    icons = utils.combine_icons(
      {
        icon = "__angelssmeltinggraphics__/graphics/icons/molten-copper.png",
        icon_size = 64,
      },
      {
        {icon = "__space-age__/graphics/icons/fluid/lava.png", icon_size = 64, pos=BADGE_LeftTop},
        {icon = "__lars_advance_space__/graphics/icons/sandstone.png", icon_size = 64, pos=BADGE_RightTop},
      }
    ),
    categories = {"lars-metallurgy"},
    subgroup = "lars-vulcanus-lava-casting",
    order = "h[shale]-a",
    energy_required = 6,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "lars-shale", amount = 2 },
      { type = "item", name = "angels-catalysator-orange", amount = 1 },
      { type = "fluid", name = "lava", amount = 1200 },
    },
    results = {
      { type = "item", name = "bob-quartz", amount = 15},
      { type = "item", name = "bob-cobalt-ore", amount = 10},
      { type = "fluid", name = "angels-liquid-multi-phase-oil", amount = 400 },
      { type = "fluid", name = "angels-thermal-water", amount = 300 },
    },
    always_show_products = true,
  },
})