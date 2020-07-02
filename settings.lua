require "resources/data_raw_electric_pole"
require "resources/data_raw_assembling_machine"
require "resources/data_raw_container"
require "resources/data_raw_furnace"
require "resources/data_raw_inserter"
require "resources/data_raw_mining"
require "resources/data_raw_lab"

require "resources/game_players_zoom"
require "resources/game_surfaces_always_day"

require "resources/player_character"
require "resources/player_force"
require "resources/player_force_manual_crafting_speed"

__settings_startup__data_raw_electric_pole(data, 1)
__settings_startup__data_raw_container(data, 2)
__settings_startup__data_raw_inserter(data, 3)

__settings_startup__data_raw_assembling_machine(data, 4)
__settings_startup__data_raw_furnace(data, 5)
__settings_startup__data_raw_mining(data, 6)
__settings_startup__data_raw_lab(data, 7)


__settings_global__game_surfaces_always_day(data, 1)
__settings_global__player_force_manual_crafting_speed(data, 2)
__settings_global__player_force(data, 3)
__settings_global__player_character(data, 4)

__settings__user__game_players_zoom(data, 100)
