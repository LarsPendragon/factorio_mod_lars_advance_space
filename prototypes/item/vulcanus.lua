local item_sounds = require("__base__.prototypes.item_sounds")
require("lars-utils")

-- 祝融星
data:extend({
  {
    -- 火成岩
    type = "item",
    name = "lars-igneous-rock",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/icons/igneous-rock.png",
    subgroup = "lars-vulcanus-rocks",
    order = "a-a[igneous-rock]",
    stack_size = 100,
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    default_import_location = "vulcanus",
    weight = 5*kg
  },
  {
    -- 花岗石 (酸性岩)
    type = "item",
    name = "lars-granite",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/icons/granite.png",
    subgroup = "lars-vulcanus-rocks",
    order = "a-b[granite]",
    stack_size = 100,
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    default_import_location = "vulcanus",
    weight = 5*kg
  },
  {
    -- 正长石 (碱性岩)
    type = "item",
    name = "lars-syenite",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/icons/syenite.png",
    subgroup = "lars-vulcanus-rocks",
    order = "a-c[syenite]",
    stack_size = 100,
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    default_import_location = "vulcanus",
    weight = 5*kg
  },
  {
    -- 安山石 (中性岩)
    type = "item",
    name = "lars-andesite",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/icons/andesite.png",
    subgroup = "lars-vulcanus-rocks",
    order = "a-d[andesite]",
    stack_size = 100,
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    default_import_location = "vulcanus",
    weight = 5*kg
  },
  {
    -- 变质岩
    type = "item",
    name = "lars-metamorphic-rock",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/icons/metamorphic-rock.png",
    subgroup = "lars-vulcanus-rocks",
    order = "b-a[metamorphic-rock]",
    stack_size = 100,
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    default_import_location = "vulcanus",
    weight = 5*kg
  },
  {
    -- 方解石
    type = "item",
    name = "lars-calcite",
    icon_size = 64,
    icon = "__space-age__/graphics/icons/calcite.png",
    subgroup = "lars-vulcanus-rocks",
    order = "b-b[calcite]",
    stack_size = 100,
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    default_import_location = "vulcanus",
    weight = 5*kg
  },
  {
    -- 板岩
    type = "item",
    name = "lars-slate",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/icons/slate.png",
    subgroup = "lars-vulcanus-rocks",
    order = "b-c[slate]",
    stack_size = 100,
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    default_import_location = "vulcanus",
    weight = 5*kg
  },
  {
    -- 片岩
    type = "item",
    name = "lars-schist",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/icons/schist.png",
    subgroup = "lars-vulcanus-rocks",
    order = "b-d[schist]",
    stack_size = 100,
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    default_import_location = "vulcanus",
    weight = 5*kg
  },
  {
    -- 沉积岩
    type = "item",
    name = "lars-sedimentary-rock",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/icons/sedimentary-rock.png",
    subgroup = "lars-vulcanus-rocks",
    order = "c-a[sedimentary-rock]",
    stack_size = 100,
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    default_import_location = "vulcanus",
    weight = 5*kg
  },
  {
    -- 砂岩
    type = "item",
    name = "lars-sandstone",
    icon_size = 64,
    icon = "__lars_advance_space__/graphics/icons/sandstone.png",
    subgroup = "lars-vulcanus-rocks",
    order = "c-b[sandstone]",
    stack_size = 100,
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    default_import_location = "vulcanus",
    weight = 5*kg
  },
  {
    -- 页岩
    type = "item",
    name = "lars-shale",
    icon_size = 128,
    icon = "__lars_advance_space__/graphics/icons/shale.png",
    subgroup = "lars-vulcanus-rocks",
    order = "c-c[shale]",
    stack_size = 100,
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    default_import_location = "vulcanus",
    weight = 5*kg
  },
})

data:extend({
  {
    -- 粗铁水
    type = "fluid",
    name = "lars-molten-raw-iron",
    icon = "__space-age__/graphics/icons/fluid/molten-iron.png",
    subgroup = "fluid",
    order = "b[new-fluid]-b[vulcanus]-g[lars-raw-iron]",
    default_temperature = 1300,
    max_temperature = 2000,
    heat_capacity = "0.01kJ",
    base_color = {0, 0.1, 0.53},
    flow_color = {0.2, 0.68, 0.93},
    auto_barrel = false
  },
  {
    -- 粗铜水
    type = "fluid",
    name = "lars-molten-raw-copper",
    icon = "__space-age__/graphics/icons/fluid/molten-copper.png",
    subgroup = "fluid",
    order = "b[new-fluid]-b[vulcanus]-h[lars-raw-copper]",
    default_temperature = 1000,
    max_temperature = 2000,
    heat_capacity = "0.01kJ",
    base_color = {0.53, 0.1, 0},
    flow_color = {0.93, 0.68, 0.2},
    auto_barrel = false
  },
})