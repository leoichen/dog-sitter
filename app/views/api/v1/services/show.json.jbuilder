json.service do
  json.id @service.id
  json.categories @service.categories
  json.duration @service.duration

  json.user_id @service.user.id
  json.user_first_name @service.user.first_name
  json.user_last_name @service.user.last_name
  json.user_gender @service.user.gender
  json.user_address @service.user.address
  json.user_bio @service.user.bio
  json.user_language @service.user.language
  json.user_image_url @service.user.image_url
  json.user_phone_number @service.user.phone_number
  json.user_price @service.user.price

  json.bookings @service.bookings do |booking|
    json.start_date booking.start_date.strftime("%A, %b, %d")
    json.end_date booking.end_date.strftime("%A, %b, %d")
    json.reviews booking.reviews do |review|
      json.content review.content
      json.rating review.rating
    end
  end
end
