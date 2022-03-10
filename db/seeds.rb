# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'faker'
# require 'nokogiri'
# require 'open-uri'

# puts "Making the bosses!"

# ['al@boss.com', 'anja@boss.com', 'alex@boss.com'].each do |user|
#   User.create(
#     first_name: user[0..-10].capitalize,
#     last_name: Faker::Name.last_name,
#     email: user,
#     password: 'password'
#   )

#   puts "Boss #{user[0..-10].capitalize} made!"
# end

# 7.times do
#   User.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: 'password'
#   )
# end

# puts "---------------------------"

# puts "Creating Medium Oddbox!"

# 3.times do |id|
#   Oddbox.create(name: "Medium Oddbox", user_id: id + 1)
# end

# puts "Creating Recipes!"

# names = []
# image_urls = []
# urls = []

# 3.times do |x|
#   odd_url = URI.open("https://www.oddbox.co.uk/recipes/page/#{x + 1}")
#   odd_noko = Nokogiri::HTML(odd_url)

#   names << odd_noko.search(".curated-posts-section__post-title h1").map(&:text)

#   image_urls << odd_noko.search(".curated-posts-section__post img").map do |y|
#     unless y['src'].nil?
#       y['src'] if y['src'].include?('prismic')
#     end
#   end
#   image_urls[x].compact!

#   urls << odd_noko.search(".curated-posts-section__post a").map do |link|
#     link["href"] if link["href"].include?("recipes")
#   end
#   urls[x].compact!
# end

# names.flatten!
# image_urls.flatten!
# urls.flatten!

# descriptions = []
# method = []
# ingredients = []
# ing_quantity = []

# urls.each do |url|
#   print "."
#   temp_noko = Nokogiri::HTML(URI.open("https://www.oddbox.co.uk#{url}"))
#   temp_ingredients = temp_noko.search(".recipe__ingredients p").map do |ing|
#     x = ing.text.match(/^(?<amount>\w?\d*\W?\s*(g|ml|tbsp|tsp)?)?\s*(?<ing>[a-zA-Z]\s?[a-z]*(-|\s)?[a-zA-Z|&]*\s?([a-zA-Z]*|$?)\s?([a-z]{2,})?)$?(?<extra>\(.*\))?$?/)
#     x['ing'].strip unless x['ing'].strip.nil?
#   end

#   temp_ing_quantity = temp_noko.search(".recipe__ingredients p").map do |ing|
#     x = ing.text.match(/^(?<amount>\w?\d*\W?\s*(g|ml|tbsp|tsp)?)?\s*(?<ing>[a-zA-Z]\s?[a-z]*(-|\s)?[a-zA-Z|&]*\s?([a-zA-Z]*|$?)\s?([a-z]{2,})?)$?(?<extra>\(.*\))?$?/)
#     x['amount'].strip unless x['amount'].strip.nil?
#   end

#   ingredients << temp_ingredients
#   ing_quantity << temp_ing_quantity
#   descriptions << temp_noko.search(".post__description p").text

#   temp_method = temp_noko.search(".recipe__content li").map(&:text)

#   method << temp_method
# end

# puts ""

# ind_ing = ingredients.join(", ").split(", ").sort.uniq

# ind_ing.each do |ing|
#   Ingredient.create(name: ing)
# end

# puts "Creating Medium Oddbox Ingredients!"

# 3.times do |x|
#   ["Avocado",
#    "Beetroots",
#    "Cavolo nero",
#    "Brussels sprouts",
#    "Carrots",
#    "Cucumbers",
#    "Ginger",
#    "Limes",
#    "Mango"].each do |ing|
#     OddboxIngredient.create(oddbox_id: x + 1, ingredient_id: Ingredient.find_by(name: ing).id)
#   end
# end

# puts "---------------------------"

# names.each_with_index do |name, index|
#   recipe = Recipe.new(
#     name: name,
#     description: descriptions[index],
#     cooking_time: [10, 15, 20, 25, 30, 35, 40].sample,
#     leftover: Faker::Food.vegetables,
#     storage: "1 week",
#     method: method[index],
#     image_url: image_urls[index],
#     substitute: Faker::Food.fruits,
#     difficulty: ["Amateur", "Intermediate", "Professional"].sample
#   )

#   recipe.save

#   ingredients[index].each_with_index do |ing, i|
#     RecipeIngredient.create(
#       recipe_id: recipe.id,
#       ingredient_id: Ingredient.find_by(name: ing).id,
#       quantity: ing_quantity[index][i]
#     )
#   end
# end

# puts "---------------------------"

puts "Creating Reviews"

temp_revs = ["I stumbled on this undiscovered gem. This was one of the best mouth-watering burgers I've had grace my taste buds in a long time.",
  "It was much better than I expected.", "I was pleasantly surprised. The dish was flavorful, savory, and succulent.", "Yumm-o!", "I stumbled on this undiscovered gem. It is a meal fit for God himself.", "My taste buds are still tingling from this dish!", "We absolutely loved this, really really tasty", "Loved this, the ingredients were usual but worked perfectly together. Excellent!", "Made this 4 times now and gets better each time I make it!", "Such a tasty mid week meal.", "Had this once already having it again tomorrow for tea!!! Excellent recipe and really easy!!", "Excellent. Great recipe - very pleased with the result.", "This was delicious and really easy! It served 6. Will definitely make again!", "This was easy and delicious - highly recommended.", "Absolutely superb, one of the best recipes I have tried, will definitely be making many more times.", "This was long and slow but well worth it.", "Absolutely tasty, glad we gave it a try!", "Absolutely delicious! We've made this several times now and wouldn't change a thing.", "After my meal, I was knocked into a food coma.", "The food is simply to die for.", "These were amazing! Made them for my family and they've already made them again.", "I made this vegan and came out awesome!", "This an excellent and simple recipe, which I have made a number of times. Always a hit.", "Really good. I made it twice. Even better second time.", "Im a non cooker but have been trying to make something different every week. This is by far the easiest one so far and very very tasty!!", "it tasted good but I probably wouldn't make again.", "Delicious! Very good and I love it.", "Was very skeptical about the ingredients, but the flavors blended magically.", "Made this twice now. Turned out great both times! Super quick and easy to throw together.", "I made it, great results. I'll do it again."]

300.times do
  review = Review.new(
    content: temp_revs.sample,
    rating: rand(3..5),
    user_id: rand(1..10),
    recipe_id: rand(1..72)
  )
  review.save
end

puts "---------------------------"

puts "Finished"
