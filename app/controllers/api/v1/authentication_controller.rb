class Api::V1::AuthenticationController < Api::V1::ApplicationController
  skip_before_action :authenticate_request

  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.jwt_encode(user_id: @user.id)
      render json: { user: @user, token:, message: 'Logged in successfully!' }, status: :ok
    else
      render json: { token: 'unauthorized', message: 'Invalid email or password!' }, status: :unauthorized
    end
  end

  def logout
    session.delete(:user_id)
    render json: { message: 'Logged out successfully!' }
  end

  def register
    @user = User.find_by(email: params[:email])

    if @user.present?
      render json: { message: 'Email already exists!' }, status: :unprocessable_entity
    else
      @user = User.new(user_params)

      @user.role = 'admin' if @user.email == 'admin@gmail.com'

      if @user.save
        token = JsonWebToken.jwt_encode(user_id: @user.id)
        render json: { user: @user, token:, message: 'Registered successfully!' }, status: :created
      else
        render json: { message: @user.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :role)
  end
end
