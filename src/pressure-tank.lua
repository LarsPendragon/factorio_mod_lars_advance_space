
local CHUNKS_PER_TICK = 16
local BATCH_SIZE = 400
local TICK_GAP = 2
local TICK_PER_SECOND = 60
local rebuild_count = 0

-- 普通流体罐禁止存放低温液体
local pressure_tank_list = {
    ["angels-pressure-tank-1"] = true,
    ["bob-titanium-pipe"] = true,
    ["bob-titanium-pipe-to-ground"] = true,
    ["bob-tungsten-pipe"] = true,
    ["bob-tungsten-pipe-to-ground"] = true,
    ["bob-copper-tungsten-pipe"] = true,
    ["bob-copper-tungsten-pipe-to-ground"] = true,
}
-- 低温液体种类
local pressure_fluid_list = {
    ["lars-liquid-oxygen"] = true,
    ["lars-liquid-hydrogen"] = true,
    ["lars-liquid-nitrogen"] = true
}

-- 粒子流体种类
local particle_fluid_list = {
    ["lars-universe-ray"] = true,
    ["lars-photon"] = true,
}

local function init_table()
    storage.lars_global = storage.lars_global or {}
    storage.lars_global.tracked_entities = storage.lars_global.tracked_entities or {}
    --storage.tracked_tanks = storage.tracked_tanks or {}
    --storage.tracked_pipes = storage.tracked_pipes or {}
    storage.lars_global.processing_queue = storage.lars_global.processing_queue or {}
    storage.lars_global.last_check_time = {}
    storage.lars_global.current_fluid_index = 1
end

-- 辅助函数：把实体加入跟踪系统
local function track_entity(entity)
    if not entity or not entity.valid then return end
    storage.lars_global.tracked_entities[entity.unit_number] = entity
    table.insert(storage.lars_global.processing_queue, entity.unit_number)
end

local function clear_table()
    storage.lars_global = storage.lars_global or {}
    storage.lars_global.tracked_entities = {}
    storage.lars_global.processing_queue = {}
    storage.lars_global.last_check_time = {}
end

