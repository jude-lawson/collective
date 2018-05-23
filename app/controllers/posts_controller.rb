class PostsController < ApplicationController
  def new
    if current_user
      @topic = Topic.find(params[:topic_id])
      @post = Post.new
    else
      render file: '/public/404'
    end
  end

  def create
    topic = Topic.find(params[:topic_id])
    topic.posts.create!(title: post_params['title'], body: post_params['body'], user_id: current_user.id)
    redirect_to topic_path(topic)
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end

  def update
    topic = Topic.find(params[:topic_id])
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to topic_path(topic)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
