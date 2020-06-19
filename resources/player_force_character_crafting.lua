local settings_key = "a2x1-config-bits-player_force_character_crafting_speed_modifier"

function on_player_created_player_force_character_crafting(event)

    player = game.players[event.player_index]
    settings_value = settings.global[settings_key]["value"]

    setting_changed_player_force_character_crafting(event)

    if settings_value == "disabled" then
        player.insert {
            name = "assembling-machine-1",
            count = 1
        }
        player.insert {
            name = "small-electric-pole",
            count = 1
        }
        player.insert {
            name = "offshore-pump",
            count = 1
        }
        player.insert {
            name = "steam-engine",
            count = 1
        }
        player.insert {
            name = "boiler",
            count = 1
        }
    end
end

function setting_changed_player_force_character_crafting(event)

    player = game.players[event.player_index]
    settings_value = settings.global[settings_key]["value"]

    if settings_value == "disabled" then
        return setting_changed_player_force_character_crafting_disabled(player, event)
    else
        return setting_changed_player_force_character_crafting_enabled(player, event)
    end

end

function setting_changed_player_force_character_crafting_disabled(player, event)

    local group = game.permissions.get_group("Default")

    if group then
        if group.allows_action(defines.input_action.craft) ~= false then
            group.set_allows_action(defines.input_action.craft, false)
            -- player.print("Changed: game.permissions.group(Default).input_action.craft = false")
        end
    end

    if player.force.manual_crafting_speed_modifier ~= 0 then
        player.force.manual_crafting_speed_modifier = 0
        -- player.print("Changed: player.force.manual_crafting_speed_modifier = 0")
    end
end

function setting_changed_player_force_character_crafting_enabled(player, event)

    local group = game.permissions.get_group("Default")

    if group then
        if group.allows_action(defines.input_action.craft) ~= true then
            group.set_allows_action(defines.input_action.craft, true)
            -- player.print("Changed: game.permissions.group(Default).input_action.craft = true")
        end
    end

    local settings_value_number = tonumber(string.sub(settings_value, 1, -2))

    if player.force.manual_crafting_speed_modifier ~= settings_value_number then
        player.force.manual_crafting_speed_modifier = settings_value_number - 1
        -- player.print("Changed: player.force.manual_crafting_speed_modifier = " .. settings_value_number)
        -- http://lua-api.factorio.com/latest/LuaForce.html#LuaForce.manual_crafting_speed_modifier
        -- The actual crafting speed will be multiplied by 1 + manual_crafting_speed_modifier.
    end
end

