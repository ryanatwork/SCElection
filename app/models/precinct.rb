class Precinct < ActiveRecord::Base
  attr_accessible :description, :number, :location, :latitude, :longitude
  has_many :votes

  def precinct_full
    self.number.to_s + '-' + self.description
  end

end
