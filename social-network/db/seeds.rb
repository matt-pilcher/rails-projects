# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create(name: "User", email: "user@example.com", password: "password" )
User.create(name: "User2", email: "user2@example.com", password: "password" )
User.create(name: "User3", email: "user3@example.com", password: "password" )
User.create(name: "User4", email: "user4@example.com", password: "password" )
User.create(name: "User5", email: "user5@example.com", password: "password" )

users = User.order(:created_at).take(6)
10.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end
