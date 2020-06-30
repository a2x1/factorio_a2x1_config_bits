local settings_key_prefix = "a2x1_config_bits" .. "-" .. "data_raw_assembling_machine" .. "-"

function __settings_startup__data_raw_assembling_machine(data, order)
  return data:extend(
    {
      {
        type = "int-setting",
        name = settings_key_prefix .. "base_productivity",
        setting_type = "startup",
        default_value = 100,
        maximum_value = 100000,
        minimum_value = 0,
        localised_name = "Assembler Productivity",
        localised_description = "0% Normal - 100% More - 100000% Even More",
        order = tonumber(order .. "1")
      },
      {
        type = "int-setting",
        name = settings_key_prefix .. "crafting_speed",
        setting_type = "startup",
        default_value = 100,
        maximum_value = 100000,
        minimum_value = 1,
        localised_name = "Assembler Crafting Speed",
        localised_description = "1% Slower - 100% Normal - 100000% Faster",
        order = tonumber(order .. "2")
      }
    }
  )
end

function __data__data_raw_assembling_machine(data, settings)
  for k, v in pairs(data.raw["assembling-machine"]) do
    --

    -- base_productivity
    v.base_productivity = (v.base_productivity or 1) / 100 * (settings.startup[settings_key_prefix .. "base_productivity"].value or 100)

    -- crafting_speed
    v.crafting_speed = (v.crafting_speed or 1) / 100 * (settings.startup[settings_key_prefix .. "crafting_speed"].value or 100)

    --
  end
end
