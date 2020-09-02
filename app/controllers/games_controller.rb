 class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @game_question = GameQuestion.where(game: @game).find_by(order_number: @game.turn_number)
    @game_questions = @game.game_questions
    @first_game_started = !@game.player.present? && current_user != @game.host
    if @first_game_started
      @game.update(player: current_user, status: "ready")
      @game_question = @game.game_questions[@game.turn_number]
      GameChannel.broadcast_to(
        @game,{
          page2: render_to_string(partial: "ready")
      })
    end
    if @game.status == "completed"
      @winner = @game.host_score > @game.player_score ? @game.host : @game.player
    end
    @gamequestions = @game.game_questions
  end

  def start
    @game = Game.find(params[:id])
    @game.update(status:'started')
    @game_question = GameQuestion.where(game: @game).find_by(order_number: @game.turn_number)
    @gamequestions = @game.game_questions
    GameChannel.broadcast_to(
      @game,{ firstStart: render_to_string(partial: "starter"),
        page2: render_to_string(partial: "started")
    })
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
    if User.find_by(email:params[:email].downcase)
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
  end

  def challenge
    @game = Game.new(host:current_user, turn_number: 0, host_score:0, player_score:0, status: "waiting")
    if @game.save
      create_game_questions(@game)
      redirect_to game_path(@game)
    else
      render root_path
    end
    @user = User.find(params[:challenged_id])
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

  def answer
    @user = current_user
    @game = Game.find(params[:game_id])
    @game_questions = @game.game_questions
    @game_question = GameQuestion.where(game: @game).find_by(order_number: @game.turn_number)
    if @game_question.present? && params[:answer] == @game_question&.question&.answers[:correct] #checking if game_question is present to stop from breaking
      current_user == @game.host ? @game.host_score += 1 : @game.player_score += 1
      @game_question.user = current_user unless @game_question.user.present?
      @game_question.save
      @game.update(turn_number: @game.turn_number + 1)
      if @game.turn_number == 10
        @winner = @game.host_score > @game.player_score ? @game.host : @game.player
        @game.host_score
        @user.update(score: @user.score += @game.host_score) if @user == @game.host
        @user.update(score: @user.score += @game.player_score) if @user == @game.player
        @game.update(status: :completed)
        GameChannel.broadcast_to(@game, {page: render_to_string(partial: "completed"), type: "completed"})
      else
        winner_is_host = @game_question.user == @game.host
        @game_question = GameQuestion.where(game: @game).find_by(order_number: @game.turn_number)
        @gamequestions = @game.game_questions
        prev_game_num = @game.turn_number - 1
        GameChannel.broadcast_to(@game, {
          correct_answer: params[:answer],
          round_end: render_to_string(partial: "round_end", locals: {winner: current_user}),
          page2: render_to_string(partial: "started"),
          winner_host: winner_is_host,
          turn_number: prev_game_num
        })
      end
    else
      NotificationChannel.broadcast_to(
        @user, {
          wrong_answer: params[:answer]
        }
      )
    end
  end

  def generate_leader_board
    @users = User.all
    @sorted = User.order('score DESC')
  end

  private

  def create_game_questions(game1)
    Question.all.sample(10).each_with_index do |q, i|
      GameQuestion.create!(game:game1, question:q, order_number: i)
    end
  end
end
