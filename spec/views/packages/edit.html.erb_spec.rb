require 'rails_helper'

RSpec.describe "packages/edit", type: :view do
  before(:each) do
    @package = assign(:package, Package.create!(
      :title => "MyString",
      :description => "MyText",
      :limit => 1,
      :price => "MyString",
      :week => nil
    ))
  end

  it "renders the edit package form" do
    render

    assert_select "form[action=?][method=?]", package_path(@package), "post" do

      assert_select "input#package_title[name=?]", "package[title]"

      assert_select "textarea#package_description[name=?]", "package[description]"

      assert_select "input#package_limit[name=?]", "package[limit]"

      assert_select "input#package_price[name=?]", "package[price]"

      assert_select "input#package_week_id[name=?]", "package[week_id]"
    end
  end
end
