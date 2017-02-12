require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.new' do
    it 'accepts a valid name and password' do
      expect(User.new(name: 'Username', password: 'password')).to be_valid
    end

    it 'requires a username' do
      expect(User.new(name: '', password: 'password')).to be_invalid
    end

    it 'requires a password' do
      expect(User.new(name: 'username', password: '')).to be_invalid
    end
  end
end
