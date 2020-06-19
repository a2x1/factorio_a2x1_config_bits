local settings_key = "a2x1-config-bits-game_surfaces_always_day"

function on_player_created_game_surfaces_always_day(event)
  setting_changed_game_surfaces_always_day(event)
end

function setting_changed_game_surfaces_always_day(event)

    player = game.players[event.player_index]
    settings_value = settings.global[settings_key]["value"]

    if settings_value == "enabled" and game.surfaces[1].always_day == true then
        return
    end

    if settings_value == "disabled" and game.surfaces[1].always_day == false then
        return
    end

    if settings_value == "enabled" then

        game.surfaces[1].always_day = true
        -- player.print("Changed: game.surfaces[1].always_day = true")
        return
    end

    if settings_value == "disabled" then

        game.surfaces[1].always_day = false
        -- player.print("Changed: game.surfaces[1].always_day = false")
        return
    end
end
