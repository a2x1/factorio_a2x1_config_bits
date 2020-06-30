local settings_key_prefix = "a2x1_config_bits" .. "-" .. "player_force_manual_crafting_speed" .. "-"

function __settings_global__player_force_manual_crafting_speed(data, order)
  return data:extend(
    {
      {
        type = "string-setting",
        name = settings_key_prefix .. "modifier",
        setting_type = "runtime-global",
        default_value = "disabled",
        allowed_values = {
          "disabled",
          "1x",
          "10x",
          "100x",
          "1000x"
        },
        localised_name = "Player Manual Crafting",
        localised_description = "Disable Manual Crafting for Lazy Bastard Achievement\n Manual Crafting Enabled with 1x, 10x, 100x, 1000x Multiplier",
        order = tonumber(order .. "1")
      }
    }
  )
end

function __on_player_created__player_force_manual_crafting_speed(event)
  --

  if settings.global[settings_key_prefix .. "modifier"]["value"] == "disabled" then
    game.players[event.player_index].insert {name = "assembling-machine-1", count = 1}
    game.players[event.player_index].insert {name = "small-electric-pole", count = 2}
    game.players[event.player_index].insert {name = "offshore-pump", count = 1}
    game.players[event.player_index].insert {name = "steam-engine", count = 2}
    game.players[event.player_index].insert {name = "boiler", count = 1}
  end

  __on_runtime_mod_setting_changed__player_force_manual_crafting_speed(event)
end

function __on_runtime_mod_setting_changed__player_force_manual_crafting_speed(event)
  --

  if settings.global[settings_key_prefix .. "modifier"]["value"] == "disabled" then
    return manual_crafting_disabled(event)
  else
    return manual_crafting_enabled(event)
  end
end

function manual_crafting_disabled(event)
  --

  local group = game.permissions.get_group("Default")

  if group then
    group.set_allows_action(defines.input_action.craft, false)
  end

  game.players[event.player_index].force.manual_crafting_speed_modifier = 0
end

function manual_crafting_enabled(event)
  --

  local group = game.permissions.get_group("Default")

  if group then
    group.set_allows_action(defines.input_action.craft, true)
  end

  game.players[event.player_index].force.manual_crafting_speed_modifier = tonumber(string.sub(settings.global[settings_key_prefix .. "modifier"]["value"], 1, -2)) - 1
  -- player.print("Changed: player.force.manual_crafting_speed_modifier = " .. settings_value_number)
  -- http://lua-api.factorio.com/latest/LuaForce.html#LuaForce.manual_crafting_speed_modifier
  -- The actual crafting speed will be multiplied by 1 + manual_crafting_speed_modifier.
end
