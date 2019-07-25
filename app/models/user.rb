class User < ApplicationRecord
    has_many:articles, dependent: :destroy
    before_save { self.email = email.downcase }
    validates :username, uniqueness:true, presence: true, length: {minimum: 3, maximum: 333}
    VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email , uniqueness: {case_sensitive: false}, presence: true, length: {maximum: 33},format: {with: VALID_EMAIL_REGEX}
    has_secure_password
end
