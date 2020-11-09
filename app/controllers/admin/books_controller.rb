class Admin::BooksController < Admin::ApplicationController
	before_action :set_book, only: [:update,:show, :edit, :destroy]
	def index
		@pagy, @books = pagy(Book.all, items: 10)
	end		
	def new
		@book = Book.new
		@chapter = @book.chapters.build
	end	
	def create
		byebug
		# @book = Book.new(category: params[:category].to_i, title: params[:title], 
		# 				author: params[:author], description: params[:description])
		bpr = book_params.merge(category: params[:category].to_i)
		@book = Book.new bpr
		if @book.save!
			redirect_to admin_books_path
			# render json: {
			# 	data_book: render_to_string(@book)
			# }, status: :ok

		end		
	end	
	def show
		@chapter = Chapter.new 
		@chapters = @book.chapters
	end	
	def edit
	end
	def update
		bpr = book_params.merge(category: params[:category].to_i)
		if @book.update! bpr
			redirect_to admin_book_path @book
		end	
		# if @book.update!(category: params[:category].to_i, title: params[:title],
		# 				 author: params[:author],  description: params[:description])
		# 	render json: {
		# 		data_bookupdate: render_to_string(@book)
		# 	}, status: :ok	
		# end	
	end	
	def destroy
		@book.destroy
		respond_to do |format|
			format.html{ redirect_to admin_books_path}
			format.js
		end	
	end	
	private
	def book_params
		params.require(:book).permit(:title, :author, :description, :category, chapters_attributes: [:title, :body, :chapter_number, :_destroy])
	end	
	def set_book
		@book = Book.find_by id: params[:id]
		if @book.nil?
			flash[:danger] = "book not found"
			redirect_to admin_books_path
		end	
	end	
end
