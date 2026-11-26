

local lars_rapid_rocket = {}
local debug_settings = {
  enable_container_requests = false
}

local lars_rapid_rocket_name_to_container = {
  ["lars-rocket-launcher-vulcanus"] = "lars-rocket-payload-container-vulcanus",
}
local is_lars_rapid_rocket_container = {
  ["lars-rocket-payload-container-vulcanus"] = true,
}
local rocket_payload_weight = {
  ["lars-rocket-payload-container-vulcanus"] = 100000, --100kg
}
local default_payload_weight = 50000 -- 50kg

local example_rocket_info = {
  launcher_entity = "launcher_entity", -- 发射器实体引用
  container = "container_entity", -- 实际存储载荷的箱子，隐藏
  proxy = "container_proxy", -- 代理，将机械臂放置的内容物转移到载荷箱中
  target_platform_name = "target_platform_name", -- 平台关联指定的发送目标平台
  inventory_signature = "item_count_quality_list", -- 记录载荷库存内容的字符串，判断是否发生变化
  recipe_move_lock = true, -- 物品转移锁
}

local function is_lars_rocket(entity)
  return entity and entity.name and lars_rapid_rocket_name_to_container[entity.name]
end

local function get_READ_ONLY_rocket_info(rocket_entity)
  local info = storage.lars_rocket_info[rocket_entity.unit_number]
  if not info then return {} end
  return info
end

---通过注册的 entity id (unit_number) 来获取实体引用
---@param entity_id number entity id
---@return unknown entity launcher entity or nil
function lars_rapid_rocket.get_rocket_entity_by_id(entity_id)
  if (storage.lars_rocket_info and storage.lars_rocket_info[entity_id] and storage.lars_rocket_info[entity_id].launcher_entity) then
    return storage.lars_rocket_info[entity_id].launcher_entity
  end
  return game.get_entity_by_unit_number(tonumber(entity_id))
end

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
  if not container then return end
  log("CREATE: container有效")

  -- 创建代理箱
  local proxy = entity.surface.create_entity{
    name = container_name .. "_proxy",
    position = entity.position,
    force = entity.force,
    create_build_effect_smoke = false,
    raise_built = false,
  }
  if not proxy then log("CREATE: proxy创建失败") return end
  log("CREATE: proxy有效")
  proxy.proxy_target_entity = container
  proxy.proxy_target_inventory = defines.inventory.chest

  container.destructible = false  -- 玩家无法直接攻击摧毁
  container.minable_flag = false  -- 无法被玩家或机器人手动拆除
  proxy.destructible = false
  proxy.minable_flag = false

  -- 记录storage
  storage.lars_rocket_info = storage.lars_rocket_info or {}
  storage.lars_rocket_info[entity.unit_number] = storage.lars_rocket_info[entity.unit_number] or {}
  storage.lars_rocket_info[entity.unit_number].launcher_entity = entity
  storage.lars_rocket_info[entity.unit_number].container = container
  storage.lars_rocket_info[entity.unit_number].proxy = proxy
  storage.lars_rocket_storage_to_launcher = storage.lars_rocket_storage_to_launcher or {}
  storage.lars_rocket_storage_to_launcher[container.unit_number] = entity.unit_number

  -- final check
  log("launcher " .. entity.unit_number .. " valid after on_build: " .. tostring(entity.valid))
end

--- ON REMOVE
---@param event any
function lars_rapid_rocket.on_remove(event)
  local entity = event.entity
  if not is_lars_rocket(entity) then
    return
  end
  local entity_id = entity.unit_number
  if not entity_id then return end

  -- 从storage清除 （读取可以用 local 变量但修改必须直接修改 storage）
  local info = storage.lars_rocket_info[entity_id]
  if info then
    local container = info.container
    local proxy = info.proxy
    local container_id = (container and container.valid) and container.unit_number or nil

    if proxy and proxy.valid then
      proxy.destroy()
    end

    -- 回收物品或掉落物品
    local player = event.player_index and game.get_player(event.player_index)
    if container and container.valid then
      lars_rapid_rocket.recycle_item_on_remove(entity, container, player)
      container.destroy()
    end
    storage.lars_rocket_info[entity_id] = nil
    if storage.lars_rocket_storage_to_launcher and container_id then
      storage.lars_rocket_storage_to_launcher[container_id] = nil
    end
  end
end


---火箭载荷是否为空
---@param entity any rocket launcher entity
---@return boolean
function lars_rapid_rocket.is_payload_empty(entity)
  if not is_lars_rocket(entity) then
    return true
  end
  local readonly_container = get_READ_ONLY_rocket_info(entity).container
  return (not readonly_container) or readonly_container.is_empty()
end


---获取火箭载荷总重量
---@param entity any rocket launcher entity
---@return integer total_weight total weight
function lars_rapid_rocket.payload_weight(entity)
  if not is_lars_rocket(entity) then
    return 0
  end
  local readonly_container = get_READ_ONLY_rocket_info(entity).container
  if not readonly_container then return 0 end
  local inv = readonly_container.get_inventory(defines.inventory.chest)
  if not inv then return 0 end

  local sum = 0
  for _, item in pairs(inv.get_contents()) do
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

  log("RIR: start recycle item")
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


