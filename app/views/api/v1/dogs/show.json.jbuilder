json.dog do
  json.id @dog.id
  json.name @dog.name
  json.gender @dog.gender
  json.age @dog.age
  json.medical_history @dog.medical_history
  json.image_url @dog.image_url

  json.user_id @dog.user.id
  json.user_first_name @dog.user.first_name
  json.user_last_name @dog.user.last_name
  json.user_gender @dog.user.gender
  json.user_address @dog.user.address
  json.user_bio @dog.user.bio
  json.user_language @dog.user.language
  json.user_image_url @dog.user.image_url

  json.bookings @dog.bookings do |booking|
    json.start_date booking.start_date.strftime("%A, %b, %d")
    json.end_date booking.end_date.strftime("%A, %b, %d")
    json.reviews booking.reviews do |review|
      json.content review.content
      json.rating review.rating
    end
  end
end
