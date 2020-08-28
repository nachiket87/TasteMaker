class NotificationsController < ApplicationController
  def destroy
    @notification = Notification.find(params[:id])
    @notification.game.status = "completed"
    @notification.game.save
    @notification.destroy
    # redirect_back(fallback_location: root_path)
  end

  def accept
    @notification = Notification.find(params[:id])
    id = @notification.game.id
    @notification.destroy
    redirect_to game_path(id)
  end
end
