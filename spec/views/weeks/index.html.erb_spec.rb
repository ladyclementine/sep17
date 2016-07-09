require 'rails_helper'

RSpec.describe "weeks/index", type: :view do
  before(:each) do
    assign(:weeks, [
      Week.create!(
        :name => "Name",
        :subdomain => "Subdomain",
        :description => "MyText"
      ),
      Week.create!(
        :name => "Name",
        :subdomain => "Subdomain",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of weeks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Subdomain".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
