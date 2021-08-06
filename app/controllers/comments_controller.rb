class CommentsController < ApplicationController
  before_action :load_post

  def index
    render json: @post.comments, each_serializer: ::CommentSerializer::Base, adapter: :json
  end

  def create
    @post.comments.create!(comments_params)
    render_success
  end

  def update
    comment = @post.comments.find_by_id(params[:id])
    comment.update!(comments_params)
    render_success
  end

  def destroy
    comment =  @post.comments.find_by_id(params[:id])

    if comment
      comment.destroy
      render_success
    else
      render_error "Unable to find this comment", 404
    end
  end

  private
    def load_post
      @post = Post.find_by_id(params[:post_id])
      render_error("Unable to find the post", 404) unless @post
    end

    def comments_params
      params.permit(:comment, :commentor_id)
    end
end
