require 'rails_helper'

RSpec.describe "packages/new", type: :view do
  before(:each) do
    assign(:package, Package.new(
      :title => "MyString",
      :description => "MyText",
      :limit => 1,
      :price => "MyString",
      :week => nil
    ))
  end

  it "renders new package form" do
    render

    assert_select "form[action=?][method=?]", packages_path, "post" do

      assert_select "input#package_title[name=?]", "package[title]"

      assert_select "textarea#package_description[name=?]", "package[description]"

      assert_select "input#package_limit[name=?]", "package[limit]"

      assert_select "input#package_price[name=?]", "package[price]"

      assert_select "input#package_week_id[name=?]", "package[week_id]"
    end
  end
end
