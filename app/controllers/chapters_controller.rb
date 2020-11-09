class ChaptersController < ApplicationController
	def index
		byebug
		@book = Book.find_by id: params[:book_id]
		@chapters = @book.chapters.where("title=?", params[:title])
		render json: {
			data_chapters: @bodys = @chapters.pluck(:title, :body, :chapter_number)
		}, status: :ok
	end	
	private 
	def set_chapters
		@chapter = Chapter.find_by id: params[:id]
		if @chapter.nil?
			redirect_to root_url
		end		
	end		
end
