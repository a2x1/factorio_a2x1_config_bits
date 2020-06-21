--
--
-- https://wiki.factorio.com/Prototype/Furnace
--
-- https://wiki.factorio.com/Prototype/CraftingMachine#base_productivity
-- https://wiki.factorio.com/Prototype/CraftingMachine#crafting_speed
--
--
local settings_key_prefix = "a2x1_config_bits-data_item_modifier_furnace-"

for k, v in pairs(data.raw["furnace"]) do
    local base_productivity = settings.startup[settings_key_prefix .. "base_productivity"]["value"]

    v.base_productivity = base_productivity / 100

    local crafting_speed = settings.startup[settings_key_prefix .. "crafting_speed"]["value"]

    if crafting_speed ~= nil then
        v.crafting_speed = v.crafting_speed + v.crafting_speed * crafting_speed / 100
    end
end
