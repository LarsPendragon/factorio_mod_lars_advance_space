local AF = angelsmods.functions
local BASE_ORDER = 1000
local order_count = 1001

local function build_vulcanus_casting_recipe(name, results, ingredients, energy, tier, order)
  if (not results) or (#results == 0) or (not ingredients) or (#ingredients == 0) then return end
  if not energy or energy <= 0 then
    energy = 1
  end
  if not tier or tier <= 1 then
    tier = 2
  end
  if not order or order <= BASE_ORDER then
    order = order_count
    order_count = order_count + 1
  end
  local base_result = results[1].name or "lars-foundry"
  local base_ingredient = ingredients[1].name or "angels-liquid-molten-iron"
  return {
    type = "recipe",
    name = name,
    icons = AF.add_icon_layer(
      AF.get_object_icons(base_result),
      AF.get_object_icons(base_ingredient),
      { -10, -10 },
      0.4375
    ),
    categories = { "angels-casting-" .. tier },
    subgroup = "vulcanus-processes",
    energy_required = energy,
    enabled = false,
    auto_recycle = false,
    hide_from_signal_gui = true,
    ingredients = ingredients,
    results = results,
    order = "c[casting]-" .. order,
    --crafting_machine_tint = angelsmods.functions.get_fluid_recipe_tint("angels-liquid-molten-solder"),
    always_show_products = true,
  }
end

local vulcanus_casting_list = {
  { -- 轻质框架浇筑
    name = "lars-low-density-structure-casting",
    results = {
      { type = "item", name = "low-density-structure", amount = 1 },
    },
    ingredients = {
      { type = "fluid", name = "angels-liquid-molten-aluminium", amount = 200 },
      { type = "fluid", name = "angels-liquid-molten-titanium", amount = 20 },
      { type = "fluid", name = "angels-liquid-plastic", amount = 50 },
    },
    time = 10,
  },
  { -- 基础隔热瓦浇筑
    name = "lars-heat-shield-tile-casting-1",
    results = {
      { type = "item", name = "lars-heat-shield-tile", amount = 2 },
    },
    ingredients = {
      { type = "fluid", name = "angels-liquid-molten-steel", amount = 200 },
      { type = "fluid", name = "angels-liquid-molten-silicon", amount = 200 },
      { type = "fluid", name = "angels-gas-nitrogen", amount = 260 },
    },
    time = 20,
  },
  { -- 隔热瓦浇筑
    name = "lars-heat-shield-tile-casting-2",
    results = {
      { type = "item", name = "lars-heat-shield-tile-2", amount = 4 },
    },
    ingredients = {
      { type = "fluid", name = "lars-liquid-molten-tungsten", amount = 200 },
      { type = "fluid", name = "angels-liquid-molten-silicon", amount = 200 },
      { type = "fluid", name = "angels-gas-nitrogen", amount = 260 },
    },
    time = 20,
    tier = 3,
  },
  { -- 齿轮浇筑
    name = "lars-iron-gear-wheel-casting",
    results = {
      { type = "item", name = "iron-gear-wheel", amount = 5 },
    },
    ingredients = {
      { type = "fluid", name = "angels-liquid-molten-iron", amount = 100 },
    },
  },
  { -- 钢齿轮浇筑
    name = "lars-bob-steel-gear-wheel-casting",
    results = {
      { type = "item", name = "bob-steel-gear-wheel", amount = 5 },
    },
    ingredients = {
      { type = "fluid", name = "angels-liquid-molten-steel", amount = 100 },
    },
  },
  { -- 黄铜齿轮浇筑
    name = "lars-bob-brass-gear-wheel-casting",
    results = {
      { type = "item", name = "bob-brass-gear-wheel", amount = 5 },
    },
    ingredients = {
      { type = "fluid", name = "angels-liquid-molten-brass", amount = 100 },
    },
  },
  { -- 钛齿轮浇筑
    name = "lars-bob-titanium-gear-wheel-casting",
    results = {
      { type = "item", name = "bob-titanium-gear-wheel", amount = 5 },
    },
    ingredients = {
      { type = "fluid", name = "angels-liquid-molten-titanium", amount = 100 },
    },
  },
  { -- 钨齿轮浇筑
    name = "lars-bob-tungsten-gear-wheel-casting",
    results = {
      { type = "item", name = "bob-tungsten-gear-wheel", amount = 5 },
    },
    ingredients = {
      { type = "fluid", name = "lars-liquid-molten-tungsten", amount = 100 },
    },
    tier = 4,
  },
  { -- 镍钛合金齿轮浇筑
    name = "lars-bob-nitinol-gear-wheel-casting",
    results = {
      { type = "item", name = "bob-nitinol-gear-wheel", amount = 5 },
    },
    ingredients = {
      { type = "fluid", name = "angels-liquid-molten-nitinol", amount = 100 },
    },
    tier = 4,
  },
  { -- 钢轴承浇筑
    name = "lars-bob-steel-bearing-casting",
    results = {
      { type = "item", name = "bob-steel-bearing", amount = 5 },
    },
    ingredients = {
      { type = "fluid", name = "angels-liquid-molten-steel", amount = 100 },
    },
    time = 2,
  },
  { -- 黄铜轴承浇筑
    name = "lars-bob-brass-bearing-casting",
    results = {
      { type = "item", name = "bob-brass-bearing", amount = 5 },
    },
    ingredients = {
      { type = "fluid", name = "angels-liquid-molten-brass", amount = 100 },
    },
    time = 2,
  },
  { -- 钛轴承浇筑
    name = "lars-bob-titanium-bearing-casting",
    results = {
      { type = "item", name = "bob-titanium-bearing", amount = 5 },
    },
    ingredients = {
      { type = "fluid", name = "angels-liquid-molten-titanium", amount = 100 },
      { type = "fluid", name = "lubricant", amount = 50 },
    },
    time = 2,
  },
  { -- 镍钛轴承浇筑
    name = "lars-bob-nitinol-bearing-casting",
    results = {
      { type = "item", name = "bob-nitinol-bearing", amount = 5 },
    },
    ingredients = {
      { type = "fluid", name = "angels-liquid-molten-nitinol", amount = 100 },
      { type = "fluid", name = "lubricant", amount = 50 },
    },
    time = 2,
    tier = 4,
  },
  { -- 电磁线圈浇筑
    name = "lars-magnetic-coil-casting",
    results = {
      { type = "item", name = "lars-magnetic-coil", amount = 20 },
    },
    ingredients = {
      { type = "fluid", name = "angels-liquid-molten-iron", amount = 100 },
      { type = "fluid", name = "angels-liquid-molten-copper", amount = 150 },
    },
    time = 2,
  },
  { -- 高强度磁线圈浇筑
    name = "lars-silver-coil-casting",
    results = {
      { type = "item", name = "lars-silver-coil", amount = 20 },
    },
    ingredients = {
      { type = "fluid", name = "angels-liquid-molten-steel", amount = 200 },
      { type = "fluid", name = "angels-liquid-molten-copper", amount = 50 },
      { type = "fluid", name = "angels-liquid-molten-silver", amount = 400 },
    },
    time = 2,
  },
  { -- 超级磁线圈浇筑
    name = "lars-gold-coil-casting",
    results = {
      { type = "item", name = "lars-gold-coil", amount = 20 },
    },
    ingredients = {
      { type = "fluid", name = "angels-liquid-molten-nitinol", amount = 300 },
      { type = "fluid", name = "angels-liquid-molten-copper", amount = 70 },
      { type = "fluid", name = "angels-liquid-molten-gold", amount = 560 },
    },
    time = 2,
    tier = 4,
  },

  { -- 钨板铸造
    name = "lars-tungsten-plate-casting-1",
    results = {
      { type = "item", name = "angels-plate-tungsten", amount = 8 },
    },
    ingredients = {
      { type = "fluid", name = "lars-liquid-molten-tungsten", amount = 80 },
    },
    time = 4,
    tier = 4,
  },
  { --碳化钨铸造
    name = "lars-tungsten-carbide-casting",
    results = {
      { type = "item", name = "tungsten-carbide", amount = 8 },
    },
    ingredients = {
      { type = "fluid", name = "lars-liquid-molten-tungsten", amount = 40 },
      { type = "fluid", name = "sulfuric-acid", amount = 40 },
      { type = "item", name = "angels-solid-carbon", amount = 4 },
    },
    time = 4,
    tier = 4,
  },
  { --钨铜合金铸造
    name = "lars-copper-tungsten-alloy-casting",
    results = {
      { type = "item", name = "bob-copper-tungsten-alloy", amount = 25 },
    },
    ingredients = {
      { type = "fluid", name = "lars-liquid-molten-tungsten", amount = 150 },
      { type = "fluid", name = "angels-liquid-molten-copper", amount = 300 },
    },
    time = 8,
    tier = 4,
  },
}

for _, casting_recipe in pairs(vulcanus_casting_list) do
  data:extend({build_vulcanus_casting_recipe(
    casting_recipe.name,
    casting_recipe.results,
    casting_recipe.ingredients,
    casting_recipe.time,
    casting_recipe.tier,
    casting_recipe.order)
  })
end
