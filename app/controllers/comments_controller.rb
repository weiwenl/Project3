class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(comment_params['post_id'])
    @comment.save
    redirect_to @post
  end

   def edit
    @comment = Comment.find(params[:id])
  end

   def update
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment['post_id'])
    @comment.update(comment_params)
    redirect_to @post
  end

   def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment['post_id'])
    @comment.destroy
    redirect_to post_path(@post)
  end

   private
   def comment_params
    params.require(:comment).permit(:commentContents, :post_id)
  end

end