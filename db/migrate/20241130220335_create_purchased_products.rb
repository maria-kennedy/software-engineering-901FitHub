class CreatePurchasedProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :purchased_products do |t|
      t.string :review_title
      t.string :review_description
      t.integer :review_rating
      t.boolean :review_recommendation
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
