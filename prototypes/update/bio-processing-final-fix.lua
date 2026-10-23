require("lars-utils")

-- 根据设置修改变质时间
local fish_spoil_seconds = settings.startup["lars-fish-spoilage-time-seconds"].value
local meat_spoil_seconds = settings.startup["lars-meat-spoilage-time-seconds"].value
local crop_spoil_seconds = settings.startup["lars-crop-spoilage-time-seconds"].value
local seed_spoil_seconds = settings.startup["lars-seed-spoilage-time-seconds"].value
local product_spoil_seconds = settings.startup["lars-crop-product-spoilage-time-seconds"].value

-- 鱼类
utils.modify_spoil_time("raw-fish", fish_spoil_seconds)
utils.modify_spoil_time("angels-alien-fish-1-raw", fish_spoil_seconds)
utils.modify_spoil_time("angels-alien-fish-2-raw", fish_spoil_seconds)
utils.modify_spoil_time("angels-alien-fish-3-raw", fish_spoil_seconds)

-- 生肉
utils.modify_spoil_time("angels-bio-raw-meat", meat_spoil_seconds)
utils.modify_spoil_time("angels-fish-pulp", meat_spoil_seconds)

-- 河豚
utils.modify_spoil_time("angels-bio-puffer-1", fish_spoil_seconds)
--utils.modify_spoil_time("angels-bio-puffer-2", fish_spoil_seconds) -- 腐臭河豚不会变质
utils.modify_spoil_time("angels-bio-puffer-3", fish_spoil_seconds)
utils.modify_spoil_time("angels-bio-puffer-4", fish_spoil_seconds)
utils.modify_spoil_time("angels-bio-puffer-5", fish_spoil_seconds)

-- 植物
utils.modify_spoil_time("angels-temperate-1", crop_spoil_seconds)
utils.modify_spoil_time("angels-temperate-2", crop_spoil_seconds)
utils.modify_spoil_time("angels-temperate-3", crop_spoil_seconds)
utils.modify_spoil_time("angels-temperate-4", crop_spoil_seconds)
utils.modify_spoil_time("angels-temperate-5", crop_spoil_seconds)
utils.modify_spoil_time("angels-swamp-1", crop_spoil_seconds)
utils.modify_spoil_time("angels-swamp-2", crop_spoil_seconds)
utils.modify_spoil_time("angels-swamp-3", crop_spoil_seconds)
utils.modify_spoil_time("angels-swamp-4", crop_spoil_seconds)
utils.modify_spoil_time("angels-swamp-5", crop_spoil_seconds)
utils.modify_spoil_time("angels-desert-1", crop_spoil_seconds)
utils.modify_spoil_time("angels-desert-2", crop_spoil_seconds)
utils.modify_spoil_time("angels-desert-3", crop_spoil_seconds)
utils.modify_spoil_time("angels-desert-4", crop_spoil_seconds)
utils.modify_spoil_time("angels-desert-5", crop_spoil_seconds)

-- 植物种子
utils.modify_spoil_time("angels-temperate-1-seed", seed_spoil_seconds)
utils.modify_spoil_time("angels-temperate-2-seed", seed_spoil_seconds)
utils.modify_spoil_time("angels-temperate-3-seed", seed_spoil_seconds)
utils.modify_spoil_time("angels-temperate-4-seed", seed_spoil_seconds)
utils.modify_spoil_time("angels-temperate-5-seed", seed_spoil_seconds)
utils.modify_spoil_time("angels-swamp-1-seed", seed_spoil_seconds)
utils.modify_spoil_time("angels-swamp-2-seed", seed_spoil_seconds)
utils.modify_spoil_time("angels-swamp-3-seed", seed_spoil_seconds)
utils.modify_spoil_time("angels-swamp-4-seed", seed_spoil_seconds)
utils.modify_spoil_time("angels-swamp-5-seed", seed_spoil_seconds)
utils.modify_spoil_time("angels-desert-1-seed", seed_spoil_seconds)
utils.modify_spoil_time("angels-desert-2-seed", seed_spoil_seconds)
utils.modify_spoil_time("angels-desert-3-seed", seed_spoil_seconds)
utils.modify_spoil_time("angels-desert-4-seed", seed_spoil_seconds)
utils.modify_spoil_time("angels-desert-5-seed", seed_spoil_seconds)

-- 植物产物
utils.modify_spoil_time("angels-solid-beans", product_spoil_seconds)
utils.modify_spoil_time("angels-solid-corn", product_spoil_seconds)
utils.modify_spoil_time("angels-solid-leafs", product_spoil_seconds)
utils.modify_spoil_time("angels-solid-nuts", product_spoil_seconds)
utils.modify_spoil_time("angels-solid-pips", product_spoil_seconds)
utils.modify_spoil_time("angels-solid-fruit", product_spoil_seconds)