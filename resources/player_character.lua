local settings_key_prefix = "a2x1_config_bits-player_character-"

function on_player_created_player_character(event)
    event.setting = "on_player_created"
    setting_changed_player_character(event)
end

function setting_changed_player_character(event)

    if event.setting == "on_player_created" or event.setting == settings_key_prefix .. "bonus_distance" then
        for _, player in pairs(game.players) do
            if player.character then
                local settings_value = settings.global[settings_key_prefix .. "bonus_distance"].value
                player.character_build_distance_bonus = settings_value
                player.character_reach_distance_bonus = settings_value
                player.character_item_drop_distance_bonus = settings_value
                player.character_resource_reach_distance_bonus = settings_value
                player.character_item_pickup_distance_bonus = math.min(settings_value, 320)
                player.character_loot_pickup_distance_bonus = math.min(settings_value, 320)
            end
        end
    end

    if event.setting == "on_player_created" or event.setting == settings_key_prefix .. "bonus_inventory" then
        for _, player in pairs(game.players) do
            if player.character then
                local settings_value = settings.global[settings_key_prefix .. "bonus_inventory"].value
                player.character_inventory_slots_bonus = settings_value
            end
        end
    end
end
