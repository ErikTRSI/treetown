EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/

class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :name
  validates_format_of :email, with: EMAIL_REGEX
  validates_uniqueness_of :email

  def self.find_by_email_and_authenticate options={}
    return unless user ||= User.find_by_email(options[:email])
    user.authenticate(options[:password])
  end
end
