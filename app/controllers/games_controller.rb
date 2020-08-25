class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
  end

  def create
    @user = User.find(game_params[:player_id])
    @game = Game.new(player:@user, host:current_user)
    if @game.save
      redirect_to game_path(@game)
    else
      render root_path
    end
  end

  def start
  end


  def test
    @test = "this is coming from the games controller"
  end


  private

  def game_params
    params.require(:game).permit(:player_id)
  end

end
