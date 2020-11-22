class Admin::BooksalesController < Admin::ApplicationController
	before_action :set_booksale, only: [:edit,:update] 
	def index
		@booksales = Booksale.all
	end
	def new
		@booksale = Booksale.new
	end
	def create
		bspr = booksale_params.merge(category: booksale_params[:category].to_i)
		@booksale = Booksale.new bspr
		if @booksale.save!
			redirect_to admin_booksales_path
		end	
	end
	def update
		bspr = booksale_params.merge(category: booksale_params[:category].to_i)
		if @booksale.update! bspr
			redirect_to admin_booksales_path
		else
			render :edit
		end
	end			

	private
	def booksale_params
		params.require(:booksale).permit(:name, :category, :price, :discount)
	end	
	def set_booksale
		@booksale = Booksale.find_by id: params[:id]
		if @booksale.nil?
			redirect_to admin_booksales_path
		end	
	end	
end	