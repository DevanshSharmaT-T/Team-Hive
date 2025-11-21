class UsersController < ApplicationController

  before_action :user_set

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

  private

    def user_set
     @user = User.find(params[:id])
    end

    def user_parameters
      params.require(:user).permit(:first_name, :last_name, :email, :job_title, :manager_id)
    end
end
