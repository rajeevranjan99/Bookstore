# Preview all emails at http://localhost:3000/rails/mailers/user_account_mailer
class UserAccountMailerPreview < ActionMailer::Preview
  def welcome_email
    #Create a dummy user for previewing
    user = UserAccount.new(name: params[:name], email: params[:email])
    #Call the welcome_email method with the dummy user
    UserAccountMailer.with(user: user).welcome_email(user)
  end
end
