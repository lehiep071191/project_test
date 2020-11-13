class BooksController < ApplicationController
	before_action :set_book, only: [:show]
	def index
		# @pagy, @books = pagy(Book.all, items: 9)
		@pagy, @books = pagy(Book.send(params["category"]), items:16)
		# render json: {
		# 	data_books: render_to_string(@books),
		# }, status: :ok
	end	
	def show
		@post = @book.posts.build
		@posts = @book.posts
		@lists = @book.chapters.paginate(page: params[:page], per_page: 20).order_by_chapter
		@chapters = @book.chapters.paginate(page: params[:page], per_page: 1).order_by_chapter
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
