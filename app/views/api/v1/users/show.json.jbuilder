json.user @user, :id, :first_name, :last_name, :address, :bio, :gender, :age, :language, :phone_number, :price, :services, :dogs
# json.services @user.services do |service|
#   json.extract! service, :id, :categories, :duration
# end
# json.dogs @user.dogs do |dog|
#   json.extract! dog, :id, :breed, :name, :gender, :age, :medical_history
# end
