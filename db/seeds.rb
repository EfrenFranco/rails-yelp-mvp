# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Removing all entries first..."
Restaurant.destroy_all

CUISINES = %W[chinese italian japanese french belgian]
#puts "Creating new entries now..."

def create_category
  last_word = name.split.last.downcase
  CUISINES.include?(last_word) ? last_word : CUISINES.sample
end

puts "Creating new entries now..."
5.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: CUISINES.sample
  )
end

puts "...created #{Restaurant.count} restaurants"
