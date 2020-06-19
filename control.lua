require "resources/player_force"
require "resources/player_force_character"
require "resources/player_force_character_crafting"
require "resources/player_character_bonus"
require "resources/game_surfaces_always_day"

script.on_event(defines.events.on_player_created, function(event)
    -- game.players[1].print("script.on_event defines.events.on_player_created")

    on_player_created_player_force(event)
    on_player_created_player_force_character(event)
    on_player_created_player_force_character_crafting(event)
    on_player_created_player_character_bonus(event)
    on_player_created_game_surfaces_always_day(event)
end)

script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
    -- game.players[1].print("script.on_event defines.events.on_runtime_mod_setting_changed")

    setting_changed_player_force(event)
    setting_changed_player_force_character(event)
    setting_changed_player_force_character_crafting(event)
    setting_changed_player_character_bonus(event)
    setting_changed_game_surfaces_always_day(event)
end)

-- function on_player_created(player)
--     player.print("A2x1 Config Bits Loaded")

--     -- player.insert {
--     --     name = "small-electric-pole",
--     --     count = 1
--     -- }
--     -- player.insert {
--     --     name = "medium-electric-pole",
--     --     count = 1
--     -- }
--     -- player.insert {
--     --     name = "big-electric-pole",
--     --     count = 1
--     -- }
--     -- player.insert {
--     --     name = "substation",
--     --     count = 1
--     -- }
-- end
