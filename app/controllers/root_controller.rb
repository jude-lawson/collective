class RootController < ApplicationController
  def index
    if session[:user_id]
      redirect_to topics_path
    else
      render "root/index"
    end
  end
end
