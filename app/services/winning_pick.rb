class WinningPick
  def winning_book
    Winner.new.declare_winner
  end

  def record_winner
    self.winning_book.save!
  end

  def reset_vote_count
    User.each do |v|
      v.votes_left = 1
    end
  end

  def reset_book_selections
    @winner = self.record_winner
    if @winner.save!
      Book.all.destroy
    end
  end

  def run!
    book = winning_book

  end
end