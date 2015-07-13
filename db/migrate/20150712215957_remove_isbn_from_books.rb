class RemoveIsbnFromBooks < ActiveRecord::Migration
  def change
    change_table(:books) do |t|
      t.remove :isbn
      t.remove :price
      t.string :customer_reviews
    end
  end
end
