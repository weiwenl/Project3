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
    @programmer = Programmer.new(programmer_params)
    #@programmers = Programmer.new(programmers_params)
    @programmer.user_id = current_user.id
    #@programmers.user_id = current_user.id

    if @programmer.save
      redirect_to root_path
    else
      render 'new'
    end
    # @programmer = current_user.build_programmer(programmer_params)
    # redirect to programmers_path

  end
  def show #this will show the user's profile
    @programmers = Programmer.find_by(:user_id => current_user.id)
  end
  def edit #definitely allow users to edit their name and level

  end
  def update #edit and update
    # @profile.update(programmer_params)
    # redirect_to(programmer_path(@programmer))
    #redirect_to :show if current_user.update programmer_params
  end

  private

  def programmer_params
     #params.require(:user).permit(programmer_attributes: [:name])
     params.require(:programmer).permit(:name, :level, :user_id)
  end

end
