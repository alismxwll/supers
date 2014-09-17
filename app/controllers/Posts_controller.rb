class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # skip_before_action :verify_authenticity_token

  def index
    @posts = Post.all.order('created_at DESC').first(10)
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @user = current_user
    if @post.valid?
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Post Added" }
        format.js
      end
    else
      render 'index'
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
      redirect_to root_path, notice: "Post Updated"
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, "Post Removed"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :picture).merge(:user_id => current_user.id)
  end
end
