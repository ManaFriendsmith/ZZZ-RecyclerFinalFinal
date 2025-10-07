if not mods["quality"] then return end

--auto_recycle = vanilla control for whether recycle recipe is generated. It gets purged for no discernible reason other than spite, so needs to be copied.
--force_auto_recycle = if true on a recipe whose category is forbidden from recycling, it can be recycled anyway.
--can_recycle = if false on a recipe category, don't generate recycling recipes.
--canonical_recipe = goes on item prototypes. This determines which recipe is used to generate recycle products when that item is recycled. Usually doesn't need setting.
--set canonical_recipe to true to force an item to recycle into itself.
--set canonical_recipe to false to force an item to not be recyclable at all.
--bespoke = goes on custom recycling recipes like scrap recycling. I purge all existing recycling recipes and regenerate them from scratch. Bespoke recipes are ignored.

for k, recipe in pairs(data.raw.recipe) do
    if recipe.auto_recycle ~= nil then
        recipe.auto_recycle_bypass = recipe.auto_recycle
    end
end

local function set_property(tab, field, val)
    if tab then
        tab[field] = val
    end
end

--scrap-recycling is a generic enough name that it might be in other mods. i am pretty sure SE had a recipe called scrap-recycling.
if mods["space-age"] then
    data.raw.recipe["scrap-recycling"].bespoke = true
end

set_property(data.raw["recipe-category"]["recycling"], "can_recycle", false)
set_property(data.raw["recipe-category"]["smelting"], "can_recycle", false)
set_property(data.raw["recipe-category"]["chemistry"], "can_recycle", false)
set_property(data.raw["recipe-category"]["chemistry-or-cryogenics"], "can_recycle", false)
set_property(data.raw["recipe-category"]["crushing"], "can_recycle", false)
set_property(data.raw["recipe-category"]["metallurgy"], "can_recycle", false)
set_property(data.raw["recipe-category"]["organic"], "can_recycle", false)

set_property(data.raw.recipe["battery"], "force_auto_recycle", true)
set_property(data.raw.recipe["big-mining-drill"], "force_auto_recycle", true)
set_property(data.raw.recipe["turbo-transport-belt"], "force_auto_recycle", true)
set_property(data.raw.recipe["turbo-underground-belt"], "force_auto_recycle", true)
set_property(data.raw.recipe["turbo-splitter"], "force_auto_recycle", true)

set_property(data.raw.recipe["railgun-turret"], "force_auto_recycle", true)
set_property(data.raw.recipe["railgun"], "force_auto_recycle", true)
set_property(data.raw.recipe["cryogenic-plant"], "force_auto_recycle", true)
set_property(data.raw.recipe["fusion-reactor"], "force_auto_recycle", true)
set_property(data.raw.recipe["fusion-generator"], "force_auto_recycle", true)

set_property(data.raw.recipe["automation-science-pack"], "auto_recycle", false)
set_property(data.raw.recipe["logistic-science-pack"], "auto_recycle", false)
set_property(data.raw.recipe["military-science-pack"], "auto_recycle", false)
set_property(data.raw.recipe["chemical-science-pack"], "auto_recycle", false)
set_property(data.raw.recipe["utility-science-pack"], "auto_recycle", false)
set_property(data.raw.recipe["production-science-pack"], "auto_recycle", false)
set_property(data.raw.recipe["space-science-pack"], "auto_recycle", false)
set_property(data.raw.recipe["electromagnetic-science-pack"], "auto_recycle", false)

set_property(data.raw.item["superconductor"], "canonical_recipe", true)
set_property(data.raw.item["tungsten-carbide"], "canonical_recipe", true)
set_property(data.raw.item["biolab"], "canonical_recipe", true)
set_property(data.raw.item["captive-biter-spawner"], "canonical_recipe", true)