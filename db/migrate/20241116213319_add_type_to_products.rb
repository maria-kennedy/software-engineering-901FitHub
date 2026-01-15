# frozen_string_literal: true

class AddTypeToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :type, :string
    add_column :products, :diet_type, :string
    add_column :products, :dietary_restrictions, :string
    add_column :products, :experience_level, :string
    add_column :products, :muscle_group, :string
  end
end
