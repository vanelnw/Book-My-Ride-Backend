require 'rails_helper'

RSpec.describe Car, type: :model do
  let(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }
  subject do
    Car.new(make: 'Ford', model: 'Fiesta', year: 2021, daily_rate: 50, user_id: user.id, image: 'car.jpg',
            description: 'A fun car to drive')
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a make' do
      subject.make = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a model' do
      subject.model = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a year' do
      subject.year = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a daily rate' do
      subject.daily_rate = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a image' do
      subject.image = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a user' do
      subject.user_id = nil
      expect(subject).not_to be_valid
    end
  end
end
