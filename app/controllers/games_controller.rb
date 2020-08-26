class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @gamequestions = @game.game_questions
    update_status(@game)
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
    @game.update(turn_number: @game.turn_number+=1)
    @gamequestions = @game.game_questions
    if @game.turn_number == 10
      @game.update(status: :completed)
      redirect_to root_path
    else
      render :show
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

  def update_status(game)
    @user = current_user
    @current_page = request.original_url
    if @user.id == game.player_id && @current_page.include?("games/#{game.id}")
      game.status = "Active"
    end
  end

end
