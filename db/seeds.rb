# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts 'cleaning database'

Dose.destroy_all
Review.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Making API call'
call = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredients = JSON.parse(call)

puts 'Creating ingredients...'
ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

puts "Finished seeding! You now have #{Ingredient.count} ingredients"

file = URI.open('https://res.cloudinary.com/djdwgio05/image/upload/v1585672007/sob_ojcxt4.jpg')
cocktail = Cocktail.new(name: 'Mojito')
cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
cocktail.save

file = URI.open('https://res.cloudinary.com/djdwgio05/image/upload/v1585672008/old_fash_ziepwb.jpg')
cocktail = Cocktail.new(name: 'Old Fashioned')
cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
cocktail.save

file = URI.open('https://res.cloudinary.com/djdwgio05/image/upload/v1585672007/sob_ojcxt4.jpg')
cocktail = Cocktail.new(name: 'Sex on the Beach')
cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
cocktail.save

file = URI.open('https://res.cloudinary.com/djdwgio05/image/upload/v1585672007/spritz_l75fnq.jpg')
cocktail = Cocktail.new(name: 'Spritz')
cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
cocktail.save

file = URI.open('https://res.cloudinary.com/djdwgio05/image/upload/v1585672007/mimosa_j4kphr.jpg')
cocktail = Cocktail.new(name: 'Mimosa')
cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
cocktail.save

Dose.create(description: '40ml', cocktail: Cocktail.find_by(name: "Mojito"), ingredient: Ingredient.find_by(name: "Spiced rum"))
Dose.create(description: '2 leaves', cocktail: Cocktail.find_by(name: "Mojito"), ingredient: Ingredient.find_by(name: "Lime"))

puts 'Uploading pictures'
