class WinnersController < ApplicationController
  def index
    @most_recent_winner = Winner.last
    @winners = Winner.all
  end

  def show
    @winner = Winner.find(params[:id])
  end

  def create
    @winner = WinningPick.new.run!
    redirect_to root_path
    flash[:notice] = "The winning book has been chosen and a new round of voting is now open."
  end
end