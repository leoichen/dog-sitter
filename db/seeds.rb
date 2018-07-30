# For users model
User.destroy_all

10.times do
  User.create(first_name:,
              last_name:,
              address:,
              bio:,
              gender:,
              age:,
              language:,
              phone_number:,
              price:
              )
end

# For services
User.all each do |user|
  Service.create(
  )
end

# For bookings
User.all each do |user|
  Dog.create(
  )
