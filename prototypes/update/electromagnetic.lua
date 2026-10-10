local OV = angelsmods.functions.OV

-- 更改电子元件科技效果
OV.add_unlock("bob-electronics", "lars-magnetic-coil")
-- 更改集成电路科技效果
OV.add_unlock("advanced-circuit", "lars-silver-coil")
-- 更改镍钛合金处理科技效果
OV.add_unlock("bob-nitinol-processing", "lars-gold-coil")

-- 更改配方
OV.patch_recipes({
    -- 需要电磁线圈
    {
        -- 组装机2型
        name = "assembling-machine-2",
        ingredients = {
          { type = "item", name = "lars-magnetic-coil", amount = 4 },
        },
    },
    {
        -- 电子组装机
        name = "bob-electronics-machine-1",
        ingredients = {
          { type = "item", name = "lars-magnetic-coil", amount = 6 },
        },
    },
    {
        -- 电动机
        name = "electric-engine-unit",
        ingredients = {
          { type = "item", name = "lars-magnetic-coil", amount = 2 },
        },
    },
    {
        -- 机器人框架
        name = "flying-robot-frame",
        ingredients = {
          { type = "item", name = "lars-magnetic-coil", amount = 1 },
        },
    },
    {
        -- 机器人充电板
        name = "bob-roboport-chargepad-1",
        ingredients = {
          { type = "item", name = "lars-magnetic-coil", amount = 1 },
        },
    },
    {
        -- 机器人天线2
        name = "bob-roboport-antenna-2",
        ingredients = {
          { type = "item", name = "lars-magnetic-coil", amount = 1 },
        },
    },
    {
        -- 蒸汽机2
        name = "bob-steam-engine-2",
        ingredients = {
          { type = "item", name = "lars-magnetic-coil", amount = 3 },
        },
    },
    {
        -- 燃油发电机
        name = "bob-fluid-generator",
        ingredients = {
          { type = "item", name = "lars-magnetic-coil", amount = 2 },
        },
    },
    {
        -- 采矿机2
        name = "bob-mining-drill-1",
        ingredients = {
          { type = "item", name = "lars-magnetic-coil", amount = 1 },
        },
    },
    {
        -- 机械臂2
        name = "long-handed-inserter",
        ingredients = {
          { type = "item", name = "lars-magnetic-coil", amount = 1 },
        },
    },

    -- 需要高强度磁线圈
    {
        -- 机器人框架2
        name = "bob-flying-robot-frame-2",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 2 },
        },
    },
    {
        -- 机器人框架3
        name = "bob-flying-robot-frame-3",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 3 },
        },
    },
    {
        -- 机器人充电板2
        name = "bob-roboport-chargepad-2",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 1 },
        },
    },
    {
        -- 机器人充电板3
        name = "bob-roboport-chargepad-3",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 1 },
        },
    },
    {
        -- 机器人天线3
        name = "bob-roboport-antenna-3",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 1 },
        },
    },
    {
        -- 蒸汽机3
        name = "bob-steam-engine-3",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 3 },
        },
    },
    {
        -- 汽轮机
        name = "steam-turbine",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 5 },
        },
    },
    {
        -- 燃油发电机
        name = "bob-fluid-generator-2",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 2 },
        },
    },
    {
        -- 组装机3
        name = "assembling-machine-3",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 2 },
        },
    },
    {
        -- 电子组装机3
        name = "bob-electronics-machine-2",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 8 },
        },
    },
    {
        -- 采矿机3
        name = "bob-mining-drill-2",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 1 },
        },
    },
    {
        -- 采矿机4
        name = "bob-mining-drill-3",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 2 },
        },
    },
    {
        -- 机械臂3
        name = "fast-inserter",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 1 },
        },
    },
    {
        -- 机械臂4
        name = "bob-turbo-inserter",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 3 },
        },
    },
    {
        -- 广域配电站
        name = "substation",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 4 },
        },
    },
    {
        -- 广域配电站2
        name = "bob-substation-2",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 6 },
        },
    },
    {
        -- 广域配电站3
        name = "bob-substation-3",
        ingredients = {
          { type = "item", name = "lars-silver-coil", amount = 8 },
        },
    },


    -- 需要超级磁线圈
    {
        -- 机器人框架4
        name = "bob-flying-robot-frame-4",
        ingredients = {
          { type = "item", name = "lars-gold-coil", amount = 4 },
        },
    },
    {
        -- 机器人天线4
        name = "bob-roboport-antenna-4",
        ingredients = {
          { type = "item", name = "lars-gold-coil", amount = 1 },
        },
    },
    {
        -- 机器人充电板4
        name = "bob-roboport-chargepad-4",
        ingredients = {
          { type = "item", name = "lars-gold-coil", amount = 1 },
        },
    },
    {
        -- 蒸汽机5
        name = "bob-steam-engine-5",
        ingredients = {
          { type = "item", name = "lars-gold-coil", amount = 3 },
        },
    },
    {
        -- 汽轮机3
        name = "bob-steam-turbine-3",
        ingredients = {
          { type = "item", name = "lars-gold-coil", amount = 5 },
        },
    },
    {
        -- 肼发电机
        name = "bob-hydrazine-generator",
        ingredients = {
          { type = "item", name = "lars-gold-coil", amount = 2 },
        },
    },
    {
        -- 组装机5
        name = "bob-assembling-machine-5",
        ingredients = {
          { type = "item", name = "lars-gold-coil", amount = 4 },
        },
    },
    {
        -- 电子组装机3
        name = "bob-electronics-machine-3",
        ingredients = {
          { type = "item", name = "lars-gold-coil", amount = 10 },
        },
    },
    {
        -- 采矿机5
        name = "bob-mining-drill-4",
        ingredients = {
          { type = "item", name = "lars-gold-coil", amount = 2 },
        },
    },
    {
        -- 机械臂5
        name = "bob-express-inserter",
        ingredients = {
          { type = "item", name = "lars-gold-coil", amount = 5 },
        },
    },
    {
        -- 广域配电站4
        name = "bob-substation-4",
        ingredients = {
          { type = "item", name = "lars-gold-coil", amount = 6 },
        },
    },

    -- 远程输电塔
    {
        -- Mk2
        name = "bob-big-electric-pole-2",
        ingredients = {
          { type = "item", name = "bob-ceramic-pipe", amount = 4 },
        },
    },
})

-- 远程输电塔2需要陶瓷前置科技
if data.raw.technology["bob-electric-pole-2"] then
    local length = #data.raw.technology["bob-electric-pole-2"].prerequisites
    data.raw.technology["bob-electric-pole-2"].prerequisites[length+1] = "bob-ceramics"
end