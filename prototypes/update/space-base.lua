local SPACE_PRESSURE = 0
local SPACE_NOT_ALLOW = 10
local EARTH_PRESSURE = 1000
local GRASS_PRESSURE = 2000
local LAVA_PRESSURE = 4000
local THUNDER_PRESSURE = 800
local ICE_PRESSURE = 300

local PRESSURE = "pressure"
local GRAVITY = "gravity"

function add_place_condition(entity_type, name, condition, min_num, max_num)
  local entity = data.raw[entity_type][name]
  if not entity or not condition then
    return
  end
  if not entity.surface_conditions then
    entity.surface_conditions = {{ 
      property = condition,
      min = min_num,
      max = max_num,
    }}
  else
    local exist_pressure = false
    for _, condition in pairs(entity.surface_conditions) do
      if condition.property == condition then
        condition.min = min_num
        condition.max = max_num
        exist_pressure = true
      end
    end
    if not exist_pressure then
      entity.surface_conditions[#entity.surface_conditions+1] = {
        property = condition,
        min = min_num,
        max = max_num,
      }
    end
  end
end

-- 蒸汽动力相关
add_place_condition("generator", "steam-engine", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("boiler", "heat-exchanger", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)

-- 制造机相关
add_place_condition("assembling-machine", "bob-burner-assembling-machine", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "bob-steam-assembling-machine", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "assembling-machine-1", PRESSURE, SPACE_NOT_ALLOW, nil)

-- 存储
add_place_condition("container", "angels-big-chest", GRAVITY, 0.1, nil)
add_place_condition("logistic-container", "angels-logistic-chest-active-provider", GRAVITY, 0.1, nil)
add_place_condition("logistic-container", "angels-logistic-chest-passive-provider", GRAVITY, 0.1, nil)
add_place_condition("logistic-container", "angels-logistic-chest-storage", GRAVITY, 0.1, nil)
add_place_condition("logistic-container", "angels-logistic-chest-buffer", GRAVITY, 0.1, nil)
add_place_condition("logistic-container", "angels-logistic-chest-requester", GRAVITY, 0.1, nil)
add_place_condition("container", "angels-silo", GRAVITY, 0.1, nil)
add_place_condition("logistic-container", "angels-silo-active-provider", GRAVITY, 0.1, nil)
add_place_condition("logistic-container", "angels-silo-passive-provider", GRAVITY, 0.1, nil)
add_place_condition("logistic-container", "angels-silo-storage", GRAVITY, 0.1, nil)
add_place_condition("logistic-container", "angels-silo-buffer", GRAVITY, 0.1, nil)
add_place_condition("logistic-container", "angels-silo-requester", GRAVITY, 0.1, nil)
add_place_condition("container", "angels-silo-ore1", GRAVITY, 0.1, nil)
add_place_condition("container", "angels-silo-ore2", GRAVITY, 0.1, nil)
add_place_condition("container", "angels-silo-ore3", GRAVITY, 0.1, nil)
add_place_condition("container", "angels-silo-ore4", GRAVITY, 0.1, nil)
add_place_condition("container", "angels-silo-ore5", GRAVITY, 0.1, nil)
add_place_condition("container", "angels-silo-ore6", GRAVITY, 0.1, nil)
add_place_condition("container", "angels-silo-coal", GRAVITY, 0.1, nil)
add_place_condition("container", "angels-warehouse", GRAVITY, 0.1, nil)
add_place_condition("logistic-container", "angels-warehouse-active-provider", GRAVITY, 0.1, nil)
add_place_condition("logistic-container", "angels-warehouse-passive-provider", GRAVITY, 0.1, nil)
add_place_condition("logistic-container", "angels-warehouse-storage", GRAVITY, 0.1, nil)
add_place_condition("logistic-container", "angels-warehouse-buffer", GRAVITY, 0.1, nil)
add_place_condition("logistic-container", "angels-warehouse-requester", GRAVITY, 0.1, nil)

-- 军事
add_place_condition("turret", "gun-turret", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("land-mine", "bob-distractor-mine", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("land-mine", "land-mine", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("land-mine", "bob-poison-mine", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("land-mine", "bob-slowdown-mine", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("electric-turret", "laser-turret", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("radar", "bob-artifact-radar", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("artillery-turret", "artillery-turret", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("artillery-turret", "bob-artillery-turret-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("artillery-turret", "bob-artillery-turret-3", PRESSURE, SPACE_NOT_ALLOW, nil)

-- 天使系列：矿石处理
add_place_condition("assembling-machine", "angels-burner-ore-crusher", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-ore-crusher", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-ore-ore-crusher-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-ore-ore-crusher-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-ore-sorting-facility", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-ore-sorting-facility-2", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-ore-sorting-facility-3", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-ore-sorting-facility-4", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-ore-sorting-facility-5", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-ore-floatation-cell", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-ore-floatation-cell-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-ore-floatation-cell-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-ore-leaching-plant", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-ore-leaching-plant-2", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-ore-leaching-plant-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-ore-refinery", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-ore-refinery-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-powderizer", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-powderizer-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-powderizer-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-electro-whinning-cell", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-electro-whinning-cell-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-filtration-unit", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-filtration-unit-2", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-filtration-unit-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-crystallizer", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-crystallizer-2", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-crystallizer-3", PRESSURE, SPACE_NOT_ALLOW, nil)

-- 天使系列：资源冶炼
add_place_condition("assembling-machine", "angels-ore-processing-machine", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-ore-processing-machine-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-ore-processing-machine-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-ore-processing-machine-4", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-pellet-press", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-pellet-press-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-pellet-press-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-pellet-press-4", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-powder-mixer", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-powder-mixer-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-powder-mixer-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-powder-mixer-4", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-blast-furnace", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-blast-furnace-2", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-blast-furnace-3", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-blast-furnace-4", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-chemical-furnace", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-chemical-furnace-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-chemical-furnace-3", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-chemical-furnace-4", PRESSURE, SPACE_NOT_ALLOW, nil)

-- 天使系列：铸造
add_place_condition("assembling-machine", "angels-induction-furnace", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-induction-furnace-2", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-induction-furnace-3", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-induction-furnace-4", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-casting-machine", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-casting-machine-2", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-casting-machine-3", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-casting-machine-4", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-strand-casting-machine", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-strand-casting-machine-2", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-strand-casting-machine-3", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-strand-casting-machine-4", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-sintering-oven-4", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-sintering-oven-5", PRESSURE, SPACE_NOT_ALLOW, nil)

-- 天使化工
add_place_condition("assembling-machine", "angels-hydro-plant", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-hydro-plant-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-hydro-plant-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-clarifier", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-salination-plant", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-salination-plant-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-washing-plant", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-washing-plant-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-ground-water-pump", PRESSURE, SPACE_NOT_ALLOW, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-electric-boiler", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-cooling-tower", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-electrilyser", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-electrilyse-2r", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-electrilyser-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-electrilyser-4", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-air-filter", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-air-filter-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-air-filter-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-liquifier", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-liquifier-2", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-liquifier-3", PRESSURE, SPACE_NOT_ALLOW, nil)
--add_place_condition("assembling-machine", "angels-liquifier-4", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "chemical-plant", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-gas-refinery-small", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-gas-refinery-small-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-gas-refinery-small-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-gas-refinery-small-4", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-gas-refinery", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-gas-refinery-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-gas-refinery-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-gas-refinery-4", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-separator", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-separator-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-separator-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-separator-4", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "oil-refinery", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-oil-refinery-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-oil-refinery-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-oil-refinery-4", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-steam-cracker", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-steam-cracker-2", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-steam-cracker-3", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-steam-cracker-4", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-flare-stack", PRESSURE, SPACE_NOT_ALLOW, nil)
add_place_condition("assembling-machine", "angels-air-filter", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-air-filter", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-air-filter", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)

-- 天使系列：生物
add_place_condition("assembling-machine", "angels-algae-farm", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-algae-farm-2", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-algae-farm-3", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-algae-farm-4", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-bio-generator-temperate-1", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-bio-generator-swamp-1", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-bio-generator-desert-1", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-bio-generator-arboretum-1", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-crop-farm", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-temperate-farm", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-swamp-farm", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-desert-farm", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-seed-extractor", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-composter", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-bio-processor", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-bio-press", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-nutrient-extractor", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-bio-refugium-fish", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-bio-butchery", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-bio-hatchery", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-bio-refugium-puffer", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)
add_place_condition("assembling-machine", "angels-bio-refugium-biter", PRESSURE, EARTH_PRESSURE, GRASS_PRESSURE)