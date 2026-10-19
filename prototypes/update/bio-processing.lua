local OV = angelsmods.functions.OV
require("utils")

local MINUTE = 60
local HOUR = 60 * 60
local DEFAULT_SPOIL_TIME = 7550 -- 默认变质时间7550秒
local DEFAULT_SPOILAGE = "spoilage"

-- 给天使生物添加变质时间
-- 鱼类 ：7550s；肉类：3600s
utils.add_spoil("angels-alien-fish-1-raw", DEFAULT_SPOIL_TIME, DEFAULT_SPOILAGE)
utils.add_spoil("angels-alien-fish-2-raw", DEFAULT_SPOIL_TIME, DEFAULT_SPOILAGE)
utils.add_spoil("angels-alien-fish-3-raw", DEFAULT_SPOIL_TIME, DEFAULT_SPOILAGE)

utils.add_spoil("angels-bio-raw-meat", 1*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-fish-pulp", 1*HOUR, DEFAULT_SPOILAGE)

utils.add_spoil("angels-bio-puffer-1", DEFAULT_SPOIL_TIME, DEFAULT_SPOILAGE)
--utils.add_spoil("angels-bio-puffer-2", DEFAULT_SPOIL_TIME, DEFAULT_SPOILAGE) -- 腐臭河豚不会变质
utils.add_spoil("angels-bio-puffer-3", DEFAULT_SPOIL_TIME, DEFAULT_SPOILAGE)
utils.add_spoil("angels-bio-puffer-4", DEFAULT_SPOIL_TIME, DEFAULT_SPOILAGE)
utils.add_spoil("angels-bio-puffer-5", DEFAULT_SPOIL_TIME, DEFAULT_SPOILAGE)

-- 植物：14400s； 植物种子: 21600s； 休眠种子无变质
utils.add_spoil("angels-temperate-1", 4*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-temperate-2", 4*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-temperate-3", 4*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-temperate-4", 4*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-temperate-5", 4*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-swamp-1", 4*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-swamp-2", 4*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-swamp-3", 4*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-swamp-4", 4*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-swamp-5", 4*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-desert-1", 4*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-desert-2", 4*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-desert-3", 4*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-desert-4", 4*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-desert-5", 4*HOUR, DEFAULT_SPOILAGE)

utils.add_spoil("angels-temperate-1-seed", 6*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-temperate-2-seed", 6*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-temperate-3-seed", 6*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-temperate-4-seed", 6*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-temperate-5-seed", 6*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-swamp-1-seed", 6*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-swamp-2-seed", 6*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-swamp-3-seed", 6*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-swamp-4-seed", 6*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-swamp-5-seed", 6*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-desert-1-seed", 6*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-desert-2-seed", 6*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-desert-3-seed", 6*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-desert-4-seed", 6*HOUR, DEFAULT_SPOILAGE)
utils.add_spoil("angels-desert-5-seed", 6*HOUR, DEFAULT_SPOILAGE)

-- 植物产物：7550s
utils.add_spoil("angels-solid-beans", DEFAULT_SPOIL_TIME, DEFAULT_SPOILAGE)
utils.add_spoil("angels-solid-corn", DEFAULT_SPOIL_TIME, DEFAULT_SPOILAGE)
utils.add_spoil("angels-solid-leafs", DEFAULT_SPOIL_TIME, DEFAULT_SPOILAGE)
utils.add_spoil("angels-solid-nuts", DEFAULT_SPOIL_TIME, DEFAULT_SPOILAGE)
utils.add_spoil("angels-solid-pips", DEFAULT_SPOIL_TIME, DEFAULT_SPOILAGE)
utils.add_spoil("angels-solid-fruit", DEFAULT_SPOIL_TIME, DEFAULT_SPOILAGE)


-- 给天使生物配方增加输出新鲜度设置
utils.set_recipe_always_fresh("angels-fish-keeping-0")
utils.set_recipe_always_fresh("angels-fish-keeping-1")
utils.set_recipe_always_fresh("angels-fish-keeping-2")
utils.set_recipe_always_fresh("angels-fish-keeping-3")
utils.set_recipe_always_fresh("angels-alien-fish-0-raw")
utils.set_recipe_always_fresh("angels-alien-fish-1-raw")
utils.set_recipe_always_fresh("angels-alien-fish-2-raw")
utils.set_recipe_always_fresh("angels-alien-fish-3-raw")

utils.set_recipe_always_fresh("angels-puffer-puffing-1")
utils.set_recipe_always_fresh("angels-puffer-puffing-2")
utils.set_recipe_always_fresh("angels-puffer-puffing-3")
utils.set_recipe_always_fresh("angels-puffer-puffing-4")
utils.set_recipe_always_fresh("angels-puffer-puffing-5")
utils.set_recipe_always_fresh("angels-puffer-puffing-23")
utils.set_recipe_always_fresh("angels-puffer-puffing-12")
utils.set_recipe_always_fresh("angels-puffer-puffing-13")
utils.set_recipe_always_fresh("angels-puffer-puffing-14")
utils.set_recipe_always_fresh("angels-puffer-puffing-15")
utils.set_recipe_always_fresh("angels-puffer-breeding-23")
utils.set_recipe_always_fresh("angels-puffer-breeding-12")
utils.set_recipe_always_fresh("angels-puffer-breeding-13")
utils.set_recipe_always_fresh("angels-puffer-breeding-14")
utils.set_recipe_always_fresh("angels-puffer-breeding-15")

utils.set_recipe_always_fresh("angels-fish-butchery-0")
utils.set_recipe_always_fresh("angels-fish-butchery-1")
utils.set_recipe_always_fresh("angels-fish-butchery-2")
utils.set_recipe_always_fresh("angels-fish-butchery-3")
utils.set_recipe_always_fresh("angels-puffer-butchery-1")
utils.set_recipe_always_fresh("angels-puffer-butchery-2")
utils.set_recipe_always_fresh("angels-puffer-butchery-3")
utils.set_recipe_always_fresh("angels-puffer-butchery-4")
utils.set_recipe_always_fresh("angels-puffer-butchery-5")

utils.set_recipe_always_fresh("angels-sorting-temperate-1")
utils.set_recipe_always_fresh("angels-sorting-temperate-2")
utils.set_recipe_always_fresh("angels-sorting-temperate-3")
utils.set_recipe_always_fresh("angels-sorting-temperate-4")
utils.set_recipe_always_fresh("angels-sorting-temperate-5")
utils.set_recipe_always_fresh("angels-sorting-swamp-1")
utils.set_recipe_always_fresh("angels-sorting-swamp-2")
utils.set_recipe_always_fresh("angels-sorting-swamp-3")
utils.set_recipe_always_fresh("angels-sorting-swamp-4")
utils.set_recipe_always_fresh("angels-sorting-swamp-5")
utils.set_recipe_always_fresh("angels-sorting-desert-1")
utils.set_recipe_always_fresh("angels-sorting-desert-2")
utils.set_recipe_always_fresh("angels-sorting-desert-3")
utils.set_recipe_always_fresh("angels-sorting-desert-4")
utils.set_recipe_always_fresh("angels-sorting-desert-5")

