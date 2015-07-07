class AddVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :value
    end

    rename_column :books, :user_id, :suggester_id
  end
end
