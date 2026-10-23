local function replace_calcite_with_igneous(surface)
  local calcites = surface.find_entities_filtered{
    name = "calcite",
    type = "resource"
  }
  for _, calcite in pairs(calcites) do
    local position = calcite.position
    local amount = calcite.amount
    calcite.destroy()
    surface.create_entity{
      name = "lars-igneous-rock",
      position = position,
      amount = amount,
    }
  end
end

-- 遍历所有表面执行替换
for _, surface in pairs(game.surfaces) do
  replace_calcite_with_igneous(surface)
end