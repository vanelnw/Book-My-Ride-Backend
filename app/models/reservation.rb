class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :reservation_date, presence: true
  validates :due_date, presence: true

  def car_make
    car.make
  end

  def car_image
    car.image
  end

  def car_model
    car.model
  end

  def car_year
    car.year
  end

  def car_daily_rate
    car.daily_rate
  end
end
