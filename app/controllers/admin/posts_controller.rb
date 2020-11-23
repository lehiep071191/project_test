class Admin::PostsController < Admin::ApplicationController
	before_action :set_post, only: [:show, :update, :destroy]
	def index
		@posts = Post.send(params["status"])
	end
	def show

	end
	def update
		@post.update! (status: params[:status])
		redirect_to()
	end	
	def destroy
	end	
	private 
	def set_post
		@post = Post.find_by id: params[:id]
		redirect_to admin_posts_path if @post.nil?
	end		
end	
