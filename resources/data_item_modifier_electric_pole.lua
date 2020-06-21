--
--
-- https://wiki.factorio.com/Prototype/ElectricPole
--
--
-- supply_area_distance
-- Type: double
-- The "radius" of this pole's supply area. Corresponds to half of the "supply area" in the item tooltip. If this is 3.5, the pole will have a 7X7 supply area.
--
-- Max value is 64.
--
--
-- maximum_wire_distance
-- Type: double
-- Default: 0
-- The maximum distance between this pole and any other connected pole - if two poles are farther apart than this, they cannot be connected together directly. Corresponds to "wire reach" in the item tooltip.
--
-- Max value is 64.
--
--
local settings_key = "a2x1_config_bits-data_item_modifier_electric_pole"

local settings_value = settings.startup[settings_key]["value"]

if settings_value == "disabled" then
    return
end

for k, v in pairs(data.raw["electric-pole"]) do
    v.supply_area_distance = v.maximum_wire_distance * settings_value / 100

    if v.supply_area_distance * 2 > 64 then
        v.maximum_wire_distance = 64
    else
        v.maximum_wire_distance = 2 * v.supply_area_distance
    end
end
