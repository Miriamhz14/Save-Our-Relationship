class BlogController < ApplicationController


  def index
  end

  def home
    @posts = Post.all
    @newPost = Post.new
    @comments = Comment.all
    @newComment = Comment.new
  end

  def profile
    if (User.find_by_username(params[:id]))
    @username = params[:id]
      else
        redirect_to root_path, :notice=> "User Not Found"
    end
      @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]))
      @newPost = Post.new
      @comments = Comment.all.where("user_id = ?", User.find_by_username(params[:id]))
      @newComment = Comment.new
  end


end
