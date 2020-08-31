class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @games = Game.where(status: "waiting")
  end
end
