class PostsController < ApplicationController

  # before_action :find_blog

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.where(blog_ID: @blog.id)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'The post was created!'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Update successful'
    else
      render ‘edit’
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'blog destroyed'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :public)
  end

  def find_post
    @post = @blog.posts.find(params[:id])
  end

  # def find_blog
  #   @blog = Blog.find(params[:id])
  # end

end
