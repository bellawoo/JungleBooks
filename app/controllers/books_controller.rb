class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    # sesh = AmazonAPI.new(aws_iam)
    # locate = sesh.find_book params[:author], params[:title], #params[:isbn]
    locate = Book.new
    if locate 
      # uri = spot_track[1]
      if true
        book = Book.where(
          author:       params[:author],
          title:        params[:title],
          isbn:         params[:isbn],
          suggester_id: current_user.id,
        ).first_or_create!
        current_user.votes.create! book: book, value: 1
      else
        flash[:notice] = "You have suggested too many books. Wait til next time you host."
      end
    else
      flash[:notice] = "No book found, please try again."
    end
    redirect_to :new
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book has been suggested and can now be voted on.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
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

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params[:book]
    end
end
