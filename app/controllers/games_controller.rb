class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    if !@game.player.present? && current_user != @game.host
      @game.update(player: current_user, status: "started")  
      GameChannel.broadcast_to(
        @game,
        {type: "start game"}
      )
    end
    @gamequestions = @game.game_questions
    @game_question = @gamequestions[@game.turn_number]
  end

  def create
    @user = User.find_by(email:params[:email])
    @game = Game.new(host:current_user, turn_number: 0, host_score:0, player_score:0, status: "waiting")
    @notification = Notification.new
    @notification.user = @user
    @notification.game = @game
    @notification.content = "#{@game.host.name} has challenged you!"    
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
    @game = Game.find(params[:game_id])
    if params[:answer] == GameQuestion.find_by(order_number: @game.turn_number).question.answers[:correct]
      User.find(params[:user_id]) == @game.host ? @game.host_score += 1 : @game.player_score += 1
      @game.update(turn_number: @game.turn_number + 1)
      @game_question = @game.game_questions[@game.turn_number]
      if @game.turn_number == 10
        @game.update(status: :completed)
      else
        @gamequestions = @game.game_questions
      end
          GameChannel.broadcast_to(
            @game,
            render_to_string(partial: "message")
          )
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
