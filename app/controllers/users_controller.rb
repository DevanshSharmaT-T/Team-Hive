class UsersController < ApplicationController

  before_action :user_set
  before_action :authenticate_user!

  def edit
    @potential_managers = User.where.not(id: @user.id)
  end

  def update
    if @user.update(user_parameters)
      redirect_to Project.first, notice: "User profile updated!"
    else
      render :edit
    end
  end

  def dashboard
    @user = User.find(params[:id])
  
    # Self Joining to user
    @manager = @user.manager
    @subordinates = @user.subordinates
  
    @projects = @user.projects
  end

  private

    def user_set
     @user = User.find(params[:id])
    end

    def user_parameters
      params.require(:user).permit(:first_name, :last_name, :email, :job_title, :manager_id)
    end
end
