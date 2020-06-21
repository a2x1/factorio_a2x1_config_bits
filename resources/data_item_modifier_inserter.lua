--
--
-- https://wiki.factorio.com/Prototype/Inserter
--
-- https://wiki.factorio.com/Prototype/Inserter#extension_speed
-- https://wiki.factorio.com/Prototype/Inserter#rotation_speed
--
--
local settings_key_prefix = "a2x1_config_bits-data_item_modifier_inserter-"

for k, v in pairs(data.raw["inserter"]) do
  local speed = settings.startup[settings_key_prefix .. "speed"]["value"]

  if speed ~= nil then
    v.extension_speed = v.extension_speed + v.extension_speed * speed / 100
    v.rotation_speed = v.rotation_speed + v.rotation_speed * speed / 100
  end
end
