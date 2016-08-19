class ProfilesController < ApplicationController

  def show
    @user  = User.find(params[:id])
  end

  def edit
    @user   = User.find(params[:id])
    @skills = Skill.all.map {|skill| [skill.name, skill.id] }
    @user.skill_users.build unless @user.skill_users.present?
  end

  def update
     @user  = User.find(params[:id])
    if @user.update(user_params)
      redirect_to profile_path(@user)
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
    params.require(:user).permit(:first_name, :last_name, :facebook_picture_url, :cv, skill_users_attributes: [:id, :level, :skill_id])
  end

end

