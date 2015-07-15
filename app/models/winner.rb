class Winner < ActiveRecord::Base
  def declare_winner
    winner = Books.max_by { |w| w.total_votes}
  end
end
