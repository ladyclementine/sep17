require 'rails_helper'

RSpec.describe "packages/index", type: :view do
  before(:each) do
    assign(:packages, [
      Package.create!(
        :title => "Title",
        :description => "MyText",
        :limit => 1,
        :price => "Price",
        :week => nil
      ),
      Package.create!(
        :title => "Title",
        :description => "MyText",
        :limit => 1,
        :price => "Price",
        :week => nil
      )
    ])
  end

  it "renders a list of packages" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
