require 'rails_helper'

describe "examiners/show" do
  before(:each) do
    @examiner = assign(:examiner, stub_model(Examiner,
      :worker_id => "Worker"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Worker/)
  end
end
