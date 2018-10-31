class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @programmer = Programmer.find(params[:programmer_id])
  end

  def edit
    @post = Post.find(params[:id])
    @programmer = Programmer.find(params[:programmer_id].to_i)
  end

  def create
    @post = Post.new(post_params)
    @post.save
    @programmer = Programmer.find(params[:programmer_id].to_i)
    redirect_to programmer_posts_path
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to  programmer_posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:content, :programmer_id, :post_title)
  end

end