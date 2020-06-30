require "resources/game_players_zoom"
require "resources/game_surfaces_always_day"

require "resources/player_character"
require "resources/player_force"
require "resources/player_force_manual_crafting_speed"

__script__game_players_zoom(script)

script.on_event(
  defines.events.on_player_created,
  function(event)
    --

    __on_player_created__game_surfaces_always_day(event)
    __on_player_created__player_force_manual_crafting_speed(event)
    __on_player_created__player_force(event)
    __on_player_created__player_character(event)
  end
)

script.on_event(
  defines.events.on_runtime_mod_setting_changed,
  function(event)
    --

    __on_runtime_mod_setting_changed__game_surfaces_always_day(event)
    __on_runtime_mod_setting_changed__player_force_manual_crafting_speed(event)
    __on_runtime_mod_setting_changed__player_force(event)
    __on_runtime_mod_setting_changed__player_character(event)
  end
)
