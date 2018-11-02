class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
    @programmer = Programmer.find(current_user.programmer.id)
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end

  def new

  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @programmer = Programmer.find(current_user.programmer.id)
    @post = Post.new(post_params)

    if @post.save
    redirect_to posts_path
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:content, :post_title, :programmer_id)
  end

end
