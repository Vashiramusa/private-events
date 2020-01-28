require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'Foo bar', username: 'foobar')
  end

  it 'validates name and username' do
    user = User.new(name: '', username: '')
    expect(user.valid?).to be(false)
  end

  it 'should have a unique username' do
    duplicate_user = @user.dup
    @user.save
    expect(duplicate_user).to_not be_valid
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
