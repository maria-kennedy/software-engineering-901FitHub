class AddSavedCardToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :saved_card, :integer
  end
end
