require 'rails_helper'

RSpec.feature 'CreateEvents', type: :feature do
  before :each do
    user = User.create(name: 'User Example', username: 'username')
    event = user.created_events.build(title: 'Event testing', description: 'Event description', date: Time.now)
    event.save
    visit login_path
    page.fill_in 'Username', with: 'username'
    click_button 'Log in'
  end

  scenario 'Event creation', type: :feature do
    click_on 'Create Event'
    page.fill_in 'Title', with: 'Event name'
    page.fill_in 'Description', with: 'Event description'
    click_button 'Create event'
    expect(page).to have_text 'Event created successfully!'
  end

  scenario 'Attend the event and leave the event', type: :feature do
    click_link('(Details)')
    expect(page.current_path).to eq '/events/1'
    click_link('Join')
    expect(page).to have_text "You're now attending this event"
    expect(page).to have_link('Leave')
    click_link('Leave')
    expect(page).to have_text "You're no longer attending the event"
    expect(page).to have_link('Join')
  end
end
