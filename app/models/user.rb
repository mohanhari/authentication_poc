class User < ApplicationRecord
  include Clearance::User
  after_create :send_verification_email
  validates :email, :first_name, :city, :password, presence: true

  def send_verification_email
     UserVerificationMailer.with(user: self).verification_email.deliver_now
  end
end