-- TODO: 物流网络同步。一期先做手动的部分
function lars_rapid_rocket.sync_requests_to_container(container, platform)
  if not debug_settings.enable_container_requests then
    log("LOGIC: disable rocket container requests")
  return end
  if not (container and container.valid and platform and platform.valid) then return end

  local point = container.get_logistic_point(defines.logistic_member_index.logistic_container)
  if not point then
    log("LOGIC: no logistic point")
    return
  end
  point.clear_slot() -- 避免残留

  -- 获取太空平台的请求 
  local hub_requester = platform.hub and platform.hub.get_logistic_point(defines.logistic_member_index.space_platform_hub_requester)
  if not hub_requester then return end

  for i = 1, #hub_requester.sections do
    local section = hub_requester.sections[i]
    for j = 1, #section.filters do
      local filter = section.filters[j]
      point.set_slot(j, {
        value = {
          name = filter.name,
          count = filter.count,
          quality = filter.quality,
        },
        min = filter.count,
        max = filter.count,
      })
    end
  end
end


---将载荷中发射器配方需要的物品转移到发射器内
---@param launcher_entity any
---@param requester_container any
function lars_rapid_rocket.distribute_recipe_items(launcher_entity, requester_container)
  local recipe = launcher_entity.get_recipe()
  if not recipe then return end

  local required_items = {}
  for _, ingre in pairs(recipe.ingredients) do
    if ingre.type == "item" then required_items[ingre.name] = true end
  end
  if next(required_items) == nil then return end
  local req_inv = requester_container.get_inventory(defines.inventory.chest)
  local launcher_inv = launcher_entity.get_inventory(defines.inventory.crafter_input)
  if not (req_inv and launcher_inv) then return end

  for i = 1, #req_inv do
    local item = req_inv[i]
    if item and item.valid_for_read and required_items[item.name] then
      local inserted = launcher_inv.insert(item)
      --if inserted > 0 then
      --  item.count = item.count - inserted
      --end
    end
  end
end


---达到重量限制后禁止继续输入
---@param launcher any
function lars_rapid_rocket.enforce_weight_limit(launcher)
  if not (launcher and launcher.valid) then return end
  local RO_info = storage.lars_rocket_info[launcher.unit_number]
  if not RO_info then return end
  local max_weight = rocket_payload_weight[launcher.name] or default_payload_weight
  if not (RO_info.container and RO_info.container.valid and RO_info.proxy and RO_info.proxy.valid) then return end
  local inv = RO_info.container.get_inventory(defines.inventory.chest)
  if not inv then return end

  local current_weight = lars_rapid_rocket.payload_weight(launcher)
  log("current_weight: " .. current_weight)
  if current_weight >= max_weight then
    -- 超重，禁止继续放入 TODO: 机器人请求也要同步修改
    inv.set_bar(1)
  else
    -- 未超重
    inv.set_bar(#inv)
  end
end


function lars_rapid_rocket.check_inventory_changed(event)
  if not storage.lars_rocket_info then return end
  --log("CIC: enter")
  for launcher_id_raw, info in pairs(storage.lars_rocket_info) do
    local launcher = info.launcher_entity
    if not (launcher and launcher.valid) then
      --if not launcher then log("CIC: launcher not exist")
      --else log("CIC: launcher is invalid") end
      goto continue
    end

    local container = info.container
    if not (container and container.valid) then
      log("CIC: container invalid")
      goto continue
    end
    local inv = container.get_inventory(defines.inventory.chest)
    if not inv then
      log("CIC: inventory invalid")
      goto continue
    end

    -- 获取库存签名哈希
    local signature = ""
    for i = 1, #inv do
      local item = inv[i]
      if item and item.valid_for_read then
        signature = signature .. item.name .. ":" .. item.count .. ":" .. (item.quality and item.quality.name or "normal") .. "|"
      end
    end
    --log("CIC: signature " .. signature)

    -- 对比哈希
    if info.inventory_signature and info.inventory_signature == signature then
      goto continue
    end
    storage.lars_rocket_info[launcher_id_raw].inventory_signature = signature
    lars_rapid_rocket.on_inventory_changed_trigger(launcher, container)

    ::continue::
  end
end


function lars_rapid_rocket.on_inventory_changed_trigger(launcher, container)
  if not (container and container.valid) then return end
  if not (launcher and launcher.valid) then
    log("ICT: launcher invalid")
    return
  end

  -- 加锁防止重复计算
  RO_info = get_READ_ONLY_rocket_info(launcher)
  if (RO_info and RO_info.recipe_move_lock) then
    log("ICT: recipe move locking")
    return
  elseif not RO_info then
    log("ICT: invalid rocket info")
    return
  end
  --log("ICT: start lock")

  -- 加锁
  storage.lars_rocket_info[launcher.unit_number].recipe_move_lock = true

  -- 执行操作
  lars_rapid_rocket.distribute_recipe_items(launcher, container)
  lars_rapid_rocket.enforce_weight_limit(launcher)

  -- TODO: 修改物流请求数量
  -- 解锁
  storage.lars_rocket_info[launcher.unit_number].recipe_move_lock = nil
end


-- >>>事件注册<<<
script.on_init(function()
  storage.lars_rocket_info = {}
end)
script.on_configuration_changed(function()
  storage.lars_rocket_info = storage.lars_rocket_info or {}
end)
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
-- 3. 定时
script.on_nth_tick(10, lars_rapid_rocket.check_inventory_changed)

return lars_rapid_rocket