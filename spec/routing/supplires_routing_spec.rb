require "spec_helper"

describe SuppliresController do
  describe "routing" do

    it "routes to #index" do
      get("/supplires").should route_to("supplires#index")
    end

    it "routes to #new" do
      get("/supplires/new").should route_to("supplires#new")
    end

    it "routes to #show" do
      get("/supplires/1").should route_to("supplires#show", :id => "1")
    end

    it "routes to #edit" do
      get("/supplires/1/edit").should route_to("supplires#edit", :id => "1")
    end

    it "routes to #create" do
      post("/supplires").should route_to("supplires#create")
    end

    it "routes to #update" do
      put("/supplires/1").should route_to("supplires#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/supplires/1").should route_to("supplires#destroy", :id => "1")
    end

  end
end
