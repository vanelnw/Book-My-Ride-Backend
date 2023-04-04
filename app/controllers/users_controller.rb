class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { status: :created, user: @user }
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
