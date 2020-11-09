class Admin::ChaptersController < Admin::ApplicationController
	before_action :set_chapter, only: [:edit, :show, :update, :destroy]

	def create
		@chapter = Chapter.new(chapter_params)
		if @chapter.save!
			respond_to do |format|
				format.html{ redirect_to admin_book_path(@chapter.book) }
				format.js
			end	
		end				
	end		
	def edit 
	end	
	def update
		if @chapter.update! chapter_params
			flash[:success] = "update!"
			redirect_to admin_chapter_path(@chapter)
		end	
	end	
	def destroy
		@chapter.destroy
	end	
	private 
	def chapter_params
		params.require(:chapter).permit(:book_id, :title, :body, :chapter_number)
	end	
	def set_chapter
		@chapter = Chapter.find_by id: params[:id]
		if @chapter.nil?
			redirect_to root_url
		end	
	end	
end	
