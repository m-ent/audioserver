require "rails_helper"

describe ExaminersController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/examiners")).to route_to("examiners#index")
    end

    it "routes to #new" do
      expect(get("/examiners/new")).to route_to("examiners#new")
    end

    it "routes to #show" do
      expect(get("/examiners/1")).to route_to("examiners#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/examiners/1/edit")).to route_to("examiners#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/examiners")).to route_to("examiners#create")
    end

    it "routes to #update" do
      expect(put("/examiners/1")).to route_to("examiners#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/examiners/1")).to route_to("examiners#destroy", :id => "1")
    end

  end
end
