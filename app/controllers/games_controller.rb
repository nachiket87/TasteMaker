class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @gamequestions = @game.game_questions
    update_status(@game)
  #  raise
    @game_question = @gamequestions[@game.turn_number]
    # @game_question.update(order_number: @game.turn_number)
    # raise
  end

  def create
    @user = User.find_by(email:params[:email])
    @game = Game.new(player:@user, host:current_user, turn_number: 0, host_score:0, player_score:0)
    @notification = Notification.new
    @notification.user = @user
    @notification.game = @game
    @notification.content = "#{@notification.user.name} has challenged you!"
    if @game.save
      create_game_questions(@game)
      @notification.save
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
      @game.update(turn_number: @game.turn_number + 1)
      @game_question = @game.game_questions[@game.turn_number]
      if @game.turn_number == 10
        @game.update(status: :completed)
        redirect_to root_path
      else
        # @game_question.update(order_number: @game.turn_number)
        @gamequestions = @game.game_questions
        # render :show
        GameChannel.broadcast_to(
          @game,
          render_to_string(partial: "message")
        )
      end
    else

    end
  end

  def test
    @test = "this is coming from the games controller"
  end

  private

  def create_game_questions(game1)
    Question.first(10).each_with_index do |q, i|
      GameQuestion.create!(game:game1, question:q, order_number: i)
    end

  end

  def update_status(game)
    @user = current_user
    @current_page = request.original_url
    if @user.id == game.player_id && @current_page.include?("games/#{game.id}")
      game.status = "Pending"
    end
  end
end
