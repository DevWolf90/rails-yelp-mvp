# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
categories = %w[chinese italian japanese french belgian]

10.times do
  @restaurant = Restaurant.new
  @restaurant.name = Faker::Restaurant.name
  @restaurant.address = Faker::Address.full_address
  @restaurant.phone_number = Faker::PhoneNumber.phone_number
  @restaurant.category = categories.sample
  @restaurant.save
end

restaurant_ids = Restaurant.pluck(:id).shuffle

10.times do
  @review = Review.new
  @review.content = Faker::Lorem.paragraph
  @review.rating = (0..5).to_a.sample
  @review.restaurant_id = restaurant_ids.pop
  @review.save
end
