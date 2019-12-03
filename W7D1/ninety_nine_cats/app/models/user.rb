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

class User < ApplicationRecord
    validates :username, :password_digest, :session_token, presence: true
    validates :username, :session_token, uniqueness: true
    before_validation :ensure_session_token
    validates :password, length: {minimum: 6, allow_nil: true}
    
    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user
        user.is_password?(password) ? user : nil
    end

    attr_reader :password
    
    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
        self.save!
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
        ### BCrypt::Password.new(self.password_digest) == password
        ### second one works as well
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token
    end

    has_many :cats,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Cat

    has_many :rental_requests,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :CatRentalRequest
end
