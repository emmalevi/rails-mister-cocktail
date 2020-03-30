# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts 'cleaning database'
Ingredient.destroy_all

puts 'Making API call'
call = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredients = JSON.parse(call)

puts 'Creating ingredients...'
ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

puts "Finished seeding! You now have #{Ingredient.count} ingredients"

Cocktail.create(name: 'Mojito')
Cocktail.create(name: 'Old Fashioned')
Cocktail.create(name: 'Sex on the Beach')
Cocktail.create(name: 'Mimosa')
Cocktail.create(name: 'Spritz')

Dose.create(description: '40ml', cocktail: Cocktail.find_by(name: "Mojito"), ingredient: Ingredient.find_by(name: "Spiced rum"))
Dose.create(description: '2 leaves', cocktail: Cocktail.find_by(name: "Mojito"), ingredient: Ingredient.find_by(name: "Lime"))


