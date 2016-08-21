require 'rails_helper'

RSpec.describe "admin/users/index", type: :view do
  before(:each) do
    assign(:admin_users, [
      Admin::User.create!(
        :name => "Name",
        :email => "Email",
        :course => "Course",
        :semester => 1,
        :university => "University"
      ),
      Admin::User.create!(
        :name => "Name",
        :email => "Email",
        :course => "Course",
        :semester => 1,
        :university => "University"
      )
    ])
  end

  it "renders a list of admin/users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Course".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "University".to_s, :count => 2
  end
end
