require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates name and username' do
    user = User.new(name: '', username: '')
    expect(user.valid?).to be(false)
  end

end