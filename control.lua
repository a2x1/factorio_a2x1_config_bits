require "resources/player_force"
require "resources/player_force-character_crafting"
require "resources/player_character"
require "resources/game_surfaces_always_day"

script.on_event(
  defines.events.on_player_created,
  function(event)
    -- game.players[1].print("script.on_event defines.events.on_player_created")

    on_player_created_player_force(event)
    on_player_created_player_force_character_crafting(event)
    on_player_created_player_character(event)
    on_player_created_game_surfaces_always_day(event)
  end
)

script.on_event(
  defines.events.on_runtime_mod_setting_changed,
  function(event)
    -- game.players[1].print("script.on_event defines.events.on_runtime_mod_setting_changed")

    setting_changed_player_force(event)
    setting_changed_player_force_character_crafting(event)
    setting_changed_player_character(event)
    setting_changed_game_surfaces_always_day(event)
  end
)
