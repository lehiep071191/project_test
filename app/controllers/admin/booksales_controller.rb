class Admin::BooksalesController < Admin::ApplicationController
	def index
		@booksales = Booksale.all
	end
	def new
		@booksale = Booksale.new
	end
	def create
		bspr = booksale_params.merge(category: booksale_params[:category].to_i)
		byebug
		@booksale = Booksale.new bspr
		if @booksale.save!
			redirect_to admin_booksales_path
		end	
	end

	private
	def booksale_params
		params.require(:booksale).permit(:name, :category, :price)
	end	
end	