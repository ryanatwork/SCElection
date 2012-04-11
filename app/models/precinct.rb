class Precinct < ActiveRecord::Base
  attr_accessible :description, :number
  has_many :votes
end
