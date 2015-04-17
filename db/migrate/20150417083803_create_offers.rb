class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :product_id
      t.integer :priceOffer
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :offers, :product_id
    add_foreign_key :offers, :users
  end
end
