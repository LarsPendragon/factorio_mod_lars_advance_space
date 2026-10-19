data:extend({
    {
        -- 鱼类
        type = "int-setting",
        name = "lars-fish-spoilage-time-seconds", -- 设置项的内部名称
        setting_type = "startup",            -- 必须是 startup 阶段
        default_value = 7550,                -- 默认值（7550秒，即官方原版鱼的变质时间）
        minimum_value = 0,                   -- 允许的最小值（0 表示永不腐败）
        maximum_value = 86400,               -- 允许的最大值
        order = "a[spoilage]-a[fish]"
    },
    {
        -- 生肉
        type = "int-setting",
        name = "lars-meat-spoilage-time-seconds",
        setting_type = "startup",
        default_value = 3600,
        minimum_value = 0,
        maximum_value = 86400,
        order = "a[spoilage]-b[meat]"
    },
    {
        -- 植物
        type = "int-setting",
        name = "lars-crop-spoilage-time-seconds",
        setting_type = "startup",
        default_value = 14400,
        minimum_value = 0,
        maximum_value = 86400,
        order = "a[spoilage]-c[plant]"
    },
    {
        -- 种子
        type = "int-setting",
        name = "lars-seed-spoilage-time-seconds",
        setting_type = "startup",
        default_value = 21600,
        minimum_value = 0,
        maximum_value = 86400,
        order = "a[spoilage]-d[seed]"
    },
    {
        -- 植物产物
        type = "int-setting",
        name = "lars-crop-product-spoilage-time-seconds",
        setting_type = "startup",
        default_value = 7550,
        minimum_value = 0,
        maximum_value = 86400,
        order = "a[spoilage]-e[product]"
    },
})