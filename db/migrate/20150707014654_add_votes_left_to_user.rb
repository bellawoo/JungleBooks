class AddVotesLeftToUser < ActiveRecord::Migration
  def change
    add_column :users, :votes_left, :integer, :default => 10
  end
end
