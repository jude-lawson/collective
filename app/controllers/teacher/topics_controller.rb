class Teacher::TopicsController < Teacher::BaseController
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.create!(topic_params)
    redirect_to topic_path(@topic)
  end

  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    @topic.update(topic_params)
    redirect_to topic_path(@topic)
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
