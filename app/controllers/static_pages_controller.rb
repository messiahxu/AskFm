class StaticPagesController < ApplicationController
  before_action :signed_in_user?, only: [:timeline]
  def home
    if signed_in?
      feeds
      render :timeline
    end
    @signuped_users = User.order(created_at: :desc).limit(10)
  end

  def help
  end

  def about
  end

  def popular
  end

  def latest
    @answers = Answer.order(created_at: :desc).page(params[:page]).per(20)
  end

  def timeline
    feeds
  end

  private
    def feeds
      @feed_items = current_user.feed.page(params[:page]).per(20)
    end
end
