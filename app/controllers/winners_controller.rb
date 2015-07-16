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
  end
end