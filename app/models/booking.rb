class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :dog
  has_many :reviews, dependent: :destroy

  # validates :start_date, :end_date, presence: true, format: {with: /%Y-%m-%d %I:%M %p/}
end
