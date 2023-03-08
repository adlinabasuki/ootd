# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# destroying all users

Item.destroy_all
puts "destroying all users"
User.destroy_all
puts "all users destroyed"

#destroy all Occasions
puts "destroying all occasions"
Occasion.destroy_all
puts "all occasions destroyed"

#Creating users
puts "creating users"
stefany = User.new(first_name: "Stefany", last_name: "Noguera", email: "stefany@gmail.com", password:"password")
stefany.save
puts "created #{User.count} users"

#Creating occasions
puts "creating occasions"
Occasion.create(name: "WORK")
Occasion.create(name: "NIGHT OUT")
Occasion.create(name: "CASUAL")
Occasion.create(name: "GYM")
puts "created #{Occasion.count} occasion"

#Creating users
puts "creating users"
stefany = User.new(first_name: "Stefany", last_name: "Noguera", email: "stefany@gmail.com", password:"password")
stefany.save
puts "created #{User.count} users"

#Items