require 'rails_helper'

RSpec.describe "admin/users/new", type: :view do
  before(:each) do
    assign(:admin_user, Admin::User.new(
      :name => "MyString",
      :email => "MyString",
      :course => "MyString",
      :semester => 1,
      :university => "MyString"
    ))
  end

  it "renders new admin_user form" do
    render

    assert_select "form[action=?][method=?]", admin_users_path, "post" do

      assert_select "input#admin_user_name[name=?]", "admin_user[name]"

      assert_select "input#admin_user_email[name=?]", "admin_user[email]"

      assert_select "input#admin_user_course[name=?]", "admin_user[course]"

      assert_select "input#admin_user_semester[name=?]", "admin_user[semester]"

      assert_select "input#admin_user_university[name=?]", "admin_user[university]"
    end
  end
end
