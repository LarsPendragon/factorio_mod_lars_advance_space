-- TFMG 的热量管理需要定义在 data 阶段而非 update 阶段
TFMG_thermal = TFMG_thermal or {}

local condition_space = {
  {
    property = "pressure",
    min = 0,
    max = 0,
  }
}

local default_max_working_temp = 250
local default_max_safe_temp = 350
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
}

local assembling_machine_connections = {
  { position = {-1, 0}, direction = defines.direction.north },
  { position = {1, 0}, direction = defines.direction.south },
}


-- 对所有组装机添加热能接口（散热片除外）
for _, entity in pairs(data.raw["assembling-machine"]) do
  if entity and (not radiator_list[entity.name]) then
    add_TFMG_thermal(entity, assembling_machine_connections, condition_space, 250, 350, 0.5, 0)
  end
end

-- 对熔炉添加热能接口
for _, entity in pairs(data.raw["furnace"]) do
  add_TFMG_thermal(entity, {}, condition_space, 900, 1200, 0.9, 0)
end

