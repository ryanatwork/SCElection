class CreatePrecincts < ActiveRecord::Migration
  def change
    create_table :precincts do |t|
      t.integer :number
      t.string :description

      t.timestamps
    end
  end
end
