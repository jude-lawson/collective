class Teacher::BaseController < ApplicationController
  before_action :require_teacher, only: [:new, :create]

  private

  def require_teacher
    render file: "/public/404" unless current_teacher?
  end
end
