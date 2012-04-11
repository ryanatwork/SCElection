require 'spec_helper'

describe "precincts/index" do
  before(:each) do
    assign(:precincts, [
      stub_model(Precinct,
        :number => 1,
        :description => "Description"
      ),
      stub_model(Precinct,
        :number => 1,
        :description => "Description"
      )
    ])
  end

  it "renders a list of precincts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
