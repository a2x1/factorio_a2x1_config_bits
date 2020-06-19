local settings_key_prefix = "a2x1-config-bits-"

function on_player_created_player_force(event)
    event.setting = "on_player_created"
    setting_changed_player_force(event)
end

function setting_changed_player_force(event)
    if event.setting == "on_player_created" or event.setting == settings_key_prefix .. "player_force_laboratory_speed_modifier" then
        for _, player in pairs(game.players) do
            if player.character then
                local settings_value = settings.global[settings_key_prefix .. "player_force_laboratory_speed_modifier"].value
                player.force.laboratory_speed_modifier = settings_value
            end
        end
    end
end
