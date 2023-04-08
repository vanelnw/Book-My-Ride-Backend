class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :reservation_date, presence: true
  validates :due_date, presence: true
end
