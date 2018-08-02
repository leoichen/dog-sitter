class User < ApplicationRecord
  has_many :services, dependent: :destroy
  has_many :dogs, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # validates :first_name, presence: true, uniqueness: {scope: :last_name}
  # validates :last_name, :gender, :bio, :age, :language, :phone_number, :price, presence: true
  # validates :phone_number, uniqueness: true, length: {is: 11}
  # validates :gender, inclusion: {in: %w(male female)}
  # validates :bio, length: { maximum: 1000,
  #                           too_long: "%{count} characters is the maximum allowed" }
  # validates :age, numericality: {only_integer: true}
  # validates :price, numericality: {only_integer: true}
end
