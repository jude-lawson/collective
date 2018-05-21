class RootController < ApplicationController
  def index
    if session[:user_logged_in]
      redirect_to topics_path
    else
      render "root/index"
    end
  end
end