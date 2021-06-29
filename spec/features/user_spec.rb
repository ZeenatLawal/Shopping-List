require 'rails_helper'

describe "the signin process", type: :feature do
  before :each do
    User.create(email: 'user@example.com', password: 'password', name: 'zeenat')
  end

  it "signs me in" do
    visit '/users/sign_in'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
  end
end

describe "the signout process", type: :feature do
  before :each do
    User.create(email: 'user@example.com', password: 'password', name: 'zeenat')
  end

  it 'Should not sign @user in if not valid' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'zee@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Sign in'
    expect(page).to have_content 'Invalid Name or Email or password.'
  end
end