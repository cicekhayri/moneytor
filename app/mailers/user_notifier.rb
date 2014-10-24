class UserNotifier < ActionMailer::Base
  default from: "from@example.com"

  def signup_user(user)
    @user = user

    mail(to: @user.email, subject: 'Thanks for signing up for our amazing app')
  end
end
