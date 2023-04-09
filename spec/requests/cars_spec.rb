require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :request do
  describe "GET /api/v1/cars/:id" do
    it "renders a JSON response with the car" do
      user = User.create(name: "user1", email: "user1@example.com", password_digest: "password")
      payload = { user_id: user.id }
      token = JWT.encode(payload, Rails.application.secret_key_base)
      headers = { "Authorization" => "Bearer #{token}" }
      car = Car.create(make: "Ford", model: "Mustang", year: 2020, price: 40000, user_id: user.id, image: "https://imgd.aeplcdn.com/0x0/cw/ec/23766/Ford-Mustang-Exterior-126883.jpg?wm=0")

      get "/api/v1/cars/#{car.id}", headers: headers

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response.body).to include(car.to_json)
    end
  end
end
