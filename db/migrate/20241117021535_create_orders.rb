class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :confirmation_number
      t.date :date
      t.integer :status

      t.timestamps
    end
  end
end
