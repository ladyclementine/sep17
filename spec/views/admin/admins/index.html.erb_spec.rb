require 'rails_helper'

RSpec.describe "admin/admins/index", type: :view do
  before(:each) do
    assign(:admin_admins, [
      Admin::Admin.create!(
        :email => "Email"
      ),
      Admin::Admin.create!(
        :email => "Email"
      )
    ])
  end

  it "renders a list of admin/admins" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
