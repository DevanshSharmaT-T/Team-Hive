class CommentsController < ApplicationController

    #setting commentable as task or a project
    before_action :commentable_set

    def create
        @comment = @commentable.comments.build(comment_parameters)
        @comment.user = User.first
    end

 private

    def comment_parameters
        params.require(:comment).require(:body)
    end

    def commenatble_set
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
