local settings_key_prefix = "a2x1_config_bits-player_force-"

function on_player_created_player_force(event)
  event.setting = "on_player_created"
  setting_changed_player_force(event)
end

function setting_changed_player_force(event)
  if event.setting == "on_player_created" or event.setting == settings_key_prefix .. "character_running_speed_modifier" then
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
        local laboratory_speed_modifier = settings.global[settings_key_prefix .. "laboratory_speed_modifier"].value
        if laboratory_speed_modifier ~= nil then
          player.force.laboratory_speed_modifier = laboratory_speed_modifier
        end
      end
    end
  end

  if event.setting == "on_player_created" or event.setting == settings_key_prefix .. "stack_inserter_capacity_bonus" then
    for _, player in pairs(game.players) do
      if player.character then
        local stack_inserter_capacity_bonus = settings.global[settings_key_prefix .. "stack_inserter_capacity_bonus"].value
        if stack_inserter_capacity_bonus ~= nil then
          player.force.stack_inserter_capacity_bonus = stack_inserter_capacity_bonus
        end
      end
    end
  end

  if event.setting == "on_player_created" or event.setting == settings_key_prefix .. "inserter_stack_size_bonus" then
    for _, player in pairs(game.players) do
      if player.character then
        local inserter_stack_size_bonus = settings.global[settings_key_prefix .. "inserter_stack_size_bonus"].value
        if inserter_stack_size_bonus ~= nil then
          player.force.inserter_stack_size_bonus = inserter_stack_size_bonus
        end
      end
    end
  end
end
