class UserMailer < ApplicationMailer
	default from: 'tuan.minh5899@gmail.com'

	def welcome_email
		@user = params[:user]
		mail(to: @user.email, subject: "Welcome " + @user.first_name + " " + @user.last_name)
	end
end
