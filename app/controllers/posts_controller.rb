class PostsController < ApplicationController

def index
    @posts = Post.all
  end

  def show
    @post = post_find
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    flash.notice = "post '#{@post.title}' was created successfully!"

    redirect_to post_path(@post)
  end

  def destroy
    @post = post_find
    @post.destroy
    flash.notice = "post '#{@post.title}' was deleted successfully!"

    redirect_to posts_path
  end

  def edit
    @post = post_find
  end

  def update
    @post = post_find
    @post.update(post_params)

    flash.notice = "post '#{@post.title}' was updated successfully!"

    redirect_to post_path(@post)
  end

  private
  def post_find
  	@post = Post.find(params[:id])
  end

  def post_params
  	params.require(:entry).permit(:title, :text)
  	
  end

end
