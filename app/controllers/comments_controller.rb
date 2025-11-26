require 'pry'

class CommentsController < ApplicationController


    #setting commentable as task or a project
    before_action :commentable_set
    before_action :authenticate_user!

    def create
        # binding.pry
        @comment = @commentable.comments.build(comment_parameters)
        @comment.user = User.first
        # binding.pry
        if @comment.save
            respond_to do |format|
            format.html { redirect_to @commentable, notice: "Comment posted!" }

           format.turbo_stream
        end
        else
            redirect_to @commentable, alert: "Comment could not be saved."
        end
    end

 private

    def comment_parameters
        params.require(:comment).permit(:body)
    end

    def commentable_set
        #if project
        if params[:project_id]
            @commentable = Project.find(params[:project_id])
        end
        #if task
        if params[:task_id]
            @commentable = Task.find(params[:task_id])
        end
    end

end
