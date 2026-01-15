# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id                   :bigint           not null, primary key
#  description          :string
#  diet_type            :string
#  dietary_restrictions :string
#  experience_level     :string
#  file                 :string
#  muscle_group         :string
#  name                 :string
#  picture              :string
#  price                :decimal(, )
#  type                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Product < ApplicationRecord
  has_many :order_items, inverse_of: :order
  has_many :orders, through: :order_items
  has_many :purchased_products, inverse_of: :product
  has_many :users, through: :purchased_products
  has_one_attached :file
  has_one_attached :picture do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  # Allowlist for Ransack (our search gem )
  def self.ransackable_attributes(auth_object = nil)
    super + %w[name description price diet_type dietary_restrictions experience_level muscle_group created_at
               updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    super + %w[picture_attachment picture_blob orders order_items]
  end
end
