class CreateWinners < ActiveRecord::Migration
  def change
    create_table :winners do |t|
      t.string :title
      t.string :author
      t.string :product_page
      t.datetime :created_at
      t.timestamps null: false
    end
  end
end
