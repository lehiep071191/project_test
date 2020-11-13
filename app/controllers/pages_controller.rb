class PagesController < ApplicationController
	def index
		@pagy, @books = pagy(Book.all, items: 8)
	end	
end
