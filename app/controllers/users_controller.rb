class UsersController < ApplicationController
	def index
	end

	def show
	end

	def new
		@user = User.new
	end

	def edit
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to '/users/new'
		else
			redirect_to '/users/new'
		end
	end

	def update
	end

	def destroy
	end

	private	
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password)
		end

end
