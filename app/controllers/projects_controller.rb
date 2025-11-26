class ProjectsController < ApplicationController

  before_action :authenticate_user!, except: [ :index ]

  def index
    @projects = Project.newest_projects_in_order.paginate(page: params[:page], per_page: 6)
  end

  def new
    @project = Project.new(start_date: Date.today)
  end

  def create
    @project = Project.new(project_parameters)
    if @project.save
      redirect_to @project, notice: "Project created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_parameters)
      redirect_to @project, notice: "Project updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice: "Project deleted."
  end

  def show
    @project = Project.includes(:users).find(params[:id])
    @comment = Comment.new
    @tasks = Task.tasks_for_project(@project).paginate(page: params[:page], per_page: 5)
    @available_users = User.available_users_for_project(@project)
  end


private
  def project_parameters
    params.require(:project).permit(:title, :description, :status, :start_date, :due_date)
  end
end
