require "rails_helper"

RSpec.describe TympanogramsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tympanograms").to route_to("tympanograms#index")
    end

    it "routes to #new" do
      expect(:get => "/tympanograms/new").to route_to("tympanograms#new")
    end

    it "routes to #show" do
      expect(:get => "/tympanograms/1").to route_to("tympanograms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tympanograms/1/edit").to route_to("tympanograms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tympanograms").to route_to("tympanograms#create")
    end

    it "routes to #update" do
      expect(:put => "/tympanograms/1").to route_to("tympanograms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tympanograms/1").to route_to("tympanograms#destroy", :id => "1")
    end

  end
end
