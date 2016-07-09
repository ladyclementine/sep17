require 'rails_helper'

RSpec.describe "weeks/show", type: :view do
  before(:each) do
    @week = assign(:week, Week.create!(
      :name => "Name",
      :subdomain => "Subdomain",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Subdomain/)
    expect(rendered).to match(/MyText/)
  end
end
