class ProgrammersController < ApplicationController

  def index
    @programmer = Programmer.find_by(:user_id => current_user)
  end

  def new
  end

  def create
      uploaded_file = params[:programmer][:photo_url].path
      cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)

      params[:programmer][:photo_url] = cloudnary_file['public_id']
      @programmer = Programmer.new(programmer_params)
      @programmer.user_id = current_user.id

      if @programmer.save
        redirect_to root_path
      else
        render 'new'
      end
  end

  def show
      @posts = Post.all
      @programmer = Programmer.find_by(:user_id => current_user)
  end

  def edit
      @programmer = Programmer.find_by(:user_id => current_user)
  end

  def update
      uploaded_file = params[:programmer][:photo_url].path
      cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)

      params[:programmer][:photo_url] = cloudnary_file['public_id']
      @programmer = Programmer.find(params[:id])
      @programmer.update(programmer_params)
      redirect_to root_path
  end

  private
  def programmer_params
     params.require(:programmer).permit(:name, :level, :user_id, :photo_url)
  end
end
