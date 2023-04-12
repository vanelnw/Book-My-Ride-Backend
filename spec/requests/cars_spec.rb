require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :request do
  describe 'GET /api/v1/cars' do
    let(:user) { User.create(name: 'user1', email: 'user1@example.com', password_digest: 'password') }
    let(:payload) { { user_id: user.id } }
    let(:token) { JWT.encode(payload, Rails.application.secret_key_base) }
    let(:headers) { { 'Authorization' => "Bearer #{token}" } }
    let(:car1) do
      Car.create(make: 'Ford', model: 'Mustang', year: 2020, user_id: user.id, image: 'ford.jpg', daily_rate: 2000,
                 description: 'Car for testing')
    end
    let(:car2) do
      Car.create(make: 'Chevrolet', model: 'Camaro', year: 2021, user_id: user.id, image: 'chevrolet.jpg',
                 daily_rate: 2500, description: 'Car for testing')
    end

    before do
      car1
      car2
      get '/api/v1/cars', headers:
    end

    it 'returns a success response' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns all cars' do
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(2)
    end
  end

  describe 'GET /api/v1/cars/:id' do
    it 'renders a JSON response with the car' do
      user = User.create(name: 'user1', email: 'user1@example.com', password_digest: 'password')
      payload = { user_id: user.id }
      token = JWT.encode(payload, Rails.application.secret_key_base)
      headers = { 'Authorization' => "Bearer #{token}" }
      car = Car.create(make: 'Ford', model: 'Mustang', year: 2020, user_id: user.id, image: 'ford.jpg',
                       daily_rate: 2000, description: 'Car for testing')

      get("/api/v1/cars/#{car.id}", headers:)

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response.body).to include(car.to_json)
    end
  end

  describe 'POST /api/v1/cars/' do
    let(:user) { User.create(name: 'user1', email: 'user1@example.com', password_digest: 'password') }
    let(:valid_attributes) do
      { make: 'Ford', model: 'Mustang', year: 2020, user_id: user.id, image: 'ford.jpg', daily_rate: 2000,
        description: 'Car for testing' }
    end

    context 'when the request is valid' do
      before do
        token = JWT.encode({ user_id: user.id }, Rails.application.secret_key_base)
        post '/api/v1/cars', params: valid_attributes.to_json,
                             headers: { 'Authorization' => "Bearer #{token}", 'Content-Type' => 'application/json' }
      end

      it 'creates a car' do
        json_response = JSON.parse(response.body)
        expect(json_response['car']['make']).to eq('Ford')
        expect(json_response['car']['model']).to eq('Mustang')
        expect(json_response['car']['year']).to eq(2020)
        expect(json_response['car']['user_id']).to eq(user.id)
        expect(json_response['car']['image']).to eq('ford.jpg')
        expect(json_response['car']['daily_rate']).to eq(2000)
        expect(json_response['car']['description']).to eq('Car for testing')
      end

      it 'returns a success message' do
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq('Car added successfully!')
      end

      it 'returns a status code 201' do
        expect(response).to have_http_status(:created)
      end
    end
  end

  describe 'DELETE /api/v1/cars/:id' do
    let(:user) { User.create(name: 'user1', email: 'user1@example.com', password_digest: 'password') }
    let(:payload) { { user_id: user.id } }
    let(:token) { JWT.encode(payload, Rails.application.secret_key_base) }
    let(:headers) { { 'Authorization' => "Bearer #{token}" } }

    let!(:car) do
      Car.create(make: 'Ford', model: 'Mustang', year: 2020, user_id: user.id, image: 'ford.jpg', daily_rate: 2000,
                 description: 'Car for testing')
    end

    it 'deletes the car' do
      expect do
        delete "/api/v1/cars/#{car.id}", headers:
      end.to change(Car, :count).by(-1)
    end
  end
end
