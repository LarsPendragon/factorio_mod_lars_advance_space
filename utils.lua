function change_recipe_ingredients(recipe_name, ingredients)
    if data.raw.recipe[recipe_name] then
        data.raw.recipe[recipe_name].ingredients = ingredients
    end
end

function change_recipe_results(recipe_name, results)
    if data.raw.recipe[recipe_name] then
        data.raw.recipe[recipe_name].results = results
    end
end