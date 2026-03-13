class AssignmentsController < ApplicationController

    before_action :project_set

    def create
        @assignment = @project.assignments.build(assignment_params)
        @assignment.joined_project_at = Date.today

        if @assignment.save
            redirect_to @project, notice: "member added successfully!"
        else
            redirect_to @project, notice: "can not add member. #{@assignment.errors}"
        end
    end

    def destroy
        @assignment = Project.assignments.find(params[:id])
        @assignment.destroy
        redirect_to @project, notice: "project member removed."
    end


  private

    def assignment_parameters
        params.require(:assignment).permit(:user_id, :role)
    end

    def project_set
        @project = Project.find(params[:project_id])
    end

end
