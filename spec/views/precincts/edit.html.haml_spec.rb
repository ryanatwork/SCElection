require 'spec_helper'

describe "precincts/edit" do
  before(:each) do
    @precinct = assign(:precinct, stub_model(Precinct,
      :number => 1,
      :description => "MyString"
    ))
  end

  it "renders the edit precinct form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => precincts_path(@precinct), :method => "post" do
      assert_select "input#precinct_number", :name => "precinct[number]"
      assert_select "input#precinct_description", :name => "precinct[description]"
    end
  end
end
