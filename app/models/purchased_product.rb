# == Schema Information
#
# Table name: purchased_products
#
#  id                    :bigint           not null, primary key
#  review_description    :string
#  review_rating         :integer
#  review_recommendation :boolean
#  review_title          :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  product_id            :bigint           not null
#  user_id               :bigint           not null
#
# Indexes
#
#  index_purchased_products_on_product_id  (product_id)
#  index_purchased_products_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
class PurchasedProduct < ApplicationRecord
  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: 'user_id',
    inverse_of: :purchased_products
  )
  belongs_to(
    :product,
    class_name: 'Product',
    foreign_key: 'product_id',
    inverse_of: :purchased_products
  )
  validates :review_title, presence: true, length: { maximum: 150 }
  validates :review_description, length: { maximum: 1000 }, allow_blank: true
  validates :review_rating, presence: true

  validate :review_title_must_be_updated, on: :update

  private

  def review_title_must_be_updated
    if review_title == "Pending Review"
      errors.add(:review_title, "must be updated before submitting your review.")
    end
  end

end
