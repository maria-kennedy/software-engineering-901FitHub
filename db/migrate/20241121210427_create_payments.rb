class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :name
      t.string :card_number
      t.integer :expiration_month
      t.integer :expiration_year
      t.string :security_code

      t.timestamps
    end
  end
end
