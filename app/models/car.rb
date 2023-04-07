class Car < ApplicationRecord
  belongs_to :user

  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :user, presence: true
  validates :image, presence: true
end
