require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        full_name: "Full Name",
        gender: "Gender",
        is_admin: false
      ),
      User.create!(
        full_name: "Full Name",
        gender: "Gender",
        is_admin: false
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "Full Name".to_s, count: 2
    assert_select "tr>td", text: "Gender".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
