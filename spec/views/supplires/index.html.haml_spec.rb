require 'spec_helper'

describe "supplires/index" do
  before(:each) do
    assign(:supplires, [
      stub_model(Supplire,
        :code => "Code",
        :name => "Name",
        :short_name => "Short Name",
        :kana => "Kana",
        :postal_code => "Postal Code",
        :address1 => "Address1",
        :address2 => "Address2",
        :address3 => "Address3",
        :tel => "Tel",
        :fax => "Fax",
        :url => "Url",
        :pic_name => "Pic Name",
        :pic_email => "Pic Email",
        :price_ratio => "",
        :create_user_id => 1,
        :update_user_id => 2
      ),
      stub_model(Supplire,
        :code => "Code",
        :name => "Name",
        :short_name => "Short Name",
        :kana => "Kana",
        :postal_code => "Postal Code",
        :address1 => "Address1",
        :address2 => "Address2",
        :address3 => "Address3",
        :tel => "Tel",
        :fax => "Fax",
        :url => "Url",
        :pic_name => "Pic Name",
        :pic_email => "Pic Email",
        :price_ratio => "",
        :create_user_id => 1,
        :update_user_id => 2
      )
    ])
  end

  it "renders a list of supplires" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
    assert_select "tr>td", :text => "Kana".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "Address3".to_s, :count => 2
    assert_select "tr>td", :text => "Tel".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Pic Name".to_s, :count => 2
    assert_select "tr>td", :text => "Pic Email".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
