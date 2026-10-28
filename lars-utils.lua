utils = utils or {}

function change_recipe_ingredients(recipe_name, ingredients)
  if data.raw.recipe[recipe_name] then
    data.raw.recipe[recipe_name].ingredients = ingredients
  end
end

function change_recipe_results(recipe_name, results)
  if data.raw.recipe[recipe_name] then
    data.raw.recipe[recipe_name].results = results
  end
end

local function get_bioprocess_item(item_name)
  local item = data.raw.item[item_name]
  if not item then
    item = data.raw.capsule[item_name]
    if not item then
      return nil
    end
  end
  return item
end

-- 添加变质信息，输入参数为变质时间（秒）和变质产物
function utils.add_spoil(item_name, spoil_seconds, spoil_result)
  if not spoil_seconds or spoil_seconds <= 0 then
    utils.remove_spoil(item_name)
    return
  end
  local item = get_bioprocess_item(item_name)
  if not item then
    return
  end
  if not spoil_result then -- 默认变质物
    spoil_result = "spoilage"
  end
  item.spoil_ticks = spoil_seconds * 60
  item.spoil_result = spoil_result
end

function utils.modify_spoil_time(item_name, spoil_seconds)
  if not spoil_seconds or spoil_seconds <= 0 then
    utils.remove_spoil(item_name)
    return
  end
  local item = get_bioprocess_item(item_name)
  if not item then
    return
  end
  item.spoil_ticks = spoil_seconds * 60
end

function utils.remove_spoil(item_name)
  local item = get_bioprocess_item(item_name)
  if not item then
    return
  end
  item.spoil_ticks = nil
  item.spoil_result = nil
end

function utils.set_recipe_always_fresh(recipe_name, is_always_fresh)
  if not data.raw.recipe[recipe_name] then
    return
  end
  if (is_always_fresh == nil) or (is_always_fresh ~= false) then
    data.raw.recipe[recipe_name].always_fresh = true
  else
    data.raw.recipe[recipe_name].always_fresh = false
  end
end

-- 能否放置在太空
function utils.can_place_in_space(entity_name, entity_type)
  if not entity_type then
    entity_type = "assembling_machine"
  end
  local entity = data.raw[entity_type][entity_name]
  if not entity then
    return false
  else
    return utils.can_entity_place_in_space(entity)
  end
end

function utils.can_entity_place_in_space(entity)
  if not entity then
    return false
  end
  --local can_place = true
  if not entity.surface_conditions then
    return true
  end
  for _, condition in pairs(entity.surface_conditions) do
    if condition.property == "gravity" and condition.min and condition.min > 0 then
      return false
      --can_place = false
    elseif condition.property == "pressure" and condition.min and condition.min > 0 then
      return false
      --can_place = false
    elseif condition.property == "magnetic_field" and condition.min and condition.min > 0 then
      return false
      --can_place = false
    end
  end
  return true
end

function utils.hide_technology(name)
  if data.raw.technology[name] then
    data.raw.technology[name].hidden = true
    data.raw.technology[name].visible_when_disabled = false
    data.raw.technology[name].effects = {}
  end
end

function utils.get_default_icon()
  return {
    {
      icon = "__base__/graphics/icons/upgrade-planner.png",
      icon_size = 32,
    },
  }
end

BADGE_RightBottom = "right_bottom"
BADGE_LeftBottom = "left_bottom"
BADGE_RightTop = "right_top"
BADGE_LeftTop = "left_top"

local function get_badge_position(badge_icon)
  if not badge_icon then
    return badge_icon
  end
  if not badge_icon.icon_size then
    badge_icon.icon_size = 64
  end
  badge_icon.scale = 16 / badge_icon.icon_size

  local pos = badge_icon.pos
  local base_shift = 12 --* badge_icon.scale
  if not pos or pos == BADGE_RightBottom then
    badge_icon.shift = {base_shift, base_shift}
  elseif pos == BADGE_LeftBottom then
    badge_icon.shift = {-base_shift, base_shift}
  elseif pos == BADGE_RightTop then
    badge_icon.shift = {base_shift, -base_shift}
  else
    badge_icon.shift = {-base_shift, -base_shift}
  end

  return badge_icon
end

function utils.combine_icons(base_icon, badge_list)
  local icons = {
    base_icon,
  }
  if badge_list[1] then
    for _, badge in pairs(badge_list) do
      badge = get_badge_position(badge)
      table.insert(icons, badge)
    end
  else
    table.insert(icons, badge_list)
  end
  return icons
end
