data:extend({
    -- game_surfaces_always_day
    {
        type = "string-setting",
        name = "a2x1-config-bits-game_surfaces_always_day",
        setting_type = "runtime-global",
        default_value = "enabled",
        allowed_values = {
            "enabled",
            "disabled"
        }
    },
    -- player_force_character_crafting
    {
        type = "string-setting",
        name = "a2x1-config-bits-player_force_character_crafting_speed_modifier",
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
    -- player_force_character
    {
        type = "int-setting",
        name = "a2x1-config-bits-player_force_character_running_speed_modifier",
        setting_type = "runtime-global",
        default_value = 100,
        minimum_value = 0
    },
    {
        type = "int-setting",
        name = "a2x1-config-bits-player_force_character_mining_speed_modifier",
        setting_type = "runtime-global",
        default_value = 100,
        minimum_value = 0
    },
    -- player_force
    {
        type = "int-setting",
        name = "a2x1-config-bits-player_force_laboratory_speed_modifier",
        setting_type = "runtime-global",
        default_value = 0,
        minimum_value = 0
    },
    -- player_character_bonus
    {
        type = "int-setting",
        name = "a2x1-config-bits-player_character_bonus_distance",
        setting_type = "runtime-global",
        default_value = 999,
        maximum_value = 10000,
        minimum_value = 0
    },
    {
        type = "int-setting",
        name = "a2x1-config-bits-player_character_bonus_inventory",
        setting_type = "runtime-global",
        default_value = 0,
        maximum_value = 100,
        minimum_value = 0
    },
    -- data_item_base_productivity
    {
        type = "int-setting",
        name = "a2x1-config-bits-data_item_base_productivity_furnace",
        setting_type = "startup",
        default_value = 100,
        minimum_value = 0
    },
    {
        type = "int-setting",
        name = "a2x1-config-bits-data_item_base_productivity_mining_drill",
        setting_type = "startup",
        default_value = 100,
        minimum_value = 0
    },
    {
        type = "int-setting",
        name = "a2x1-config-bits-data_item_base_productivity_assembling_machine",
        setting_type = "startup",
        default_value = 100,
        minimum_value = 0
    },
    -- data_item_supply_distance_electric_pole
    {
        type = "string-setting",
        name = "a2x1-config-bits-data_item_supply_distance_electric_pole",
        setting_type = "startup",
        default_value = "1.0",
        allowed_values = {
            "disabled",
            "1.0",
            "1.5",
            "2.0"
        }
    }
})
