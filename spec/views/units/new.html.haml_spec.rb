require 'spec_helper'

describe "units/new" do
  before(:each) do
    assign(:unit, stub_model(Unit,
      :code => "MyString",
      :name => "MyString",
      :create_user_id => 1,
      :update_user_id => 1
    ).as_new_record)
  end

  it "renders new unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", units_path, "post" do
      assert_select "input#unit_code[name=?]", "unit[code]"
      assert_select "input#unit_name[name=?]", "unit[name]"
      assert_select "input#unit_create_user_id[name=?]", "unit[create_user_id]"
      assert_select "input#unit_update_user_id[name=?]", "unit[update_user_id]"
    end
  end
end
