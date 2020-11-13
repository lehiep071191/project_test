class PagesController < ApplicationController
	def index
		@pagy, @books = pagy(Book.all.order(count_view: :desc), items: 8)
	end	
end
