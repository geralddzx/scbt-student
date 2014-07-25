class UserMailer < ActionMailer::Base
  default from: "Stanford International College"
  def activation(user)
    @user = user
    msg = mail(to: user.email, subject: "Please activate your account")
    msg.deliver
  end
  
end
