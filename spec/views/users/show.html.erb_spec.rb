require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      full_name: "Full Name",
      gender: "Gender",
      is_admin: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/false/)
  end
end
