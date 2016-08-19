class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @selected_projects = Project.last(3).reverse
  end

  def about
  end

  def contact
  end

end
