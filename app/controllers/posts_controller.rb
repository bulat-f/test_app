class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user,         only: [:new, :create, :edit, :update, :destroy]

  def index
    order = params[:DESC] ? :desc : :asc
    @posts = Post.search(params[:search]).order(created_at: order).paginate(page: params[:page])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments
    @tags = @post.tags
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    if Post.find(id: params[:id]).destroy
      flash[:success] = "Post deleted"
      redirect_to posts_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :str_tags, :category_id)
  end
end
