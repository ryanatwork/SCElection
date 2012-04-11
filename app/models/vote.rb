class Vote < ActiveRecord::Base
  attr_accessible :candidate_id, :precint_id, :votes
end
