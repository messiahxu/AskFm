class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper
  include QuestionsHelper

  before_action :count_unread_notification

  private
    def count_unread_notification
      if signed_in?
        @unread_count = current_user.notifications.where(unread: true).count
      end
    end

end
