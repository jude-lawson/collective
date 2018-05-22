class Teacher::TopicsController < Teacher::BaseController
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.create!(topic_params)
    redirect_to topic_path(@topic)
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
