# == Schema Information
#
# Table name: payments
#
#  id               :bigint           not null, primary key
#  card_number      :string
#  expiration_month :integer
#  expiration_year  :integer
#  name             :string
#  security_code    :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint
#
# Indexes
#
#  index_payments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Payment < ApplicationRecord

  validates :card_number, presence: true, format: { with: /\A\d+\z/ }, length: { is: 16 }
  validates :security_code, presence: true, format: { with: /\A\d+\z/ }, length: { in: 3..4 }
  validates :name, presence: true
  validates :expiration_month, presence: true, inclusion: { in: 1..12 }
  validates :expiration_year, presence: true

  validate :expiration_date_not_expired

  belongs_to :user

  def expiration_date_not_expired
    card_exp = Date.new(expiration_year, expiration_month).end_of_month
    today = Date.today
    if card_exp < Date.today.end_of_month
      errors.add(:base, "Your card's expiration date has passed")
    end
  end
end
