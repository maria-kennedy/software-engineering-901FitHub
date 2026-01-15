# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default(0)
#  saved_card             :integer
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/, message: 'must contain @ and .' }

  validates :username, format: { with: /\A[a-zA-Z]+\z/, message: 'Username can only contain alphabet characters' }

  validate :password_complexity

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[#?!@$%^&*-]).{8,}$/

    errors.add :password,
               'Password must be at least8 characters long with 1 special character.'
  end

  def admin?
    role == 1 # 1 is an admin
  end

  has_many :orders, inverse_of: :user
  has_one :payment
  has_many :purchased_products, inverse_of: :user
  has_many :products, through: :purchased_products
  after_create :create_cart # made function to make a cart when a user is created
  after_create :create_payment # Get to use build_payment through has one relationship

  private

  def create_cart
    orders.create!(status: :cart) # Check the enum and if the user doesnt have a cart give them one
  end

  def create_payment
    return unless payment.nil?

    build_payment(name: nil, card_number: nil, expiration_month: nil, expiration_year: nil, security_code: nil)
    payment.save(validate: false)
    # we have to build it first then save because we cant user create and pass in parameters
  end
end
