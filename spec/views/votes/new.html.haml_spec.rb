require 'spec_helper'

describe "votes/new" do
  before(:each) do
    assign(:vote, stub_model(Vote,
      :precint_id => 1,
      :candidate_id => 1,
      :votes => 1
    ).as_new_record)
  end

  it "renders new vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => votes_path, :method => "post" do
      assert_select "input#vote_precint_id", :name => "vote[precint_id]"
      assert_select "input#vote_candidate_id", :name => "vote[candidate_id]"
      assert_select "input#vote_votes", :name => "vote[votes]"
    end
  end
end
