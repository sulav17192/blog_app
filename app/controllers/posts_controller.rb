class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: %i[show edit update destroy]
  after_action :verify_authorized, except: [:index, :show]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def new
    @post = current_user.posts.build
    authorize @post
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def create
    @post = current_user.posts.build(post_params)
    authorize @post

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

def update
    @post = Post.find(params[:id])
    authorize @post

    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

def destroy
    @post = Post.find(params[:id])
    authorize @post

    @post.destroy
    redirect_to posts_path, notice: "Post was successfully destroyed."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
