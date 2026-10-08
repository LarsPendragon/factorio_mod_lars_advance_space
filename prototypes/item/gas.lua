local AF = angelsmods.functions

data:extend({
    {
        -- 纯化高压空气
        type = "fluid",
        name = "lars-purify-compressed-air",
        icons = angelsmods.functions.create_viscous_liquid_fluid_icon(nil, { { 139, 137, 137 }, { 139, 121, 94 } }),
        subgroup = "angels-water-cleaning-fluid",
        order = "x",
        default_temperature = 0,
        heat_capacity = "0.1kJ",
        base_color = { r = 0.53, g = 0.53, b = 0.53 },
        flow_color = { r = 0.53, g = 0.53, b = 0.53 },
        max_temperature = 100,
    },
})