class ProgrammersController < ActionController::Base
  #before_action :authenticate_user!
  #before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index #tbh i dunno if this is needed
    #the question is: do i need to refer to anything on index?
    @programmers = Programmer.all
  end
  def new
    #@programmer = current_user.build_programmer
  end
  def create #create user: name & level
    @programmer = Programmer.new(programmer_params)
    @programmer.user_id = current_user.id

    if @programmer.save
      redirect_to root_path
    else
      render 'new'
    end
    # @programmer = current_user.build_programmer(programmer_params)
    # redirect to programmers_path

  end
  def show #this will show the user's profile

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
     params.require(:programmer).permit(:name, :level)
  end

end
