class ChaptersController < ApplicationController
	def index
		@book = Book.find_by id: params[:book_id]
		@chapters = @book.chapters.where("title=?", params[:title])
		render json: {
			data_chapters: @bodys = @chapters.pluck(:title, :body, :chapter_number)
		}, status: :ok
	end	
	def show
   
		@chapter = Chapter.find_by id: params[:id]
		@book = Book.find_by id: params[:book_id]
		@lists = @book.chapters.paginate(page: params[:page], per_page: 3).order_by_chapter
	end	
	private 
	def set_chapters
		@chapter = Chapter.find_by id: params[:id]
		if @chapter.nil?
			redirect_to root_url
		end		
	end		
end

