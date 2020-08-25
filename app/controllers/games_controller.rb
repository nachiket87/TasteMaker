class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @question = Question.find(1) 
    
  end

  def create
    @user = User.find_by(email:params[:email])
    @game = Game.new(player:@user, host:current_user, turn_number: 0, host_score:0, player_score:0)
    generate_game_questions(@questions, @game)
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

  def generate_game_questions(questions, thisgame)
    @questions = Question.first(10)#this needs to change
    @questions.each do |question1|
      GameQuestion.create(game:thisgame, question_id:question1.id)
    end
  end

end
