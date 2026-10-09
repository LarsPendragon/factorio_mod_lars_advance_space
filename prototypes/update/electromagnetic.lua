local OV = angelsmods.functions.OV

-- 更改电子元件科技效果
OV.add_unlock("bob-electronics", "lars-magnetic-coil")

-- 更改配方
OV.patch_recipes({
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
})