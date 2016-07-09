require 'rails_helper'

RSpec.describe "weeks/edit", type: :view do
  before(:each) do
    @week = assign(:week, Week.create!(
      :name => "MyString",
      :subdomain => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit week form" do
    render

    assert_select "form[action=?][method=?]", week_path(@week), "post" do

      assert_select "input#week_name[name=?]", "week[name]"

      assert_select "input#week_subdomain[name=?]", "week[subdomain]"

      assert_select "textarea#week_description[name=?]", "week[description]"
    end
  end
end
