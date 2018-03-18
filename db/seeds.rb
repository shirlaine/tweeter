# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# gem =Carrierwave.new(data)
# image_src = File.join(Rails.root, "/app/assets/images/twitter.png")
# src_file = File.new(image_src)
# gem.image = src_file
# gem.save

puts "Seeding data for 1 user"

user_1 = User.find_or_initialize_by(username: "user1")
user_1.fullname = "user1"
user_1.email = 'user1@gmail.com'
user_1.password = '123123'
user_1.avatar = File.open(Rails.root + "app/assets/images/twitter.png")
user_1.save

tweet_1 = Tweet.find_or_create_by!(
  body:'Heloooooo',
  user_id: 1
)

tweet_2 = Tweet.find_or_create_by!(
  body:'Heloooooo0000',
  user_id: 1
)