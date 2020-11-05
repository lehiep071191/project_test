class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update]
	before_action :correct_user, only: [:edit, :update]
	
	def show
		@post = current_user.posts
	end

	def edit
	end	

	def update
	end	
	private
	def find_user
		@user = User.find_by id: params[:id]
		if @user.nil?
			flash[:danger] = "user not found"
		end	
 	end	
 	def correct_user
		if !current_user.current_user?(@user)
			flash[:danger] = "unpermited!"
			redirect_to @user
		end	
	end
end
