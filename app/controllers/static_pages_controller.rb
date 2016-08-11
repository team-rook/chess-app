class StaticPagesController < ApplicationController
  def index
      @games = Game.needing_second_player
  end
end
