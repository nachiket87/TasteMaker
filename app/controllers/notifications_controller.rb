class NotificationsController < ApplicationController
  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    # redirect_back(fallback_location: root_path)
  end
end
