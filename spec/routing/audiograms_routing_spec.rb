require "rails_helper"

describe AudiogramsController do
  describe "routing" do
    it "routes to #index" do
#      get("/audiograms").should route_to("audiograms#index")
      expect(get("/patients/1/audiograms")).to route_to("audiograms#index", :patient_id => "1")
    end

    it "routes to #new" do
#      get("/audiograms/new").should route_to("audiograms#new")
      expect(get("/patients/1/audiograms/new")).to route_to("audiograms#new", :patient_id => "1")
    end

    it "routes to #show" do
      expect(get("/patients/1/audiograms/2")).to route_to("audiograms#show", :patient_id => "1", :id => "2")
    end

    it "routes to #edit" do
      expect(get("/patients/1//audiograms/2/edit")).to route_to("audiograms#edit", :patient_id => "1", :id => "2")
    end

    it "routes to #create" do
      expect(post("/patients/1/audiograms")).to route_to("audiograms#create", :patient_id => "1")
    end

    it "routes to #update" do
      expect(put("/patients/1/audiograms/2")).to route_to("audiograms#update", :patient_id => "1", :id => "2")
    end

    it "routes to #destroy" do
      expect(delete("/patients/1/audiograms/2")).to route_to("audiograms#destroy", :patient_id => "1", :id => "2")
    end

    it "routes to #direct_create" do
      expect(post("/audiograms/direct_create")).to route_to("audiograms#direct_create")
    end

  end
end
