class AddMoreInfoToBooks < ActiveRecord::Migration
  def change
    change_table(:books) do |t|
      t.integer :pages
      t.integer :isbn
      t.float :list_price
      t.string :product_image
    end
  end
end
