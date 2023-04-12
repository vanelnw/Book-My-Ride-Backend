require 'rails_helper'

RSpec.describe Api::V1::AuthenticationController, type: :request do
  describe 'POST authentication' do
    let(:signup_params) { { name: 'Test User', email: 'test@example.com', password: 'password' } }
    let(:login_params) { { email: 'test@example.com', password: signup_params[:password] } }

    before do
      post '/api/v1/auth/register', params: signup_params.to_json, headers: { 'Content-Type' => 'application/json' }
    end

    it 'creates a user' do
      json_response = JSON.parse(response.body)
      expect(json_response['user']['name']).to eq('Test User')
      expect(json_response['user']['email']).to eq('test@example.com')
    end

    it 'returns a success message' do
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Registered successfully!')
    end

    it 'returns a status code 201' do
      expect(response).to have_http_status(:created)
    end

    it 'logins the user' do
      post '/api/v1/auth/login', params: login_params.to_json, headers: { 'Content-Type' => 'application/json' }
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Logged in successfully!')
    end
  end
end
