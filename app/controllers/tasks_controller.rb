require "pry"
class TasksController < ApplicationController

    before_action :project_set
    before_action :set_task, only: [:show, :edit, :update, :destroy, :update_status]
    before_action :authenticate_user!

    def new
    @task = @project.tasks.build
    end

    def create
        # binding.pry
        @task = @project.tasks.build(task_parameters)
        # binding.pry
        if @task.save
            redirect_to @project, notice: "Task saved successfully"
        else
            redirect_to @project, alert: "Task not save #{ @task.errors.full_messages }"
        end
    end

    def destroy
        @task = @project.tasks.find(params[:id])
        @task.destroy
        redirect_to @project, notice: "Task deleted sucessfully"
    end

    def show 
        @task = Task.includes(:tags, comments: :user).find(params[:id])
        @comments = @task.comments.includes(:user).order(created_at: :desc)
        @comment = Comment.new
    end

    def update_status
        @task = @project.tasks.find(params[:id])
        if @task.update(status: params[:status])
            redirect_to @project, notice: "Task moved to #{@task.status.humanize}!"
        else
            redirect_to @project, alert: "Could not update task."
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        if @task.update(task_parameters)
            redirect_to @project, notice: "Task updated successfully!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private
        def project_set
            @project = Project.find(params[:project_id])
        end 

        def set_task
            @task = @project.tasks.find(params[:id])
        end

        def task_parameters
            params.require(:task).permit(:title, :description, :priority, :status, tag_ids: [])
        end
end
