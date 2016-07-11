require 'rails_helper'

RSpec.describe "weeks/new", type: :view do
  before(:each) do
    assign(:week, Week.new(
      :name => "MyString",
      :subdomain => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new week form" do
    render

    assert_select "form[action=?][method=?]", weeks_path, "post" do

      assert_select "input#week_name[name=?]", "week[name]"

      assert_select "input#week_subdomain[name=?]", "week[subdomain]"

      assert_select "textarea#week_description[name=?]", "week[description]"
    end
  end
end
