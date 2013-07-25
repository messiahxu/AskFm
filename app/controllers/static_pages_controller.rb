class StaticPagesController < ApplicationController
  def home
    if signed_in?
      redirect_to profile_path
    end
  end
end
