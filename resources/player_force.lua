local settings_key_prefix = "a2x1_config_bits" .. "-" .. "player_force" .. "-"

function __settings_global__player_force(data, order)
  return data:extend(
    {
      {
        type = "double-setting",
        name = settings_key_prefix .. "character_running_speed_modifier",
        setting_type = "runtime-global",
        default_value = 1,
        minimum_value = 0,
        localised_name = "Player Running Speed Modifier",
        localised_description = "-1 Slower - 0 Normal - 1 Faster",
        order = tonumber(order .. "1")
      },
      {
        type = "double-setting",
        name = settings_key_prefix .. "manual_mining_speed_modifier",
        setting_type = "runtime-global",
        default_value = 1,
        minimum_value = 0,
        localised_name = "Player Mining Speed Modifier",
        localised_description = "-1 Slower - 0 Normal - 1 Faster",
        order = tonumber(order .. "1")
      }
    }
  )
end

function __on_player_created__player_force(event)
  --

  __on_runtime_mod_setting_changed__player_force(event)
end

function __on_runtime_mod_setting_changed__player_force(event)
  --

  for _, player in pairs(game.players) do
    if player.character then
      --

      -- character_running_speed_modifier
      player.force.character_running_speed_modifier = settings.global[settings_key_prefix .. "character_running_speed_modifier"].value

      -- manual_mining_speed_modifier
      player.force.manual_mining_speed_modifier = settings.global[settings_key_prefix .. "manual_mining_speed_modifier"].value

    --
    end
  end
end
