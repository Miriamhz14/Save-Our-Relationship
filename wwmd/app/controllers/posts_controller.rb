class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |f|
      if (@post.save)
        f.html { redirect_to :back, notice: "Post Created"}
      else
        f.html { redirect_to :back, notice: "Error: Post Not Saved"}
      end
    end
  end

# security feature so stuff  we dont want to be updated won't
  private
  def post_params
    params.require(:post).permit(:user_id, :content)

  end




end
