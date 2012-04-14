class AddLatitudeAndLongitudeToPrecinct < ActiveRecord::Migration
  def change
    add_column :precincts, :latitude, :float
    add_column :precincts, :longitude, :float
  end
end
