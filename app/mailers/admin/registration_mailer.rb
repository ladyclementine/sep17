class Admin::RegistrationMailer < ApplicationMailer
  def welcome(user, generated_password)
    @user = user
    @password = generated_password
  end
end
