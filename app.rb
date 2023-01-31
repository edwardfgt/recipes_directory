require_relative "lib/database_connection"
require_relative "lib/recipe_repository"

results = DatabaseConnection.connect('recipes_directory')

recipe_repository = RecipeRepository.new

recipe_repository.all.each{
  |recipe|
  p "#{recipe.name} - Cooking Time: #{recipe.cooking_time} - Rating: #{recipe.rating}"
}