class BlogsController < ApplicationController

  before_action :find_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to @blog, notice: 'The blog was created!'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Update successful'
    else
      render ‘edit’
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: 'blog destroyed'
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :user_id)
  end
  def find_blog
    @blog = Blog.find(params[:id])
  end


end