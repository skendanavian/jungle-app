require 'rails_helper'
require 'database_cleaner'
require 'capybara-webkit'

RSpec.feature "UserLogins", type: :feature do
  before :each do
    @user = User.create(first_name: "Jim", last_name: "Smith", email: "jim@example.com", password: "password", password_confirmation: "password")
  end



  scenario "They can login and then see all products" do
    # ACT
    visit login_path
    fill_in 'email', with: 'jim@example.com'
    fill_in 'password', with: 'password'
    click_on('Submit')
    sleep(5)

    # DEBUG / VERIFY
    save_screenshot 'login-page.png'
    expect(page).to have_css 'article.product', count: 10
  end

end
