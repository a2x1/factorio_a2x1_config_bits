--
--
-- https://wiki.factorio.com/Prototype/MiningDrill
--
-- https://wiki.factorio.com/Prototype/MiningDrill#base_productivity
-- https://wiki.factorio.com/Prototype/MiningDrill#mining_speed
--
--
local settings_key_prefix = "a2x1-config-bits-data_item_modifier_mining-"

for k, v in pairs(data.raw["mining-drill"]) do
    local base_productivity = settings.startup[settings_key_prefix .. "base_productivity"]["value"]

    v.base_productivity = base_productivity / 100

    local mining_speed = settings.startup[settings_key_prefix .. "mining_speed"]["value"]

    if mining_speed ~= nil then
        v.mining_speed = v.mining_speed + v.mining_speed * mining_speed / 100
    end
end
