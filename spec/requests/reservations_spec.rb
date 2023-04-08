require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :request do
  describe 'POST /api/v1/reservations' do
    let(:user) { User.create(name: "user1", email: "user1@example.com", password_digest: "password") }
    let(:car) { Car.create(make: "Ford", model: "Mustang", year: 2020, price: 40000, user_id: user.id, image: "https://imgd.aeplcdn.com/0x0/cw/ec/23766/Ford-Mustang-Exterior-126883.jpg?wm=0") }
    let(:valid_attributes) { { reservation_date: Date.today + 1, due_date: Date.today + 7, car_id: car.id } }

    context 'when the request is valid' do
      before do
        token = JWT.encode({ user_id: user.id }, Rails.application.secret_key_base)
        post '/api/v1/reservations', params: valid_attributes.to_json, headers: { 'Authorization' => "Bearer #{token}", 'Content-Type' => 'application/json' }
      end

      it 'creates a reservation' do
        json_response = JSON.parse(response.body)
        expect(json_response['reservation']['reservation_date']).to eq((Date.today + 1).strftime('%Y-%m-%d'))
        expect(json_response['reservation']['due_date']).to eq((Date.today + 7).strftime('%Y-%m-%d'))
        expect(json_response['reservation']['user_id']).to eq(user.id)
        expect(json_response['reservation']['car_id']).to eq(car.id)
      end

      it 'returns a success message' do
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq('Car reserved successfully')
      end

      it 'returns a status code 201' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end
