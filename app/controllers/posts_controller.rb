class PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def create
    post = Post.new(post_params)

    if post.save
      render json: post, status: :created #201
    else
      render json: post.errors, status: :not_found #404
    end
  end

  def destroy
    post = Post.find(params[:id])
    
    if post.destroy
      render json: { id: params[:id], result: 'Destroyed successfully' }
    else
      render json: post.errors, status: :not_found #404
    end
  end

  def update
    post = Post.find(params[:id])

    if post.update(post_params)
      render json: { id: params[:id], result: 'Updated successfully' }
    else
      render json: post.errors, status: :not_found #404
    end
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  private

  def post_params
    params.require(:post).permit(:name, :title)
  end
end
