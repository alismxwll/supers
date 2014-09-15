class PostController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      redirect_to root_path, notice: "Post Added"
    else
      'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path, notice: "Post Updated"
    else
      'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, "Post Removed"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
