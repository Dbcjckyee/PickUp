class UsersController < ApplicationController
	before_action :current_user
	def index
	end

	def show
		@user = User.find_by(id: params[:id])
		@events = @user.events

		@event = Event.all

		if @user
			render 'show'
		else
			redirect_to '/'
		end
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to login_path
			UserMailer.welcome_email(@user).deliver_now
		else
			flash[:notice] = "Failed to create a new account. Try Again."
			redirect_to new_user_path
		end
	end

	def update
		@user = User.find_by(id: params[:id])

		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find_by(id: params[:id])
		if @user
			@user.destroy
			redirect_to '/'
		else
			redirect_to '/'
		end
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password)
		end

end
