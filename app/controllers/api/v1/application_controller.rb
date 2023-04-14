require_relative './json_web_token'

class Api::V1::ApplicationController < ActionController::API
  before_action :authenticate_request
  before_action :set_default_format

  private

  def set_default_format
    request.format = :json
  end

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split.last if header
    decoded = JsonWebToken.jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end
end
