require 'spec_helper'

describe "supplires/show" do
  before(:each) do
    @supplire = assign(:supplire, stub_model(Supplire,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Name/)
    rendered.should match(/Short Name/)
    rendered.should match(/Kana/)
    rendered.should match(/Postal Code/)
    rendered.should match(/Address1/)
    rendered.should match(/Address2/)
    rendered.should match(/Address3/)
    rendered.should match(/Tel/)
    rendered.should match(/Fax/)
    rendered.should match(/Url/)
    rendered.should match(/Pic Name/)
    rendered.should match(/Pic Email/)
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
