class WinnerController < ApplicationController
  def index
    @winners = Winner.all
  end

  def show
    @winner = Winner.find(params[:id])
  end

  def new
    @winner = Winner.new.declare_winner
  end
end