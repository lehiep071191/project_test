class PostsController < ApplicationController
	load_and_authorize_resource
	before_action :set_post, only: [:show,:edit,:update]
	def index
		@posts = @book.posts
	end	
	def new
		@post = Post.new
	end
	def create	
		@book = Book.find_by id: params[:book_id]
		@post = @book.posts.build (post_params)
		@post.user = current_user
		if @post.save!
			flash[:success] = "post create"
			redirect_to post_path(@post)
		else
			render :new	
		end	
	end
	def show
		@comment = Comment.new
		@comments = @post.comments
		if user_signed_in?
	      @rate = current_user.rates.find_by rate_duty_id: @post.id
	      @rates = @post.rates
	    end
	end	
	def edit
	end	
	def update
		if @post.update! post_params
			flash[:danger] = "update!!"
			redirect_to @post
		end	
	end	
	private
	def post_params
		params.require(:post).permit(:user_id, :content, :title, :book_id)
	end	
	def set_post
		@post = Post.find_by id: params[:id]
		if @post.nil?
			flash[:success] = "post not found"
			redirect_to root_url
		end	
	end	
end
