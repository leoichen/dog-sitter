json.dog @dog ,:id, :breed, :name, :age, :gender, :medical_history, :image_url
json.user do
  json.first_name @dog.user.first_name
end
