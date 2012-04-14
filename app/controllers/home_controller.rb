class HomeController < ApplicationController
  def index
    @json = Precinct.all.to_gmaps4rails

  end
end
