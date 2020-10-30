class PostsController < ApplicationController
	before_action :set_post, only: [:show]
	def new
		@post = Post.new
	end
	def create	
		@post = Post.new post_params
		if @post.save!
			flash[:success] = "post create"
			redirect_to @post
		else
			render :new	
		end	
	end
	def show
	end	
	private
	def post_params
		params.require(:post).permit(:user_id, :content, :title)
	end	
	def set_post
		@post = Post.find_by id: params[:id]
		if @post.nil?
			flash[:success] = "post not found"
			redirect_to root_url
		end	
	end	
end
