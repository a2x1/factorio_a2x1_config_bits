local settings_key_prefix = "a2x1_config_bits" .. "-" .. "data_raw_inserter" .. "-"

function __settings_startup__data_raw_inserter(data, order)
  return data:extend(
    {
      {
        type = "int-setting",
        name = settings_key_prefix .. "inserter_speed",
        setting_type = "startup",
        default_value = 100,
        maximum_value = 100000,
        minimum_value = 1,
        localised_name = "Inserter Speed",
        localised_description = "1% Slower - 100% Normal - 100000% Faster",
        order = tonumber(order .. "1")
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
