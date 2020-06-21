local settings_key_prefix = "a2x1_config_bits-player_force-"

function on_player_created_player_force(event)
    event.setting = "on_player_created"
    setting_changed_player_force(event)
end

function setting_changed_player_force(event)

    if event.setting == "on_player_created" or event.setting == settings_key_prefix ..
        "character_running_speed_modifier" then
        for _, player in pairs(game.players) do
            if player.character then
                local settings_value = settings.global[settings_key_prefix .. "character_running_speed_modifier"].value
                player.force.character_running_speed_modifier = settings_value / 100
            end
        end
    end

    if event.setting == "on_player_created" or event.setting == settings_key_prefix .. "character_mining_speed_modifier" then
        for _, player in pairs(game.players) do
            if player.character then
                local settings_value = settings.global[settings_key_prefix .. "character_mining_speed_modifier"].value
                player.force.manual_mining_speed_modifier = settings_value / 100
            end
        end
    end

    if event.setting == "on_player_created" or event.setting == settings_key_prefix .. "laboratory_speed_modifier" then
        for _, player in pairs(game.players) do
            if player.character then
                local laboratory_speed_modifier = settings.global[settings_key_prefix .. "laboratory_speed_modifier"]
                                                      .value
                if laboratory_speed_modifier ~= nil then
                    player.force.laboratory_speed_modifier = laboratory_speed_modifier
                end
            end
        end
    end
end
