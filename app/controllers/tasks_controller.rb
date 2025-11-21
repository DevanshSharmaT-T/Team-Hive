class TasksController < ApplicationController

    before_action :project_set, except: [:show]

    def create
        @task = @project.tasks.build(task_parameters)
        if @task.save
            redirect_to @project, notice: "Task saved successfully"
        else
            redirect_to @project, alert: "Task not save #{ @task.errors }"
        end
    end

    def destroy
        @task = @project.task.find(params[:id])
        @task.destroy
        redirect_to @project, notice: "Task deleted sucessfully"
    end

    def show 
        @task = Task.includes(:tags, comments: :user).find(params[:id])
        @comment = Comment.new
    end

    private
        def project_set
            @project = Project.find(params[:project_id])
        end 

        def task_parameters
            params.require(:task).permit(:title, :priority, :status, tag_ids: [])
        end
end
