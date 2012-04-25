require 'spec_helper'

describe VotesController do

  login_user

  before do
    @vote = FactoryGirl.create(:vote)
  end


  describe "GET index" do
    it "assigns all votes as @votes" do
      get :index, {}
      assigns(:votes).should eq([@vote])
    end
  end

  describe "GET show" do
    it "assigns the requested vote as @vote" do
      get :show, {:id => @vote.to_param}
      assigns(:vote).should eq(@vote)
    end
  end

  describe "GET new" do
    it "assigns a new vote as @vote" do
      get :new, {}
      assigns(:vote).should be_a_new(Vote)
    end
  end

  describe "GET edit" do
    it "assigns the requested vote as @vote" do
      get :edit, {:id => @vote.to_param}
      assigns(:vote).should eq(@vote)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Vote" do
        expect {
          post :create, {:vote => FactoryGirl.attributes_for(:vote)}
        }.to change(Vote, :count).by(1)
      end

      it "assigns a newly created vote as @vote" do
        post :create, {:vote => FactoryGirl.attributes_for(:vote)}
        assigns(:vote).should be_a(Vote)
        assigns(:vote).should be_persisted
      end

      it "redirects to the created vote" do
        post :create, {:vote => FactoryGirl.attributes_for(:vote)}
        response.should redirect_to(Vote.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vote as @vote" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vote.any_instance.stub(:save).and_return(false)
        post :create, {:vote => {}}
        assigns(:vote).should be_a_new(Vote)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vote.any_instance.stub(:save).and_return(false)
        post :create, {:vote => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vote" do
        # Assuming there are no other votes in the database, this
        # specifies that the Vote created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Vote.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @vote.to_param, :vote => {'these' => 'params'}}
      end

      it "assigns the requested vote as @vote" do
        put :update, {:id => @vote.to_param, :vote => FactoryGirl.attributes_for(:vote)}
        assigns(:vote).should eq(@vote)
      end

      it "redirects to the vote" do
        put :update, {:id => @vote.to_param, :vote => FactoryGirl.attributes_for(:vote)}
        response.should redirect_to(@vote)
      end
    end

    describe "with invalid params" do
      it "assigns the vote as @vote" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vote.any_instance.stub(:save).and_return(false)
        put :update, {:id => @vote.to_param, :vote => {}}
        assigns(:vote).should eq(@vote)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vote.any_instance.stub(:save).and_return(false)
        put :update, {:id => @vote.to_param, :vote => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vote" do
      expect {
        delete :destroy, {:id => @vote.to_param}
      }.to change(Vote, :count).by(-1)
    end

    it "redirects to the votes list" do
      delete :destroy, {:id => @vote.to_param}
      response.should redirect_to(votes_url)
    end
  end

end
