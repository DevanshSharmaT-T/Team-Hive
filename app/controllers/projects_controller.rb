class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end


  def show
    @project = Project.includes(:users, tasks: [ :tags, :comments ]).find(params[:id])
    @comment = Comment.new
  end


private
  def project_parameters
    param.require(:project).permit(:title, :description, :status, :start_date, :start_date)
  end
end
