require 'rails_helper'

RSpec.describe "tympanograms/new", :type => :view do
  before(:each) do
    assign(:tympanogram, Tympanogram.new(
      :patient => nil,
      :examiner => nil,
      :comment => "MyString",
      :image_location => "MyString",
      :impedancemeter => "MyString",
      :hospital => "MyString",
      :rt_pvt => 1.5,
      :rt_sc => 1.5,
      :rt_peak => 1,
      :rt_interval => 1.5,
      :rt_data => "MyText",
      :rt_data_length => 1,
      :lt_pvt => 1.5,
      :lt_sc => 1.5,
      :lt_peak => 1,
      :lt_interval => 1.5,
      :lt_data => "MyText",
      :lt_data_length => 1
    ))
  end

  it "renders new tympanogram form" do
    render

    assert_select "form[action=?][method=?]", tympanograms_path, "post" do

      assert_select "input#tympanogram_patient_id[name=?]", "tympanogram[patient_id]"

      assert_select "input#tympanogram_examiner_id[name=?]", "tympanogram[examiner_id]"

      assert_select "input#tympanogram_comment[name=?]", "tympanogram[comment]"

      assert_select "input#tympanogram_image_location[name=?]", "tympanogram[image_location]"

      assert_select "input#tympanogram_impedancemeter[name=?]", "tympanogram[impedancemeter]"

      assert_select "input#tympanogram_hospital[name=?]", "tympanogram[hospital]"

      assert_select "input#tympanogram_rt_pvt[name=?]", "tympanogram[rt_pvt]"

      assert_select "input#tympanogram_rt_sc[name=?]", "tympanogram[rt_sc]"

      assert_select "input#tympanogram_rt_peak[name=?]", "tympanogram[rt_peak]"

      assert_select "input#tympanogram_rt_interval[name=?]", "tympanogram[rt_interval]"

      assert_select "textarea#tympanogram_rt_data[name=?]", "tympanogram[rt_data]"

      assert_select "input#tympanogram_rt_data_length[name=?]", "tympanogram[rt_data_length]"

      assert_select "input#tympanogram_lt_pvt[name=?]", "tympanogram[lt_pvt]"

      assert_select "input#tympanogram_lt_sc[name=?]", "tympanogram[lt_sc]"

      assert_select "input#tympanogram_lt_peak[name=?]", "tympanogram[lt_peak]"

      assert_select "input#tympanogram_lt_interval[name=?]", "tympanogram[lt_interval]"

      assert_select "textarea#tympanogram_lt_data[name=?]", "tympanogram[lt_data]"

      assert_select "input#tympanogram_lt_data_length[name=?]", "tympanogram[lt_data_length]"
    end
  end
end
