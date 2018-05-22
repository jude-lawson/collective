class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_teacher?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_teacher?
    current_user && current_user.teacher?
  end
end
