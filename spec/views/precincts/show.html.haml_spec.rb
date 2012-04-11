require 'spec_helper'

describe "precincts/show" do
  before(:each) do
    @precinct = assign(:precinct, stub_model(Precinct,
      :number => 1,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Description/)
  end
end
