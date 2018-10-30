class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    # @post = Post.find(comment_params['post_id'])
    # redirect_to @post
    @programmer = Programmer.find(params[:programmer_id].to_i)
    @post = Post.find(params[:post_id].to_i)
    redirect_to root_path
  end

   def edit
    @comment = Comment.find(params[:id])
    @programmer = Programmer.find(params[:programmer_id].to_i)
    @post = Post.find(params[:post_id].to_i)
  end

   def update
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment['post_id'])
    @programmer = Programmer.find(@programmer['post_id'])
    @comment.update(comment_params)
    redirect_to  programmer_posts_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment['post_id'])
    @programmer = Programmer.find(@programmer['programmer_id'])
    @comment.destroy
    redirect_to root_path
  end

   private
   def comment_params
    params.require(:comment).permit(:commentContents, :programmer_id, :post_id)
  end

end