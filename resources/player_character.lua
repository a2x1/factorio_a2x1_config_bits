local settings_key_prefix = "a2x1_config_bits" .. "-" .. "player_character" .. "-"

function __settings_global__player_character(data, order)
  return data:extend(
    {
      {
        type = "double-setting",
        name = settings_key_prefix .. "pickup_distance",
        setting_type = "runtime-global",
        default_value = 0,
        maximum_value = 9999,
        minimum_value = 0,
        localised_name = "Player Pickup Distance",
        localised_description = "Player Item Pickup Distance",
        order = tonumber(order .. "1")
      },
      {
        type = "double-setting",
        name = settings_key_prefix .. "reach_distance",
        setting_type = "runtime-global",
        default_value = 9999,
        maximum_value = 9999,
        minimum_value = 0,
        localised_name = "Player Reach Distance",
        localised_description = "Player Build, Reach, Item drop, etc. Distance",
        order = tonumber(order .. "2")
      },
      {
        type = "double-setting",
        name = settings_key_prefix .. "character_inventory_slots_bonus",
        setting_type = "runtime-global",
        default_value = 40,
        minimum_value = 0,
        localised_name = "Player Extra Inventory Slots",
        localised_description = "Player Extra Inventory Slots\nDefault 40",
        order = tonumber(order .. "3")
      }
    }
  )
end

function __on_player_created__player_character(event)
  --

  __on_runtime_mod_setting_changed__player_character(event)
end

function __on_runtime_mod_setting_changed__player_character(event)
  --

  for _, player in pairs(game.players) do
    if player.character then
      --

      local reach_distance = settings.global[settings_key_prefix .. "reach_distance"].value

      player.character_build_distance_bonus = reach_distance
      player.character_reach_distance_bonus = reach_distance
      player.character_item_drop_distance_bonus = reach_distance
      player.character_resource_reach_distance_bonus = reach_distance

      local pickup_distance = settings.global[settings_key_prefix .. "pickup_distance"].value

      player.character_item_pickup_distance_bonus = math.min(pickup_distance, 320)
      player.character_loot_pickup_distance_bonus = math.min(pickup_distance, 320)

      player.character_inventory_slots_bonus = settings.global[settings_key_prefix .. "character_inventory_slots_bonus"].value
    --
    end
  end
end
