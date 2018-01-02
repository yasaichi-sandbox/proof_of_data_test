require "rails_helper"

RSpec.describe "User sign in", type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    visit new_user_session_path
  end

  it "should allow users to sign in with their email and password" do
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    expect(page).to have_current_path(root_path)
  end

  it "should allow users to sign in with their email and password (with `data-test`)" do
    find(:data_test, "email").set(user.email)
    find(:data_test, "password").set(user.password)
    find(:data_test, "submit").click

    expect(page).to have_current_path(root_path)
  end
end
