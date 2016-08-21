require 'rails_helper'

RSpec.describe "admin/users/show", type: :view do
  before(:each) do
    @admin_user = assign(:admin_user, Admin::User.create!(
      :name => "Name",
      :email => "Email",
      :course => "Course",
      :semester => 1,
      :university => "University"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Course/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/University/)
  end
end
