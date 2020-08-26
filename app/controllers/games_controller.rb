class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @questions = Question.first(10)
  end

  def create
    @user = User.find_by(email:params[:email])
    @game = Game.new(player:@user, host:current_user, turn_number: 0, host_score:0, player_score:0)
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

end
