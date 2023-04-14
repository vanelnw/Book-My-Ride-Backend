require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Test User', email: 'test@example.com', password: 'password') }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with a duplicate email' do
      User.create(name: 'Another User', email: 'test@example.com', password: 'password123')
      expect(subject).not_to be_valid
    end
  end

  describe 'password encryption' do
    it 'encrypts the password' do
      expect(subject.password_digest).not_to eq('password')
    end
  end
end
