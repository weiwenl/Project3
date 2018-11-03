class CommentsController < ApplicationController

  def index
    @comment = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id].to_i)
    @programmer = Programmer.find(params[:programmer_id].to_i)
    @comment.post_id = @post.id
    @comment.programmer_id = current_user.programmer.id
    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      redirect_to posts_path
    end
  end

   def edit
    @comment = Comment.find(params[:id])
    # @programmer = Programmer.find(params[:programmer_id].to_i)
    # @post = Post.find(params[:post_id].to_i)
  end

  def show
    @comment = Comment.find(params[:id])
  end

   def update
    @comment = Comment.find(params[:id])
    # @post = Post.find(params[:post_id].to_i)
    # @comment.post_id = @post.id
    @comment.update(comment_params)
    redirect_to posts_path
    # @comment = Comment.find(params[:id])
    # @post = Post.find(@comment['post_id'])
    # @programmer = Programmer.find(@programmer['post_id'])
    # @comment.update(comment_params)
    # redirect_to  programmer_posts_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    # @post = Post.find(@comment['post_id'])
    # @programmer = Programmer.find(@programmer['programmer_id'])
    @comment.destroy
    redirect_to posts_path
  end

   private
  def comment_params
    params.require(:comment).permit(:commentContents, :post_id, :programmer_id)
  end

end