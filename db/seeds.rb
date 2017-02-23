# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  full_name: 'Peter Nguyen',
  email: 'nate@ionlyflyfirstclass.com',
  password: '12345678',
  password_confirmation: '12345678',
  image: Faker::Avatar.image,
  phone_number: Faker::PhoneNumber.phone_number,
  description: Faker::Hipster.paragraph(2),
  confirmed_at: Faker::Date.between(1.days.ago, Date.today)
)
# User.create!(
#   full_name: 'Nate Welling'
#   email: 'nater.welling@gmail.com'
#   password: '12345678'
#   provider: 'facebook'
#   uid: ''
# )
puts "Created ##{User.count} user#{'s' unless User.count == 1}"

address = ['340 S Lemon Ave, Walnut, CA 91789',
           '385 S Lemon Ave a, Walnut, CA 91789',
           '351 Paseo Sonrisa, Walnut, CA 91789',
           '20259 Valley Blvd, Walnut, CA 91789',
           '20373 Valley Blvd, Walnut, CA 91789']
count = 0

5.times do
  Room.create!(
    user_id: 1,
    home_type: ['Apartment', 'House', 'Bed & Breakfast'].sample,
    room_type: ['Entire Home', 'Private Room', 'Shared Room'].sample,
    accomodate: Faker::Number.between(1, 6),
    bedroom: Faker::Number.between(1, 6),
    bathroom: Faker::Number.between(1, 6),
    listing_name: Faker::StarWars.character,
    summary: Faker::Hipster.paragraph(3),
    price: Faker::Number.between(50, 150),
    address: address[count],
    is_internet: Faker::Boolean.boolean,
    is_tv: Faker::Boolean.boolean,
    is_kitchen: Faker::Boolean.boolean,
    is_air: Faker::Boolean.boolean,
    is_heating: Faker::Boolean.boolean,
    active: true
  )
  count += 1
end
puts "Created ##{Room.count} room#{'s' unless Room.count == 1}"

# 20.times do
#   Photo.create!(
#     room_id: Faker::Number.between(1, 5),
#     image: Faker::Avatar.image
#   )
#   count += 1
# end
# room.photo = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
# puts "Created ##{Photo.count} room#{'s' unless Photo.count == 1}"
