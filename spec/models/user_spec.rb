require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates name and username' do
    user = User.new(name: '', username: '')
    expect(user.valid?).to be(false)
  end

  it 'has many attendances' do
    assc = User.reflect_on_association(:attendances)
    expect(assc.macro).to eq :has_many
  end
  it 'has many event' do
    assc = User.reflect_on_association(:attending_events)
    expect(assc.macro).to eq :has_many
  end

  it 'has many events' do
    assc = User.reflect_on_association(:created_events)
    expect(assc.macro).to eq :has_many
  end
end
