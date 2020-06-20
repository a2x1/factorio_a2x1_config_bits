local settings_key_prefix = "a2x1-config-bits-"

function on_player_created_player_force_character(event)
    event.setting = "on_player_created"
    setting_changed_player_force_character(event)
end

function setting_changed_player_force_character(event)

    if event.setting == "on_player_created" or event.setting == settings_key_prefix .. "player_force_character_running_speed_modifier" then
        for _, player in pairs(game.players) do
            if player.character then
                local settings_value = settings.global[settings_key_prefix .. "player_force_character_running_speed_modifier"].value
                player.force.character_running_speed_modifier = settings_value / 100
            end
        end
    end

    if event.setting == "on_player_created" or event.setting == settings_key_prefix .. "player_force_character_mining_speed_modifier" then
        for _, player in pairs(game.players) do
            if player.character then
                local settings_value = settings.global[settings_key_prefix .. "player_force_character_mining_speed_modifier"].value
                player.force.manual_mining_speed_modifier = settings_value / 100
            end
        end
    end
end
