# frozen_string_literal: true

class AddUsernameAndRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :role, :integer, default: 0 # default role for a user is 0 admin = 1
  end
end
