local settings_key_prefix = "a2x1_config_bits" .. "-" .. "data_raw_electric_pole" .. "-"

function __settings_startup__data_raw_electric_pole(data, order)
  return data:extend(
    {
      {
        type = "string-setting",
        name = settings_key_prefix .. "supply_area_boost",
        setting_type = "startup",
        default_value = "100",
        allowed_values = {
          "disabled",
          "100",
          "150",
          "200"
        },
        localised_name = "Electric Poles Supply Area Boost",
        localised_description = "100% Same as Wire Distance - 150% More - 200% More",
        order = tonumber(order .. "1")
      }
    }
  )
end

function __data__data_raw_electric_pole(data, settings)
  --

  local supply_area_boost = settings.startup[settings_key_prefix .. "supply_area_boost"].value

  if supply_area_boost == "disabled" then
    return
  end

  for k, v in pairs(data.raw["electric-pole"]) do
    --

    -- supply_area_boost

    v.supply_area_distance = v.maximum_wire_distance / 100 * supply_area_boost

    if v.supply_area_distance * 2 > 64 then
      v.maximum_wire_distance = 64
    else
      v.maximum_wire_distance = 2 * v.supply_area_distance
    end

    --
  end
end
