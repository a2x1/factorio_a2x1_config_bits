local settings_key_prefix = "a2x1_config_bits" .. "-" .. "game_surfaces_always_day" .. "-"

function __settings_global__game_surfaces_always_day(data, order)
  return data:extend(
    {
      {
        type = "string-setting",
        name = settings_key_prefix .. "mode",
        setting_type = "runtime-global",
        default_value = "enabled",
        allowed_values = {
          "enabled",
          "disabled"
        },
        localised_name = "Always Day",
        localised_description = "Enable Always Day - or Disable",
        order = tonumber(order .. "1")
      }
    }
  )
end

function __on_player_created__game_surfaces_always_day(event)
  --

  __on_runtime_mod_setting_changed__game_surfaces_always_day(event)
end

function __on_runtime_mod_setting_changed__game_surfaces_always_day(event)
  --

  if settings.global[settings_key_prefix .. "mode"].value == "disabled" then
    game.surfaces[1].always_day = false
  end

  if settings.global[settings_key_prefix .. "mode"].value == "enabled" then
    game.surfaces[1].always_day = true
  end
end
