require 'spec_helper'

describe "candidates/edit" do
  before(:each) do
    @candidate = assign(:candidate, stub_model(Candidate,
      :name => "MyString"
    ))
  end

  it "renders the edit candidate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => candidates_path(@candidate), :method => "post" do
      assert_select "input#candidate_name", :name => "candidate[name]"
    end
  end
end
