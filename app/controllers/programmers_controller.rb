class ProgrammersController < ApplicationController
  #before_action :authenticate_user!
  #before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    #@programmers = Programmer.all
    @programmers = Programmer.find_by(:user_id => current_user)
    #@programmers.user_id
  end
  def new

  end
  def create #create user: name & level

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
  def show #this will show the user's profile
    @programmers = Programmer.find_by(:user_id => current_user)
  end
  def edit #definitely allow users to edit their name and level
    # @programmers = Programmer.find_by(:id => current_user)
    # #if params[:programmers][:photo_url]
    #   uploaded_file = params[:photo_url].path
    #   cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
    #
    #   params[:photo_url] = cloudnary_file['public_id']
    # else
    #   params[:photo_url] = $result.data.image_original_url
  #  end

  end
  def update #edit and update
    @programmers = Programmer.find(params[:id])
    uploaded_file = params[:programmers][:photo_url].path
    cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)

    params[:programmers][:photo_url] = cloudnary_file['public_id']

    @programmers.update(programmer_params)
    redirect_to root_path
  end

  private

  def programmer_params
     params.require(:programmer).permit(:name, :level, :user_id, :photo_url)
  end

end
