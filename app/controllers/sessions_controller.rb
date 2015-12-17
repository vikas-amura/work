class SessionsController < ApplicationController

	def new
	end
	def create		
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] =user.id
			flash[:success]="Login sucessfull"
			redirect_to user_path(user)
		else
			flash.now[:danger]="password not match"
			render 'new'
		end
	end
	def destroy
		session[:user_id] =nil
		flash[:success]="LogOut sucessfull"
		render 'new'
	end
end