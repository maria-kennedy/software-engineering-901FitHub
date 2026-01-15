# == Schema Information
#
# Table name: orders
#
#  id                  :bigint           not null, primary key
#  confirmation_number :integer
#  date                :date
#  status              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :bigint
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  before_create :set_defaults #using this to set the date and confirmation number
  enum status: { cart: 0, completed: 1} #Use this for switching "mode"
  has_many :order_items, inverse_of: :order
  has_many :products, through: :order_items
  scope :completed_orders, -> { where(status: :completed) } #simplifies queries on completed orders

  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: 'user_id',
    inverse_of: :orders
  )

  private

  def set_defaults
    self.date ||= Date.today
    self.confirmation_number ||= generate_confirmation_number
  end

  def generate_confirmation_number
    rand(100000..999999)
  end

end
