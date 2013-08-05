class NotificationsController < ApplicationController
  after_action :mark_all_as_read, :signed_in_user?, only: [:index]

  def index
    @notifications = current_user.notifications.order(created_at: :desc).page(params[:page]).per(20)
  end

  private
    def mark_all_as_read
      current_user.notifications.update_all(unread: false)
    end
end
