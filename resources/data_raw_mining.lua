local settings_key_prefix = "a2x1_config_bits" .. "-" .. "data_raw_mining" .. "-"

function __settings_startup__data_raw_mining(data, order)
  return data:extend(
    {
      {
        type = "int-setting",
        name = settings_key_prefix .. "base_productivity",
        setting_type = "startup",
        default_value = 100,
        maximum_value = 100000,
        minimum_value = 0,
        localised_name = "Mining Drill Productivity",
        localised_description = "0% Normal - 100% More - 100000% Even More",
        order = tonumber(order .. "1")
      },
      {
        type = "int-setting",
        name = settings_key_prefix .. "mining_speed",
        setting_type = "startup",
        default_value = 100,
        maximum_value = 100000,
        minimum_value = 1,
        localised_name = "Mining Drill Mining Speed",
        localised_description = "1% Slower - 100% Normal - 100000% Faster",
        order = tonumber(order .. "2")
      }
    }
  )
end

function __data__data_raw_mining(data, settings)
  for k, v in pairs(data.raw["mining-drill"]) do
    --

    -- base_productivity
    v.base_productivity = (v.base_productivity or 1) / 100 * (settings.startup[settings_key_prefix .. "base_productivity"].value or 100)

    -- mining_speed
    v.mining_speed = (v.mining_speed or 1) / 100 * (settings.startup[settings_key_prefix .. "mining_speed"].value or 100)

    --
  end
end
