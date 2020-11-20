class BooksalesController < ApplicationController
  def index
  	@booksales = Booksale.all.paginate(page: params[:page], per_page: 10)
  end

  def show
  	@booksale = Booksale.find_by id: params[:id]
  end
end