-- 触发重建（通常在模组更新或首次加载旧存档时）
local function start_rebuild()
    storage.lars_global.rebuild_chunks = {} -- 待扫描的区块列表
    storage.lars_global.rebuild_index = 1

    -- 只收集区块坐标，不收集实体，避免内存爆炸
    for _, surface in pairs(game.surfaces) do
        -- 只处理已生成的区块
        for chunk in surface.get_chunks() do
            local pos = chunk.position or chunk
            table.insert(storage.lars_global.rebuild_chunks, {
                surface_index = surface.index,
                x = pos.x,
                y = pos.y
            })
        end
    end

    log("开始重建队列，共 " .. #storage.lars_global.rebuild_chunks .. " 个区块待扫描")
end

script.on_init(function()
    init_table()
end)

-- 模组更新
script.on_configuration_changed(function()
    init_table()
    clear_table()
    start_rebuild()
end)

-- 分帧扫描逻辑（每tick处理几个区块）
script.on_nth_tick(1, function(event)
    if not storage.lars_global or not storage.lars_global.rebuild_chunks then return end
    local total = #storage.lars_global.rebuild_chunks
    if total == 0 then
        storage.lars_global.rebuild_chunks = nil
        log("队列重建完成，共跟踪 " .. #storage.lars_global.processing_queue .. " 个实体")
        return
    end

    local start_idx = storage.lars_global.rebuild_index
    local end_idx = math.min(start_idx + CHUNKS_PER_TICK - 1, total)
    rebuild_count = rebuild_count + 1

    for i = start_idx, end_idx do
        local chunk_info = storage.lars_global.rebuild_chunks[i]
        local surface = game.surfaces[chunk_info.surface_index]
        if surface then
            -- 注意：这里用 find_entities_filtered 带 area 参数，只扫描单个区块
            local area = {
                {chunk_info.x * 32, chunk_info.y * 32},
                {(chunk_info.x + 1) * 32, (chunk_info.y + 1) * 32}
            }
            local entities = surface.find_entities_filtered{
                area = area,
                type = {"storage-tank", "pipe", "pipe-to-ground"} -- 按需调整类型
            }
            for _, entity in pairs(entities) do
                track_entity(entity)
            end
        end
    end

    storage.lars_global.rebuild_index = end_idx + 1
    if storage.lars_global.rebuild_index > total then
        storage.lars_global.rebuild_chunks = nil
        log("队列重建完成，共跟踪 " .. #storage.lars_global.processing_queue .. " 个实体")
    elseif rebuild_count % 25 == 0 then
        log("队列重建完成进度" .. storage.lars_global.rebuild_index .. " of " .. #storage.lars_global.rebuild_chunks .. "，已跟踪 " .. #storage.lars_global.processing_queue .. " 个实体")
    end
end)


-- 建造时加入
local function on_built_storage(event)
    local entity = event.created_entity or event.entity
    if entity and entity.valid and (entity.type == "storage-tank" or entity.type == "pipe" or entity.type == "pipe-to-ground") then
        track_entity(entity)
    end
end

script.on_event(defines.events.on_built_entity, on_built_storage)
script.on_event(defines.events.on_robot_built_entity, on_built_storage)
script.on_event(defines.events.script_raised_built, on_built_storage)
script.on_event(defines.events.script_raised_revive, on_built_storage)

-- 拆除时从字典移除（数组采用懒删除）
local function on_removed_storage(event)
    local entity = event.entity
    if entity and entity.valid and storage.lars_global.tracked_entities then
        --log("[C] Remove entity " .. entity.unit_number .. " from table done")
        storage.lars_global.tracked_entities[entity.unit_number] = nil
        -- 数组里暂不删除，处理时通过 valid 检查跳过，避免 O(n) 删除操作
    end
end

script.on_event(defines.events.on_entity_died, on_removed_storage)
script.on_event(defines.events.on_player_mined_entity, on_removed_storage)
script.on_event(defines.events.on_robot_mined_entity, on_removed_storage)
script.on_event(defines.events.script_raised_destroy, on_removed_storage)



local function check_pressure_container(entity, gap_ticks)
    if not (entity and entity.valid) then
        return
    end
    if pressure_tank_list[entity.name] then
        return
    end
    if not gap_ticks then
        gap_ticks = 60 -- 默认1s
    end
    local fluid = entity.get_fluid(1)
    if fluid and pressure_fluid_list[fluid.name] then
        entity.damage(100 * (gap_ticks / TICK_PER_SECOND), "player") -- 100 damage per second
    end
end

local function check_particle_container(entity, gap_ticks)
    if not (entity and entity.valid) then
        return
    end
    if not gap_ticks then
        gap_ticks = 60 -- 默认1s
    end
    local capacity = entity.get_fluid_capacity(1)
    local fluid = entity.get_fluid(1)
    if capacity and capacity > 0 and fluid and particle_fluid_list[fluid.name] then
        if fluid.amount / capacity < 0.1 then
            entity.clear_fluids()
        else
            entity.remove_fluid(1, fluid.amount*0.5*(gap_ticks / TICK_PER_SECOND)) -- 50% remove per second
        end
    end
end


-- 实际处理
script.on_nth_tick(TICK_GAP, function(event) -- 每0.1秒处理一批
    local queue = storage.lars_global.processing_queue
    local total = #queue
    if total == 0 then return end
        
    local start_idx = storage.lars_global.current_fluid_index
    local end_idx = math.min(start_idx + BATCH_SIZE - 1, total)

    for i = start_idx, end_idx do
        local unit_number = queue[i]
        local entity = storage.lars_global.tracked_entities[unit_number]
        local last_time = storage.lars_global.last_check_time[unit_number] or 0
        if not entity or not entity.valid then
            -- 实体无效，从实体记录中删除，列表则每次循环完成一遍后压缩
            storage.lars_global.tracked_entities[unit_number] = nil
        else
            local gap_ticks = math.min(game.tick - last_time, 60)
            check_pressure_container(entity, gap_ticks)
            check_particle_container(entity, gap_ticks)
            storage.lars_global.last_check_time[unit_number] = game.tick
        end
    end

    storage.lars_global.current_fluid_index = end_idx + 1
    if storage.lars_global.current_fluid_index > total then
        storage.lars_global.current_fluid_index = 1
        -- 压缩队列
        local new_queue = {}
        for i = 1, total do
            local unit_number = queue[i]
            -- 如果字典中仍存在，说明实体还有效，保留
            if storage.lars_global.tracked_entities[unit_number] then
                table.insert(new_queue, unit_number)
            end
        end
        storage.lars_global.processing_queue = new_queue
    end
end)


-- 高负载但是简单实现【废弃】
function easy_destroy_over_pressure_tank()
    if game.tick % 300 ~= 0 then return end -- 5s
    for _, surface in pairs(game.surfaces) do
        -- 储液罐
        local tanks = surface.find_entities_filtered{type = "storage-tank"}
        for _, tank in pairs(tanks) do
            check_pressure_container(tank)
            check_particle_container(tank)
        end
        -- 管道
        local pipes = surface.find_entities_filtered{type = {"pipe", "pipe-to-ground"}}
        for _, pipe in pairs(pipes) do
            check_particle_container(pipe)
        end
    end
end
