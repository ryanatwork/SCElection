require 'spec_helper'

describe "precincts/new" do
  before(:each) do
    assign(:precinct, stub_model(Precinct,
      :number => 1,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new precinct form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => precincts_path, :method => "post" do
      assert_select "input#precinct_number", :name => "precinct[number]"
      assert_select "input#precinct_description", :name => "precinct[description]"
    end
  end
end
