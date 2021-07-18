require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      full_name: "MyString",
      gender: "MyString",
      is_admin: false
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[full_name]"

      assert_select "input[name=?]", "user[gender]"

      assert_select "input[name=?]", "user[is_admin]"
    end
  end
end
