class UsersController < ApplicationController
	before_action :find_user, only: [:show]
	def show
		@post = current_user.posts
	end	
	private
	def find_user
		@user = User.find_by id: params[:id]
		if @user.nil?
			flash[:danger] = "user not found"
		end	
 	end	

end
