# For users model
User.destroy_all
p "#{User.count}"

languages = ["English", "Spanish", "German", "Italian", "French"]

10.times do
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              address: "159 Nanjing West Road, Shanghai",
              bio: Faker::SiliconValley.quote,
              gender: ["male", "female"].sample,
              age:(1..80).to_a.sample,
              language: languages.sample,
              phone_number: "12312341234",
              price: (50..200).to_a.sample
              )
end

puts "Create #{User.count} users!"

# For services
User.all.each do |user|
  Service.create(user: user,
                 categories: ["Dog Sitter", "Dog Walker", "Dog Daycare", "Dog Boarder"].sample
                 )
end
puts "Create #{Service.count} services!"

# For dogs
User.all.each do |user|
  Dog.create(user: user,
             name: Faker::Dog.name,
             breed: Faker::Dog.breed,
             gender: ["male", "femail"].sample,
             age: (1..20).to_a.sample,
             medical_history: Faker::FamilyGuy.quote
             )
end

puts "Create #{Dog.count} dogs!"

# For bookings
Service.all.each do |service|
  Booking.create(service: service,
                 dog: Dog.all.sample,
                 start_date: Faker::Date.forward(23),
                 end_date: Faker::Date.forward(23),
                 )
end

puts "Create #{Booking.count} bookings!"

Booking.all.each do |booking|
  Review.create(booking: booking,
                content: Faker::SiliconValley.quote,
                rating: (1..5).to_a.sample,
                )
end

puts "Create #{Review.count} reviews!"
