require 'rails_helper'

RSpec.describe "admin/admins/edit", type: :view do
  before(:each) do
    @admin_admin = assign(:admin_admin, Admin::Admin.create!(
      :email => "MyString"
    ))
  end

  it "renders the edit admin_admin form" do
    render

    assert_select "form[action=?][method=?]", admin_admin_path(@admin_admin), "post" do

      assert_select "input#admin_admin_email[name=?]", "admin_admin[email]"
    end
  end
end
