class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # Need a flash message here, test first 
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  def index
    if current_user
      @users = User.all
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
  end
end
