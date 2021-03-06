class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def select
    api = AmazonAPI.new
    @books = api.book_lookup params[:Author], params[:Title]
    render :select
  end

  def create
    @book = Book.save_as_selection params[:title], params[:author], params[:customer_reviews]
    @book.suggester_id = current_user.id
    current_user.votes.create! book_id: @book.id, value: 1
    if @book.save
      redirect_to books_path
      flash[:notice]= "The book has been added and can now be voted on."
    else
      redirect_to new_book_path
      flash[:notice] = "Something went wrong. Please try again."
    end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
