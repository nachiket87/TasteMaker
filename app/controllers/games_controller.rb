class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @gamequestions = @game.game_questions 
  #  raise
  end

  def create
    @user = User.find_by(email:params[:email])
    @game = Game.new(player:@user, host:current_user, turn_number: 0, host_score:0, player_score:0)
    if @game.save
      create_game_questions(@game)
      redirect_to game_path(@game)
    else
      render root_path
    end
  end

  def start
  end

  def answer
    @game = Game.find(params[:id])
    #@game.turn_number += 1
    @game.update(turn_number: @game.turn_number+=1)
    @gamequestions = @game.game_questions
    render :show
  end

  def test
    @test = "this is coming from the games controller"
  end

  private

  def create_game_questions(game1)
    Question.first(10).each do |q|
      GameQuestion.create!(game:game1, question:q)
    end

  end

end
