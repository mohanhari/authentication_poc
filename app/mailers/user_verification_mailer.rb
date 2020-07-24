class UserVerificationMailer < ApplicationMailer
  def verification_email
    @user = params[:user]
     mail(to: @user.email, subject: "Email verification email")
  end
end
