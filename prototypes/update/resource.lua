-- 火成岩替换方解石
if data.raw.resource["calcite"] then
  local calcite = data.raw.resource["calcite"]
  calcite.minable = calcite.minable or {}
  calcite.minable.result = "lars-igneous-rock"
  calcite.icon_size = 128
  calcite.icon = "__lars_advance_space__/graphics/icons/igneous-rock.png"
  calcite.map_color = {139, 26, 26}
  calcite.stages = calcite.stages or {}
  calcite.stages.sheet = calcite.stages.sheet or {}
  calcite.stages.sheet.tint = {r=139, g=26, b=26, a=128}
end

-- 树木产物替换
if data.raw.resource["ashland-lichen-tree"] then
  local tree = data.raw.resource["ashland-lichen-tree"]
  tree.minable = tree.minable or {}
  tree.minable.result = "angels-solid-carbon"
end
if data.raw.resource["ashland-lichen-tree-flaming"] then
  local tree = data.raw.resource["ashland-lichen-tree-flaming"]
  tree.minable = tree.minable or {}
  tree.minable.result = "angels-solid-carbon"
end