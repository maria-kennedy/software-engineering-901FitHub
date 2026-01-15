class AddProductDetailsToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :product_name, :string
    add_column :order_items, :product_price, :decimal
  end
end
