require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :code => "MyString",
      :name => "MyString",
      :short_name => "MyString",
      :product_group_id => 1
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_path(@product), "post" do
      assert_select "input#product_code[name=?]", "product[code]"
      assert_select "input#product_name[name=?]", "product[name]"
      assert_select "input#product_short_name[name=?]", "product[short_name]"
      assert_select "input#product_product_group_id[name=?]", "product[product_group_id]"
    end
  end
end
