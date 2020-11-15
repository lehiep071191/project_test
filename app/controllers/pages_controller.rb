class PagesController < ApplicationController
	def index
		 @book_hots = Book.all.order(count_view: :desc).limit(13)
		 @book_alls = Book.order(created_at: :desc).limit(15)
	end	
end
