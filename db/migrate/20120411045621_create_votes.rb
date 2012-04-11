class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :precinct_id
      t.integer :candidate_id
      t.integer :votes

      t.timestamps
    end
  end
end
