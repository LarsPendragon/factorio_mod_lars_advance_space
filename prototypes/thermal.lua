-- TFMG 的热量管理需要定义在 data 阶段而非 update 阶段
TFMG_thermal = TFMG_thermal or {}

require("utils")

local condition_space = {
  {
    property = "pressure",
    min = 0,
    max = 0,
  }
}

local default_max_working_temp = 150
local default_max_safe_temp = 250
local default_heat_ratio = 0.5
local default_place_temp = 0

function add_TFMG_thermal(entity, connections, conditions, max_working_temperature, max_safe_temperature, heat_ratio, place_temperature)
  if not entity or not entity.collision_box then
    -- can not use thermal settings
    log("can not use TFMG thermal on " ..entity.name .. "no collision box")
  end
  if not connections then
    -- must have definations of connections!
    log("can not use TFMG thermal on " .. entity.name .. " no connections")
  end
  if not conditions then
    conditions = condition_space
  end
  if not max_working_temperature then
    max_working_temperature = default_max_working_temp
  end
  if not max_safe_temperature then
    max_safe_temperature = default_max_safe_temp
  end
  if not heat_ratio then
    heat_ratio = default_heat_ratio
  end
  if not place_temperature then
    place_temperature = default_place_temp
  end

  entity.TFMG_thermal = {
    surface_conditions = conditions,
    heat_ratio = heat_ratio,
    max_working_temperature = max_working_temperature,
    max_safe_temperature = max_safe_temperature,
    default_temperature = place_temperature,
    heat_when_disabled_by_script=false,
  }
end

local radiator_list = {
  ["lars-TFMG-radiator"] = true,
  ["lars-space-radiator"] = true,
}

local assembling_machine_connections = {
  { position = {-1, 0}, direction = defines.direction.north },
  { position = {1, 0}, direction = defines.direction.south },
}

local need_thermal_entities = {
  {type="furnace", name="electric-furnace"}, -- 电炉
  {type="furnace", name="bob-electric-furnace-2"},
  {type="furnace", name="bob-electric-furnace-3"},
  {type="furnace", name="bob-electric-mixing-furnance"},
  {type="furnace", name="bob-electric-chemical-mixing-furnance"},
  {type="furnace", name="bob-electric-chemical-mixing-furnance-2"},
  {type="assembling-machine", name="angels-induction-furnace-2"}, -- 感应炉
  {type="assembling-machine", name="angels-induction-furnace-3"},
  {type="assembling-machine", name="angels-induction-furnace-4"},
  {type="assembling-machine", name="angels-casting-machine-2"}, -- 铸造机
  {type="assembling-machine", name="angels-casting-machine-3"},
  {type="assembling-machine", name="angels-casting-machine-4"},
  {type="assembling-machine", name="angels-blast-furnace-2"}, -- 高炉
  {type="assembling-machine", name="angels-blast-furnace-3"},
  {type="assembling-machine", name="angels-blast-furnace-4"},
  {type="assembling-machine", name="angels-chemical-furnace-4"}, -- 化学炉
  {type="assembling-machine", name="assembling-machine-2"}, -- 组装机
  {type="assembling-machine", name="assembling-machine-3"},
  {type="assembling-machine", name="bob-assembling-machine-4"},
  {type="assembling-machine", name="bob-assembling-machine-5"},
  {type="assembling-machine", name="bob-assembling-machine-6"},
  {type="assembling-machine", name="bob-electronics-machine-1"}, -- 电子组装机
  {type="assembling-machine", name="bob-electronics-machine-2"},
  {type="assembling-machine", name="bob-electronics-machine-3"},
  {type="assembling-machine", name="centrifuge"}, -- 离心机
  {type="assembling-machine", name="bob-centrifuge-2"},
  {type="assembling-machine", name="bob-centrifuge-3"},
  {type="assembling-machine", name="bob-centrifuge-2"},
  {type="assembling-machine", name="angels-ore-sorting-facility-2"}, -- 矿石分选机
  {type="assembling-machine", name="angels-ore-sorting-facility-3"},
  {type="assembling-machine", name="angels-ore-sorting-facility-4"},
  {type="assembling-machine", name="angels-ore-sorting-facility-5"},
  {type="assembling-machine", name="angels-ore-crusher"}, -- 矿石破碎机
  {type="assembling-machine", name="angels-ore-crusher-2"},
  {type="assembling-machine", name="angels-ore-crusher-3"},
  {type="assembling-machine", name="angels-filtration-unit-2"}, -- 过滤单元
  {type="assembling-machine", name="angels-filtration-unit-3"},
  {type="assembling-machine", name="angels-crystallizer-3"}, -- 结晶器
  {type="assembling-machine", name="angels-electric-boiler"}, -- 电锅炉
  {type="assembling-machine", name="angels-electric-boiler-2"},
  {type="assembling-machine", name="angels-electric-boiler-3"},
  {type="assembling-machine", name="angels-electrolyser"}, -- 电解槽
  {type="assembling-machine", name="angels-electrolyser-2"},
  {type="assembling-machine", name="angels-electrolyser-3"},
  {type="assembling-machine", name="angels-electrolyser-4"},
  {type="assembling-machine", name="angels-liquifier-2"}, -- 液化器
  {type="assembling-machine", name="angels-liquifier-3"},
  {type="assembling-machine", name="angels-liquifier-4"},
  {type="assembling-machine", name="angels-chemical-plant-2"}, -- 化工厂
  {type="assembling-machine", name="angels-chemical-plant-3"},
  {type="assembling-machine", name="angels-chemical-plant-4"},
  {type="assembling-machine", name="angels-advanced-chemical-plant"},
  {type="assembling-machine", name="angels-advanced-chemical-plant-2"},
  {type="assembling-machine", name="crusher"}, -- 破碎机
  {type="thruster", name="thruster"}, -- 推进器
}

local function get_thermal_defination(name)
  local thermal_info = {
    surface_conditions = condition_space,
    heat_ratio = 0.5,
    max_working_temperature = 150,
    max_safe_temperature = 250,
    default_temperature = 0,
    heat_when_disabled_by_script=false,
  }
  if string.find(name, "angels-induction-furnace") then
    thermal_info.heat_ratio = 0.7
    thermal_info.max_working_temperature = 1500
    thermal_info.max_safe_temperature = 1501
  elseif string.find(name, "angels-casting-machine") then
    thermal_info.heat_ratio = 0.5
    thermal_info.max_working_temperature = 1500
    thermal_info.max_safe_temperature = 1501
  elseif string.find(name, "angels-blast-furnace") then
    thermal_info.heat_ratio = 0.9
    thermal_info.max_working_temperature = 1700
    thermal_info.max_safe_temperature = 1701
  elseif string.find(name, "angels-chemical-furnace") then
    thermal_info.heat_ratio = 0.85
    thermal_info.max_working_temperature = 1700
    thermal_info.max_safe_temperature = 1701
  elseif string.find(name, "furnace") then
    thermal_info.heat_ratio = 0.9
    thermal_info.max_working_temperature = 1200
    thermal_info.max_safe_temperature = 1201
  end
  return thermal_info
end




-- 特殊设置
for _, entity_pair in pairs(need_thermal_entities) do
  local entity = data.raw[entity_pair.type][entity_pair.name]
  if entity then
    local thermal_info = get_thermal_defination(entity_pair.name)
    add_TFMG_thermal(entity, {}, thermal_info.surface_conditions,
      thermal_info.max_working_temperature, thermal_info.max_safe_temperature,
      thermal_info.heat_ratio, thermal_info.default_temperature)
  end
end
