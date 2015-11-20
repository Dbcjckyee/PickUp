class UsersController < ApplicationController
	def index
	end

	def show
		@user = User.find_by(id: params[:id])
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
			redirect_to '/users/new'
		else
			redirect_to '/users/new'
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


# class EventsController
# 	before_action :require_user, only: [:index, :show]
# end
