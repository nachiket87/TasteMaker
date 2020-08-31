class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @game_question = GameQuestion.where(game: @game).find_by(order_number: @game.turn_number)
    if !@game.player.present? && current_user != @game.host
      @game.update(player: current_user, status: "started")
      @game_question = @game.game_questions[@game.turn_number]
      GameChannel.broadcast_to(
        @game,
        render_to_string(partial: "started")
      )
    end
    @gamequestions = @game.game_questions
  end

  def create

    @game = Game.new(host:current_user, turn_number: 0, host_score:0, player_score:0, status: "waiting")


    if @game.save
      create_game_questions(@game)
      redirect_to game_path(@game)
    else
      render root_path
    end
  end

  def invite
    @game = Game.find(params[:id])
    @user = User.find_by(email:params[:email].downcase)
    @notification = Notification.new
    @notification.user = @user
    @notification.game = @game
    @notification.content = "#{@game.host.name} has challenged you!"
    @notification.save
    NotificationChannel.broadcast_to(
      @user,
      render_to_string(partial: "shared/notification", locals: { user: @user })
    )
  end

  def start
  end

  def answer
    @user = current_user
    @game = Game.find(params[:game_id])
    @game_question = GameQuestion.where(game: @game).find_by(order_number: @game.turn_number)
    if params[:answer] == @game_question.question.answers[:correct]
      current_user == @game.host ? @game.host_score += 1 : @game.player_score += 1
      @game_question.user = current_user
      @game_question.save
      @game.update(turn_number: @game.turn_number + 1)
      if @game.turn_number == 10
        @winner = @game.host_score > @game.player_score ? @game.host : @game.player
        @game.host_score
        @user.update(score: @user.score += @game.host_score) if @user == @game.host
        @user.update(score: @user.score += @game.player_score) if @user == @game.player
        @game.update(status: :completed)
        GameChannel.broadcast_to(@game, render_to_string(partial: "completed"))
      else
        @game_question = GameQuestion.where(game: @game).find_by(order_number: @game.turn_number)
        @gamequestions = @game.game_questions
        GameChannel.broadcast_to(@game, render_to_string(partial: "result", locals: { winner: current_user }))
        sleep(3)
        GameChannel.broadcast_to(@game, render_to_string(partial: "started"))
      end
    end
  end

  def generate_leader_board
    @sorted = User.where.not(score: nil).order("score DESC")
  end

  private

  def create_game_questions(game1)
    Question.all.sample(10).each_with_index do |q, i|
      GameQuestion.create!(game:game1, question:q, order_number: i)
    end
  end
end
