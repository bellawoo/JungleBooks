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
    current_user.votes.create! book_id: self.id, value: 1
    if @book.save
      flash[:notice] = "The book has been added and can now be voted on."
      redirect_to :index
    else
      flash[:notice] = "Something went wrong. Please try again."
      redirect_to :new
    end

  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def total
    @book = Book.find params[:book_id]
    @book.total_votes
    render json: { total: @book.total_votes }
  end
end
