class PostsController < ApplicationController
  def index
    @post = Post.all.order(:cached_votes_up => :desc)
    @programmer = Programmer.find(current_user.programmer.id)

    # @postFiltered = Post.where(programmer_id: current_user.programmer.id)
  end

  def show
    @post = Post.find(params[:id])
    @programmer = Programmer.find(@post.programmer.id)
    @comments = Comment.where(post_id: params[:id])
  end

  def new
    @programmer = Programmer.find(params[:programmer_id])
  end

  def edit
    @post = Post.find(params[:id])
    @programmer = Programmer.find(params[:programmer_id])
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
    @programmer = Programmer.find(params[:programmer_id])
    @post.destroy

    redirect_to root_path
  end

  def upvote
    @programmer = Programmer.find(current_user.programmer.id)
    @post = Post.find(params[:id])
    @post.upvote_by @programmer
    redirect_to posts_path
  end

  def downvote
    @programmer = Programmer.find(current_user.programmer.id)
    @post = Post.find(params[:id])
    @post.downvote_by @programmer
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:content, :post_title, :programmer_id)
  end

end
