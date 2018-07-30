# For users model
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


  # For bookings
  10.times do
    Booking.create(start_date:
                   end_date:
                   )
