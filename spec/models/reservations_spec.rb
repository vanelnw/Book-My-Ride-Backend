require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }
  let(:car) do
    Car.create(make: 'Ford', model: 'Fiesta', year: 2021, daily_rate: 50, user_id: user.id, image: 'car.jpg',
               description: 'A fun car to drive')
  end
  subject { Reservation.new(reservation_date: '2023-04-10', due_date: '2023-04-15', user_id: user.id, car_id: car.id) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a reservation date' do
      subject.reservation_date = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a due date' do
      subject.due_date = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a car' do
      subject.car_id = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a user' do
      subject.user_id = nil
      expect(subject).not_to be_valid
    end
  end
end
