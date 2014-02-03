require 'spec_helper'

describe "units/show" do
  before(:each) do
    @unit = assign(:unit, stub_model(Unit,
      :code => "Code",
      :name => "Name",
      :create_user_id => 1,
      :update_user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
