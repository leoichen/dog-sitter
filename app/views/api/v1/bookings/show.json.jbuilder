json.booking do
  json.id @booking.id
  json.start_date @booking.start_date.strftime("%A, %b, %d")
  json.end_date @booking.end_date.strftime("%A, %b, %d")

  json.dog_id @booking.dog.id
  json.dog_name @booking.dog.name
  json.dog_breed @booking.dog.breed
  json.dog_gender @booking.dog.gender
  json.dog_age @booking.dog.age
  json.dog_medical_history @booking.dog.medical_history
  json.dog_image_url @booking.dog.image_url

  json.dog_owner_id @booking.dog.user.id
  json.dog_owner_first_name @booking.dog.user.first_name
  json.dog_owner_last_name @booking.dog.user.last_name
  json.dog_owner_image_url @booking.dog.user.image_url

  json.service_id @booking.service.id
  json.service_categories @booking.service.categories
  json.service_duration @booking.service.duration

  json.sitter_id @booking.service.user.id
  json.sitter_first_name @booking.service.user.first_name
  json.dog_sitter_last_name @booking.service.user.last_name
  json.dog_sitter_image_url @booking.service.user.image_url

  json.reviews @booking.reviews do |review|
    json.content review.content
    json.rating review.rating
  end
end
