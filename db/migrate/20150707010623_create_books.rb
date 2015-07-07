class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null:false
      t.integer :isbn
      t.float :price
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
