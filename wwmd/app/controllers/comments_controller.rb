class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    respond_to do |f|
      if (@comment.save)
        f.html { redirect_to :back, notice: "Comment Created"}
      else
        f.html { redirect_to :back, notice: "Error: Comment Not Saved"}
      end
    end
  end

# security feature so stuff  we dont want to be updated won't
  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)

  end

end
