class ProfilesController < ApplicationController

  def show
    @user  = User.find(params[:id])
  end

  def edit
    @user   = User.find(params[:id])
    @skills = Skill.all.map {|skill| [skill.name, skill.id] }
  end

  def update
     @user  = User.find(params[:id])
    if @user.update(user_params)
      redirect_to project_path(@user)
    else
      @errors = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    (User.find(params[:id])).destroy
    redirect_to projects_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :author_id, project_skills_attributes: [:id, :level, :skill_id])
  end

end

