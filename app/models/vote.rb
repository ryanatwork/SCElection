class Vote < ActiveRecord::Base
  attr_accessible :candidate_id, :precinct_id, :votes
  belongs_to :candidate
  belongs_to :precinct
end
