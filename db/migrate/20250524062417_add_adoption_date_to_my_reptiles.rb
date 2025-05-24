class AddAdoptionDateToMyReptiles < ActiveRecord::Migration[7.2]
  def change
    add_column :my_reptiles, :adoption_date, :date
  end
end
