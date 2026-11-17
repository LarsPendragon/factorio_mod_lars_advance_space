GUI_base = require("src.gui-base")

local lars_rocket_vulcanus_name = "lars-rocket-launcher-vulcanus"
local lars_rocket_vulcanus_root = lars_rocket_vulcanus_name

local gui_settings = {
  ["lars-rocket-launcher-vulcanus"] = {
    name = lars_rocket_vulcanus_name,
    label_caption = "光帆发射器"
  }
}

local function get_gui_settings(entity)
  local name = entity.name or lars_rocket_vulcanus_name
  return gui_settings[name]
end

---@param weight integer
---@return string
local function weight_text(weight)
  return "总重量: " .. weight .. " kg"
end

local lars_rocket_gui = {}

function lars_rocket_gui.get_platforms(force, surface)
  local platforms = {}
  local labels = {"请选择平台"}
  if not surface or not surface.name then return platforms, labels end
  local planet = game.planets[surface.name]
  if planet and force then
    local current_platforms = planet.get_space_platforms(force)
    for _, platform in pairs(current_platforms) do
      if platform.valid and platform.hub and platform.hub.valid then
        local label = platform.name
        table.insert(labels, label)
        platforms[label] = platform
      end
    end
  end
  return platforms, labels
end

function lars_rocket_gui.open(player, entity)
  -- 销毁可能存在的旧 GUI
  local existing = player.gui.relative[lars_rocket_vulcanus_root]
  if existing then existing.destroy() end
  existing = player.gui.screen[lars_rocket_vulcanus_root]
  if existing then existing.destroy() end

  --log("打开GUI")
  -- 创建界面画布
  local canvas = player.gui.relative.add{
    type = "frame",
    name = lars_rocket_vulcanus_root,
    direction = "vertical",
    anchor = {
      gui=defines.relative_gui_type.assembling_machine_gui,
      position=defines.relative_gui_position.right},
    tags = {unit_number = entity.unit_number},
    --location = {x = 100, y = 100}
  }
  --player.opened = canvas

  canvas.add{type = "label", caption = get_gui_settings(entity).label_caption, style = "frame_title"}
  --canvas.add{type = "label", caption = "测试界面"}

  --canvas.add{type = "button", name = "test_btn", caption = "测试按钮"}
  -- 平台选择
  local platform_section = canvas.add{type = "flow", name = "platform_section", direction = "horizontal"}
  local platforms, labels = lars_rocket_gui.get_platforms(player.force, entity.surface)
  platform_section.add{
    type = "drop-down",
    name = "platform_section_list",
    items = labels,
    selected_index = 1,
    tags = {platforms = platforms},
  }

  -- 载荷物品
  local scroll = canvas.add{type = "scroll-pane", name = "payload_scroll", direction = "vertical"}
  scroll.style.maximal_height = 200
  local scroll_table = scroll.add{type = "table", name = "payload_table", column_count = 10}

  -- 总重量
  local weight_label = canvas.add{type = "label", name = "payload_weight", caption = weight_text(0)}

  -- 初次绘制
  lars_rocket_gui.update_gui(player, canvas, entity)
end

GUI_base.register(lars_rocket_vulcanus_root, lars_rocket_vulcanus_name, lars_rocket_gui.open)


function lars_rocket_gui.update_gui(player, canvas, entity)
  -- 获取标签
  local scroll = canvas["payload_scroll"]
  local payload_table = scroll and scroll["payload_table"]
  local weight_label = canvas["payload_weight"]
  if not (scroll and table and weight_label) then
    log("GUI: 未找到绘制区域")
    return
  end
  local info = storage.lars_rocket_info[entity.unit_number]
  if not info then return end

  payload_table.clear()
  local container = info.container
  if not (container and container.valid) then
    payload_table.add{type = "label", caption = "error: 未找到载荷箱"}
    log("GUI: 火箭未找到载荷箱")
  return end

  -- 获取库存
  local inv = container.get_inventory(defines.inventory.chest)
  if not inv or inv.is_empty() then
    payload_table.add{type = "label", caption = "载荷为空"}
    log("GUI: 载荷为空")
    weight_label.caption = weight_text(0)
    return
  end
  log("GUI: 开始绘制")
  local total_weight, items_added = 0, 0
  for i = 1, #inv do
    local item = inv[i]
    if item and item.valid_for_read then
      items_added = items_added + 1
      local proto = prototypes.item[item.name]
      local unit_weight = proto and proto.weight or 0
      total_weight = total_weight + (unit_weight * item.count)

      -- 绘制
      payload_table.add{
        type = "sprite-button",
        sprite = "item/" .. item.name,
        number = item.count,
        tooltip = item.name,
        style = "slot_button",
      }
    end
  end
  weight_label.caption = weight_text(total_weight)
end

function lars_rocket_gui.do_gui_update(event)
  for _, player in pairs(game.connected_players) do
    for _, setting in pairs(gui_settings) do
      local root = player.gui.relative[setting.name]
      if root and root.valid and root.tags and root.tags.entity then
        local entity = root.tags.entity
        if entity.valid then
          lars_rocket_gui.update_gui(player, root, entity)
        else
          root.destroy()
        end
      end
    end
  end
end

-- 定时刷新gui
script.on_nth_tick(15, function(event)
  lars_rocket_gui.do_gui_update(event)
end)
