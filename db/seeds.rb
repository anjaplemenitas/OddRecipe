# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'nokogiri'
require 'open-uri'

puts "Making the bosses!"

['al@boss.com', 'anja@boss.com', 'alex@boss.com'].each do |user|
  User.create(
    first_name: "First",
    last_name: "Last",
    email: user,
    password: 'password'
  )

  puts "Boss #{user} made!"
end

puts "---------------------------" * 2

puts "Creating Medium Oddbox!"

Oddbox.create(name: "Medium Oddbox", user_id: 1)

puts "Creating Recipes!"

odd_url = URI.open("https://www.oddbox.co.uk/recipes")
odd_noko = Nokogiri::HTML(odd_url)

names = odd_noko.search(".curated-posts-section__post-title h1").map(&:text)
urls = odd_noko.search(".curated-posts-section__post a").map do |link|
  link["href"] if link["href"].include?("recipes")
end

urls.compact!

descriptions = []
method = []
ingredients = []

urls.each do |url|
  temp_noko = Nokogiri::HTML(URI.open("https://www.oddbox.co.uk#{url}"))
  temp_ingredients = temp_noko.search(".recipe__ingredients p").map do |ing|
    x = ing.text.match(/^\w?\d*\W?\s*(g|ml|tbsp|tsp)?\s*(?<ing>[a-zA-Z][a-z]*\s?[a-zA-Z|&]*\s?[a-zA-Z]*)/)
    x['ing'].strip unless x['ing'].strip.nil?
  end

  ingredients << temp_ingredients
  descriptions << temp_noko.search(".post__description p").text

  temp_method = temp_noko.search(".recipe__content li").map(&:text)

  method << temp_method
end

ind_ing = ingredients.join(", ").split(", ").sort.uniq

ind_ing.each do |ing|
  Ingredient.create(name: ing)
end

puts "Creating Medium Oddbox Ingredients!"

["Avocado",
 "Beetroots",
 "Cavolo nero",
 "Brussels sprouts",
 "Carrots",
 "Cucumbers",
 "Ginger",
 "Limes",
 "Mango"].each do |ing|
  OddboxIngredient.create(oddbox_id: 1, ingredient_id: Ingredient.find_by(name: ing).id)
end

puts "---------------------------" * 2

names.each_with_index do |name, index|
  recipe = Recipe.new(
    name: name,
    description: descriptions[index],
    cooking_time: [10, 15, 20, 25, 30, 35, 40].sample,
    leftover: Faker::Food.vegetables,
    storage: "1 week",
    method: method[index],
    substitute: Faker::Food.fruits
  )

  recipe.save

  ingredients[index].each do |ing|
    RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: Ingredient.find_by(name: ing).id)
  end
end

puts "---------------------------" * 2

puts "Creating Reviews"

150.times do
  review = Review.new(
    content: Faker::Quote.famous_last_words,
    rating: rand(1..5),
    user_id: rand(1..3),
    recipe_id: rand(1..24)
  )
  review.save
end

puts "---------------------------" * 2

puts "Finished"
