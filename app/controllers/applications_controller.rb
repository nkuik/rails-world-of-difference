class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application  = Application.find(params[:id])
  end

  def new
    @application  = Application.new
  end

  def create
    @application  = Application.new(application_params)
    if @application.save
      redirect_to application_path(@application)
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
    params.require(:application).permit(:content, :accepted)
  end


end
