class NotificationsController < ApplicationController
  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    redirect_back(fallback_location: root_path)
  end

  def join_game
    @notification = Notification.find(params[:id])
    @my_game = @notification.game
    @notification.destroy
    redirect_to :game_path
  end
end
