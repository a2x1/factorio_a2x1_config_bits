local settings_key_prefix = "a2x1_config_bits" .. "-" .. "game_players_zoom" .. "-"

function __settings__user__game_players_zoom(data, order)
  return data:extend(
    {
      {
        type = "double-setting",
        name = settings_key_prefix .. "zoom_distance",
        setting_type = "runtime-per-user",
        default_value = 0.1,
        localised_name = "Infinite Zoom Distance",
        localised_description = "Less is more",
        order = tonumber(order .. "1")
      }
    }
  )
end

function __data__game_players_zoom(data, settings)
  return data:extend {
    {
      type = "custom-input",
      name = settings_key_prefix .. "zoom_custom_input",
      key_sequence = "SHIFT + Z",
      localised_name = "Infinite Zoom Keybinding"
    }
  }
end

function __script__game_players_zoom(script)
  script.on_event(
    settings_key_prefix .. "zoom_custom_input",
    function(event)
      local player = game.players[event.player_index]
      player.zoom = (player.mod_settings[settings_key_prefix .. "zoom_distance"].value or 1)
    end
  )
end
