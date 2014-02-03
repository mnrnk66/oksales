require 'spec_helper'

describe "supplires/edit" do
  before(:each) do
    @supplire = assign(:supplire, stub_model(Supplire,
      :code => "MyString",
      :name => "MyString",
      :short_name => "MyString",
      :kana => "MyString",
      :postal_code => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :address3 => "MyString",
      :tel => "MyString",
      :fax => "MyString",
      :url => "MyString",
      :pic_name => "MyString",
      :pic_email => "MyString",
      :price_ratio => "",
      :create_user_id => 1,
      :update_user_id => 1
    ))
  end

  it "renders the edit supplire form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", supplire_path(@supplire), "post" do
      assert_select "input#supplire_code[name=?]", "supplire[code]"
      assert_select "input#supplire_name[name=?]", "supplire[name]"
      assert_select "input#supplire_short_name[name=?]", "supplire[short_name]"
      assert_select "input#supplire_kana[name=?]", "supplire[kana]"
      assert_select "input#supplire_postal_code[name=?]", "supplire[postal_code]"
      assert_select "input#supplire_address1[name=?]", "supplire[address1]"
      assert_select "input#supplire_address2[name=?]", "supplire[address2]"
      assert_select "input#supplire_address3[name=?]", "supplire[address3]"
      assert_select "input#supplire_tel[name=?]", "supplire[tel]"
      assert_select "input#supplire_fax[name=?]", "supplire[fax]"
      assert_select "input#supplire_url[name=?]", "supplire[url]"
      assert_select "input#supplire_pic_name[name=?]", "supplire[pic_name]"
      assert_select "input#supplire_pic_email[name=?]", "supplire[pic_email]"
      assert_select "input#supplire_price_ratio[name=?]", "supplire[price_ratio]"
      assert_select "input#supplire_create_user_id[name=?]", "supplire[create_user_id]"
      assert_select "input#supplire_update_user_id[name=?]", "supplire[update_user_id]"
    end
  end
end
