class PagesController < ApplicationController
	def index
		 @book_hots = Book.all.order(count_view: :desc).limit(13)
		 @categories = Book.order(created_at: :desc).limit(15)
	end	
end
