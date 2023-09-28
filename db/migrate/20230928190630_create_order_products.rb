class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.integer :quantity
      t.integer :order_id
      t.integer :product_id
      t.decimal :total

      t.timestamps
    end
  end
end
