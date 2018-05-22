class Teacher::BaseController < ApplicationController
  before_action :require_teacher, only: [:new, :create]
  before_action :require_is_topics_teacher, only: [:edit, :update]

  private

  def require_teacher
    render file: "/public/404" unless current_teacher?
  end

  def require_is_topics_teacher
    render file: "/public/404" unless current_teacher? && current_user == Topic.find(params[:id]).user
  end
end
