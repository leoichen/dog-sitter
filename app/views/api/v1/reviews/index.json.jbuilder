json.reviews @reviews do |review|
  json.id review.id
  json.content review.content
  json.rating review.rating

  json.dog_owner_id review.booking.dog.user.id
  json.dog_owner_first_name review.booking.dog.user.first_name
  json.dog_owner_last_name review.booking.dog.user.last_name
  json.dog_owner_image_url review.booking.dog.user.image_url

  json.sitter_id review.booking.service.user.id
  json.sitter_first_name review.booking.service.user.first_name
  json.sitter_last_name review.booking.service.user.last_name
  json.sitter_image_url review.booking.service.user.image_url
end
