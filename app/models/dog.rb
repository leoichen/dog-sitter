class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  # validates :breed, :name, :gender, :age, :medical_history, presence: true
  # validates :age, numericality: {only_integer: true}
end
