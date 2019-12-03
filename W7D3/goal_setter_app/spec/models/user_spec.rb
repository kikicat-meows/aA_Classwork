# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  password_digest :string           not null
#  session_token   :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_session_token  (session_token) UNIQUE
#  index_users_on_username       (username) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:helen) { User.create(username: 'helen', password: 'password') }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_uniqueness_of(:username) }

  describe 'session_token' do
    it 'assigns a session_token if none is given' do
      expect(FactoryBot.create(:user).session_token).not_to be_nil
    end
  end

  describe 'password encryption' do
    it 'does not save passwords to the database' do
        FactoryBot.create(:user, username: 'sandy')
        sandy = User.find_by(username: 'sandy')

        expect(sandy.password).to be_nil
    end

    it 'encrypts the password using BCrypt' do
        expect(BCrypt::Password).to receive(:create).with('starwars')

        FactoryBot.build(:user, password: 'starwars')
    end
  end

  describe 'password reader' do
    it 'sets @password to the password provided' do
      kitten = FactoryBot.create(:user, password: 'catmeows')
      
      expect(kitten.password).to eq('catmeows')
    end
  end

  describe 'is_password?(password) retrieves password_digest from Database and compares with user input password through BCrypt' do
    FactoryBot.create(:user, username: 'Todd')
    todd = User.find_by(username: 'Todd')

    context 'when the password is entered correctly' do
      it 'will return true' do
        expect(todd.is_password?('password')).to eq(true)
      end
    end

    context 'when the password is entered incorrectly' do
      it 'will return false' do
        expect(todd.is_password?('catmeows')).to eq(false)
      end
    end
  end

  describe 'self.find_by_credentials(username, password)' do
    context 'when the user does not exist in the database' do
      it 'will return nil' do
        expect(User.find_by_credentials('harrypotter','hogwarts')).to eq(nil)
      end
    end

    context 'when the user exist in the database and the password is correct' do
      it 'will return user' do
        freddy = User.new(username: 'freddy', password: 'catmeows')
        freddy.save!
        freddy = User.find_by(username: 'freddy')

        expect(User.find_by_credentials('freddy', 'catmeows')).to eq(freddy)
      end
    end
  end

  describe 'reset_session_token!' do
    it 'resets session token and returns the new session token set' do
      FactoryBot.create(:user, username: 'ashe')
      ashe = User.find_by(username: 'ashe')
      original_token = ashe.session_token

      expect(ashe.reset_session_token!).not_to eq(original_token)
    end
  end

end
