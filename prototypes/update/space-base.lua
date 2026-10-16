local SPACE_PRESSURE = 0
local SPACE_NOT_ALLOW = 10
local EARTH_PRESSURE = 1000
local GRASS_PRESSURE = 2000
local LAVA_PRESSURE = 4000
local THUNDER_PRESSURE = 800
local ICE_PRESSURE = 300

function add_place_pressure_condition(entity_type, name, min_pressure, max_pressure)
  local entity = data.raw[entity_type][name]
  if not entity then
    return
  end
  if not entity.surface_conditions then
    entity.surface_conditions = {{ 
      property = "pressure",
      min = min_pressure,
      max = max_pressure,
    }}
  else
    local exist_pressure = false
    for _, condition in pairs(entity.surface_conditions) do
      if condition.property == "pressure" then
        condition.min = min_pressure
        condition.max = max_pressure
        exist_pressure = true
      end
    end
    if not exist_pressure then
      entity.surface_conditions[#entity.surface_conditions+1] = {
        property = "pressure",
        min = min_pressure,
        max = max_pressure,
      }
    end
  end
end

-- 蒸汽动力相关
add_place_pressure_condition("generator", "steam-engine", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("boiler", "heat-exchanger", EARTH_PRESSURE, GRASS_PRESSURE)

-- 制造机相关
add_place_pressure_condition("assembling-machine", "bob-burner-assembling-machine", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "bob-steam-assembling-machine", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "assembling-machine-1", SPACE_NOT_ALLOW, nil)

-- 军事
add_place_pressure_condition("turret", "gun-turret", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("land-mine", "bob-distractor-mine", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("land-mine", "land-mine", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("land-mine", "bob-poison-mine", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("land-mine", "bob-slowdown-mine", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("electric-turret", "laser-turret", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("radar", "bob-artifact-radar", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("artillery-turret", "artillery-turret", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("artillery-turret", "bob-artillery-turret-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("artillery-turret", "bob-artillery-turret-3", SPACE_NOT_ALLOW, nil)

-- 天使系列：矿石处理
add_place_pressure_condition("assembling-machine", "angels-burner-ore-crusher", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-ore-crusher", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-ore-ore-crusher-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-ore-ore-crusher-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-ore-sorting-facility", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-ore-sorting-facility-2", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-ore-sorting-facility-3", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-ore-sorting-facility-4", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-ore-sorting-facility-5", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-ore-floatation-cell", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-ore-floatation-cell-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-ore-floatation-cell-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-ore-leaching-plant", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-ore-leaching-plant-2", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-ore-leaching-plant-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-ore-refinery", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-ore-refinery-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-powderizer", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-powderizer-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-powderizer-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-electro-whinning-cell", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-electro-whinning-cell-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-filtration-unit", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-filtration-unit-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-filtration-unit-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-crystallizer", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-crystallizer-2", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-crystallizer-3", SPACE_NOT_ALLOW, nil)

-- 天使系列：资源冶炼
add_place_pressure_condition("assembling-machine", "angels-ore-processing-machine", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-ore-processing-machine-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-ore-processing-machine-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-ore-processing-machine-4", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-pellet-press", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-pellet-press-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-pellet-press-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-pellet-press-4", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-powder-mixer", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-powder-mixer-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-powder-mixer-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-powder-mixer-4", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-blast-furnace", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-blast-furnace-2", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-blast-furnace-3", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-blast-furnace-4", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-chemical-furnace", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-chemical-furnace-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-chemical-furnace-3", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-chemical-furnace-4", SPACE_NOT_ALLOW, nil)

-- 天使系列：铸造
add_place_pressure_condition("assembling-machine", "angels-induction-furnace", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-induction-furnace-2", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-induction-furnace-3", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-induction-furnace-4", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-casting-machine", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-casting-machine-2", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-casting-machine-3", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-casting-machine-4", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-strand-casting-machine", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-strand-casting-machine-2", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-strand-casting-machine-3", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-strand-casting-machine-4", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-sintering-oven-4", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-sintering-oven-5", SPACE_NOT_ALLOW, nil)

-- 天使化工
add_place_pressure_condition("assembling-machine", "angels-hydro-plant", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-hydro-plant-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-hydro-plant-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-clarifier", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-salination-plant", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-salination-plant-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-washing-plant", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-washing-plant-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-ground-water-pump", SPACE_NOT_ALLOW, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-electric-boiler", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-cooling-tower", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-electrilyser", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-electrilyse-2r", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-electrilyser-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-electrilyser-4", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-air-filter", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-air-filter-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-air-filter-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-liquifier", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-liquifier-2", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-liquifier-3", SPACE_NOT_ALLOW, nil)
--add_place_pressure_condition("assembling-machine", "angels-liquifier-4", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "chemical-plant", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-gas-refinery-small", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-gas-refinery-small-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-gas-refinery-small-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-gas-refinery-small-4", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-gas-refinery", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-gas-refinery-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-gas-refinery-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-gas-refinery-4", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-separator", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-separator-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-separator-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-separator-4", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-oil-refinery", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-oil-refinery-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-oil-refinery-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-oil-refinery-4", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-steam-cracker", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-steam-cracker-2", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-steam-cracker-3", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-steam-cracker-4", SPACE_NOT_ALLOW, nil)
add_place_pressure_condition("assembling-machine", "angels-flare-stack", SPACE_NOT_ALLOW, nil)

-- 天使系列：生物
add_place_pressure_condition("assembling-machine", "angels-algae-farm", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-algae-farm-2", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-algae-farm-3", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-algae-farm-4", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-bio-generator-temperate-1", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-bio-generator-swamp-1", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-bio-generator-desert-1", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-bio-generator-arboretum-1", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-crop-farm", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-temperate-farm", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-swamp-farm", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-desert-farm", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-seed-extractor", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-composter", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-bio-processor", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-bio-press", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-nutrient-extractor", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-bio-refugium-fish", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-bio-butchery", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-bio-hatchery", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-bio-refugium-puffer", EARTH_PRESSURE, GRASS_PRESSURE)
add_place_pressure_condition("assembling-machine", "angels-bio-refugium-biter", EARTH_PRESSURE, GRASS_PRESSURE)