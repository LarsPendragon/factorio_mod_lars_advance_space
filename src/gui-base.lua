local GUI_base = {}

GUI_base.register_list = {}

--- 登记gui入口，在监听事件时只处理登记过的gui
---@param gui_root_name string
---@param entity_name string
---@param on_gui_open fun()
---@param on_gui_close? fun()?
function GUI_base.register(gui_root_name, entity_name, on_gui_open, on_gui_close)
  local register_structure = {
    root_name = gui_root_name,
    open_function = on_gui_open,
  }
  if on_gui_close then
    register_structure.close_function = on_gui_close
  end
  GUI_base.register_list[entity_name] = register_structure
end

-- 基础的关闭 gui 操作
function GUI_base.gui_close(player, root_name)
  local gui = player.gui.relative[root_name]
  if gui then gui.destroy() end

  gui = player.gui.screen[root_name]
  if gui then gui.destroy() end
end

-- 接管关闭 gui 操作
function GUI_base.on_gui_close(event)
  if not event then return end
  local player = game.get_player(event.player_index)
  local entity = event.entity
  if not (player and entity and entity.valid) then return end

  local registered_gui = GUI_base.register_list[entity.name]
  if not registered_gui then
    return
  end
  if registered_gui.close_function then
    registered_gui.close_function(player, registered_gui.root_name)
    return
  end

  GUI_base.gui_close(player, registered_gui.root_name)
end

-- 监听 gui close
script.on_event(defines.events.on_gui_closed, function(event)
  GUI_base.on_gui_close(event)
end)


-- 接管打开 gui
function GUI_base.on_gui_open(event)
  if not event then return end
  local player = game.get_player(event.player_index)
  local entity = event.entity
  if not (player and entity and entity.valid) then return end
  local registered_gui = GUI_base.register_list[entity.name]
  --log("尝试打开实体 gui: " .. entity.name )
  if not registered_gui then
    return
  end
  if not registered_gui.open_function then return end
  --player.opened = nil

  --log("尝试打开实体 gui Phase-2: " .. entity.name )
  registered_gui.open_function(player, entity)
end

-- 监听 gui open
script.on_event(defines.events.on_gui_opened, function(event)
  GUI_base.on_gui_open(event)
end)

return GUI_base
