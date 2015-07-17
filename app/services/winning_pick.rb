class WinningPick
  attr_reader :winner

  # def winning_book
  #   winner = Winner.new.declare_winner
  #   record_winner winner
  # end

  def record_winner
    winning_book = Book.declare_winner
    @winner = Winner.create!(
      title: winning_book.title,
      author: winning_book.author,
      product_page: winning_book.product_page
    )
  end

  def reset_book_selections
    if @winner
      Book.destroy_all
    end
  end

  def reset_vote_count
    User.all.map { |v| v.votes_left = 1}
  end

  def run!
    record_winner 
    reset_vote_count
    reset_book_selections
  end
end