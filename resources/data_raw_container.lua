local settings_key_prefix = "a2x1_config_bits" .. "-" .. "data_raw_container" .. "-"

function __settings_startup__data_raw_container(data, order)
  return data:extend(
    {
      {
        type = "int-setting",
        name = settings_key_prefix .. "inventory_size",
        setting_type = "startup",
        default_value = 250,
        maximum_value = 100000,
        minimum_value = 1,
        localised_name = "Container Inventory Size",
        localised_description = "1% Smaller - 100% Default - 100000% Larger",
        order = tonumber(order .. "1")
      }
    }
  )
end

function __data__data_raw_container(data, settings)
  for k, v in pairs(data.raw["container"]) do
    --

    -- inventory_size
    v.inventory_size = (v.inventory_size or 1) / 100 * (settings.startup[settings_key_prefix .. "inventory_size"].value or 100)

    --
  end
end
