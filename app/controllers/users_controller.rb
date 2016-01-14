class UsersController < ApplicationController
	before_action :current_user

	def show
		@user = User.find_by(id: params[:id])
		@ownedevents = @user.created_events.current.order('date asc')
		@joinedevents = @user.events.current.order('date asc')
		if @user && @user == current_user
		else
			flash[:notice] = "Access Denied."
			redirect_to '/'
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to '/'
			UserMailer.welcome_email(@user).deliver_now
		else
			flash[:notice] = "Failed to create a new account. Try Again."
			redirect_to '/'
		end
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password)
		end

end
