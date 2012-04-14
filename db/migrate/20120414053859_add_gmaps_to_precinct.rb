class AddGmapsToPrecinct < ActiveRecord::Migration
  def change
    add_column :precincts, :gmaps, :boolean
  end
end
