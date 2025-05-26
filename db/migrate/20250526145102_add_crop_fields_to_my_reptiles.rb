class AddCropFieldsToMyReptiles < ActiveRecord::Migration[7.2]
  def change
    add_column :my_reptiles, :crop_x, :float
    add_column :my_reptiles, :crop_y, :float
    add_column :my_reptiles, :crop_width, :float
    add_column :my_reptiles, :crop_height, :float
  end
end
