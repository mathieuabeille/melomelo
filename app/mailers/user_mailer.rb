class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.match.subject
  #
  def match(cloth, wish)
    @user = wish.user
    @cloth = cloth
    @wish = wish
    mail(to: @user.email, subject: 'Melomelo : You have a match !')
  end

end
