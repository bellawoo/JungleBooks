class AddUrlToBooks < ActiveRecord::Migration
  def change
    change_table(:books) do |t|
      t.remove :list_price
      t.string :product_page
    end
  end
end
