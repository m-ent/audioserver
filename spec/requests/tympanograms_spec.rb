require 'rails_helper'

RSpec.describe "Tympanograms", :type => :request do
  describe "GET /tympanograms" do
    it "works! (now write some real specs)" do
      get tympanograms_path
      expect(response).to have_http_status(200)
    end
  end
end
