class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.all.map do |post|
      {
        id: post.id,
        image: post.image_url,
        category: post.category,
        admin_id: post.admin_id
      }
    end

    render json: @posts
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    head :no_content

    render json: 'Post deleted successfully'
  end

  private

  def post_params
    params.permit(:category, :image, :admin_id)
  end
end
