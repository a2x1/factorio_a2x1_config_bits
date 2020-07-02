local settings_key_prefix = "a2x1_config_bits" .. "-" .. "data_raw_inserter" .. "-"

function __settings_startup__data_raw_inserter(data, order)
  return data:extend(
    {
      {
        type = "double-setting",
        name = settings_key_prefix .. "inserter_stack_size_bonus",
        setting_type = "startup",
        default_value = 25,
        minimum_value = 1,
        maximum_value = 254,
        localised_name = "Inserters Non-Stack Stack Size Bonus",
        localised_description = "Non Stack Inserter capacity bonus research increases the stack size for inserters, i.e. the number of items they can hold in the arm at once",
        order = tonumber(order .. "1")
      },
      {
        type = "double-setting",
        name = settings_key_prefix .. "stack_inserter_capacity_bonus",
        setting_type = "startup",
        default_value = 100,
        minimum_value = 1,
        maximum_value = 254,
        localised_name = "Inserters Stack Capacity Bonus",
        localised_description = "Stack Inserter capacity bonus research increases the stack size for inserters, i.e. the number of items they can hold in the arm at once",
        order = tonumber(order .. "2")
      },
      {
        type = "int-setting",
        name = settings_key_prefix .. "inserter_speed",
        setting_type = "startup",
        default_value = 100,
        maximum_value = 100000,
        minimum_value = 1,
        localised_name = "Inserter Rotation Speed",
        localised_description = "1% Slower - 100% Normal - 100000% Faster",
        order = tonumber(order .. "3")
      }
    }
  )
end

function __data__data_raw_inserter(data, settings)
  for k, v in pairs(data.raw["inserter"]) do
    --

    -- inserter_speed
    v.extension_speed = (v.extension_speed or 1) / 100 * (settings.startup[settings_key_prefix .. "inserter_speed"].value or 100)
    v.rotation_speed = (v.rotation_speed or 1) / 100 * (settings.startup[settings_key_prefix .. "inserter_speed"].value or 100)

    --
  end
end

function __on_player_created__data_raw_inserter(event)
  --

  __on_runtime_mod_setting_changed__data_raw_inserter(event)
end

function __on_runtime_mod_setting_changed__data_raw_inserter(event)
  --

  for _, player in pairs(game.players) do
    if player.character then
      --

      -- inserter_stack_size_bonus
      player.force.inserter_stack_size_bonus = settings.startup[settings_key_prefix .. "inserter_stack_size_bonus"].value

      -- stack_inserter_capacity_bonus
      player.force.stack_inserter_capacity_bonus = (settings.startup[settings_key_prefix .. "stack_inserter_capacity_bonus"].value or 1)

    --
    end
  end
end
