class CommentController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comments_params)

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

  private
    def comments_params
      params.require(:comment).permit(:author_name, :body)
    end
end
