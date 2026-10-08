local OV = angelsmods.functions.OV

angelsmods.functions.modify_barreling_recipes()
-- 禁用液体燃料
OV.remove_unlock("flammables", "bob-liquid-fuel")
OV.remove_unlock("flammables", "bob-enriched-fuel")
OV.remove_unlock("bob-fluid-canister-processing", "bob-liquid-fuel-barrel")
OV.remove_unlock("bob-fluid-canister-processing", "empty-bob-liquid-fuel-barrel")
-- 禁用液氢液氧
OV.remove_unlock("bob-fluid-canister-processing", "lars-liquid-oxygen-barrel")
OV.remove_unlock("bob-fluid-canister-processing", "empty-lars-liquid-oxygen-barrel")
OV.remove_unlock("bob-fluid-canister-processing", "lars-liquid-hydroxide-barrel")
OV.remove_unlock("bob-fluid-canister-processing", "empty-lars-liquid-hydroxide-barrel")


-- 燃烧塔处理
angelsmods.functions.make_void("lars-kerosene", "chemical")
angelsmods.functions.make_void("lars-diesel-fuel", "chemical")
angelsmods.functions.make_void("lars-liquid-hydroxide", "chemical")

