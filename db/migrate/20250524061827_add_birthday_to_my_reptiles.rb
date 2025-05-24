class AddBirthdayToMyReptiles < ActiveRecord::Migration[7.2]
  def change
    add_column :my_reptiles, :birthday, :date
  end
end
