class SessionsController < ApplicationController
	before_action :current_user
	def new
	end

	def create
		if request.env['omniauth.auth']
			@user = User.from_omniauth(request.env['omniauth.auth'])
    	session[:user_id] = @user.id
    	redirect_to events_path
		else
			@user = User.find_by_email(params[:session][:email])
			if @user && @user.authenticate(params[:session][:password])
				session[:user_id] = @user.id
				redirect_to events_path
			else
				flash[:notice] = "Username or Password was incorrect. Try Again."
				redirect_to root_path
			end
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have been logged out"
		redirect_to '/'
	end

end
