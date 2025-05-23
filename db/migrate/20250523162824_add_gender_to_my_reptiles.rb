class AddGenderToMyReptiles < ActiveRecord::Migration[7.2]
  def change
    add_column :my_reptiles, :gender, :string
  end
end
