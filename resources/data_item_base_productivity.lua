--
-- https://wiki.factorio.com/Prototype/Furnace
-- https://wiki.factorio.com/Prototype/MiningDrill
-- https://wiki.factorio.com/Prototype/AssemblingMachine
--
--
for k, v in pairs(data.raw["furnace"]) do
    local settings_value = settings.startup["a2x1-config-bits-data_item_base_productivity_furnace"]["value"]
    v.base_productivity = settings_value / 100
end

for k, v in pairs(data.raw["mining-drill"]) do
    local settings_value = settings.startup["a2x1-config-bits-data_item_base_productivity_mining_drill"]["value"]
    v.base_productivity = settings_value / 100
end

for k, v in pairs(data.raw["assembling-machine"]) do
    local settings_value = settings.startup["a2x1-config-bits-data_item_base_productivity_assembling_machine"]["value"]
    v.base_productivity = settings_value / 100
end
