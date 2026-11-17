

local lars_rapid_rocket = {}

local lars_rapid_rocket_name_to_container = {
  ["lars-rocket-launcher-vulcanus"] = "lars-rocket-payload-container-vulcanus",
}
local default_payload_weight = 50000 -- 50kg

local function is_lars_rocket(entity)
  return entity and entity.valid and lars_rapid_rocket_name_to_container[entity.name]
end

local function get_READ_ONLY_rocket_info(rocket_entity)
  local info = storage.lars_rocket_info[rocket_entity.unit_number]
  if not info then return {} end
  return info
end

script.on_configuration_changed(function()
  storage.lars_rocket_info = storage.lars_rocket_info or {}
end)

--- ON BUILD
---@param event any
function lars_rapid_rocket.on_build(event)
  local entity = event.created_entity or event.entity
  if not (entity and entity.valid) then
    return
  end
  local container_name = lars_rapid_rocket_name_to_container[entity.name]
  if not container_name then
    return
  end

  log("CREATE: start")
  -- 创建隐藏的容器
  local container = entity.surface.create_entity{
    name = container_name,
    position = entity.position,
    force = entity.force,
    create_build_effect_smoke = false,
    raise_built = false,
  }
  if container then
    log("CREATE: container有效")
    container.destructible = false  -- 玩家无法直接攻击摧毁
    container.minable_flag = false  -- 无法被玩家或机器人手动拆除

    -- 记录storage
    storage.lars_rocket_info = storage.lars_rocket_info or {}
    storage.lars_rocket_info[entity.unit_number] = storage.lars_rocket_info[entity.unit_number] or {}
    storage.lars_rocket_info[entity.unit_number].container = container
  end
end

--- ON REMOVE
---@param event any
function lars_rapid_rocket.on_remove(event)
  local entity = event.entity
  if not is_lars_rocket(entity) then
    return
  end

  -- 从storage清除 （读取可以用 local 变量但修改必须直接修改 storage）
  local info = storage.lars_rocket_info[entity.unit_number]
  if info then
    local container = info.container

    -- 回收物品或掉落物品
    local player = event.player_index and game.get_player(event.player_index)
    if container and container.valid then
      lars_rapid_rocket.recycle_item_on_remove(entity, container, player)
      container.destroy()
    end
    storage.lars_rocket_info[entity.unit_number] = nil
  end
end


---火箭载荷是否为空
---@param entity any -- rocket launcher entity
---@return boolean
function lars_rapid_rocket.is_payload_empty(entity)
  if not is_lars_rocket(entity) then
    return true
  end
  local readonly_container = get_READ_ONLY_rocket_info(entity).container
  return (not readonly_container) or readonly_container.is_empty()
end


---获取火箭载荷总重量
---@param entity any -- rocket launcher entity
---@return integer -- total weight
function lars_rapid_rocket.payload_weight(entity)
  if not is_lars_rocket(entity) then
    return 0
  end
  local readonly_container = get_READ_ONLY_rocket_info(entity).container
  if not readonly_container then return 0 end

  local sum = 0
  for _, item in pairs(readonly_container.get_contents()) do
    local proto = prototypes.item[item.name]
    sum = sum + (proto and proto.weight or 0) * item.count
  end
  return sum
end


---处理拆除时的物品回收与掉落
---@param entity any
---@param container any
---@param player any
function lars_rapid_rocket.recycle_item_on_remove(entity, container, player)
  if not (container and container.valid) then return end
  local inv = container.get_inventory(defines.inventory.chest)
  if not (inv and not inv.is_empty()) then return end

  local items_to_spill = {} -- 洒落列表
  local contents = inv.get_contents()
  for i = 1, #contents do
    local item = contents[i]
    if player then
      -- 物品塞入玩家背包
      local inserted = player.insert(item)
      if inserted < item.count then
        item.count = item.count - inserted
        table.insert(items_to_spill, item)
      end
    else
      -- 无玩家，直接掉落
      table.insert(items_to_spill, item)
    end
  end

  -- 掉落物品
  for _, item in pairs(items_to_spill) do
    entity.surface.spill_item_stack{
      position = entity.position,
      stack = item,
      enable_looted = true,
      force = entity.force,
      allow_belts = true,
      max_radius = 5,
    }
  end
end


-- >>>事件注册<<<
-- 1. 建造时
script.on_event(defines.events.on_built_entity, lars_rapid_rocket.on_build)
script.on_event(defines.events.on_robot_built_entity, lars_rapid_rocket.on_build)
script.on_event(defines.events.script_raised_built, lars_rapid_rocket.on_build)
script.on_event(defines.events.script_raised_revive, lars_rapid_rocket.on_build)
script.on_event(defines.events.on_entity_cloned, lars_rapid_rocket.on_build)
-- 2. 拆除时
script.on_event(defines.events.on_player_mined_entity, lars_rapid_rocket.on_remove)
script.on_event(defines.events.on_robot_mined_entity, lars_rapid_rocket.on_remove)
script.on_event(defines.events.on_entity_died, lars_rapid_rocket.on_remove)
script.on_event(defines.events.script_raised_destroy, lars_rapid_rocket.on_remove)