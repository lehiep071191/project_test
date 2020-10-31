class BooksController < ApplicationController
	before_action :set_book, only: [:show]

	def show
		@post = current_user.posts.build
		@posts = @book.posts
	end	
	private
	def set_book
		@book = Book.find_by id: params[:id]
		if @book.nil?
			redirect_to root_url
		end		
	end	
end
