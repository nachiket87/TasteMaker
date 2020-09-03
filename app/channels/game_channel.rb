class GameChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @game = Game.find(params[:id])
    stream_for @game
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    if @game.status == "waiting" && (Time.now - @game.created_at > 1.minutes)
      @game.destroy
    end
  end
end
