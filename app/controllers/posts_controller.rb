class PostsController < ApplicationController

  def index
    render json: current_user.posts, each_serializer: ::PostSerializer::Base, adapter: :json
  end

  def create
    current_user.posts.create!(posts_params)
    render_success
  end

  def update
    post = current_user.posts.find_by_id(params[:id])
    post.update!(posts_params)
    render_success
  end

  def destroy
    post = current_user.posts.find_by_id(params[:id])

    if post
      post.destroy
      render_success
    else
      render_error "Unable to find this post", 404
    end
  end

  private
    def posts_params
      params.permit(:title, :description)
    end
end
