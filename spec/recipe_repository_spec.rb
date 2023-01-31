require "recipe_repository"

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do
    reset_recipes_table
  end
  
  it "returns information on all recipes in the database" do
    repo = RecipeRepository.new
    recipes = repo.all
    expect(recipes.length).to eq 5
    expect(recipes.first.name).to eq "Spahgetti bolognese"
    expect(recipes[2].rating).to eq "5"
  end

  it "returns a single recipe for a method to be used on" do
    repo = RecipeRepository.new
    recipe = repo.find(2)
    expect(recipe.id).to eq "2" # =>  1
    expect(recipe.name).to eq "Chicken tikka masala" # => 'Chicken tikka masala"
    expect(recipe.cooking_time).to eq "30" # => '30'
    expect(recipe.rating).to eq "3" # => 3
  end
end