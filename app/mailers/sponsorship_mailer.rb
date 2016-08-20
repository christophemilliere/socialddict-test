class SponsorshipMailer < ApplicationMailer

  def invite_sponsorship(email_sponsorship, user)
    @user = user
    @email_sponsorship = email_sponsorship
    mail(to: @email_sponsorship, subject: 'Viens je te parraine')
  end

  def send_password(user, pwd)
    @user = user
    @pwd = pwd
    mail(to: @user.email, subject: 'Vos identifiants')
  end
end
