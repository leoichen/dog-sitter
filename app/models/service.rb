class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :categories, :duration, presence: true
  # validates :categories # INCLUSION OF THE TYPES OF SERVICES
end
