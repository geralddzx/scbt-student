class UserMailer < ActionMailer::Base
  default from: "geralddzx@gmail.com"
  def activation(user, host_url)
    @user = user
    @host_url = host_url
    msg = mail(to: user.email, subject: "Please activate your account")
    msg.deliver
  end
end
