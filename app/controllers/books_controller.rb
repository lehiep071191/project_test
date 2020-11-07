class BooksController < ApplicationController
	before_action :set_book, only: [:show]

	def show
		@post = @book.posts.build
		@posts = @book.posts
		 @supports = Supports::Book.new @book
		@comment = Comment.new
		@comments = @book.comments
		if user_signed_in?
	      @rate = current_user.rates.find_by rate_duty_id: @book.id
	      @rates = @book.rates
	    end

	end	
	private
	def set_book
		@book = Book.find_by id: params[:id]
		if @book.nil?
			redirect_to root_url
		end		
	end	
end
