class ProfilesController < ApplicationController

  def show
    @profile  = User.find(params[:id])
    @skills   = @profile.skills
  end

  private

  def user_params
    params.require(:user)
  end


end
