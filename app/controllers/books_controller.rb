class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:book])
  end

  def new
    @book = Book.new
  end

  def select
    api = AmazonAPI.new
    books = api.book_lookup params[:Author], params[:Title]
  end

  def create

    # respond_to do |format|
    #   if @book.save
    #     format.html { redirect_to @book, notice: 'Book has been suggested and can now be voted on.' }
    #     format.json { render :show, status: :created, location: @book }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @book.errors, status: :unprocessable_entity }
    #   end
    # end
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
