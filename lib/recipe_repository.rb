require_relative './recipe'

class RecipeRepository
  def all
    sql = 'SELECT * FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])

    recipes = []

    result_set.each{ 
    |record|
    recipe = Recipe.new
    recipe.name = record['recipe_name']
    recipe.cooking_time = record['cooking_time']
    recipe.rating = record['rating']
    recipes << recipe
    }

    return recipes

  end

  def find(id)
    sql = 'SELECT * FROM recipes WHERE id = $1'
    sql_param = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_param)
    record = result_set[0]
    recipe = Recipe.new
    recipe.id = record['id']
    recipe.name = record['recipe_name']
    recipe.cooking_time = record['cooking_time']
    recipe.rating = record['rating']
    return recipe
  end

end