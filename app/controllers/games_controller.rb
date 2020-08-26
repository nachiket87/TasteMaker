class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @game_question = @game.game_questions[@game.turn_number]
    @game_question.update(order_number: @game.turn_number)

    # raise
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
    if params[:answer] == GameQuestion.find_by(order_number: @game.turn_number).question.answers[:correct]
      @game.update(turn_number: @game.turn_number+=1)
      @game_question = @game.game_questions[@game.turn_number]
      if @game.turn_number == 10
        @game.update(status: :completed)
        redirect_to root_path
      else
        @game_question.update(order_number: @game.turn_number)
        render :show
      end
    else
      render :js => "alert('wrong answer try again');"
    end
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
