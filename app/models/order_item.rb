# == Schema Information
#
# Table name: order_items
#
#  id            :bigint           not null, primary key
#  product_name  :string
#  product_price :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  order_id      :bigint           not null
#  product_id    :bigint           not null
#
# Indexes
#
#  index_order_items_on_order_id    (order_id)
#  index_order_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (product_id => products.id)
#
class OrderItem < ApplicationRecord
  before_save :store_product_details
  belongs_to(
    :order,
    class_name: 'Order',
    foreign_key: 'order_id',
    inverse_of: :order_items
  )
  belongs_to(
    :product,
    class_name: 'Product',
    foreign_key: 'product_id',
    inverse_of: :order_items
  )
  private

  def store_product_details
    self.product_name = product.name
    self.product_price = product.price
  end

end
