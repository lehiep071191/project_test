class Admin::BooksController < Admin::ApplicationController
	before_action :set_book, only: [:update,:show]
	def index
		@books = Book.all
	end		
	def new
		@book = Book.new
	end	
	def create
		@book = Book.new(category: params[:category].to_i, title: params[:title], 
						author: params[:author], description: params[:description])
		if @book.save!
			render json: {
				data_book: render_to_string(@book)
			}, status: :ok

		end		
	end	
	def edit
	end
	def update
		byebug
		if @book.update!(category: params[:category].to_i, title: params[:title],
						 author: params[:author],  description: params[:description])
			render json: {
				data_bookupdate: render_to_string(@book)
			}, status: :ok	
		end	
	end	

	private
	def book_params
		params.require(:book).permit(:title, :author, :description, :category)
	end	
	def set_book
		@book = Book.find_by id: params[:id]
		if @book.nil?
			flash[:danger] = "book not found"
			redirect_to admin_books_path
		end	
	end	
end
