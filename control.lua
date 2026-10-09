cpt = cpt or {}

require("src.pressure-tank")

-------------
-- 加载存档时
-------------
script.on_load(function()
    script.on_nth_tick(60, function(event)
        script.on_nth_tick(60, nil)
        cpt.init_tank_when_load()
    end)
    -- 初始化储液罐表
end
)

-------------
-- 每帧
-------------
script.on_event(defines.events.on_tick, function(event)
    -- 给过压力的储液罐造成伤害
    --cpt.destroy_over_pressure_tank()
    cpt.easy_destroy_over_pressure_tank()
end
)

-------------
-- 监听放置、拆除事件，过滤储液罐
-------------

script.on_event(defines.events.on_built_entity, function(event)
    --cpt.record_tank(event)
end, {
    {filter = "type", type = "storage-tank"}
}
)

script.on_event(defines.events.on_robot_built_entity, function(event)
    --cpt.record_tank(event)
end, {
    {filter = "type", type = "storage-tank"}
}
)

script.on_event(defines.events.on_player_mined_entity, function(event)
    --cpt.remove_tank(event)
end, {
    {filter = "type", type = "storage-tank"}
}
)

script.on_event(defines.events.on_robot_mined_entity, function(event)
    --cpt.remove_tank(event)
end, {
    {filter = "type", type = "storage-tank"}
}
)



