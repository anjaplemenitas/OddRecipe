# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#require
require 'faker'

puts "Making the bosses!"

['al@boss.com', 'anja@boss.com', 'alex@boss.com'].each do |user|
  User.create(
    first_name: "First Name",
    last_name: "Last Name",
    email: user,
    password: 'password'
  )

  puts "Boss #{user} made!"
end

puts "---------------------------" * 2

puts "Creating Medium Oddbox!"

oddbox = Oddbox.create(name: "Medium Oddbox", user_id: 1)

puts "Creating Medium Oddbox Ingredients!"

oddbox_ingredients = ["Potatoe", "Aubergine", "Rocket", "Spring Onion", "Spring Green", "Cauliflower", "Mushroom", "Celery"]
oddbox_ingredients.each do |oddbox_ingredient|
  Ingredient.create(name: oddbox_ingredient)
end

oddbox_ingredients.each do |ing|
  OddboxIngredient.create(oddbox_id: 1, ingredient_id: Ingredient.find_by(name: ing).id)
end

puts "---------------------------" * 2

puts "Creating Recipes!"

10.times do
  recipes = Recipe.new(
    name: Faker::Food.dish,
    description: Faker::Food.description,
    cooking_time: "10 minutes",
    leftover: Faker::Food.vegetables,
    storage: "1 week"
  )
  recipes.save
  5.times do
   RecipeIngredient.create(recipe_id: recipes.id, ingredient_id: Ingredient.all.sample.id)
  end
end

puts "---------------------------" * 2

puts "Creating Reviews"

10.times do
review = Review.new(
  content: Faker::Quote.famous_last_words,
  rating: rand(0..5),
  user_id: rand(1..3),
  recipe_id: rand(1..10)
)
  review.save
end

puts "---------------------------" * 2

puts "Finished"
