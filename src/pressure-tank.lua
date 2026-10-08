-- class "check pressure tanks"
--local cpt = {}
local empty_check_count = 0


-- 普通流体罐禁止存放低温液体
local pressure_tank_list = {
    ["angels-pressure-tank-1"] = true
}
-- 低温液体种类
local pressure_fluid_list = {
    ["lars-liquid-oxygen"] = true,
    ["lars-liquid-hydroxide"] = true,
    ["lars-liquid-nitrogen"] = true
}

function cpt.add_tank_to_table(entity)
    if eneity.unit_number then
        storage.cpt_current_tank_table[entity.unit_number] = entity
    end
end

function cpt.record_tank(event)
    local e = event.entity
    if not (e and e.valid) then return end
    if e.type == "storage-tank" and e.unit_number then
        storage.cpt_current_tank_table[e.unit_number] = e
    end
end

function cpt.remove_tank(event)
    local e = event.entity
    if not (e and e.valid) then return end
    if e.type == "storage-tank" and e.unit_number then
        storage.cpt_current_tank_table[e.unit_number] = nil
    end
end

local function cpt_init()
    for _, surface in pairs(game.surfaces) do
        local tanks = surface.find_entities_filtered{type = "storage-tank"}
        for _, tank in pairs(tanks) do
            if tank.unit_number then
                storage.cpt_current_tank_table[tank.unit_number] = e
            end
        end
    end
end

-- 初始化所有储液罐列表
-- 需要用在 control.lua 的 on_load 阶段
function cpt.init_tank_when_load()
    if not storage.cpt_current_tank_table then
        storage.cpt_current_tank_table = {}
    end
    cpt_init()
end

-- 如果普通储液罐存储了低温高压液体，则定期造成伤害
-- 需要用在 control.lua 的 on_tick 阶段
function cpt.destroy_over_pressure_tank(event)
    if game.tick % 300 ~= 0 then return end -- 5s
    if #storage.cpt_current_tank_table == 0 then
        if empty_check_count < 3 then
            empty_check_count = empty_check_count + 1
            cpt_init()
            if #storage.cpt_current_tank_table > 0 then
                empty_check_count = 0
            end
        end
    end
    for unit_number, tank in pairs(storage.cpt_current_tank_table) do
        local not_pressure = true
        if tank and pressure_tank_list[tank.name] then
            not_pressure = false
        end
        local fluid = tank.fluidbox[1]
        if not_pressure and fluid and pressure_fluid_list[fluid.name] then
            tank.damage(300, "player")
        end
    end
end

-- 高负载但是简单实现
function cpt.easy_destroy_over_pressure_tank()
    if game.tick % 300 ~= 0 then return end -- 5s
    for _, surface in pairs(game.surfaces) do
        local tanks = surface.find_entities_filtered{type = "storage-tank"}
        for _, tank in pairs(tanks) do
            local not_pressure = true
            if tank and pressure_tank_list[tank.name] then
                not_pressure = false
            end
            local fluid = tank.fluidbox[1]
            if not_pressure and fluid and pressure_fluid_list[fluid.name] then
                tank.damage(300, "player")
            end
        end
    end
end
