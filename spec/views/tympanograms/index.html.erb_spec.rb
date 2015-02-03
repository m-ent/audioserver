require 'rails_helper'

RSpec.describe "tympanograms/index", :type => :view do
  before(:each) do
    assign(:tympanograms, [
      Tympanogram.create!(
        :patient => nil,
        :examiner => nil,
        :comment => "Comment",
        :image_location => "Image Location",
        :impedancemeter => "Impedancemeter",
        :hospital => "Hospital",
        :rt_pvt => 1.5,
        :rt_sc => 1.5,
        :rt_peak => 1,
        :rt_interval => 1.5,
        :rt_data => "MyText",
        :rt_data_length => 2,
        :lt_pvt => 1.5,
        :lt_sc => 1.5,
        :lt_peak => 3,
        :lt_interval => 1.5,
        :lt_data => "MyText",
        :lt_data_length => 4
      ),
      Tympanogram.create!(
        :patient => nil,
        :examiner => nil,
        :comment => "Comment",
        :image_location => "Image Location",
        :impedancemeter => "Impedancemeter",
        :hospital => "Hospital",
        :rt_pvt => 1.5,
        :rt_sc => 1.5,
        :rt_peak => 1,
        :rt_interval => 1.5,
        :rt_data => "MyText",
        :rt_data_length => 2,
        :lt_pvt => 1.5,
        :lt_sc => 1.5,
        :lt_peak => 3,
        :lt_interval => 1.5,
        :lt_data => "MyText",
        :lt_data_length => 4
      )
    ])
  end

  it "renders a list of tympanograms" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
    assert_select "tr>td", :text => "Image Location".to_s, :count => 2
    assert_select "tr>td", :text => "Impedancemeter".to_s, :count => 2
    assert_select "tr>td", :text => "Hospital".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
