require 'rails_helper'

RSpec.describe "tympanograms/show", :type => :view do
  before(:each) do
    @tympanogram = assign(:tympanogram, Tympanogram.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Comment/)
    expect(rendered).to match(/Image Location/)
    expect(rendered).to match(/Impedancemeter/)
    expect(rendered).to match(/Hospital/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/4/)
  end
end
