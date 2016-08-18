class ApplicationsController < ApplicationController
  def index
    @applications = Application.where(project_id: params[:project_id])
  end

  def show
    @application  = Application.find(params[:id])
    @user = User.find(@application.user_id)
  end

  def new
    @application  = current_user.applications.build
  end

  def create
    @application  = current_user.applications.build(application_params.merge(project_id: params[:project_id]))
    if @application.save
      redirect_to project_applications_path
    else
      @errors = @application.errors.full_messages
      render :new
    end
  end

  def update
    @application.update(application_params)
    if @application.save
      redirect_to application_path(@application)
    else
      @errors = @application.errors.full_messages
      render :edit
    end
  end

  def destroy
    (Application.find(params[:id])).destroy
    redirect_to projects_path
  end

  private

  def application_params
    params.require(:application).permit(:content, :accepted, :project_id, :user_id)
  end

end
