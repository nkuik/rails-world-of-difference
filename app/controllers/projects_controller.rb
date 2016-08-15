class ProjectsController < ApplicationController


  def index
    @projects = Project.all
  end

  def show
    @project  = Project.find(params[:id])
    # @skills   = @project.project_skills
  end

  def new
    @project  = Project.new
  end

  def create
    @project  = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      @errors = @project.errors.full_messages
      render :new
    end
  end

  def update
    @project.update(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      @errors = @project.errors.full_messages
      render :edit
    end
  end

  def destroy
    (Project.find(params[:id])).destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end


end
