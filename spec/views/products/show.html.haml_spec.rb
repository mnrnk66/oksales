require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :code => "Code",
      :name => "Name",
      :short_name => "Short Name",
      :product_group_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Name/)
    rendered.should match(/Short Name/)
    rendered.should match(/1/)
  end
end
