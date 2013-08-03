class StaticPagesController < ApplicationController
  before_action :signed_in_user?, only: [:timeline]
  def home
    if signed_in?
      #redirect_to user_path(current_user)
      render :timeline
    end
  end

  def timeline
  end
end
