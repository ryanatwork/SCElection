class Precinct < ActiveRecord::Base
  attr_accessible :description, :number, :location, :latitude, :longitude
  has_many :votes

  acts_as_gmappable

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.location}, Santa Clarita, CA USA"
  end


  def precinct_full
    self.number.to_s + '-' + self.description
  end

  def full_address
    self.location + 'Santa Clarita, CA'
  end

end
