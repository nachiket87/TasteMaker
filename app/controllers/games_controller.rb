class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    if !@game.player.present? && current_user != @game.host
      @game.update(player: current_user, status: "started")  
      @game_question = @game.game_questions[@game.turn_number]
      GameChannel.broadcast_to(
        @game,
        render_to_string(partial: "started") 
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
      @notification.save
      NotificationChannel.broadcast_to(
        @user,
        render_to_string(partial: "shared/notification", locals: { user: @user })
      )
      redirect_to game_path(@game)
    else
      render root_path
    end
  end

  def start 
  end

  def answer
    @game = Game.find(params[:game_id])
    if params[:answer] == GameQuestion.where(game: @game).find_by(order_number: @game.turn_number).question.answers[:correct]
      User.find(params[:user_id]) == @game.host ? @game.host_score += 1 : @game.player_score += 1
      @game.update(turn_number: @game.turn_number + 1)
      @game_question = @game.game_questions[@game.turn_number]
      if @game.turn_number == 10
        @game.update(status: :completed)
        GameChannel.broadcast_to(@game, render_to_string(partial: "completed"))
      else
        @gamequestions = @game.game_questions
        GameChannel.broadcast_to(@game, render_to_string(partial: "started"))
      end
    end
  end

  private

  def create_game_questions(game1)
    Question.all.sample(10).each_with_index do |q, i| 
      GameQuestion.create!(game:game1, question:q, order_number: i)
    end
  end
end
