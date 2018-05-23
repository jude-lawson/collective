class PostsController < ApplicationController
  before_action :set_topic, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy]

  def new
    if current_user
      @post = Post.new
    else
      render file: '/public/404'
    end
  end

  def create
    @topic.posts.create!(title: post_params['title'], body: post_params['body'], user_id: current_user.id)
    redirect_to topic_path(@topic)
  end

  def edit
  end

  def update
    @post.update!(post_params)
    redirect_to topic_path(@topic)
  end

  def destroy
    @post.destroy
    redirect_to topic_path(@topic)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
