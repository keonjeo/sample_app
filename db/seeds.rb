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
             password_confirmation: "admin123",
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Staven.vanderbilt",
             email: "staven.vanderbilt@gmail.com",
             password:              "12345678",
             password_confirmation: "12345678",
             activated: true,
             activated_at: Time.zone.now)

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

puts '=====================            End to seed the data          ======================='
end_time = Time.current

seed_time = end_time - start_time
puts "      It takes #{seed_time} s to generate the seed data for tetraceratops project.       "



