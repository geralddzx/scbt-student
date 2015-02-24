class UserMailer < ActionMailer::Base
  default from: "geralddzx@gmail.com"
  def activation(user)
    @user = user
    msg = mail(to: user.email, subject: "Please activate your account")
    msg.deliver
  end
end
