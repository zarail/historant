# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Place.destroy_all
Review.destroy_all
MenuItem.destroy_all
User.destroy_all

user = User.create(
  email: "user@admin.com",
  password: "123456",
  password_confirmation: "123456",
  first_name: "Patricia",
  last_name: "Lambertz"
)

mcdonalds = Place.new(
  {
    name: "McDonalds",
    address: "Rudolfplatz 2",
    cuisine: "American",
    category: "Restaurant"
  }
)
mcdonalds.user = user
mcdonalds.save!

mongol = Place.new(
  {
    name: "Mongol",
    address: "Friesenstraße 34",
    category: "Bar"
  }
)
mongol.user = user
mongol.save!

punjabi = Place.new(
  {
    name: "Punjabi Palace",
    address: "Venloer Straße 53",
    cuisine: "Indian",
    category: "Restaurant"
  }
)
punjabi.user = user
punjabi.save!

cafe = Place.new(
  {
    name: "Cafe-Coffee-Day",
    address: "Ehrenstraße 34",
    category: "Cafe"
  }
)
cafe.user = user
cafe.save!

indian_biryani = MenuItem.new(
  {
    name: "Biryani",
    price: 10,
    category: "Main Course"
  }
)
indian_biryani.place = punjabi
indian_biryani.save!

cappuccino_cafe = MenuItem.new(
  {
    name: "Cappuccino",
    price: 3.5,
    category: "Hot Beverage"
  }
)
cappuccino_cafe.place = cafe
cappuccino_cafe.save!

review_biryani = Review.new(
  {
    visit_date: Date.today,
    rating: 5,
    description: "Very good dish with lots of sauce"
  }
)
review_biryani.menu_item = indian_biryani
review_biryani.save!

review_cappuccino = Review.new(
  {
    visit_date: Date.yesterday,
    rating: 3,
    description: "Didn't like it too much, was too strong for me"
  }
)
review_cappuccino.menu_item = cappuccino_cafe
review_cappuccino.save!
