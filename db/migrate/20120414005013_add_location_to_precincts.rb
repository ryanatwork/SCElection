class AddLocationToPrecincts < ActiveRecord::Migration
  def change
    add_column :precincts, :location, :string
  end
end
