require 'spec_helper'

describe "units/index" do
  before(:each) do
    assign(:units, [
      stub_model(Unit,
        :code => "Code",
        :name => "Name",
        :create_user_id => 1,
        :update_user_id => 2
      ),
      stub_model(Unit,
        :code => "Code",
        :name => "Name",
        :create_user_id => 1,
        :update_user_id => 2
      )
    ])
  end

  it "renders a list of units" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
