class BlogsController < ApplicationController

  before_action :find_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :is_author?, only: [:edit, :update, :destroy]
  def index
    @blogs = Blog.all  #authenticate tylko przy edycji
  end

  def show
    @blog = Blog.find(params[:id])
    if @blog.nil?
      redirect_to blogs_path
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
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

  def is_author?
    redirect_to root_path unless @blog.user_id == current_user.id
  end

end