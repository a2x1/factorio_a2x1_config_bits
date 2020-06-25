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
      },
      order = 211
    },
    {
  		type = "double-setting",
      name = "a2x1_config_bits-game_surfaces_zoom",
  		setting_type = "runtime-per-user",
  		default_value = 0.1,
      order = 221
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
      },
      order = 221
    },
    -- player_force-character
    {
      type = "double-setting",
      name = "a2x1_config_bits-player_force-character_running_speed_modifier",
      setting_type = "runtime-global",
      default_value = 100,
      minimum_value = 0,
      order = 231
    },
    {
      type = "double-setting",
      name = "a2x1_config_bits-player_force-character_mining_speed_modifier",
      setting_type = "runtime-global",
      default_value = 100,
      minimum_value = 0,
      order = 232
    },
    -- player_force-laboratory
    {
      type = "double-setting",
      name = "a2x1_config_bits-player_force-laboratory_speed_modifier",
      setting_type = "runtime-global",
      default_value = 100,
      minimum_value = 1,
      order = 251
    },
    -- player_force-inserter_stack_size_bonus
    {
      type = "int-setting",
      name = "a2x1_config_bits-player_force-stack_inserter_capacity_bonus",
      setting_type = "runtime-global",
      default_value = 100,
      minimum_value = 1,
      maximum_value = 254,
      order = 261
    },
    {
      type = "double-setting",
      name = "a2x1_config_bits-player_force-inserter_stack_size_bonus",
      setting_type = "runtime-global",
      default_value = 25,
      minimum_value = 1,
      maximum_value = 254,
      order = 262
    },
    -- player_character_bonus
    {
      type = "double-setting",
      name = "a2x1_config_bits-player_character-bonus_distance",
      setting_type = "runtime-global",
      default_value = 999,
      maximum_value = 10000,
      minimum_value = 0,
      order = 241
    },
    {
      type = "double-setting",
      name = "a2x1_config_bits-player_character-bonus_inventory",
      setting_type = "runtime-global",
      default_value = 40,
      -- maximum_value = 100,
      minimum_value = 0,
      order = 242
    },
    -- data_item_modifier_assembler
    {
      type = "double-setting",
      name = "a2x1_config_bits-data_item_modifier_assembler-base_productivity",
      setting_type = "startup",
      default_value = 0,
      minimum_value = 0,
      order = 111
    },
    {
      type = "double-setting",
      name = "a2x1_config_bits-data_item_modifier_assembler-crafting_speed",
      setting_type = "startup",
      default_value = 700,
      minimum_value = 0,
      order = 112
    },
    -- data_item_modifier_furnace
    {
      type = "double-setting",
      name = "a2x1_config_bits-data_item_modifier_furnace-base_productivity",
      setting_type = "startup",
      default_value = 0,
      minimum_value = 0,
      order = 121
    },
    {
      type = "double-setting",
      name = "a2x1_config_bits-data_item_modifier_furnace-crafting_speed",
      setting_type = "startup",
      default_value = 300,
      minimum_value = 0,
      order = 122
    },
    -- data_item_modifier_mining
    {
      type = "double-setting",
      name = "a2x1_config_bits-data_item_modifier_mining-base_productivity",
      setting_type = "startup",
      default_value = 0,
      minimum_value = 0,
      order = 131
    },
    {
      type = "double-setting",
      name = "a2x1_config_bits-data_item_modifier_mining-mining_speed",
      setting_type = "startup",
      default_value = 300,
      minimum_value = 0,
      order = 132
    },
    -- data_item_modifier_inserter
    {
      type = "double-setting",
      name = "a2x1_config_bits-data_item_modifier_inserter-speed",
      setting_type = "startup",
      default_value = 0,
      minimum_value = 0,
      order = 141
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
      order = 151
    }
  }
)
