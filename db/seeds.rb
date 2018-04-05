# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rails db:drop db:create db:migrate db:seed

# rails db:migrate:reset db:seed

start_time = Time.current
puts '=====================           Start to seed the data         ======================='
puts '===                                  seeding......                                 ==='

# User seeds
User.create!(name:  "Admin",
             email: "admin@sampleapp.com",
             admin: true,
             password:              "admin123",
             password_confirmation: "admin123")

User.create!(name:  "Staven.vanderbilt",
             email: "staven.vanderbilt@gmail.com",
             password:              "12345678",
             password_confirmation: "12345678")

499.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

puts '=====================            End to seed the data          ======================='
end_time = Time.current

seed_time = end_time - start_time
puts "      It takes #{seed_time} s to generate the seed data for tetraceratops project.       "



