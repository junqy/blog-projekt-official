class PostsController < ApplicationController

  # before_action :find_blog
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :is_author?, only: [:edit, :update, :destroy, :new, :create]

  def index
    @blog = Blog.find(params[:blog_id])
    @posts = Post.where(:blog_id => @blog.id)#post filter (użytkownik jako parametr //request_user)
  end

  def search
    @blog = Blog.find_by(params[:blog_id])
    @posts = Post.where("title LIKE?", "%" + params[:q] + "%")
  end

  def show
    @blog = Blog.find(params[:blog_id])
    @post = Post.find(params[:id])
    if @post.nil?
      redirect_to blog_posts_path
    end
  end

  def new
    @post = Post.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @post = Post.new(post_params)
    @post.blog_id = @blog.id
    if @post.save
      redirect_to blog_posts_path, notice: 'The post was created!'
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:blog_id])
    if @post.update(post_params)
      redirect_to [@blog, @post], notice: 'Update successful'
    else
      render ‘edit’
    end
  end

  def destroy
    @post.destroy
    redirect_to blog_posts_path, notice: 'Post destroyed'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :public, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def is_author?
    @blog = Blog.find(params[:blog_id])
    redirect_to root_path unless @blog.user_id == current_user.id
  end

end
