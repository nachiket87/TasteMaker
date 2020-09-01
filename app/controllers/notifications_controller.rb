class NotificationsController < ApplicationController
  def destroy
    @notification = Notification.find(params[:id])
    @game = Game.find(@notification.game_id)
    @game.status = "rejected"
    @game.save
    GameChannel.broadcast_to(
        @game,{ page: render_to_string(partial: "rejected")}
    )
    @notification.destroy
    # redirect_back(fallback_location: root_path)
  end

  def accept
    @notification = Notification.find(params[:id])
    id = @notification.game.id
    @notification.destroy
    redirect_to "/games/#{id}?new_game=true" 
  end
end
