require 'spec_helper'

describe Precinct do

  before do
    FactoryGirl.create(:precinct)
  end

  describe "#gmaps4rails_address" do
    it "should return the concat name" do
      test = Precinct.last
      test.gmaps4rails_address.should == "12345 Main Street, Santa Clarita, CA USA"
    end
  end

  describe "#precinct_full" do
    it "should return full precinct info" do
      test = Precinct.last
      test.precinct_full.should == "1-Santa Clarita Library"
    end
  end

  describe "#full_address" do
    it "should return the full address" do
      test = Precinct.last
      test.full_address.should == "12345 Main Street Santa Clarita, CA"
    end
  end

end
