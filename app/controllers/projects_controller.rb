class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @project = Project.new
    @origins = Origins.all
    @projects = Project.all
    @typeOfWorks = TypeOfWorks.all
  end

  def show
    @comments = @project.comments.order(id: :desc)
    @comment = Comment.new
  end

  def update
  end

  def create
    @project = Project.new project_params

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'User was successfully created.' }
        format.js   {render json: @project}
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :description, :type_of_work_id, :origin_id)
  end

end
