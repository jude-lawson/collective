class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create!(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :is_teacher)
  end
end