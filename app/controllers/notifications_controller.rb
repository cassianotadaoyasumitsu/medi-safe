class NotificationsController < ApplicationController
  before_action :all_notifications

  def index; end

  def mark_as_read
    @notifications.update_all(read_at: Time.zone.now)
    render json: { success: true }
  end

  private

  def all_notifications
    @notifications = Notification.where(recipient: current_user).unread
  end
end
