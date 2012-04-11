require "spec_helper"

describe PrecinctsController do
  describe "routing" do

    it "routes to #index" do
      get("/precincts").should route_to("precincts#index")
    end

    it "routes to #new" do
      get("/precincts/new").should route_to("precincts#new")
    end

    it "routes to #show" do
      get("/precincts/1").should route_to("precincts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/precincts/1/edit").should route_to("precincts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/precincts").should route_to("precincts#create")
    end

    it "routes to #update" do
      put("/precincts/1").should route_to("precincts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/precincts/1").should route_to("precincts#destroy", :id => "1")
    end

  end
end
