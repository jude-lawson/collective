class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    new_user = User.create!(user_params)
    redirect_to user_path(new_user)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :is_teacher)
  end
end