require 'spec_helper'


describe CandidatesController do

  login_user

  before do
    @candidate = FactoryGirl.create(:candidate)
  end

  describe "GET index" do
    it "assigns all candidates as @candidates" do
      get :index, {}
      assigns(:candidates).should eq([@candidate])
    end
  end

  describe "GET show" do
    it "assigns the requested candidate as @candidate" do
      get :show, {:id => @candidate.to_param}
      assigns(:candidate).should eq(@candidate)
    end
  end

  describe "GET new" do
    it "assigns a new candidate as @candidate" do
      get :new, {}
      assigns(:candidate).should be_a_new(Candidate)
    end
  end

  describe "GET edit" do
    it "assigns the requested candidate as @candidate" do
      get :edit, {:id => @candidate.to_param}
      assigns(:candidate).should eq(@candidate)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Candidate" do
        expect {
          post :create, {:candidate => FactoryGirl.attributes_for(:candidate)}
        }.to change(Candidate, :count).by(1)
      end

      it "assigns a newly created candidate as @candidate" do
        post :create, {:candidate => FactoryGirl.attributes_for(:candidate)}
        assigns(:candidate).should be_a(Candidate)
        assigns(:candidate).should be_persisted
      end

      it "redirects to the created candidate" do
        post :create, {:candidate => FactoryGirl.attributes_for(:candidate)}
        response.should redirect_to(Candidate.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved candidate as @candidate" do
        # Trigger the behavior that occurs when invalid params are submitted
        Candidate.any_instance.stub(:save).and_return(false)
        post :create, {:candidate => {}}
        assigns(:candidate).should be_a_new(Candidate)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Candidate.any_instance.stub(:save).and_return(false)
        post :create, {:candidate => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested candidate" do
        # Assuming there are no other candidates in the database, this
        # specifies that the Candidate created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Candidate.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @candidate.to_param, :candidate => {'these' => 'params'}}
      end

      it "assigns the requested candidate as @candidate" do
        put :update, {:id => @candidate.to_param, :candidate => FactoryGirl.attributes_for(:candidate)}
        assigns(:candidate).should eq(@candidate)
      end

      it "redirects to the candidate" do
        put :update, {:id => @candidate.to_param, :candidate => FactoryGirl.attributes_for(:candidate)}
        response.should redirect_to(@candidate)
      end
    end

    describe "with invalid params" do
      it "assigns the candidate as @candidate" do
        # Trigger the behavior that occurs when invalid params are submitted
        Candidate.any_instance.stub(:save).and_return(false)
        put :update, {:id => @candidate.to_param, :candidate => {}}
        assigns(:candidate).should eq(@candidate)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Candidate.any_instance.stub(:save).and_return(false)
        put :update, {:id => @candidate.to_param, :candidate => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested candidate" do
      expect {
        delete :destroy, {:id => @candidate.to_param}
      }.to change(Candidate, :count).by(-1)
    end

    it "redirects to the candidates list" do
      delete :destroy, {:id => @candidate.id}
      response.should redirect_to(candidates_url)
    end
  end

end
