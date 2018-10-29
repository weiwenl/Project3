class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
  end

  def new
    @programmer = Programmer.find(params[:programmer_id])
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.save
    @programmer = Programmer.find(params[:post][:programmer_id])
    redirect_to root_path
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:content, :programmer_id)
  end

end