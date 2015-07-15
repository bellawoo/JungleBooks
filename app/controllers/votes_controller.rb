class VotesController < ApplicationController
  def new
    if current_user.votes_left > 0
      book = Book.find_by_id(params[:id])
      Vote.create! user_id: current_user.id, book_id: book.id, value: params[:value]
      vl = current_user.votes_left
      current_user.update(votes_left: vl -= 1)
    else
      flash[:alert] = "You are out of votes!"
      status 400
    end
    redirect_to ("/")
  end
end