class CreateWishlistReptiles < ActiveRecord::Migration[7.2]
  def change
    create_table :wishlist_reptiles do |t|
      t.string :species
      t.string :morph
      t.integer :priority
      t.text :memo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
