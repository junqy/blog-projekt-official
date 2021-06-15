class CommentsController < ApplicationController
  before_action :find_blog, only: [:show, :edit, :update, :destroy, :create]
  before_action :find_post, only: [:show, :edit, :update, :destroy, :create]
  before_action :find_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :is_author?, only: [:destroy]

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to [@blog, @post]
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to [@blog, @post]
  end

private

  def find_blog
    @blog = Blog.find(params[:blog_id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

  def is_author?
    redirect_to root_path unless @comment.user_id == current_user.id
  end
end