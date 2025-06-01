class AddSpeciesAndMorphToMyReptiles < ActiveRecord::Migration[7.2]
  def change
    add_column :my_reptiles, :species, :string
    add_column :my_reptiles, :morph, :string
  end
end
