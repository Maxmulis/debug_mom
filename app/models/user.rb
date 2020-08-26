class User < ApplicationRecord
  validates :email, presence: true# , uniqueness: { case_sensitive: false }
  # after_create :send_welcome_email
  passwordless_with :email

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
