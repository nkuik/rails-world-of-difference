class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project  = Project.find(params[:id])
  end

  def new
    @project  = Project.new
    @skills   = Skill.all.map {|skill| [skill.name, skill.id] }
    @project_skills = @project.project_skills.build
  end

  def create
    @project = current_user.authored_projects.build(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      @skills   = Skill.all.map {|skill| [skill.name, skill.id] }
      @errors = @project.errors.full_messages
      render :new
    end
  end

  def edit
    @project  = Project.find(params[:id])
    @skills   = Skill.all.map {|skill| [skill.name, skill.id] }
  end

  def update
     @project  = Project.find(params[:id])
    if @project.update(project_params)
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
    params.require(:project).permit(:name, :description, :author_id, project_skills_attributes: [:id, :level, :skill_id])
  end

end
