require 'spec_helper'

describe "votes/edit" do
  before(:each) do
    @vote = assign(:vote, stub_model(Vote,
      :precint_id => 1,
      :candidate_id => 1,
      :votes => 1
    ))
  end

  it "renders the edit vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => votes_path(@vote), :method => "post" do
      assert_select "input#vote_precint_id", :name => "vote[precint_id]"
      assert_select "input#vote_candidate_id", :name => "vote[candidate_id]"
      assert_select "input#vote_votes", :name => "vote[votes]"
    end
  end
end
