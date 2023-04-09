require 'swagger_helper'

describe 'Api::V1::CarsController', type: :request do
  let(:user) { User.create(name: "user1", email: "user1@example.com", password_digest: "password") }
  let(:payload) { { user_id: user.id } }
  let(:token) { JWT.encode(payload, Rails.application.secret_key_base) }
  let(:Authorization) { "Bearer #{token}" }
  let(:car) { Car.create(make: "Ford", model: "Mustang", year: 2020, price: 40000, user_id: user.id, image: "https://imgd.aeplcdn.com/0x0/cw/ec/23766/Ford-Mustang-Exterior-126883.jpg?wm=0") }
  let(:id) { car.id }
  
  path '/api/v1/cars/{id}' do
    parameter name: :id, in: :path, type: :integer, description: 'ID of the car'
    parameter name: 'Authorization', in: :header, type: :string, required: true

    get 'Retrieves a car by ID' do
      tags 'Cars'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer
      
      response '200', 'car found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            make: { type: :string },
            model: { type: :string },
            year: { type: :integer },
            price: { type: :integer },
            user_id: { type: :integer },
            image: { type: :string }
          },
          required: [ 'id', 'make', 'model', 'year', 'price', 'user_id', 'image' ]

        run_test!
      end
    end
  end
end
