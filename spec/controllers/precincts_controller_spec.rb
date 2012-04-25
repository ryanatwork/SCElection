require 'spec_helper'

describe PrecinctsController do

  login_user

  before do
    @precinct = FactoryGirl.create(:precinct)
  end

  describe "GET index" do
    it "assigns all precincts as @precincts" do
      get :index, {}
      assigns(:precincts).should eq([@precinct])
    end
  end

  describe "GET show" do
    it "assigns the requested precinct as @precinct" do
      get :show, {:id => @precinct.to_param}
      assigns(:precinct).should eq(@precinct)
    end
  end

  describe "GET new" do
    it "assigns a new precinct as @precinct" do
      get :new, {}
      assigns(:precinct).should be_a_new(Precinct)
    end
  end

  describe "GET edit" do
    it "assigns the requested precinct as @precinct" do
      get :edit, {:id => @precinct.to_param}
      assigns(:precinct).should eq(@precinct)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Precinct" do
        expect {
          post :create, {:precinct => @precincts}
        }.to change(Precinct, :count).by(1)
      end

      it "assigns a newly created precinct as @precinct" do
        post :create, {:precinct => @precincts}
        assigns(:precinct).should be_a(Precinct)
        assigns(:precinct).should be_persisted
      end

      it "redirects to the created precinct" do
        post :create, {:precinct => @precincts}
        response.should redirect_to(Precinct.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved precinct as @precinct" do
        # Trigger the behavior that occurs when invalid params are submitted
        Precinct.any_instance.stub(:save).and_return(false)
        post :create, {:precinct => {}}
        assigns(:precinct).should be_a_new(Precinct)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Precinct.any_instance.stub(:save).and_return(false)
        post :create, {:precinct => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested precinct" do
        # Assuming there are no other precincts in the database, this
        # specifies that the Precinct created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Precinct.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @precinct.to_param, :precinct => {'these' => 'params'}}
      end

      it "assigns the requested precinct as @precinct" do
        put :update, {:id => @precinct.to_param, :precinct => @precincts}
        assigns(:precinct).should eq(@precinct)
      end

      it "redirects to the precinct" do
        put :update, {:id => @precinct.to_param, :precinct => @precincts}
        response.should redirect_to(@precinct)
      end
    end

    describe "with invalid params" do
      it "assigns the precinct as @precinct" do
        # Trigger the behavior that occurs when invalid params are submitted
        Precinct.any_instance.stub(:save).and_return(false)
        put :update, {:id => @precinct.to_param, :precinct => {}}
        assigns(:precinct).should eq(@precinct)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Precinct.any_instance.stub(:save).and_return(false)
        put :update, {:id => @precinct.to_param, :precinct => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested precinct" do
      expect {
        delete :destroy, {:id => @precinct.to_param}
      }.to change(Precinct, :count).by(-1)
    end

    it "redirects to the precincts list" do
      delete :destroy, {:id => @precinct.to_param}
      response.should redirect_to(precincts_url)
    end
  end

end
