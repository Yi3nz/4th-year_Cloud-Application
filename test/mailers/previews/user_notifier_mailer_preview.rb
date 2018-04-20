# Preview all emails at http://localhost:3000/rails/mailers/user_notifier_mailer
class UserNotifierMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier_mailer/activation
  def activation
    UserNotifierMailer.activation
  end

end
