class AddImageToMyReptiles < ActiveRecord::Migration[7.2]
  def change
    add_column :my_reptiles, :image, :string
  end
end
