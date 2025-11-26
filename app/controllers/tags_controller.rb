class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @tasks = @tag.tasks.includes(:project)
  end
  
end
