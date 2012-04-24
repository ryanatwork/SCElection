require 'spec_helper'


describe CandidatesController do

  login_user

  # This should return the minimal set of attributes required to create a valid
  # Candidate. As you add validations to Candidate, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    FactoryGirl.create(:candidate)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CandidatesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all candidates as @candidates" do
      candidate = valid_attributes
      get :index, {}, valid_session
      assigns(:candidates).should eq([candidate])
    end
  end

  describe "GET show" do
    it "assigns the requested candidate as @candidate" do
      candidate = valid_attributes
      get :show, {:id => candidate.to_param}, valid_session
      assigns(:candidate).should eq(candidate)
    end
  end

  describe "GET new" do
    it "assigns a new candidate as @candidate" do
      get :new, {}, valid_session
      assigns(:candidate).should be_a_new(Candidate)
    end
  end

  describe "GET edit" do
    it "assigns the requested candidate as @candidate" do
      candidate = valid_attributes
      get :edit, {:id => candidate.to_param}, valid_session
      assigns(:candidate).should eq(candidate)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Candidate" do
        expect {
          post :create, {:candidate => valid_attributes}, valid_session
        }.to change(Candidate, :count).by(1)
      end

      it "assigns a newly created candidate as @candidate" do
        post :create, {:candidate => valid_attributes}, valid_session
        assigns(:candidate).should be_a(Candidate)
        assigns(:candidate).should be_persisted
      end

      it "redirects to the created candidate" do
        post :create, {:candidate => valid_attributes}, valid_session
        response.should redirect_to(Candidate.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved candidate as @candidate" do
        # Trigger the behavior that occurs when invalid params are submitted
        Candidate.any_instance.stub(:save).and_return(false)
        post :create, {:candidate => {}}, valid_session
        assigns(:candidate).should be_a_new(Candidate)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Candidate.any_instance.stub(:save).and_return(false)
        post :create, {:candidate => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested candidate" do
        candidate = valid_attributes
        # Assuming there are no other candidates in the database, this
        # specifies that the Candidate created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Candidate.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => candidate.to_param, :candidate => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested candidate as @candidate" do
        candidate = valid_attributes
        put :update, {:id => candidate.to_param, :candidate => valid_attributes}, valid_session
        assigns(:candidate).should eq(candidate)
      end

      it "redirects to the candidate" do
        candidate = valid_attributes
        put :update, {:id => candidate.to_param, :candidate => valid_attributes}, valid_session
        response.should redirect_to(candidate)
      end
    end

    describe "with invalid params" do
      it "assigns the candidate as @candidate" do
        candidate = valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Candidate.any_instance.stub(:save).and_return(false)
        put :update, {:id => candidate.to_param, :candidate => {}}, valid_session
        assigns(:candidate).should eq(candidate)
      end

      it "re-renders the 'edit' template" do
        candidate = valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Candidate.any_instance.stub(:save).and_return(false)
        put :update, {:id => candidate.to_param, :candidate => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested candidate" do
      candidate =  valid_attributes
      expect {
        delete :destroy, {:id => candidate.to_param}, valid_session
      }.to change(Candidate, :count).by(-1)
    end

    it "redirects to the candidates list" do
      candidate = valid_attributes
      delete :destroy, {:id => candidate.to_param}, valid_session
      response.should redirect_to(candidates_url)
    end
  end

end
