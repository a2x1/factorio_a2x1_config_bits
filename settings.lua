data:extend(
  {
    -- game_surfaces_always_day
    {
      type = "string-setting",
      name = "a2x1_config_bits-game_surfaces_always_day",
      setting_type = "runtime-global",
      default_value = "enabled",
      allowed_values = {
        "enabled",
        "disabled"
      }
    },
    -- player_force-character_crafting
    {
      type = "string-setting",
      name = "a2x1_config_bits-player_force-character_crafting_speed_modifier",
      setting_type = "runtime-global",
      default_value = "disabled",
      allowed_values = {
        "disabled",
        "1x",
        "10x",
        "100x",
        "1000x"
      }
    },
    -- player_force-character
    {
      type = "int-setting",
      name = "a2x1_config_bits-player_force-character_running_speed_modifier",
      setting_type = "runtime-global",
      default_value = 100,
      minimum_value = 0
    },
    {
      type = "int-setting",
      name = "a2x1_config_bits-player_force-character_mining_speed_modifier",
      setting_type = "runtime-global",
      default_value = 100,
      minimum_value = 0
    },
    -- player_force-laboratory
    {
      type = "int-setting",
      name = "a2x1_config_bits-player_force-laboratory_speed_modifier",
      setting_type = "runtime-global",
      default_value = 10,
      minimum_value = 1
    },
    -- player_character_bonus
    {
      type = "int-setting",
      name = "a2x1_config_bits-player_character-bonus_distance",
      setting_type = "runtime-global",
      default_value = 999,
      maximum_value = 10000,
      minimum_value = 0
    },
    {
      type = "int-setting",
      name = "a2x1_config_bits-player_character-bonus_inventory",
      setting_type = "runtime-global",
      default_value = 40,
      -- maximum_value = 100,
      minimum_value = 0
    },
    -- data_item_modifier_assembler
    {
      type = "int-setting",
      name = "a2x1_config_bits-data_item_modifier_assembler-base_productivity",
      setting_type = "startup",
      default_value = 0,
      minimum_value = 0
    },
    {
      type = "int-setting",
      name = "a2x1_config_bits-data_item_modifier_assembler-crafting_speed",
      setting_type = "startup",
      default_value = 300,
      minimum_value = 0
    },
    -- data_item_modifier_furnace
    {
      type = "int-setting",
      name = "a2x1_config_bits-data_item_modifier_furnace-base_productivity",
      setting_type = "startup",
      default_value = 0,
      minimum_value = 0
    },
    {
      type = "int-setting",
      name = "a2x1_config_bits-data_item_modifier_furnace-crafting_speed",
      setting_type = "startup",
      default_value = 300,
      minimum_value = 0
    },
    -- data_item_modifier_mining
    {
      type = "int-setting",
      name = "a2x1_config_bits-data_item_modifier_mining-base_productivity",
      setting_type = "startup",
      default_value = 0,
      minimum_value = 0
    },
    {
      type = "int-setting",
      name = "a2x1_config_bits-data_item_modifier_mining-mining_speed",
      setting_type = "startup",
      default_value = 300,
      minimum_value = 0
    },
    -- data_item_modifier_electric_pole
    {
      type = "string-setting",
      name = "a2x1_config_bits-data_item_modifier_electric_pole",
      setting_type = "startup",
      default_value = "100",
      allowed_values = {
        "disabled",
        "100",
        "150",
        "200"
      },
      order = 0
    }
  }
)
