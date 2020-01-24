require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  scenario 'Log in and log out' do
    user = User.create(name: 'User Example', username: 'username')
    visit login_path
    have_link 'Log In', href: login_path
    have_link 'Events', href: events_path
    page.fill_in 'Username', with: 'username'
    click_button 'Log in'
    expect(page.current_path).to eq '/events'
    have_link 'Create Event', href: new_event_path
    have_link 'Log out', href: logout_path
    have_link 'Events', href: events_path
    click_on 'Log out'
    expect(page.current_path).to eq root_path
  end
end