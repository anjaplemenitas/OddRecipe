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
    #name?
    email: user,
    password: 'password',
  )

  puts "Boss #{user} made!"
end

puts "---------------------------" * 2

puts "Creating Medium Oddbox!"

oddbox = Oddbox.new(name: "Medium Oddbox", ingredients: "Potatoes, Aubergines, Rocket, Spring Onions, Spring Greens, Cauliflower, Mushrooms, Celery")

puts "Creating Medium Oddbox!"

oddbox_ingredients = Ingredients.new()

puts "---------------------------" * 2

puts "Creating Recipes!"

10.times do
recipes = Recipe.new(
  name: Faker::Food.dish
  rating: (0..5).sample
  description: Faker::Food.description
  cooking_time: "10 minutes"
  substitute: Faker::Food.ingredient
  leftover: Faker::Food.vegetables
  store_recipe: "1 week"
)
  recipes.save
end

puts "---------------------------" * 2

puts "Creating Reviews"

10.times do
review = Review.new(
  content: Faker::Quote.famous_last_words
  rating: (0..5).sample
)
  review.save
end

puts "---------------------------" * 2
